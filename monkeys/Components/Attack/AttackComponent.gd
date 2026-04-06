extends Component
class_name AttackComponent

@export var damage: float = 1
@export var pierce: float = 2
@export var attackCooldown: float = 0.95
@export var projectileSpeed: float = 500
@export var projectileLifetime: float = 1
@export var projectileScene: PackedScene
@export var projectilesAtOnce: float = 1
@export var spreadAmount: float = 0
@export var camo: bool = false
@export var lead: bool = false
@export var purple: bool = false
@export var ice: bool = false
@export var ceramicBonus: float = 0
@export var moabBonus: float = 0

var canAttack: bool = true
var attackTimer: Timer

func _init() -> void:
	component_name = "attack"
	attackTimer = Timer.new()
	attackTimer.one_shot = true
	attackTimer.timeout.connect(reset)
	add_child(attackTimer)

func _process(delta: float) -> void:
	var target: Bloon = host.get_component("range").getTargetBloon()
	if canAttack and target and host.placed:
		if target.camo and !camo:
			return
		attack(target)
		canAttack = false
		attackTimer.start(attackCooldown)

func attack(target: Bloon):
	host.get_component("visuals").look_at(target.global_position)
	look_at(target.global_position)
	var rot = spreadAmount * projectilesAtOnce
	rot /= 2
	for i in projectilesAtOnce:
		var proj: Projectile = projectileScene.instantiate()
		proj.damage = damage
		proj.speed = projectileSpeed
		proj.lifetime = projectileLifetime
		proj.pierce = pierce
		proj.rotation = rotation + rot
		proj.global_position = global_position
		GlobalGame.Projectiles.add_child(proj)
		rot -= spreadAmount

func reset():
	canAttack = true
