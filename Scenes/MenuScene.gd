extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here


	var vViewPortRes = get_viewport().size
	var firstSeedPosition = Vector2(vViewPortRes.x*0.5, vViewPortRes.y - vViewPortRes.y*0.5) 
	var secondSeedPosition = Vector2(vViewPortRes.x*0.4, vViewPortRes.y - vViewPortRes.y*0.3) 
	var playerStart = Vector2(vViewPortRes.x*0.1, vViewPortRes.y - vViewPortRes.y*0.1) 

	$firstSeed.position = firstSeedPosition
	$Seed2.position = secondSeedPosition
	$Slime.position = firstSeedPosition
	$TileMap.position = Vector2(0,0)

	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	#$World.rotate(10*delta)
	#var loc = $World.get_transform().origin
#	loc.x += 0.1*delta
#	loc.y += 0.1*delta
#	var tr = Transform2D( 10*delta, loc)	

	pass
