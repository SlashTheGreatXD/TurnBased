function tilesInit()
  local tiles = {}
  tiles[1] = {
    name = "solid",
    solid = true,
    color = {0.5,0,0},
  }
  tiles[2] = {
    name = "air",
    solid = false,
    color = {0,0,0,0},
  }
  tiles[3] = {
    name = "door",
    solid = true,
    color = {0.5,0,0.5}
  }
  return tiles
end