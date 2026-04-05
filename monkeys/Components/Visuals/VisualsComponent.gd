extends Component
class_name VisualsComponent

@export var texture: Texture
var sprite: Sprite2D

func _init() -> void:
	component_name = "visuals"
func _ready() -> void:
	sprite = Sprite2D.new()
	sprite.texture = texture
	sprite.rotation_degrees = 90
	add_child(sprite)
