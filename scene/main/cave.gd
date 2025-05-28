extends TileMapLayer
var damaged_tiles = {}
var coins_scene = load("res://scene/coins/coins.tscn")
signal popa

func feeler_placed(coords):
	var place = local_to_map(to_local(coords))
	for i in range(1,5):
		%floor.set_cell(place+Vector2i(0,-i), 0,Vector2i(1,0),0)
		%floor.set_cell(place+Vector2i(0,+i), 0,Vector2i(1,0),0)
		%floor.set_cell(place+Vector2i(i,0), 0,Vector2i(1,0),0)
		%floor.set_cell(place+Vector2i(-i,0), 0,Vector2i(1,0),0)
		await get_tree().create_timer(0.1).timeout
	%floor.set_cell(place+Vector2i(1,1), 0,Vector2i(1,0),0)
	%floor.set_cell(place+Vector2i(-1,-1), 0,Vector2i(1,0),0)
	%floor.set_cell(place+Vector2i(-1,1), 0,Vector2i(1,0),0)
	%floor.set_cell(place+Vector2i(1,-1), 0,Vector2i(1,0),0)

	


	



func damage_tile(Rid,player_damage):
	
	var data = get_cell_tile_data(get_coords_for_body_rid(Rid))
	$GPUParticles2D.global_position =to_global(map_to_local(get_coords_for_body_rid(Rid)))
	$GPUParticles2D.restart()
	if not Rid in damaged_tiles:
		
		damaged_tiles[Rid] = data.get_custom_data("hp")
		damaged_tiles[Rid] -= player_damage
		if damaged_tiles[Rid] <=0:
			erase_cell(get_coords_for_body_rid(Rid))
			damaged_tiles.erase(Rid)
			var coins_scene_inst
			if data.get_custom_data("type")=="_$_":
				for i in range(Globals.ores):
					await get_tree().create_timer(1).timeout
					coins_scene_inst = coins_scene.instantiate()
					coins_scene_inst.global_position = to_global(map_to_local(get_coords_for_body_rid(Rid)))# + Vector2(-16,-(296-136-16)) + Vector2(round(randf_range(-20,20)),round(randf_range(-20,20)))
					coins_scene_inst.type ="$"
					add_child(coins_scene_inst)
					
				
			elif data.get_custom_data("type")=="_#_":
				for i in range(Globals.ores):
					await get_tree().create_timer(1).timeout
					coins_scene_inst = coins_scene.instantiate()
					coins_scene_inst.global_position = to_global(map_to_local(get_coords_for_body_rid(Rid)))# + Vector2(-16,-(296-136-16)) + Vector2(round(randf_range(-20,20)),round(randf_range(-20,20)))
					coins_scene_inst.type ="#"
					add_child(coins_scene_inst)
				
		
	else:
		damaged_tiles[Rid] -= player_damage
		if damaged_tiles[Rid] <=0:
			erase_cell(get_coords_for_body_rid(Rid))
			damaged_tiles.erase(Rid)
			var coins_scene_inst
			if data.get_custom_data("type")=="_$_":
				for i in range(Globals.ores):
					coins_scene_inst = coins_scene.instantiate()
					coins_scene_inst.global_position = to_global(map_to_local(get_coords_for_body_rid(Rid))) + Vector2(-16,-(296-136-16))
					coins_scene_inst.type ="$"
					add_child(coins_scene_inst)
					
				
			elif data.get_custom_data("type")=="_#_":
				for i in range(Globals.ores):
					coins_scene_inst = coins_scene.instantiate()
					coins_scene_inst.global_position = to_global(map_to_local(get_coords_for_body_rid(Rid))) + Vector2(-16,-(296-136-16))
					coins_scene_inst.type ="#"
					add_child(coins_scene_inst)
					
			
		
	
