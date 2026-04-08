package main

import (
	"log"

	"github.com/app/personas/internal/config"
	"github.com/app/personas/internal/handlers"
	"github.com/app/personas/internal/models"
	"github.com/gin-gonic/gin"
)

func main() {
	if err := config.InitDatabase(); err != nil {
		log.Fatal("Error al conectar con la base de datos:", err)
	}
	if err := models.Migrate(); err != nil {
		log.Fatal("Error al migrar la base de datos:", err)
	}

	r := gin.Default()
	api := r.Group("/api/personas")
	{
		api.GET("", handlers.GetAllPersonas)
		api.GET("/:id", handlers.GetPersonaByID)
		api.POST("", handlers.CreatePersona)
		api.PUT("/:id", handlers.UpdatePersona)
		api.PATCH("/:id", handlers.PatchPersona)
		api.DELETE("/:id", handlers.DeletePersona)
	}

	r.Run(":5000")
}