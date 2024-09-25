tool
extends CenterContainer

export var id = 0
export var direction = 0
export var front = true

func _process(_delta):
	$"%Front".visible = front
	$"%MainSign".texture = load("res://assets/" + str(id + 1) + ".png")
	if direction == 0:
		$"%Line".hide()
	else:
		$"%Line".show()
		$"%Line".texture = load("res://assets/line" + str(direction - 1) + ".png")
	

func _on_sign_pressed(pressed_id):
	if pressed_id == id:
		front = false
	else:
		get_node("%Sign" + str(pressed_id)).disabled = true
