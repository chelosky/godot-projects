extends Node

const GOAL_POSITION = { 
	'TOP': 'TOP', 
	'DOWN': 'DOWN'
}
var current_goal = GOAL_POSITION.TOP

func _ready():
	set_score(0)

func set_score(new_score):
	Global.score = new_score
	$CanvasLayer/Score.text = 'Score: ' + str(Global.score)

func validate_score(goal):
	if goal == current_goal:
		set_score(Global.score + 1)
		var isTop = current_goal == GOAL_POSITION.TOP
		current_goal = GOAL_POSITION.DOWN if isTop else GOAL_POSITION.TOP

func _on_Top_body_entered(body): validate_score(GOAL_POSITION.TOP)

func _on_Down_body_entered(body): validate_score(GOAL_POSITION.DOWN)
