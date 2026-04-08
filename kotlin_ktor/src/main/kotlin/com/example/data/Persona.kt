package com.example.data

import org.jetbrains.exposed.sql.Table
import org.jetbrains.exposed.sql.javatime.datetime
import java.time.LocalDateTime

object PersonaTable : Table("personas") {
    val id = integer("id").autoIncrement()
    val nombre = varchar("nombre", 100)
    val apellido = varchar("apellido", 100)
    val documento = varchar("documento", 20).uniqueIndex()
    val direccion = varchar("direccion", 255)
    val createdAt = datetime("created_at").clientDefault { LocalDateTime.now() }
    val updatedAt = datetime("updated_at").clientDefault { LocalDateTime.now() }

    override val primaryKey = PrimaryKey(id)
}

data class Persona(
    val id: Int = 0,
    val nombre: String,
    val apellido: String,
    val documento: String,
    val direccion: String
)

data class PersonaDTO(
    val id: Int? = null,
    val nombre: String,
    val apellido: String,
    val documento: String,
    val direccion: String
)

data class PersonaUpdateDTO(
    val nombre: String? = null,
    val apellido: String? = null,
    val documento: String? = null,
    val direccion: String? = null
)
