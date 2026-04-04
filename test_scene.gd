extends Track
const BLUE_SPAWN = preload("uid://cc1f450aam0a4")
const BLACK_SPAWN = preload("uid://cjbuimbmqdo1p")
const WHITE_SPAWN = preload("uid://c10k4pk83hedx")
@onready var path_2d: Path2D = $Path2D

func _ready() -> void:
	super()
	var proj = Projectile.new()
	proj.damage = 2
	for a in 3:
		spawnBloon(WHITE_SPAWN,100)
	for bloon in path_2d.get_children():
		bloon.get_child(0).damage(proj,true,false,0)
