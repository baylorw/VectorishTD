extends Node

const creep_names := [
	#--- Normal
	"weak", "normal", "tough",
	"chicken",
	#--- Fast
	"fast",
	#"fast_on_straights", "sprint_on_damage", "sprint_near_death",
	#--- Special
	#"disable_tower", "front_shield", "juggernaut", "haste_others", "heal_others", 
	#"loner", "martyr", "regenerate", "shield_others", "spawner",
	#--- Special on death
	#"clown_car", "disable_tower_on_death", "explode", "heal_on_death", "lootbox",
	#--- Steering
	#"drunk", "overshoots",
	#--- Audibles
	#"screamer",
	#--- Fireworks
	#"confetti",
	# unfair, i don't wanna!, cry, laugh, dattebayo
	#--- Unwanted
	#"armor", "flying", "resist_certain_towers", "untargetable_by_certain_towers", 
	#"untargetable_at_times"
]
var creep_by_name := {
	"no_op": null
}

func _ready():
	for creep_name in creep_names:
		var resource = load_creep(creep_name)
		if resource:
			creep_by_name[creep_name] = resource
	
func load_creep(creep_name: String) -> Resource:
	var scene_fqn := "res://scenes/creeps/%s/%s.tscn" % [creep_name, creep_name]
	print("loading creep=" + scene_fqn)
	var resource : Resource = load(scene_fqn)
	if resource:
		return resource
	else:
		print("creep not found=" + scene_fqn)
		return null
