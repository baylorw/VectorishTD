extends Control

const grayed_out_color := Color("48484888")

var level_name_by_id := {
	"tutorial": "Tutorial",
	"elementalish": "Elementalish",
	"frog": "Frog",
	"dq_halls_of_the_god_king": "God King",
	"no_left_turns": "No Left Turns",
	#"std": "SimpleTD",
	"slim_pickings": "Slim Pickings",
	"snaking_path": "Snaking Path",
	"switchback": "Switchback",
	"up_and_down": "Up And Down",
	"void": "Void",

	"dq_zelemir": "Zelemir"
}
var current_level : String

func _ready():
	setup_level_buttons()
	#--- Click on the first button.
	var first_button = %ButtonVBoxContainer.get_child(0) as Button
	first_button.button_pressed = true
	first_button.emit_signal("pressed")

func setup_level_buttons():
	#--- This button helps when designing the screen to see how much room stuff takes.
	#--- But we don't want to show it at runtime.
	%PlaceholderButton.free()
	
	var group := ButtonGroup.new()
	#--- i can't find a way to sort keys :(
	#level_name_by_id.keys().sort()
	for id in level_name_by_id.keys():
		var button = Button.new()
		var display_name = level_name_by_id[id]
		button.name = id + "Button"
		button.text = display_name
		button.set_meta("level_name", id)
		button.toggle_mode = true
		button.button_group = group
		button.pressed.connect(Callable(_on_level_selection_button_pressed).bind(id))
		%ButtonVBoxContainer.add_child(button)

func _on_load_level_button_pressed() -> void:
	if current_level == "tutorial":
		Globals.level_name = "res://levels/tutorial/tutorial.tscn"
		print("gonna load " + Globals.level_name)
		get_tree().change_scene_to_file("res://scenes/level_manager_tutorial/tutorial_level_manager.tscn")
	else:
		print("wasn't tutorial, loading something else")
		SceneNavigation.go_to_level(current_level)

func _on_level_selection_button_pressed(level_id : String):
	current_level = level_id
	show_level_info(level_id)

func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://menus/main/main_menu.tscn")

func show_level_info(level_id: String):
	var preview_texture_fqn = "res://levels/%s/%s.png" % [level_id, level_id]
	%CurrentLevelNameLabel.text = level_id
	%level_preview_image.texture = load(preview_texture_fqn)
