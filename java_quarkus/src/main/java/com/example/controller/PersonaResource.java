package com.example.controller;

import com.example.model.Persona;
import com.example.service.PersonaService;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.List;

@Path("/api/personas")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class PersonaResource {

    @Inject
    PersonaService personaService;

    @GET
    public List<Persona> listarTodos() {
        return personaService.listarTodos();
    }

    @GET
    @Path("/{id}")
    public Response obtenerPorId(@PathParam("id") Long id) {
        Persona persona = personaService.obtenerPorId(id);
        if (persona == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(persona).build();
    }

    @POST
    public Response crear(Persona persona) {
        Persona nuevaPersona = personaService.crear(persona);
        return Response.status(Response.Status.CREATED).entity(nuevaPersona).build();
    }

    @PUT
    @Path("/{id}")
    public Response actualizar(@PathParam("id") Long id, Persona persona) {
        Persona personaActualizada = personaService.actualizar(id, persona);
        if (personaActualizada == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(personaActualizada).build();
    }

    @PATCH
    @Path("/{id}")
    public Response actualizarParcial(@PathParam("id") Long id, Persona persona) {
        Persona personaActualizada = personaService.actualizarParcial(id, persona);
        if (personaActualizada == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(personaActualizada).build();
    }

    @DELETE
    @Path("/{id}")
    public Response eliminar(@PathParam("id") Long id) {
        boolean eliminado = personaService.eliminar(id);
        if (!eliminado) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.noContent().build();
    }
}