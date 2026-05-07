require("player")
require("tile")


game = {}
game.entities = {}
game.player = playerInit()
game.tiles = tilesInit()
game.map = {
  1,3,2,2,2,1,1,2,
  1,2,2,2,2,2,2,1,
  1,2,2,2,2,2,2,1,
  1,2,2,2,2,2,2,1,
  1,2,2,2,2,2,2,1,
  1,2,2,2,2,2,2,1,
  1,2,2,2,2,2,2,1,
  1,1,1,1,1,1,1,1,
}

function love.update(dt)
  
end

function love.draw()
  love.graphics.setColor(0.5, 0.5, 0.5)
  love.graphics.rectangle("fill",0,0,8 * 8,16 * 8)
  local j = 0
  while(j < 8) do
    local i = 0
    while( i < 8) do
      local index = 1 + i + 8 * j
      love.graphics.setColor(unpack(game.tiles[game.map[index]].color))
      love.graphics.rectangle("fill", i * 8, j * 16, 8, 16)
      i = i + 1
    end
    j = j + 1
  end
end
