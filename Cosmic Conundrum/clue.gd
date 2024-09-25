tool
extends Control

export var id = 0
export var direction = 0
export var rule = "right"
export var revealed = true

func _process(_delta):
	for i in range(2):
		if i == direction:
			continue
		get_node("Line" + str(i)).visible = false
		get_node("Rule" + str(i)).visible = false
		get_node("Rule" + str(i)).disabled = false
	$Sign.disabled = revealed
	get_node("Line" + str(direction)).visible = revealed
	get_node("Rule" + str(direction)).visible = true
	get_node("Rule" + str(direction)).disabled = revealed
	$Sign.texture_disabled = load("res://assets/" + str(id + 1) + ".png")
	get_node("Rule" + str(direction)).texture_disabled = load("res://assets/clue-" + rule + ".png")


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
