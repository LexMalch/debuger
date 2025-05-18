extends TileMapLayer
var damaged_tiles = {}
var coins_scene = load("res://scene/coins/coins.tscn")
signal popa
func damage_tile(Rid):
	
	var data = get_cell_tile_data(get_coords_for_body_rid(Rid))
	
	if not Rid in damaged_tiles:
		damaged_tiles[Rid] = data.get_custom_data("hp")
		
	else:
		damaged_tiles[Rid] -=1
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
			
		
	
