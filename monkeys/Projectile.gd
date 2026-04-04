extends CharacterBody2D
class_name Projectile

@export var pierce: int = 1
@export var damage: float = 1
@export var lifetime: float = 1
@export var camo: bool = false
@export var lead: bool = false
@export var purple: bool = false
@export var ceramicBonus: float = 0
@export var moabBonus: float = 0
@export var hitBloons: Array[Bloon]
@export var lifetimeTimer: Timer
