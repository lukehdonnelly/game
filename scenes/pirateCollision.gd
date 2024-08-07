extends CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	#print("plaher sofjdso")
	var label = Label.new()
	label.text = "Press E to interact"
	label.set_position(self.position)
	var font = FontFile.new()
	font.size = 24
	label.add_font_override("font", font)
	add_child(label)
