extends Control

signal pressed
signal missed

func _on_sign_pressed():
	emit_signal("pressed", self)
	emit_signal("missed")
	
func reset():
	pass
