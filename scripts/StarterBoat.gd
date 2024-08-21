extends CharacterBody2D

var SPEED = 100

@onready var starter_boat = $StarterBoat

func _physics_process(delta):
	var input_vector = Vector2.ZERO # Making a 2 dimensional input vector
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left") # Horizontal positioning
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up") # Vertical
	input_vector = input_vector.normalized() # no clue what this does

  # giving the movement
	if input_vector:
		velocity = input_vector * SPEED #ensure that a speed variable is made
	else:
		velocity = input_vector
	move_and_slide()
  
	# horizontal flip
	if input_vector.x >= 0:
		starter_boat.flip_h = false
	else:
		starter_boat.flip_h = true
		
	# animation
	if input_vector.x == 0 && input_vector.y > 0:
		starter_boat.play("South")
	elif input_vector.x == 0 && input_vector.y < 0:
		starter_boat.play("North")
	elif input_vector.y > 0:
		starter_boat.play("SouthEast")
	elif input_vector.y == 0:
		starter_boat.play("East")
	elif input_vector.y < 0:
		starter_boat.play("NorthEast")



