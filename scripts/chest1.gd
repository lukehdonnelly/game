extends Area2D

var chest_opened = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func chest_idle():
	get_parent().play("bob")

func chest_stop():
	if chest_opened == true:
		get_parent().play("close")
		chest_opened = false
	else:
		get_parent().stop()
		get_parent().play("default")

func chest_open():
	if chest_opened == false:
		chest_opened = true
		get_parent().play("open")
