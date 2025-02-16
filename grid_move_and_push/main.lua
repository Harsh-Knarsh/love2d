grid = {cells = {}, w = 50, h = 50, cw = 10, ch = 10, pad = 1}
obstacles = {cells = {}}
player = {{x = 1, y = 3}}

table.insert(obstacles.cells, {x = 1, y = 1})
table.insert(obstacles.cells, {x = 4, y = 1})

function love.draw()
  
  for i in pairs(grid.cells) do
     love.graphics.setColor(1,1,1)  

--      if grid.cells[i].x == obstacles.cells[u].x and grid.cells[i].y == obstacles.cells[u].y then
       
       if object_position_grid_check(obstacles.cells, grid.cells[i]) then
         love.graphics.setColor(1,0,0)
       elseif object_position_grid_check(player, grid.cells[i]) then
        love.graphics.setColor(0,0,1)
       end
       
    love.graphics.rectangle("fill", grid.cells[i].xpos, grid.cells[i].ypos, grid.cw, grid.ch)
  end
end

function object_position_grid_check(object_, grid_)
  for u in pairs(object_) do
  if grid_.x == object_[u].x and grid_.y == object_[u].y then
    return true
    end
  end
end

function grid_generate()
  local xOff = 0
  local yOff = 0
  local _x = 0
  local _y = 0
  for x = 1,grid.w do
    yOff = 0
    xOff = xOff + grid.cw + grid.pad
    _x = _x + 1
    _y = 0
    for y = 1,grid.h do
      yOff = yOff + grid.ch + grid.pad
      _y = _y + 1
      table.insert(grid.cells, {xpos = xOff, ypos = yOff, x = _x, y = _y})
    end
  end
end

function love.keyreleased(key)
  if key == "w" then
    player[1].y = player[1].y - 1
  elseif key == "a" then
    player[1].x = player[1].x - 1
  elseif key == "s" then
    player[1].y = player[1].y + 1
  elseif key == "d" then
    player[1].x = player[1].x + 1
  end
end

grid_generate()

print(obstacles.cells[1].x)