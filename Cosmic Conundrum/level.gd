extends Node

func _process(_delta):
	var cards = $"%Cards".get_children()
	var won = true
	for top_card in cards:
		if not top_card.front:
			for card in cards:
				var card_sign = card.get_node("%Sign" + str(top_card.id))
				card_sign.disabled = true
				card_sign.texture_disabled = load("res://assets/0.png")
		else:
			won = false
	$NextButton.visible = won


func _on_next_button_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://level" + str(int($".".name.right(1)) + 1) + ".tscn")
