function requeue()
  for i, entity in ipairs(game.entities) do
    table.insert(game.moveQueue,entity)
  end
end

function baseMap(width,height)
  local map = {}
  local i = 0
  while i < width do
    table.insert(map,1)
    i = i + 1
  end


  local j = 0
  while j < height - 2 do

    table.insert(map,1)

    local i = 0
    while i < width - 2 do
      table.insert(map,2)
      i = i + 1
    end

    table.insert(map,1)
    j = j + 1
  end


  local i = 0
  while i < width do
    table.insert(map,1)
    i = i + 1
  end
  return map
end

function gameInit()
  local game = {}
  game.entities = {}
  game.tiles = tilesInit()
  game.tileset = {
    image = love.graphics.newImage('ascii.png'),
    quads = {}
  }

  local j = 0
  while j < 8 do
    local i = 0
    while i < 36 do
      table.insert(game.tileset.quads,love.graphics.newQuad(i * 8 + 1,j * 16,9,17,game.tileset.image))
      i = i + 1
    end
    j = j + 1
  end
  local nums = {0,170,85,255}
  local palette = {}
  local i = 0
  while i < math.pow(2,6) do
    local tick = 0
    local j = 2
    while j <= 64 do
      if tick % 3 == 1 then
        
      end
      tick = tick + 1
      j = j * 2
    end
    --print(1 + (math.floor(i / 2)) + 2 * (math.floor(i / 16)))
    --[[
    local r = nums[1 + (math.floor(i % 8)) + 2 * (math.floor(i % 64))] / 255
    local g = nums[1 + (math.floor(i % 4)) + 2 * (math.floor(i % 32))] / 255
    local b = nums[1 + (math.floor(i % 2)) + 2 * (math.floor(i % 16))] / 255]]

    table.insert(palette, {r,g,b})
    i = i + 1
  end
  return game

end