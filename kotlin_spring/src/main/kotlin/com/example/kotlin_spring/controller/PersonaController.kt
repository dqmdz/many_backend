package com.example.kotlin_spring.controller

import com.example.kotlin_spring.model.Persona
import com.example.kotlin_spring.service.PersonaService
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PatchMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.PutMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/personas")
class PersonaController(private val personaService: PersonaService) {

    @GetMapping
    fun getAll(): ResponseEntity<List<Persona>> {
        val personas = personaService.findAll()
        return ResponseEntity.ok(personas)
    }

    @GetMapping("/{id}")
    fun getById(@PathVariable id: Long): ResponseEntity<Persona> {
        val persona = personaService.findById(id)
        return if (persona != null) {
            ResponseEntity.ok(persona)
        } else {
            ResponseEntity.notFound().build()
        }
    }

    @PostMapping
    fun create(@RequestBody persona: Persona): ResponseEntity<Persona> {
        val saved = personaService.save(persona)
        return ResponseEntity.status(HttpStatus.CREATED).body(saved)
    }

    @PutMapping("/{id}")
    fun update(@PathVariable id: Long, @RequestBody persona: Persona): ResponseEntity<Persona> {
        val updated = personaService.update(id, persona)
        return if (updated != null) {
            ResponseEntity.ok(updated)
        } else {
            ResponseEntity.notFound().build()
        }
    }

    @PatchMapping("/{id}")
    fun patch(@PathVariable id: Long, @RequestBody fields: Map<String, Any>): ResponseEntity<Persona> {
        val updated = personaService.patch(id, fields)
        return if (updated != null) {
            ResponseEntity.ok(updated)
        } else {
            ResponseEntity.notFound().build()
        }
    }

    @DeleteMapping("/{id}")
    fun delete(@PathVariable id: Long): ResponseEntity<Void> {
        val deleted = personaService.delete(id)
        return if (deleted) {
            ResponseEntity.noContent().build()
        } else {
            ResponseEntity.notFound().build()
        }
    }
}