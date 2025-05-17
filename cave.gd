extends TileMapLayer

# ID тайлов (замените на свои из TileSet)
enum Tiles {
	DIRT = 3,   # Земля (основа)
	GOLD = 3,   # Золото
	IRON = 2    # Железо
}

func _ready():
	generate_world()

# Генерация мира
func generate_world():
	clear()  # Очищаем карту
	
	# 1. Заполняем всю карту землёй (40x30 тайлов)
	for x in range(-20, 20):
		for y in range(-15, 15):
			set_cell(0, Vector2i(x, y), Tiles.DIRT, Vector2i.ZERO)
	
	# 2. Размещаем золото (15 тайлов)
	place_resources(Tiles.GOLD, 15)
	
	# 3. Размещаем железо (10 тайлов)
	place_resources(Tiles.IRON, 10)

# Размещение ресурсов
func place_resources(tile_id: int, count: int):
	for _i in range(count):
		var x = randi_range(-18, 18)
		var y = randi_range(-13, 13)
		set_cell(0, Vector2i(x, y), tile_id, Vector2i.ZERO)

# Добыча ресурсов по клику (опционально)
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var mouse_pos = get_global_mouse_position()
		var cell = local_to_map(mouse_pos)
		
		var tile_id = get_cell_source_id(0, cell)
		if tile_id == Tiles.GOLD:
			print("Добыто золото!")
			set_cell(0, cell, Tiles.DIRT, Vector2i.ZERO)  # Заменяем на землю
		elif tile_id == Tiles.IRON:
			print("Добыто железо!")
			set_cell(0, cell, Tiles.DIRT, Vector2i.ZERO)
