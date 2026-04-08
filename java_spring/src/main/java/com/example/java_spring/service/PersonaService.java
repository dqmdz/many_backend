package com.example.java_spring.service;

import com.example.java_spring.model.Persona;
import com.example.java_spring.repository.PersonaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class PersonaService {

    private final PersonaRepository personaRepository;

    public PersonaService(PersonaRepository personaRepository) {
        this.personaRepository = personaRepository;
    }

    @Transactional(readOnly = true)
    public List<Persona> findAll() {
        return personaRepository.findAll();
    }

    @Transactional(readOnly = true)
    public Optional<Persona> findById(Long id) {
        return personaRepository.findById(id);
    }

    @Transactional
    public Persona save(Persona persona) {
        return personaRepository.save(persona);
    }

    @Transactional
    public Optional<Persona> update(Long id, Persona persona) {
        return personaRepository.findById(id).map(existing -> {
            existing.setNombre(persona.getNombre());
            existing.setApellido(persona.getApellido());
            existing.setDocumento(persona.getDocumento());
            existing.setDireccion(persona.getDireccion());
            return personaRepository.save(existing);
        });
    }

    @Transactional
    public Optional<Persona> patch(Long id, Persona persona) {
        return personaRepository.findById(id).map(existing -> {
            if (persona.getNombre() != null) {
                existing.setNombre(persona.getNombre());
            }
            if (persona.getApellido() != null) {
                existing.setApellido(persona.getApellido());
            }
            if (persona.getDocumento() != null) {
                existing.setDocumento(persona.getDocumento());
            }
            if (persona.getDireccion() != null) {
                existing.setDireccion(persona.getDireccion());
            }
            return personaRepository.save(existing);
        });
    }

    @Transactional
    public boolean delete(Long id) {
        if (personaRepository.existsById(id)) {
            personaRepository.deleteById(id);
            return true;
        }
        return false;
    }
}
