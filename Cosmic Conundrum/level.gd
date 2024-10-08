extends Node

var current_clue = null
var misses = 0

func _process(_delta):
	var cards = $"%Cards".get_children()
	var won = true
	for top_card in cards:
		if not top_card.front:
			for card in cards:
				var card_sign = card.get_node("%Sign" + str(top_card.id - top_card.start_id))
				card_sign.disabled = true
				card_sign.texture_disabled = load("res://assets/0.png")
		else:
			won = false
	$NextButton.visible = won


func set_current_clue(clue):
	current_clue.reset()
	current_clue = clue


func _on_next_button_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://level" + str(int($".".name.right(1)) + 1) + ".tscn")


func _on_clue_pressed(clicked_clue):
	for clue in $ClueContainer.get_children():
		if clue != clicked_clue:
			clue.reset()


func _on_missed():
	misses += 1
	$"%Misses".text = str(misses)
