extends Node2D
class_name monkey

@export var range: float
@export var rangeArea: Area2D
@export var rangeCircle: Node2D
@export var attackCooldown: float
@export var lookMarker: Marker2D
@export var base: Sprite2D
@export var AttackTimer: Timer

var target: Bloon
var canAttack = true

func _process(delta: float) -> void:
	rangeArea.scale = Vector2(range,range)
	rangeCircle.scale = Vector2(range,range)
	
	for b in rangeArea.get_overlapping_bodies():
		if b.is_in_group("bloon"):
			if target == null:
				target = b
			if b.progress > target.progress:
				target = b
	if !rangeArea.get_overlapping_bodies().has(target):
		target = null
	
	if target:
		lookMarker.look_at(target.global_position)
		if canAttack:
			attack()

func attack():
	AttackTimer.start()
	canAttack = false
	base.rotation = lookMarker.rotation + 1.571

func resetAttackCooldown():
	canAttack = true
