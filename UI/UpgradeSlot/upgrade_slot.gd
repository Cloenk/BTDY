extends Node2D
class_name UpgradeSlot

@onready var name_label: Label = $NameLabel

@export var upgrade: Upgrade

func _process(delta: float) -> void:
	if upgrade:
		name_label.text = upgrade.UpgradeName
		show()
	else:
		hide()

func _on_buy_button_pressed() -> void:
	if GlobalGame.cash >= upgrade.price:
		GlobalGame.cash -= upgrade.price
		GlobalGame.selectedMonkey.getUpgrade(upgrade)
