package models

import (
	"github.com/app/personas/internal/config"
	"gorm.io/gorm"
)

type Persona struct {
	gorm.Model
	Nombre    string `json:"nombre"`
	Apellido  string `json:"apellido"`
	Documento string `json:"documento"`
	Direccion string `json:"direccion"`
}

func Migrate() error {
	return config.DB.AutoMigrate(&Persona{})
}