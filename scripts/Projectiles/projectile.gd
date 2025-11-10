extends CharacterBody2D
class_name Projectile

var pierce: float
var damage: int
var lifetime: float
var lead: bool
var camo: bool
var hitBloons: Array[Bloon]
var lifetimeTimer: Timer

@export var damageArea: Area2D

func _ready() -> void:
	lifetimeTimer = Timer.new()
	add_child(lifetimeTimer)
	lifetimeTimer.timeout.connect(delete)
	lifetimeTimer.start(lifetime)

func setStats(pierce: float, damage: int, lifetime: float, lead: bool, camo: bool):
	self.pierce = pierce
	self.damage = damage
	self.lifetime = lifetime
	self.lead = lead
	self.camo = camo

func hit(bloon: Bloon):
	bloon.damage(damage,self,true,false)
	if pierce <= 0:
		delete()

func delete():
	queue_free()

func _process(delta: float) -> void:
	for body in damageArea.get_overlapping_bodies():
		if body.is_in_group("bloon") and !hitBloons.has(body):
			hit(body)
			hitBloons.append(body)

func _physics_process(delta: float) -> void:
	move_and_slide()
