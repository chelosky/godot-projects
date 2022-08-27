extends Position2D

const CAR_NODE = preload("res://Car/Car.tscn")

export (float) var timer = 1
export (CarClass.DIRECTION) var spawnDirection = CarClass.DIRECTION.RIGHT

func _ready():
	$Timer.start(timer)

func _on_Timer_timeout():
	var car = CAR_NODE.instance()
	car.init(spawnDirection)
	car.position = position
	add_child(car)
