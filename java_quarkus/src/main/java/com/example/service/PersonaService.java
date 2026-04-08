package com.example.service;

import com.example.model.Persona;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.transaction.Transactional;
import java.util.List;

@ApplicationScoped
public class PersonaService {

    public List<Persona> listarTodos() {
        return Persona.listAll();
    }

    public Persona obtenerPorId(Long id) {
        return Persona.findById(id);
    }

    @Transactional
    public Persona crear(Persona persona) {
        persona.persist();
        return persona;
    }

    @Transactional
    public Persona actualizar(Long id, Persona personaActualizada) {
        Persona persona = Persona.findById(id);
        if (persona == null) {
            return null;
        }
        persona.nombre = personaActualizada.nombre;
        persona.apellido = personaActualizada.apellido;
        persona.documento = personaActualizada.documento;
        persona.direccion = personaActualizada.direccion;
        persona.persist();
        return persona;
    }

    @Transactional
    public Persona actualizarParcial(Long id, Persona personaParcial) {
        Persona persona = Persona.findById(id);
        if (persona == null) {
            return null;
        }
        if (personaParcial.nombre != null) {
            persona.nombre = personaParcial.nombre;
        }
        if (personaParcial.apellido != null) {
            persona.apellido = personaParcial.apellido;
        }
        if (personaParcial.documento != null) {
            persona.documento = personaParcial.documento;
        }
        if (personaParcial.direccion != null) {
            persona.direccion = personaParcial.direccion;
        }
        persona.persist();
        return persona;
    }

    @Transactional
    public boolean eliminar(Long id) {
        return Persona.deleteById(id);
    }
}