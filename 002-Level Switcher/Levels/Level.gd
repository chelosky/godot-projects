extends CanvasLayer

signal level_changed(level_name)

export (String) var level_name = "level"

func _ready():
	$Button.disabled = true

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
