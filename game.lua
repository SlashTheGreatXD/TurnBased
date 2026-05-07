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