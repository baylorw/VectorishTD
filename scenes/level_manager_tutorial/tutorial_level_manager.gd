class_name TutorialLevelManager extends LevelManager

@onready var tutorial: Node = %Tutorial

func _ready():
	Globals.level_name = "res://levels/tutorial/tutorial.tscn"
	super._ready()
	Events.level_loaded.emit()

func is_a_buildable_position(tile_position : Vector2i) -> bool:
	var answer = super.is_a_buildable_position(tile_position)
	return answer

#region Tower Info popup events
#func _on_sell_button_pressed() -> void:
	#CurrentLevel.money += selected_tower.get_sell_value()
	#ui.show_money()
	#tower_by_map_coord.erase(selected_tower.position_tile)
	#selected_tower.queue_free()
	#tower_info_popup_panel.hide()
#
#func _on_target_button_pressed() -> void:
	#var strategies = selected_tower.allowed_targeting_strategies
	#var index = strategies.find(selected_tower.targeting_strategy)
	#index += 1
	#if index >= strategies.size():
		#index = 0
	#selected_tower.targeting_strategy = strategies[index]
	#%TargetStrategyLabel.text = selected_tower.get_targeting_strategy_name()
#
#func _on_upgrade_button_pressed() -> void:
	#super._on_upgrade_button_pressed()
#endregion
