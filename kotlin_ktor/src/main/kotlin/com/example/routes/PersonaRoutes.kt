package com.example.routes

import com.example.data.Persona
import com.example.data.PersonaDTO
import com.example.data.PersonaRepository
import com.example.data.PersonaUpdateDTO
import io.ktor.http.*
import io.ktor.server.application.*
import io.ktor.server.request.*
import io.ktor.server.response.*
import io.ktor.server.routing.*

fun Route.personaRoutes() {
    val repository = PersonaRepository()

    get("/api/personas") {
        val personas = repository.getAll()
        call.respond(personas)
    }

    get("/api/personas/{id}") {
        val id = call.parameters["id"]?.toIntOrNull()
        if (id == null) {
            call.respond(HttpStatusCode.BadRequest, "ID inválido")
            return@get
        }
        val persona = repository.getById(id)
        if (persona == null) {
            call.respond(HttpStatusCode.NotFound, "Persona no encontrada")
        } else {
            call.respond(persona)
        }
    }

    post("/api/personas") {
        val dto = call.receive<PersonaDTO>()
        val persona = repository.create(dto)
        call.respond(HttpStatusCode.Created, persona)
    }

    put("/api/personas/{id}") {
        val id = call.parameters["id"]?.toIntOrNull()
        if (id == null) {
            call.respond(HttpStatusCode.BadRequest, "ID inválido")
            return@put
        }
        val dto = call.receive<PersonaDTO>()
        val persona = repository.update(id, dto)
        if (persona == null) {
            call.respond(HttpStatusCode.NotFound, "Persona no encontrada")
        } else {
            call.respond(persona)
        }
    }

    patch("/api/personas/{id}") {
        val id = call.parameters["id"]?.toIntOrNull()
        if (id == null) {
            call.respond(HttpStatusCode.BadRequest, "ID inválido")
            return@patch
        }
        val dto = call.receive<PersonaUpdateDTO>()
        val persona = repository.patch(id, dto)
        if (persona == null) {
            call.respond(HttpStatusCode.NotFound, "Persona no encontrada")
        } else {
            call.respond(persona)
        }
    }

    delete("/api/personas/{id}") {
        val id = call.parameters["id"]?.toIntOrNull()
        if (id == null) {
            call.respond(HttpStatusCode.BadRequest, "ID inválido")
            return@delete
        }
        val deleted = repository.delete(id)
        if (deleted) {
            call.respond(HttpStatusCode.NoContent)
        } else {
            call.respond(HttpStatusCode.NotFound, "Persona no encontrada")
        }
    }
}
