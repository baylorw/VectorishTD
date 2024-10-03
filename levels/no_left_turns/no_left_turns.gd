extends LevelData

func setup_paths():
	var path := Path.new()
	path.name = "path_1"
	path_by_name[path.name] = path
	path.start_coord_map = coordinate_global_to_map(%StartGroup1.position)
	path.end_coord_map   = coordinate_global_to_map(%EndGroup1.position)
	path.kill_zone       = %KillZone

	path = Path.new()
	path.name = "path_2"
	path_by_name[path.name] = path
	path.start_coord_map = coordinate_global_to_map(%StartGroup2.position)
	path.end_coord_map   = coordinate_global_to_map(%EndGroup2.position)
	path.kill_zone       = %KillZone

func setup_waves():
	var wave  : Wave
	var number_of_paths := 2

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
