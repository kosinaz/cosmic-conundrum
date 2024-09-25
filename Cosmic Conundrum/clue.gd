tool
extends Control

export var id = 0
export var rule = "right"
export var revealed = true

func _process(_delta):
	$Sign.disabled = revealed
	$Line.visible = revealed
	$Rule.disabled = revealed
	$Sign.texture_disabled = load("res://assets/" + str(id + 1) + ".png")
	$Rule.texture_disabled = load("res://assets/clue-" + rule + ".png")


func _on_rule_pressed():
	if $Sign.pressed:
		revealed = true
	else:
		for clue in $"..".get_children():
			if clue.get_node("Sign").pressed:
				clue.get_node("Sign").pressed = false


func _on_sign_pressed():
	for clue in $"..".get_children():
		if clue.get_node("Sign").pressed and not clue == self:
			clue.get_node("Sign").pressed = false
