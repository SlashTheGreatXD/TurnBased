function playerInit()
  local player = {}
  player.x = 2
  player.y = 2
  player.hp = 5
  player.movement = PlayerMovement

  table.insert(game.entities,player)
  return player
end


function PlayerMovement(player)
  local input = 0
  love.keyboard.setKeyRepeat(false)
  if love.keyboard.isDown("w") then
    input = 1
  end
  if love.keyboard.isDown("s") then
    input = 2
  end
  if love.keyboard.isDown("a") then
    input = 3
  end
  if love.keyboard.isDown("d") then
    input = 4
  end

  if input == 0 then
    return false
  end


  game.delay = 15


  if input <= 2 then
    if input == 1 then
      return playerMove(player,0,-1)
    end
    --playerMove(player,0,1)
    return playerMove(player,0,1)
  end

  if input <= 4 then
    if input == 3 then
      return playerMove(player,-1,0)
    end
    return playerMove(player,1,0)
  end
  return false


end

function playerMove(player,x,y)
  local nX = player.x + x
  local nY = player.y + y
  local index = 1 + nX + nY * game.map.width
  if game.tiles[game.map.grid[index]].solid then
    return false
  end
  for i, entity in ipairs(game.entities) do
    if entity.x == nX then
      if entity.y == nY then
        entity.hp = entity.hp - 1
        return false
      end
    end
  end
  player.x = nX
  player.y = nY
  return true

end