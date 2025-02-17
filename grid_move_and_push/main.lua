grid = {cells = {}, 
  dims = {
    cellW = 25,
    cellH = 5,
    gridW = 5,
    gridH = 5,
    pad = 1
    }
  }

function love.draw()
  for i in pairs(grid.cells) do
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
