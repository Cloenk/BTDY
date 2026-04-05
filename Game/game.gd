extends Node2D
@onready var monkeys: Node2D = $Monkeys
@onready var projectiles: Node2D = $Projectiles
@onready var slots: Node2D = $GUI/SideBar/Slots
@onready var cash_counter: Label = $GUI/SideBar/CashCounter
@onready var lives_counter: Label = $GUI/SideBar/LivesCounter

func _ready() -> void:
	GlobalGame.monkeys = monkeys
	GlobalGame.Projectiles = projectiles

func _process(delta: float) -> void:
	cash_counter.text = str(GlobalGame.cash)
	lives_counter.text = str(GlobalGame.lives)
	
	if GlobalGame.placingMonkey:
		GlobalGame.placingMonkey.global_position = get_global_mouse_position()
		
		if Input.is_action_just_pressed("LMB") and GlobalGame.placingMonkey.canBePlaced:
			GlobalGame.placingMonkey.placed = true
			GlobalGame.selectedMonkey = GlobalGame.placingMonkey
			GlobalGame.placingMonkey = null
			GlobalGame.cash -= GlobalGame.placingMonkeyPrice
		if Input.is_action_just_pressed("RMB"):
			GlobalGame.placingMonkey.queue_free()
			GlobalGame.placingMonkey = null
	else:
		if Input.is_action_just_pressed("RMB"):
			GlobalGame.selectedMonkey = null
		
		if Input.is_action_just_pressed("LMB"):
			var mousePos: Vector2 = get_global_mouse_position()
			var closestMonkey: Monkey
			for monkey: Monkey in monkeys.get_children():
				if closestMonkey == null:
					closestMonkey = monkey
				if mousePos.distance_to(monkey.global_position) <= mousePos.distance_to(closestMonkey.global_position):
					closestMonkey = monkey
			if closestMonkey:
				if mousePos.distance_to(closestMonkey.global_position) <= 15:
					if GlobalGame.selectedMonkey == closestMonkey:
						GlobalGame.selectedMonkey = null
					else:
						GlobalGame.selectedMonkey = closestMonkey
				else:
					GlobalGame.selectedMonkey = null
			else:
				GlobalGame.selectedMonkey = null
