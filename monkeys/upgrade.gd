extends Resource
class_name Upgrade

@export var UpgradeName: String = "burger"
@export var price: float = 0
@export var nextUpgrades: Array[Upgrade] = []
@export var AddDamage: float = 0
@export var AddPierce: float = 0
@export var AddAttackCooldown: float = 0
@export var AddProjectileSpeed: float = 0
@export var AddProjectileLifetime: float = 0
@export var SetProjectileScene: PackedScene
@export var AddProjectilesAtOnce: float = 0
@export var AddSpreadAmount: float = 0
@export var SetCamo: bool = false
@export var SetLead: bool = false
@export var SetPurple: bool = false
@export var SetIce: bool = false
@export var AddCeramicBonus: float = 0
@export var AddMoabBonus: float = 0
@export var AddRange: float = 0
@export var SetTexture: Texture
