extends Component
class_name RangeComponent

const CIRCLE_INSIDE = preload("uid://b2ykewsivdtbd")
const CIRCLE_OUTSIDE = preload("uid://cojsdys6olduo")

@export var range: float = 1

var rangeArea: Area2D
var collision: CollisionShape2D
var target: Bloon

func _init() -> void:
	component_name = "range"

func _ready() -> void:
	z_index = -1
	
	rangeArea = Area2D.new()
	add_child(rangeArea)
	
	collision = CollisionShape2D.new()
	collision.shape = CircleShape2D.new()
	collision.shape.radius = 20
	collision.debug_color = Color(0.698, 0.698, 0.698, 0.322)
	rangeArea.add_child(collision)

func getTargetBloon():
	match host.targetMode:
		"first":
			return getFirstBloon()
		"last":
			return getLastBloon()

func getFirstBloon():
	for b in rangeArea.get_overlapping_bodies():
		if b.is_in_group("bloon"):
			if target == null:
				target = b
			if b.progress > target.progress:
				target = b
	if !rangeArea.get_overlapping_bodies().has(target):
		target = null
	return target

func getLastBloon():
	for b in rangeArea.get_overlapping_bodies():
		if b.is_in_group("bloon"):
			if target == null:
				target = b
			if b.progress < target.progress:
				target = b
	if !rangeArea.get_overlapping_bodies().has(target):
		target = null
	return target

func _process(delta: float) -> void:
	scale = Vector2(range,range)
