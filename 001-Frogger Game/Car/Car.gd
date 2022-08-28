extends Area2D
class_name CarClass

enum DIRECTION { LEFT = -1, RIGHT = 1 }

var speed = 250
var direction = DIRECTION.RIGHT

func _ready():
	randomize()
	$Sprite.frame = randi() % $Sprite.get_hframes()

func init(init_direction, speed_flow):
	direction = init_direction
	$Sprite.flip_h = direction == DIRECTION.LEFT
	speed = speed_flow
	
func _process(delta):
	position.x += speed * delta * direction

func _on_Car_body_entered(body):
	get_tree().change_scene("res://Game Screen/GameScreen.tscn")
