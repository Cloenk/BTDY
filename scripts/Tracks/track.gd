extends Node2D
class_name track

@onready var basicBloonScene: PackedScene = preload("res://scenes/Bloons/basic_bloon.tscn")

@export var path: Path2D

func spawnBloon(bloonType: String, progress: float):
	var bloon: Bloon
	var follower = PathFollow2D.new()
	follower.loop = false
	follower.rotates = false
	path.add_child(follower)
	follower.progress = progress
	match bloonType:
		"red":
			bloon = basicBloonScene.instantiate()
			bloon.setLayer(1)
		"blue":
			bloon = basicBloonScene.instantiate()
			bloon.setLayer(2)
		"green":
			bloon = basicBloonScene.instantiate()
			bloon.setLayer(3)
		"yellow":
			bloon = basicBloonScene.instantiate()
			bloon.setLayer(4)
		"pink":
			bloon = basicBloonScene.instantiate()
			bloon.setLayer(5)
		"black":
			bloon = basicBloonScene.instantiate()
			bloon.setLayer(6)
		"white":
			bloon = basicBloonScene.instantiate()
			bloon.setLayer(7)
		"zebra":
			bloon = basicBloonScene.instantiate()
			bloon.setLayer(8)
		"rainbow":
			bloon = basicBloonScene.instantiate()
			bloon.setLayer(9)
		"ceramic":
			bloon = basicBloonScene.instantiate()
			bloon.setLayer(20)
		"brick":
			bloon = basicBloonScene.instantiate()
			bloon.setLayer(40)
	bloon.progress = progress
	follower.add_child(bloon)
	return bloon

func _process(delta: float) -> void:
	for b in path.get_children():
		b.progress += b.get_child(0).speed * delta
		if b.progress_ratio == 1:
			b.queue_free()
