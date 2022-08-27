extends Area2D
class_name CarClass

enum DIRECTION { LEFT = -1, RIGHT = 1 }

var speed = 250
var direction = DIRECTION.RIGHT

func init(init_direction):
	direction = init_direction
	$Sprite.flip_h = direction == DIRECTION.LEFT 

func _process(delta):
	position.x += speed * delta * direction

func _on_Car_body_entered(body):
	get_tree().change_scene("res://Game Screen/GameScreen.tscn")
