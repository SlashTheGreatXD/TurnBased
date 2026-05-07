require("player")
require("tile")
require("game")
require("enemy")


game = {}
game.entities = {}
game.player = playerInit()
game.enemy = baseEnemyInit()
game.tiles = tilesInit()
game.tileset = love.graphics.newImage('ascii.png')
local i = 0
while i < 36 do
  love.graphics.newQuad(i * 8,0,8,16,game.tileset)
  i = i + 1
end

game.map = {
  grid = baseMap(16,8),
  width = 16,
  height = 8,
}
game.delay = 0

game.moveQueue = {}



function love.update(dt)
  if game.delay > 0 then
    game.delay= game.delay - 1
    return
  end
  if table.getn(game.moveQueue) == 0 then
    requeue()
  end
  if game.moveQueue[1].movement(game.moveQueue[1]) then
    table.remove(game.moveQueue,1)
  end
end

function love.draw()
  love.graphics.setColor(0.5, 0.5, 0.5)
  love.graphics.rectangle("fill",0,0,8 * game.map.width,16 * game.map.height)
  local j = 0
  while(j < game.map.height) do
    local i = 0
    while( i < game.map.width) do
      local index = 1 + i + game.map.width * j
      love.graphics.setColor(unpack(game.tiles[game.map.grid[index]].color))
      love.graphics.rectangle("fill", i * 8, j * 16, 8, 16)
      i = i + 1
    end
    j = j + 1
  end
  local player = game.player
  love.graphics.setColor(0,1,0)
  love.graphics.rectangle("fill", player.x * 8, player.y * 16, 8, 16)

  local enemy = game.enemy
  love.graphics.setColor(0,1,0)
  love.graphics.rectangle("fill", enemy.x * 8, enemy.y * 16, 8, 16)
  love.graphics.print(table.getn(game.moveQueue))
end
