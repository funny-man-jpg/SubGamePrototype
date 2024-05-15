extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var attackTiming: float
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
signal swing

func start():
	$BasicAttackTimer.start()

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity += direction * 600 * delta
		if direction.x == 0:
			velocity.x = lerp(velocity.x, 0.0, 0.1)
		elif direction.y == 0:
			velocity.y = lerp(velocity.y, 0.0, 0.1)
	else:
		if direction == Vector2(0,0):
			velocity = lerp(velocity, Vector2(0,0), 0.22)
		
	velocity.x = clamp(velocity.x, -SPEED, SPEED)
	velocity.y = clamp(velocity.y, -SPEED, SPEED)
	move_and_slide()


func _on_basic_attack_timer_timeout():
	emit_signal("swing")
