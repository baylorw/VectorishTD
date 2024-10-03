extends Node


func add_creep_to_path_wave(path_wave: PathWave, creep_name: String, count: int, level:=1):
	for i in count:
		var creep = CreepSpecifier.new(creep_name, level)
		path_wave.creeps.push_back(creep)

func create_uniform_wave(number_of_paths: int, creep_name: String, number_per_path: int, level:=1, time_between_creeps_s: float=-1) -> Wave:
	var wave = Wave.new()
	if time_between_creeps_s > 0:
		wave.time_between_creeps_sec = time_between_creeps_s
	for path_number in number_of_paths:
		var path_name = "path_" + str(path_number+1)
		var path_wave = PathWave.new()
		wave.wave_by_path[path_name] = path_wave
		add_creep_to_path_wave(path_wave, creep_name, number_per_path, level)
	return wave

func create_default_waves(number_of_paths: int) -> Array[Wave]:
	var wave  : Wave
	var waves : Array[Wave] = []
	waves.push_back(create_uniform_wave(number_of_paths, "weak",   14, 1))
	waves.push_back(create_uniform_wave(number_of_paths, "normal", 14, 2))
	
	wave = create_uniform_wave(number_of_paths, "fast",   14, 3, 0.25)
	wave.end_message = "[center]Careful. Next comes [color=red]Red[/color].\nThey're slow but tough.[/center]"
	waves.push_back(wave)
	
	wave = Wave.new()
	waves.push_back(wave)
	for path_number in number_of_paths:
		var path_name = "path_" + str(path_number+1)
		var path_wave = PathWave.new()
		wave.wave_by_path[path_name] = path_wave
		add_creep_to_path_wave(path_wave, "normal", 5, 4)
		add_creep_to_path_wave(path_wave, "tough",  1, 4)
		add_creep_to_path_wave(path_wave, "normal", 3, 4)
		add_creep_to_path_wave(path_wave, "tough",  1, 4)
		add_creep_to_path_wave(path_wave, "normal", 3, 4)
		add_creep_to_path_wave(path_wave, "tough",  1, 4)
	
	waves.push_back(create_uniform_wave(number_of_paths, "weak",   14, 5))
	waves.push_back(create_uniform_wave(number_of_paths, "normal", 20, 6))
	waves.push_back(create_uniform_wave(number_of_paths, "fast",   20, 7, 0.25))
	
	wave = Wave.new()
	waves.push_back(wave)
	for path_number in number_of_paths:
		var path_name = "path_" + str(path_number+1)
		var path_wave = PathWave.new()
		wave.wave_by_path[path_name] = path_wave
		add_creep_to_path_wave(path_wave, "normal",  5, 8)
		add_creep_to_path_wave(path_wave, "tough",   1, 8)
		add_creep_to_path_wave(path_wave, "normal",  3, 8)
		add_creep_to_path_wave(path_wave, "tough",   1, 8)
		add_creep_to_path_wave(path_wave, "normal",  3, 8)
		add_creep_to_path_wave(path_wave, "chicken", 1, 8)
	
	waves.push_back(create_uniform_wave(number_of_paths, "weak",   20, 9))
	waves.push_back(create_uniform_wave(number_of_paths, "normal", 20, 10))
	waves.push_back(create_uniform_wave(number_of_paths, "fast",   20, 11, 0.25))
	
	wave = Wave.new()
	waves.push_back(wave)
	for path_number in number_of_paths:
		var path_name = "path_" + str(path_number+1)
		var path_wave = PathWave.new()
		wave.wave_by_path[path_name] = path_wave
		add_creep_to_path_wave(path_wave, "normal",  5, 12)
		add_creep_to_path_wave(path_wave, "tough",   1, 12)
		add_creep_to_path_wave(path_wave, "normal",  3, 12)
		add_creep_to_path_wave(path_wave, "chicken", 1, 12)
		add_creep_to_path_wave(path_wave, "normal",  3, 12)
		add_creep_to_path_wave(path_wave, "chicken", 1, 12)
	
	waves.push_back(create_uniform_wave(number_of_paths, "weak",   20, 13))
	waves.push_back(create_uniform_wave(number_of_paths, "normal", 20, 14))
	waves.push_back(create_uniform_wave(number_of_paths, "fast",   20, 15, 0.25))
	
	wave = Wave.new()
	waves.push_back(wave)
	for path_number in number_of_paths:
		var path_name = "path_" + str(path_number+1)
		var path_wave = PathWave.new()
		wave.wave_by_path[path_name] = path_wave
		add_creep_to_path_wave(path_wave, "weak",    5, 20)
		add_creep_to_path_wave(path_wave, "chicken", 1, 20)
		add_creep_to_path_wave(path_wave, "normal",  3, 20)
		add_creep_to_path_wave(path_wave, "chicken", 1, 20)
		add_creep_to_path_wave(path_wave, "fast",    3, 20)
		add_creep_to_path_wave(path_wave, "chicken", 1, 20)
	
	return waves
