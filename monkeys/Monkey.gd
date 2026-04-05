extends CharacterBody2D
class_name Monkey

@export var components: Array[Component] = []
@export var obstacleCheckArea: Area2D
var targetMode: String = "first"
var placed: bool = false
var canBePlaced: bool = true

func _ready() -> void:
	add_to_group("monkey")
	for component in components:
		component.host = self

func _process(delta: float) -> void:
	if !placed:
		checkIfCanBePlaced()
	else:
		canBePlaced = true
		modulate = Color.WHITE
		var rangeComponent = get_component("range")
		if rangeComponent:
			if GlobalGame.selectedMonkey == self:
				rangeComponent.show()
			else:
				rangeComponent.hide()

func checkIfCanBePlaced():
	for body in obstacleCheckArea.get_overlapping_bodies():
		if !body == self and body.is_in_group("monkey") or body.is_in_group("obstacle"):
			canBePlaced = false
			modulate = Color.RED
			return
	canBePlaced = true
	modulate = Color.WHITE

func add_component(new_component: Component):
	add_child(new_component)
	new_component.host = self
	components.append(new_component)
func remove_component(component_to_remove: Component):
	components.erase(component_to_remove)
	component_to_remove.queue_free()
func get_component(component_to_find: String):
	for component in components:
		if component.component_name == component_to_find:
			return component
	return null
