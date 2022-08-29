extends Control

func _ready():
	$Score.text = "Score: " + str(Global.score)

func _process(delta):
	if Input.is_action_just_pressed("start_game"):
		get_tree().change_scene("res://Level/Level.tscn")
