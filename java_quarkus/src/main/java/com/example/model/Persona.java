package com.example.model;

import io.quarkus.hibernate.orm.panache.PanacheEntity;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "personas")
public class Persona extends PanacheEntity {
    public String nombre;
    public String apellido;
    public String documento;
    public String direccion;
}