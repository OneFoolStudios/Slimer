extends KinematicBody2D

export (int) var SPEED = 4000
#export (int) var GRAVITY = 500
export (int) var JUMPDIST = 250

var velocity = Vector2()  # the character's movement vector
var screensize  # size of the game window
var localSeed # seed where the character is on
var lastSeed # seed where the character was on
var pos = Vector2() #position of the character
var endPos = Vector2() #position where the character is jumping to
var distance = 0 #distance between the character and the jumping desination
var bigPos = false #small check to know if it's 'a-b' or 'b-a' (to know when player reached the jump destination)


func _ready():
	screensize = get_viewport_rect().size
	localSeed = get_node("/root/level1/firstSeed") #a starting seed
	
func _process(delta):
	
	rotation_degrees = localSeed.rotation_degrees
	
	if Input.is_action_just_pressed("ui_tap"):
		if velocity.x == 0 and velocity.y == 0 :
			jump()
	if distance > 0:
		velocity += velocity.normalized() * SPEED
		$Area2D/AnimatedSprite.play()
		move_and_slide(velocity*delta)
		pos = position
		if bigPos :
			distance = pos.length() - endPos.length()
		else :
			distance = endPos.length() - pos.length()
#	elif $Area2D/AnimatedSprite.is_playing():
#		pass
	else :
		$Area2D/AnimatedSprite.stop()
		if lastSeed == localSeed:
			position = localSeed.position
			lastSeed = null
		velocity = Vector2(0, 0)
		
	
	
	
	
func jump():
	lastSeed = localSeed
	pos = position
	endPos = pos + Vector2(JUMPDIST, 0).rotated(localSeed.rotation_degrees*PI/180)
	velocity = Vector2(1, 0).rotated(localSeed.rotation_degrees*PI/180)
	distance = endPos.length() - pos.length()
	if distance < 0 :
		bigPos = true
		distance = pos.length() - endPos.length()
	else :
		bigPos = false
	var x = 0
	
func start(pos):
	show()
	position = pos
	$CollisionShape2D.disabled = false

func _on_Area2D_body_entered( body ):
	localSeed = body
	position = body.position 
