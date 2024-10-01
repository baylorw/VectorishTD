class_name TutorialManager extends Node

@onready var level_manager: TutorialLevelManager = $".."
@onready var tutorial_step_manager: TutorialStepManager = %TutorialStepManager
@onready var ui: LevelUI = %UI
@onready var tutorial_image: TextureRect = %TutorialImage

@onready var shade: TextureRect = %Shade
@onready var highlight_arrow: TextureRect = %HighlightArrow
@onready var tutorial_dialog: TutorialDialogWindow = %TutorialDialog
@onready var tutorial_label: Label = %TutorialLabel

var arrow_offset := Vector2(10, -10)
#--- If you want the visible area to be bigger than the object you're highlighting.
var highlight_offset_uv := 0.00


func _ready() -> void:
	disable_all_buttons()
	tutorial_image.hide()
	Events.level_loaded.connect(on_level_loaded)

func on_level_loaded():
	print("on_level_loaded")
	tutorial_step_manager.start()

func disable_all_buttons():
	ui.should_suppress_affordable_towers = true
	ui.disable_all_buttons()
func enable_all_buttons():
	ui.should_suppress_affordable_towers = false
	ui.enable_all_buttons()

func hide_tutorial_stuff():
	tutorial_image.hide()
	shade.hide()
	highlight_arrow.hide()
	tutorial_dialog.hide()
	enable_all_buttons()

func show_dialog(lines: Array[String], show_final_continue:=true) -> void:
	tutorial_dialog.show_lines(lines, show_final_continue)
	tutorial_dialog.show()

func show_image(texture: Texture):
	tutorial_image.texture = texture
	tutorial_image.show()

func dim_screen():
	disable_all_buttons()
	shade.visible = true

func highlight(object):
	disable_all_buttons()
	if (object is Button) or (object is TextureButton):
		object.disabled = false
	
	#print("NOTICE: object=%s position=%s global=%s screen=%s" % \
		#[object, object.position, object.global_position, object.get_screen_position()])
	
	highlight_arrow.visible = true
	if object.global_position.x < 50:
		highlight_arrow.position = get_top_right_corner(object)
		highlight_arrow.flip_h = true
	else:
		highlight_arrow.position = object.global_position - arrow_offset
		highlight_arrow.flip_h = false
	shade.visible = true
	var top_left     = global_to_uv(object.global_position)
	var bottom_right = global_to_uv(object.global_position + object.size)
	shade.material.set_shader_parameter("tlx", top_left.x-highlight_offset_uv)
	shade.material.set_shader_parameter("tly", top_left.y-highlight_offset_uv)
	shade.material.set_shader_parameter("brx", bottom_right.x+highlight_offset_uv)
	shade.material.set_shader_parameter("bry", bottom_right.y+highlight_offset_uv)

#region Coordinate functions
func global_to_uv(coord_global: Vector2) -> Vector2:
	return coord_global / get_viewport().get_visible_rect().size

func get_top_right_corner(object) -> Vector2:
	return object.global_position + Vector2(object.size.x, 0)
#endregion
