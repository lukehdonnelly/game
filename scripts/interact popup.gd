extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel.hide()

func _on_area_2d_body_entered(body):
	$Panel.show()


func _on_area_2d_body_exited(body):
	$Panel.hide()
