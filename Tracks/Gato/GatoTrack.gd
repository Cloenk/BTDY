extends Track

@export var allBloons: Array[BloonSpawn]

@onready var path_2d: Path2D = $Path2D

func _ready() -> void:
	super()
	for bloon in allBloons:
		spawnBloon(bloon,0)
