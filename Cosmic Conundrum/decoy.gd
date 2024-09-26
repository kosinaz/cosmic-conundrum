extends Control

func _on_sign_pressed():
	for clue in $"..".get_children():
		if clue.get_node("Sign").pressed:
			clue.get_node("Sign").pressed = false
		if clue.has_node("Rule3") and not clue == self:
			clue.get_node("Rule3").pressed = false
			clue.get_node("Rule4").pressed = false
