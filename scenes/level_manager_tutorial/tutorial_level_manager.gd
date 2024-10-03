class_name TutorialLevelManager extends LevelManager

@onready var tutorial: Node = %Tutorial

func _ready():
	Globals.level_name = "res://levels/tutorial/tutorial.tscn"
	super._ready()
	Events.level_loaded.emit()

func is_a_buildable_position(tile_position : Vector2i) -> bool:
	var answer = super.is_a_buildable_position(tile_position)
	return answer
