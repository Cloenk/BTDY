extends CharacterBody2D
class_name Bloon

@export var hp: float
@export var layers: Array[Layer]
@export var speed: float = 0
@export var density: float = 1
@export var progress: float = 0
@export var sprite: Sprite2D
@export var camo: bool = false
@export var lead: bool = false
@export var purple: bool = false
@export var ice: bool = false
@export var ceramic: bool = false
@export var moab: bool = false

func _ready() -> void:
	add_to_group("bloon")
	setStats(getCurrentLayer())

func damage(projectile: Projectile, doPopEffect: bool, overRideCanHit: bool, extraDamage: float):
	if canHit(projectile) or overRideCanHit and hp > 0:
		var damageToDeal = projectile.damage + extraDamage
		if projectile.ceramicBonus and ceramic:
			damageToDeal += projectile.ceramicBonus
		if projectile.moabBonus and moab:
			damageToDeal += projectile.moabBonus
		if damageToDeal > 0:
			split(projectile)
			hp -= damageToDeal
		if hp <= 0:
			die()
			return
		setStats(getCurrentLayer())

func split(projectile: Projectile):
	progress = get_parent().progress
	var extraProgress = -15 * getCurrentLayer().bloonsToSplit.size()/2
	for spawn in getCurrentLayer().bloonsToSplit:
		var bloon: Bloon = GlobalGame.currentTrack.spawnBloon(spawn,progress+extraProgress)
		projectile.hitBloons.append(bloon)
		bloon.damage(projectile,false,false,-1)
		extraProgress += 15

func canHit(projectile: Projectile):
	if camo and !projectile.camo:
		return false
	if lead and !projectile.lead:
		projectile.pierce = 0
		return false
	if purple and !projectile.purple:
		return false
	return true

func setStats(layer: Layer):
	speed = layer.speed
	density = layer.density
	sprite.texture = layer.sprite
	camo = layer.camo
	lead = layer.lead
	purple = layer.purple
	ceramic = layer.ceramic
	ice = layer.ice
	moab = layer.moab

func getCurrentLayer():
	for layer in layers:
		if layer.hpRange.x >= hp and layer.hpRange.y <= hp:
			return layer

func _process(delta: float) -> void:
	progress = get_parent().progress

func die():
	delete()

func delete():
	get_parent().queue_free()
	queue_free()
