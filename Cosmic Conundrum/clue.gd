tool
extends Control

signal pressed
signal missed

export var revealed = true setget set_revealed
export var sign_0_0: Resource = null setget set_sign_0_0
export var sign_0_1: Resource = null setget set_sign_0_1
export var sign_1_0: Resource = null setget set_sign_1_0
export var sign_1_1: Resource = null setget set_sign_1_1
export var sign_2_0: Resource = null setget set_sign_2_0
export var sign_2_1: Resource = null setget set_sign_2_1

var signs = []

func _ready():
	set_revealed(false)
	set_signs()

func set_revealed(is_revealed):
	revealed = is_revealed
	for i in range(signs.size()):
		signs[i].disabled = revealed
		set_line_to(i, revealed)

func set_sign_0_0(sign_resource):
	sign_0_0 = sign_resource
	if Engine.editor_hint:
		set_signs()

func set_sign_0_1(sign_resource):
	sign_0_1 = sign_resource
	if Engine.editor_hint:
		set_signs()

func set_sign_1_0(sign_resource):
	sign_1_0 = sign_resource
	if Engine.editor_hint:
		set_signs()

func set_sign_1_1(sign_resource):
	sign_1_1 = sign_resource
	if Engine.editor_hint:
		set_signs()

func set_sign_2_0(sign_resource):
	sign_2_0 = sign_resource
	if Engine.editor_hint:
		set_signs()

func set_sign_2_1(sign_resource):
	sign_2_1 = sign_resource
	if Engine.editor_hint:
		set_signs()

func set_signs():
	for child in $Signs.get_children():
		child.visible = false
	signs = []
	if sign_0_0:
		$"%Sign00".texture_disabled = sign_0_0
		$"%Sign00".visible = true
		signs.append($"%Sign00")
	if sign_0_1:
		$"%Sign01".texture_disabled = sign_0_1
		$"%Sign01".visible = true
		signs.append($"%Sign01")
	if sign_1_0:
		$"%Sign10".texture_disabled = sign_1_0
		$"%Sign10".visible = true
		signs.append($"%Sign10")
	if sign_1_1:
		$"%Sign11".texture_disabled = sign_1_1
		$"%Sign11".visible = true
		signs.append($"%Sign11")
	if sign_2_0:
		$"%Sign20".texture_disabled = sign_2_0
		$"%Sign20".visible = true
		signs.append($"%Sign20")
	if sign_2_1:
		$"%Sign21".texture_disabled = sign_2_1
		$"%Sign21".visible = true
		signs.append($"%Sign21")

func reset():
	if revealed:
		return
	for child in $Lines.get_children():
		child.visible = false
	for current_sign in $Signs.get_children():
		current_sign.pressed = false

func set_line_to(i, is_revealed):
	if i == 0:
		return
	get_node("%Line" + signs[i - 1].name.right(4) + "" + signs[i].name.right(4)).visible = is_revealed

func _on_sign_pressed(xy):
	emit_signal("pressed", self)
	var i = signs.find(get_node("%Sign" + xy))
	if i == 0:
		if not get_node("%Sign" + xy).pressed:
			reset()
			emit_signal("missed")
		return
	if signs[i - 1].pressed:
		set_line_to(i, true)
		if i == signs.size() - 1:
			set_revealed(true)
	else:
		reset()
		emit_signal("missed")
