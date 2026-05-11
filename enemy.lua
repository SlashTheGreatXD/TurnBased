function baseEnemyInit()
  local enemy = {}
  enemy.x = 4
  enemy.y = 4
  enemy.hp = 5
  enemy.movement = baseEnemyMovement
  enemy.direction = 1
  enemy.active = true

  table.insert(game.entities,enemy)

  return enemy
end

function baseEnemyMovement(enemy)
  if not enemy.active then return true end
  if enemy.hp <= 0 then
    enemy.active = false
    return true
  end
  if playerMove(enemy,0,enemy.direction) then
    return true
  end
  enemy.direction = -enemy.direction
  return true
end