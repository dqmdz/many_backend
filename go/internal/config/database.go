package config

import (
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
)

var DB *gorm.DB

func InitDatabase() error {
	var err error
	DB, err = gorm.Open(sqlite.Open("personas.db"), &gorm.Config{
		Logger: logger.Default.LogMode(logger.Info),
	})
	return err
}