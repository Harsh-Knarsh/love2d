grid = {cells = {}, obstacles = {{x = 2, y = 8}}, player = {x = 1, y = 1},
  dims = {
    cellW = 10,
    cellH = 10,
    gridW = 25,
    gridH = 25,
    pad = 1
    }
  }

function love.draw()
  for i in pairs(grid.cells) do
    love.graphics.setColor(1,1,1)
    
    if grid.player.x == grid.cells[i].x / (grid.dims.cellW + grid.dims.pad) and grid.player.y == grid.cells[i].y / (grid.dims.cellH + grid.dims.pad) then
      love.graphics.setColor(0,0,1)
    end
    
    for u in pairs(grid.obstacles) do
       if grid.obstacles[u].x == grid.cells[i].x / (grid.dims.cellW + grid.dims.pad) and grid.obstacles[u].y == grid.cells[i].y / (grid.dims.cellH + grid.dims.pad) then
         love.graphics.setColor(1,0,0)
      end
    end
    
    love.graphics.rectangle("fill", grid.cells[i].x, grid.cells[i].y, grid.dims.cellW, grid.dims.cellH)
  end
end

function grid_generate()
  local _x = 0
  local _y = 0
  
  for x = 1,grid.dims.gridW do
    _y = 0
    _x = _x + grid.dims.cellW + grid.dims.pad
    for y = 1,grid.dims.gridH do
      _y = _y + grid.dims.cellH + grid.dims.pad
      table.insert(grid.cells, {x = _x, y = _y})
    end
  end
end

grid_generate()

for i in pairs(grid.cells) do
  --print(grid.cells[i].x / (grid.dims.cellW + grid.dims.pad))
end
