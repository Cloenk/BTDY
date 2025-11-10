extends Node2D

@export var Track: track
@onready var monkeys: Node2D = $Monkeys
@onready var projectiles: Node2D = $Projectiles

func _ready() -> void:
	GlobalGame.monkeys = monkeys
	GlobalGame.projectiles = projectiles
	GlobalGame.currentTrack = Track
	#Track.spawnBloon("red",0)
	#Track.spawnBloon("blue",0)
	#Track.spawnBloon("green",0)
	#Track.spawnBloon("yellow",0)
	#Track.spawnBloon("pink",0)
	#Track.spawnBloon("black",0)
	#Track.spawnBloon("white",0)
	#Track.spawnBloon("zebra",0)
	#Track.spawnBloon("rainbow",0)
	Track.spawnBloon("ceramic",0)
	#Track.spawnBloon("brick",0)
