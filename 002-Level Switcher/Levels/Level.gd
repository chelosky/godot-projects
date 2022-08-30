extends CanvasLayer

signal level_changed(level_name)

export (String) var level_name = "level"

var level_parameters = {
	"clicks": 0
}

func load_level_parameters(new_level_parameters: Dictionary):
	level_parameters = new_level_parameters
	$Label2.text = "CLICKS: " + str(level_parameters.clicks)

func _ready():
	$Button.disabled = true
	$Button2.disabled = false

func play_loaded_sound():
	$LevelLoadedSound.play()
	$Button.disabled = false

func cleanup():
	if $ButtonClickedSound.playing:
		yield($ButtonClickedSound, "finished")
	queue_free()

func _on_Button_pressed():
	$ButtonClickedSound.play()
	$Button.disabled = true	
	emit_signal("level_changed", level_name)


func set_clicks(new_value: int):
	level_parameters.clicks = new_value
	$Label2.text = "CLICKS: " + str(level_parameters.clicks)

func _on_Button2_pressed():
	set_clicks(level_parameters.clicks + 1)
