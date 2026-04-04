extends Node2D
class_name Track

@export var paths: Array[Path2D]
var currentPath: int = 0
var bloons: Array[Bloon] = []

func _ready() -> void:
	Game.currentTrack = self

func spawnBloon(spawn: BloonSpawn, progress: float):
	var pathFollower = PathFollow2D.new()
	pathFollower.progress = progress
	getPath(currentPath).add_child(pathFollower)
	var bloon: Bloon = spawn.scene.instantiate()
	bloon.hp = spawn.hp
	pathFollower.add_child(bloon)
	bloons.append(bloon)
	currentPath += 1
	return bloon

func getPath(pathNum: int):
	if paths.size()-1 < pathNum:
		pathNum = 0
	return paths[pathNum]
