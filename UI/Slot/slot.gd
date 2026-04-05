extends Node2D
class_name Slot

@onready var icon: Sprite2D = $Icon

@export var monkeyResource: MonkeyResource

func _process(delta: float) -> void:
	if monkeyResource:
		show()
		icon.texture = monkeyResource.icon
	else:
		hide()

func _on_button_pressed() -> void:
	if GlobalGame.cash >= monkeyResource.price:
		if GlobalGame.placingMonkey:
			GlobalGame.placingMonkey.queue_free()
		var newMonkey = monkeyResource.monkeyScene.instantiate()
		GlobalGame.monkeys.add_child(newMonkey)
		GlobalGame.placingMonkey = newMonkey
		GlobalGame.placingMonkeyPrice = monkeyResource.price
		GlobalGame.selectedMonkey = null
