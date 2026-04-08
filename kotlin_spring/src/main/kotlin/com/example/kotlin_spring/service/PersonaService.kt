package com.example.kotlin_spring.service

import com.example.kotlin_spring.model.Persona
import com.example.kotlin_spring.repository.PersonaRepository
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
class PersonaService(private val personaRepository: PersonaRepository) {

    fun findAll(): List<Persona> = personaRepository.findAll()

    fun findById(id: Long): Persona? = personaRepository.findById(id).orElse(null)

    @Transactional
    fun save(persona: Persona): Persona = personaRepository.save(persona)

    @Transactional
    fun update(id: Long, persona: Persona): Persona? {
        return if (personaRepository.existsById(id)) {
            persona.copy(id = id).let { personaRepository.save(it) }
        } else null
    }

    @Transactional
    fun patch(id: Long, fields: Map<String, Any>): Persona? {
        val existing = personaRepository.findById(id).orElse(null) ?: return null
        val updated = existing.copy(
            nombre = fields["nombre"] as? String ?: existing.nombre,
            apellido = fields["apellido"] as? String ?: existing.apellido,
            documento = fields["documento"] as? String ?: existing.documento,
            direccion = fields["direccion"] as? String ?: existing.direccion
        )
        return personaRepository.save(updated)
    }

    @Transactional
    fun delete(id: Long): Boolean {
        return if (personaRepository.existsById(id)) {
            personaRepository.deleteById(id)
            true
        } else false
    }
}