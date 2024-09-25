extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_rule_pressed():
	if $Sign.pressed:
		$Sign.disabled = true
		$Rule.disabled = true
		$Line.visible = true
	else:
		for clue in $"..".get_children():
			if clue.get_node("Sign").pressed:
				clue.get_node("Sign").pressed = false


func _on_sign_pressed():
	for clue in $"..".get_children():
		if clue.get_node("Sign").pressed and not clue == self:
			clue.get_node("Sign").pressed = false
