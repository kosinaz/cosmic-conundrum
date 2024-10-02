extends Control

signal pressed

func _on_sign_pressed():
	emit_signal("pressed", self)
	
func reset():
	pass
