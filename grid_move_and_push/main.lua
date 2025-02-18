grid = {cells = {}, obstacles = {{x = 2, y = 8}}, player = {pos = {x = 1, y = 1}, set = {speed = .1}},
  dims = {
    cellW = 10,
    cellH = 10,
    gridW = 20,
    gridH = 60,
    pad = 1
    }
  }
gug = nil
timers = {}

function love.update(dt)
  player_input()
  
  for i = #timers, 1, -1 do
    local timer = timers[i]
  
  if not timers.finished then
    timer.timeLeft = timer.timeLeft - dt
    if timer.timeLeft <= 0 then
      timer.timeLeft = 0
      timer.finished = true
      timer.callback()
      table.remove(timers, i)
    end
  end
  end
end

function love.draw()
  
  
  for i in pairs(grid.cells) do
    love.graphics.setColor(1,1,1)
    
    if grid.player.pos.x == grid.cells[i].x / (grid.dims.cellW + grid.dims.pad) and grid.player.pos.y == grid.cells[i].y / (grid.dims.cellH + grid.dims.pad) then
      gug = i
      love.graphics.setColor(0,0,1)
    end
    
    for u in pairs(grid.obstacles) do
       if grid.obstacles[u].x == grid.cells[i].x / (grid.dims.cellW + grid.dims.pad) and grid.obstacles[u].y == grid.cells[i].y / (grid.dims.cellH + grid.dims.pad) then
         love.graphics.setColor(1,0,0)
      end
    end
    
    love.graphics.rectangle("fill", grid.cells[i].x, grid.cells[i].y, grid.dims.cellW, grid.dims.cellH)
    love.graphics.setColor(1,0,0)
    
  end
      love.graphics.line(grid.cells[gug].x,grid.cells[gug].y,100,100)
      love.graphics.print(gug, 250, 100)

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

timerActive = false

function player_input()
  local direction
  if love.keyboard.isDown("w") and not timerActive then
    timer_create(grid.player.set.speed, function() 
        grid.player.pos.y = grid.player.pos.y - 1
        timerActive = false
      end)
  elseif love.keyboard.isDown("a") and not timerActive then
    timer_create(grid.player.set.speed, function() 
        grid.player.pos.x = grid.player.pos.x - 1
        timerActive = false
      end)
  elseif love.keyboard.isDown("s") and not timerActive then
    timer_create(grid.player.set.speed, function() 
        grid.player.pos.y = grid.player.pos.y + 1
        timerActive = false
      end)
  elseif love.keyboard.isDown("d") and not timerActive then
    timer_create(grid.player.set.speed, function() 
        grid.player.pos.x = grid.player.pos.x + 1
        timerActive = false
      end)
  end
end


function timer_create(_timeLeft, _callback)
  local newTimer = {timeLeft = _timeLeft, finished = false, callback = _callback
        }
    table.insert(timers, newTimer)
    timerActive = true
end

grid_generate()
