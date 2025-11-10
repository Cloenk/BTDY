extends CharacterBody2D
class_name Bloon

var layer: int
var speed: float
var density: float
var ccResistance: float
var type: String = "None"
var progress: float = 0
var ProjBlackList: Array[Projectile]
@export var Base: Sprite2D

func _ready() -> void:
	add_to_group("bloon")

func setStats(speed: float, density: float, ccResistance: float, type: String):
	self.speed = speed
	self.density = density
	self.ccResistance = ccResistance
	self.type = type

func damage(amount: float, projectile: Projectile, doPopEffect: bool, overRideCanHit: bool):
	if canHit(projectile) or overRideCanHit:
		setLayer(layer - amount)
		projectile.pierce -= density

func canHit(projectile: Projectile):
	if !ProjBlackList.has(projectile) and projectile.pierce > 0:
		match type:
			"None":
				return true
			"Camo":
				return projectile.camo
			"Lead":
				if projectile.lead:
					return true
				else:
					projectile.pierce = 0
					return false

func setLayer(newLayer: int):
	layer = newLayer
	if layer <= 0:
		delete()

func spawnExtraBloon(amount:float,projectile: Projectile, type: String,offset:float):
	var bloon1 = GlobalGame.currentTrack.spawnBloon(type,progress + offset)
	bloon1.ProjBlackList.append(projectile)
	if amount > 0:
		bloon1.damage(amount,projectile,false,true)
	delete()
	return

func delete():
	get_parent().queue_free()
	queue_free()

func _process(delta: float) -> void:
	progress = get_parent().progress
