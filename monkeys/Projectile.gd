extends CharacterBody2D
class_name Projectile

@export var collisionArea: Area2D
@export var pierce: int = 1
@export var damage: float = 1
@export var speed: float = 50
@export var lifetime: float = 1
@export var camo: bool = false
@export var lead: bool = false
@export var ice: bool = false
@export var purple: bool = false
@export var ceramicBonus: float = 0
@export var moabBonus: float = 0

var hitBloons: Array[Bloon]
var lifetimeTimer: Timer

func _ready() -> void:
	lifetimeTimer = Timer.new()
	lifetimeTimer.one_shot = true
	lifetimeTimer.timeout.connect(delete)
	add_child(lifetimeTimer)
	lifetimeTimer.start(lifetime)

func _process(delta: float) -> void:
	if pierce > 0:
		for body in collisionArea.get_overlapping_bodies():
			if pierce > 0:
				if body.is_in_group("bloon") and !hitBloons.has(body):
					body.damage(self,true,false,0)
					hitBloons.append(body)
					pierce -= body.density
			else:
				delete()
				return
	else:
		delete()
		return

func _physics_process(delta: float) -> void:
	velocity = Vector2(speed,0).rotated(rotation)
	move_and_slide()

func delete():
	queue_free()
