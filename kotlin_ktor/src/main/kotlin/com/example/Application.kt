package com.example

import com.example.data.DatabaseFactory
import com.example.routes.personaRoutes
import io.ktor.http.*
import io.ktor.server.application.*
import io.ktor.server.plugins.*
import io.ktor.server.plugins.contentnegotiation.*
import io.ktor.server.plugins.cors.routing.*
import io.ktor.server.response.*
import io.ktor.server.routing.*
import io.ktor.serialization.gson.*

fun main(args: Array<String>): Unit = io.ktor.server.netty.EngineMain.main(args)

fun Application.module() {
    DatabaseFactory.init()

    install(ContentNegotiation) {
        gson {
            setPrettyPrinting()
        }
    }

    install(CORS) {
        anyHost()
    }

    routing {
        personaRoutes()
        get("/") {
            call.respondText("API Personas - Ktor + Exposed + SQLite", ContentType.Text.Plain)
        }
    }
}
