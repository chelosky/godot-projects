extends KinematicBody2D

const SPEED = 200
const PARAMETERS_IDLE_BLEND_POSITION = "parameters/Idle/blend_position"

var direction_input = Vector2.ZERO

func _process(delta):
	direction_input = Vector2.ZERO
	
	if Input.is_action_pressed("ui_left"):
		direction_input.x -= 1
	if Input.is_action_pressed("ui_up"):
		direction_input.y -= 1
	if Input.is_action_pressed("ui_right"):
		direction_input.x += 1
	if Input.is_action_pressed("ui_down"):
		direction_input.y += 1

	move_and_slide(direction_input.normalized() * SPEED )
	player_animation()

func player_animation():
	if direction_input.x != 0:
		$Sprite.flip_h = direction_input.x > 0
	if direction_input != Vector2.ZERO:
		$AnimationTree.set(PARAMETERS_IDLE_BLEND_POSITION, direction_input)
