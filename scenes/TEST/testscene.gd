extends Node2D
@onready var bloon: Bloon = $Bloon
@onready var projectile: Projectile = $Projectile
@onready var basic_bloon: CharacterBody2D = $BasicBloon

func _ready() -> void:
	bloon.setLayer(30)
	projectile.setStats(2,2,1,1,false,false)
	projectile.hit(bloon)
