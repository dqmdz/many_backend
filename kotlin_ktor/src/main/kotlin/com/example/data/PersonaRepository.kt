package com.example.data

import org.jetbrains.exposed.sql.*
import org.jetbrains.exposed.sql.SqlExpressionBuilder.eq
import org.jetbrains.exposed.sql.transactions.transaction
import java.time.LocalDateTime

class PersonaRepository {

    fun getAll(): List<Persona> = transaction {
        PersonaTable.selectAll().map { it.toPersona() }
    }

    fun getById(id: Int): Persona? = transaction {
        PersonaTable.select { PersonaTable.id eq id }
            .firstOrNull()
            ?.toPersona()
    }

    fun create(dto: PersonaDTO): Persona = transaction {
        val id = PersonaTable.insert {
            it[nombre] = dto.nombre
            it[apellido] = dto.apellido
            it[documento] = dto.documento
            it[direccion] = dto.direccion
        }[PersonaTable.id]
        Persona(id, dto.nombre, dto.apellido, dto.documento, dto.direccion)
    }

    fun update(id: Int, dto: PersonaDTO): Persona? = transaction {
        val updated = PersonaTable.update({ PersonaTable.id eq id }) {
            it[nombre] = dto.nombre
            it[apellido] = dto.apellido
            it[documento] = dto.documento
            it[direccion] = dto.direccion
            it[updatedAt] = LocalDateTime.now()
        }
        if (updated > 0) {
            PersonaTable.select { PersonaTable.id eq id }
                .firstOrNull()
                ?.toPersona()
        } else null
    }

    fun patch(id: Int, dto: PersonaUpdateDTO): Persona? = transaction {
        val existing = PersonaTable.select { PersonaTable.id eq id }.firstOrNull() ?: return@transaction null
        
        PersonaTable.update({ PersonaTable.id eq id }) {
            dto.nombre?.let { nombreVal -> it[nombre] = nombreVal }
            dto.apellido?.let { apellidoVal -> it[apellido] = apellidoVal }
            dto.documento?.let { docVal -> it[documento] = docVal }
            dto.direccion?.let { dirVal -> it[direccion] = dirVal }
            it[updatedAt] = LocalDateTime.now()
        }
        
        PersonaTable.select { PersonaTable.id eq id }
            .firstOrNull()
            ?.toPersona()
    }

    fun delete(id: Int): Boolean = transaction {
        val deleted = PersonaTable.deleteWhere { PersonaTable.id eq id }
        deleted > 0
    }

    private fun ResultRow.toPersona() = Persona(
        id = this[PersonaTable.id],
        nombre = this[PersonaTable.nombre],
        apellido = this[PersonaTable.apellido],
        documento = this[PersonaTable.documento],
        direccion = this[PersonaTable.direccion]
    )
}
