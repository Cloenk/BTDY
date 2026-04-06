extends Sprite2D

@onready var cash_counter: Label = $CashCounter
@onready var lives_counter: Label = $LivesCounter
@onready var monkey_selected: Node2D = $MonkeySelected
@onready var slots: Node2D = $Slots
@onready var upgrade_slots: Node2D = $MonkeySelected/UpgradeSlots
@onready var upgrade_slot_bottom: UpgradeSlot = $MonkeySelected/UpgradeSlots/UpgradeSlotBottom
@onready var upgrade_slot_middle: UpgradeSlot = $MonkeySelected/UpgradeSlots/UpgradeSlotMiddle
@onready var upgrade_slot_top: UpgradeSlot = $MonkeySelected/UpgradeSlots/UpgradeSlotTop

func _process(delta: float) -> void:
	cash_counter.text = str(GlobalGame.cash)
	lives_counter.text = str(GlobalGame.lives)
	
	if !GlobalGame.placingMonkey and GlobalGame.selectedMonkey:
		monkey_selected.show()
		slots.hide()
		if GlobalGame.selectedMonkey.nextUpgrades.size() == 0:
			for upgradeSlot: UpgradeSlot in upgrade_slots.get_children():
				upgradeSlot.upgrade = null
		if GlobalGame.selectedMonkey.nextUpgrades.size() == 1:
			upgrade_slot_middle.upgrade = GlobalGame.selectedMonkey.nextUpgrades[0]
		else:
			for i in GlobalGame.selectedMonkey.nextUpgrades.size():
				upgrade_slots.get_child(i).upgrade = GlobalGame.selectedMonkey.nextUpgrades[i]
	else:
		monkey_selected.hide()
		slots.show()
