extends Node

func _process(_delta):
	var cards = $"%Cards".get_children()
	for top_card in cards:
		if not top_card.front:
			for card in cards:
				var card_sign = card.get_node("%Sign" + str(top_card.id))
				card_sign.disabled = true
				card_sign.texture_disabled = load("res://assets/0.png")
				
