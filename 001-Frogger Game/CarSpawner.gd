extends Position2D

const CAR_NODE = preload("res://Car/Car.tscn")

export (int, 220, 300, 10) var speed_flow = 250
export (float) var timer = 1
export (CarClass.DIRECTION) var spawn_direction = CarClass.DIRECTION.RIGHT

func _ready():
	$Timer.start(timer)

func _on_Timer_timeout():
	var car = CAR_NODE.instance()
	car.init(spawn_direction, speed_flow)
	add_child(car)
