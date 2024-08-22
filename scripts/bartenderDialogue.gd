extends Area2D  # Assuming the NPC is an Area2D node

var dialogue_options = [
	"Hello, traveler!",
	"How can I assist you today?",
	"Be careful out there, the road is dangerous."
]

# This function can be called when the player interacts with the NPC
func get_dialogue():
	return dialogue_options
