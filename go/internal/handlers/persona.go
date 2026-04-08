package handlers

import (
	"net/http"
	"strconv"

	"github.com/app/personas/internal/config"
	"github.com/app/personas/internal/models"
	"github.com/gin-gonic/gin"
)

func GetAllPersonas(c *gin.Context) {
	var personas []models.Persona
	if result := config.DB.Find(&personas); result.Error != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": result.Error.Error()})
		return
	}
	c.JSON(http.StatusOK, personas)
}

func GetPersonaByID(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "ID inválido"})
		return
	}
	var persona models.Persona
	if result := config.DB.First(&persona, id); result.Error != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Persona no encontrada"})
		return
	}
	c.JSON(http.StatusOK, persona)
}

func CreatePersona(c *gin.Context) {
	var persona models.Persona
	if err := c.ShouldBindJSON(&persona); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	if result := config.DB.Create(&persona); result.Error != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": result.Error.Error()})
		return
	}
	c.JSON(http.StatusCreated, persona)
}

func UpdatePersona(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "ID inválido"})
		return
	}
	var persona models.Persona
	if result := config.DB.First(&persona, id); result.Error != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Persona no encontrada"})
		return
	}
	var input models.Persona
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	config.DB.Model(&persona).Updates(models.Persona{
		Nombre:     input.Nombre,
		Apellido:   input.Apellido,
		Documento:  input.Documento,
		Direccion:  input.Direccion,
	})
	c.JSON(http.StatusOK, persona)
}

func PatchPersona(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "ID inválido"})
		return
	}
	var persona models.Persona
	if result := config.DB.First(&persona, id); result.Error != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Persona no encontrada"})
		return
	}
	var input map[string]string
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	if nombre, ok := input["nombre"]; ok {
		persona.Nombre = nombre
	}
	if apellido, ok := input["apellido"]; ok {
		persona.Apellido = apellido
	}
	if documento, ok := input["documento"]; ok {
		persona.Documento = documento
	}
	if direccion, ok := input["direccion"]; ok {
		persona.Direccion = direccion
	}
	config.DB.Save(&persona)
	c.JSON(http.StatusOK, persona)
}

func DeletePersona(c *gin.Context) {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "ID inválido"})
		return
	}
	var persona models.Persona
	if result := config.DB.First(&persona, id); result.Error != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Persona no encontrada"})
		return
	}
	config.DB.Delete(&persona)
	c.JSON(http.StatusOK, gin.H{"message": "Persona eliminada"})
}