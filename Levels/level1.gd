# TUTORIAL LEVEL.
#	first level players will see as a test
#
#


extends Node2D

export (PackedScene) var Seed #the seeds or planets or shit the player needs to jump to.

enum sRegion {SCREEN_ALL, SCREEN_BOTTOM, SCREEN_MIDDEL, SCREEN_TOP}
var screenPartSizeX
var screenPartSizeY
var vViewPortRes #the resolution the game is played in. (to know the borders)
var seeds = [] # the array that contains the seeds the player needs to jump to.
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here

	vViewPortRes = get_viewport().size
	#screenPartSizeX = vViewPortRes.x/screenParts.size()
	screenPartSizeY = vViewPortRes.y/(sRegion.size()-1)
	var firstSeedPosition = Vector2(vViewPortRes.x*0.5, vViewPortRes.y - vViewPortRes.y*0.1) 
	var secondSeedPosition = Vector2(vViewPortRes.x*0.3, vViewPortRes.y - vViewPortRes.y*0.2) 	
	var noob = Vector2(vViewPortRes.x*0.3, vViewPortRes.y - vViewPortRes.y*0.2) 
	seeds.resize(5)
	for i in range(5) :
		seeds[i] = Seed.instance()
		add_child(seeds[i], true)
		seeds[i].position = randomGenPosition(sRegion.SCREEN_ALL)
		
#	var playerStart = Vector2(vViewPortRes.x*0.1, vViewPortRes.y - vViewPortRes.y*0.1) 

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

func randomGenPosition(var region):
	var posX
	var posY
	posX = rand_range(0, vViewPortRes.x)
	if region == 0:
		posY = rand_range(0, vViewPortRes.y)
	elif region == 1:
		posY = rand_range(vViewPortRes.y - screenPartSizeY, vViewPortRes.y)
	elif region == 2:
		posY = rand_range(screenPartSizeY, vViewPortRes.y - screenPartSizeY)
	elif region == 3:
		posY = rand_range(0, screenPartSizeY)
	else :
		posY = 0
	return Vector2(posX, posY)

