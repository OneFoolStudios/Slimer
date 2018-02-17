extends KinematicBody2D



export (int) var SPEED = 400  # how fast the player will move (pixels/sec)
var velocity = Vector2()  # the player's movement vector
var screensize  # size of the game window

func _ready():
	screensize = get_viewport_rect().size

func _process(delta):
	velocity = Vector2()
	if Input.is_action_just_pressed("ui_tap"):
		if velocity.x == 0 && velocity.y ==0 :
			
			velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		$AnimatedSprite.play()
	else :
		$AnimatedSprite.stop()
	position += velocity * delta
	
func start(pos):
	show()
	position = pos
	$CollisionShape2D.disabled = false
