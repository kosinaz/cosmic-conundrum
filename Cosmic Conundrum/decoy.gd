extends Control

func _on_sign_pressed():
	for clue in $"..".get_children():
		if clue.get_node("Sign").pressed:
			clue.get_node("Sign").pressed = false
