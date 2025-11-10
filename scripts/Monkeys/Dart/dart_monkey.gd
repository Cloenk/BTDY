extends monkey

@onready var dartScene: PackedScene = preload("res://scenes/Monkeys/Dart/dart.tscn")

func attack():
	super()
	var dart: Projectile = dartScene.instantiate()
	dart.global_position = global_position
	dart.velocity = Vector2(1500,0).rotated(lookMarker.rotation)
	dart.rotation = lookMarker.rotation
	dart.setStats(2,7,0.3,false,false)
	GlobalGame.projectiles.add_child(dart)
