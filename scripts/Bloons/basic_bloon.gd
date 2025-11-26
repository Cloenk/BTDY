extends Bloon

func _process(delta: float) -> void:
	super(delta)
	$Label.text = str(layer)

func damage(amount: float, projectile: Projectile, doPopEffect: bool, overRideCanHit: bool):
	if canHit(projectile) or overRideCanHit:
		var newLayer = layer - amount
		if overRideCanHit == false:
			projectile.pierce -= density
		if layer == 6 or layer == 7:
			spawnExtraBloon(amount - 1,projectile,"pink",25)
			spawnExtraBloon(amount - 1,projectile,"pink",-25)
			return
		if layer == 8:
			spawnExtraBloon(amount - 1,projectile,"black",25)
			spawnExtraBloon(amount - 1,projectile,"white",-25)
			delete()
			return
		if layer == 9:
			spawnExtraBloon(amount - 1,projectile,"zebra",25)
			spawnExtraBloon(amount - 1,projectile,"zebra",-25)
			delete()
			return
		if layer >= 10 and layer <= 20:
			if newLayer <= 10:
				spawnExtraBloon(amount - (layer - 10),projectile,"rainbow",25)
				spawnExtraBloon(amount - (layer - 10),projectile,"rainbow",-25)
				delete()
				return
		if layer >= 21 and layer <= 40:
			if newLayer <= 21:
				spawnExtraBloon(amount - (layer - 10),projectile,"ceramic",25)
				spawnExtraBloon(amount - (layer - 10),projectile,"ceramic",-25)
				delete()
				return
		setLayer(newLayer)

func setLayer(newlayer: int):
	super(newlayer)
	match layer:
		1:
			setStats(100,1,0,type)
			Base.texture = load("res://assets/Sprites/Bloons/RedBloon.png")
			Base.scale = Vector2(4.8,4.8)
		2:
			setStats(150,1,0,type)
			Base.texture = load("res://assets/Sprites/Bloons/BlueBloon.png")
			Base.scale = Vector2(4.9,4.9)
		3:
			setStats(200,1,0,type)
			Base.texture = load("res://assets/Sprites/Bloons/GreenBloon.png")
			Base.scale = Vector2(5,5)
		4:
			setStats(300,1,0,type)
			Base.texture = load("res://assets/Sprites/Bloons/YellowBloon.png")
			Base.scale = Vector2(5.1,5.1)
		5:
			setStats(350,1,0,type)
			Base.texture = load("res://assets/Sprites/Bloons/PinkBloon.png")
			Base.scale = Vector2(5.2,5.2)
		6:
			setStats(150,1,0,type)
			Base.texture = load("res://assets/Sprites/Bloons/BlackBloon.png")
			Base.scale = Vector2(4.0,4.0)
		7:
			setStats(150,1,0,type)
			Base.texture = load("res://assets/Sprites/Bloons/WhiteBloon.png")
			Base.scale = Vector2(4.0,4.0)
		8:
			setStats(200,1,0,type)
			Base.texture = load("res://assets/Sprites/Bloons/ZebraBloon.png")
			Base.scale = Vector2(5.2,5.2)
		9:
			setStats(325,1,0,type)
			Base.texture = load("res://assets/Sprites/Bloons/RainbowBloon.png")
			Base.scale = Vector2(5.2,5.2)
	if layer >= 10 and layer <= 20:
		setStats(250,1,0,type)
		Base.scale = Vector2(5.2,5.2)
		if layer > 10:
			Base.texture = load("res://assets/Sprites/Bloons/CeramicBloonLast.png")
		if layer > 14:
			Base.texture = load("res://assets/Sprites/Bloons/CeramicBloonHalf.png")
		if layer > 17:
			Base.texture = load("res://assets/Sprites/Bloons/CeramicBloon.png")
	if layer >= 21 and layer <= 40:
		setStats(200,2,0,type)
		Base.scale = Vector2(5.3,5.3)
		if layer > 23:
			Base.texture = load("res://assets/Sprites/Bloons/BrickBloonLast.png")
		if layer > 28:
			Base.texture = load("res://assets/Sprites/Bloons/BrickBloonHalf.png")
		if layer > 34:
			Base.texture = load("res://assets/Sprites/Bloons/BrickBloon.png")
