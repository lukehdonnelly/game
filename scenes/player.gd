extends CharacterBody2D

var SPEED = 100

func _physics_process(delta):
	var input_vector = Vector2.ZERO # Making a 2 dimensional input vector
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left") # Horizontal positioning
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up") # Vertical
	input_vector = input_vector.normalized() # changes so that the player doesnt move diagonally

  # giving the movement
	if input_vector:
		velocity = input_vector * SPEED #ensure that a speed variable is made
	else:
		velocity = input_vector
	move_and_slide()


func _on_area_2d_area_entered(area):
	pass # Replace with function body.
