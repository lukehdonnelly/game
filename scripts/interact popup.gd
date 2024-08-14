extends CanvasLayer

var player_in_NPC = false
var typing_speed = 0.05  # Time between each character appearing
var current_dialogue = []  # Stores the current NPC's dialogue
var current_line_index = 0  # Index for the current dialogue line
var typing = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$"interact panel".hide()
	$"dialogue panel".hide()

func _process(delta):
	if player_in_NPC and Input.is_action_just_pressed("ui_select") and !typing:
		$"interact panel".hide()
		$"dialogue panel".show()  # Show the dialogue panel when entering the area
		$"dialogue panel/next dialogue text".hide()
		if current_dialogue.size() > 0:
			if current_line_index < current_dialogue.size():
				start_typing_text(current_dialogue[current_line_index])  # Start typing the current line
				current_line_index += 1
			else:
				# If all lines are shown, hide the dialogue panel
				$"dialogue panel".hide()
				player_in_NPC = false

# Coroutine to type out the text
func start_typing_text(text):
	$"dialogue panel/next dialogue text".hide()
	typing = true
	var label = $"dialogue panel/dialogue text"
	label.text = ""
	await get_tree().create_timer(typing_speed).timeout
	for i in range(text.length()):
		label.text += text[i]
		await get_tree().create_timer(typing_speed).timeout
	typing = false
	$"dialogue panel/next dialogue text".show()

func _on_interact_area_area_entered(area):
	if area.has_method("get_dialogue"):
		$"interact panel".show()
		player_in_NPC = true
		current_dialogue = area.get_dialogue()  # Get the dialogue from the NPC
		current_line_index = 0  # Reset the dialogue line index

func _on_interact_area_area_exited(area):
	$"interact panel".hide()
	player_in_NPC = false
	$"dialogue panel".hide()
	current_line_index = 0  # Reset the dialogue line index when exiting the area
