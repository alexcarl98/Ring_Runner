- Implement non-color springs (universally capable of jumping onto them)
- find ideal jump distance between springs, make those more consistent obstacles

- If you run into problems with `function pixelcollision(obstacle)`, use the debug code: 
```lua
function pixelcollision(obstacle)
  if obstacle.color == 29 then return false end
  if ((obstacle.y == 96) and not p.isjumping) then return false end
  -- if (not p.isjumping and p.x+8 > obstacle.x+1) then return false end 
  local ob_pix = {x=obstacle.x, y = obstacle.y}
  local obstaclepixelcolor = pget(ob_pix.x, ob_pix.y)
  -- local obstaclepixelcolor1 = pget(ob_pix.x, ob_pix.y+3)
		--debugging
  local matching = 0
  local nonmatching = 0
  -- local colstrs = {"","",""}

  for adder = 0, 7 do
    local colors = {pget(ob_pix.x-1+adder, ob_pix.y-1)}
    if adder < 4 then 
      add(colors, pget(ob_pix.x-1, ob_pix.y+adder))
      add(colors, pget(ob_pix.x+7, ob_pix.y+adder))
    end
    
    for i, col in ipairs(colors) do -- corrected iteration over colors
      -- if col < 10 then
      --   colstrs[i] = colstrs[i].." 0"..col
      -- else
      --   colstrs[i] = colstrs[i].." "..col
      -- end
      if col ~= 0 and col ~= 4 and col ~=9 then
        if col == obstaclepixelcolor then
          matching = matching + 1 -- corrected increment operation
        else
          nonmatching = nonmatching + 1 -- corrected increment operation
        end
      end
    end
  end
  -- printh("")
  -- printh("boxcolor: "..obstaclepixelcolor)
  -- printh("top:"..colstrs[1])
  -- printh("left:"..colstrs[2])
  -- printh("right:"..colstrs[3])
  -- if matching == 0 and nonmatching == 0 then
  if (not p.isjumping and p.x+8 > obstacle.x+1 and nonmatching > matching) then 
    collision_cooldown = 12
    return false
  elseif matching == 0 then
    return false
  else
    collision_cooldown = 6
  end
  -- printh("matching: "..matching)
  -- -- printh("nonmatching: "..nonmatching)
  -- extcmd("screen")
  if p.s > 5 then 
    nonmatching -= 2
  end
  if matching > nonmatching then
    obstacle.bouncing = true

    if p.isjumping or p.vy > 0 then 
      p.vy = max(-5.5, p.vy*-1.15)
      -- printh("jumpingtruep.vy:"..p.vy)
    else
      -- printh("p.vy:"..p.vy)
      p.isjumping = true
      p.vy = -3
      p.y -= 3
    end
    -- incremental noise
    if p.combo < 5 then
      sfx(p.combo)
    else
      sfx(4)
    end
    p.combo += 1
    return false
  elseif matching <= nonmatching then 
    collision_cooldown = 14
    return true
  end
  return false
end
```

Decent idea of how bouncing works when the `p.vy` down equals the `p.vy` going up (before, we had a `p.vy*-1.15` multiplier. I think that makes it feel a little awkward): 

```lua 
function addobstacle()
  local colors = 1
  if p.s == 3 then
    colors = 2
  elseif p.s == 5 then
    colors = 3
  elseif p.s == 7 then
    colors = 4
  end

  -- Picks random color
  rgb = (init_spring_tile + flr(rnd(colors)))
  x_spawn = 128
  x_adders_no_downward_force = {55,60,65,70}
  for i = 1, #x_adders_no_downward_force do
    obstacles[#obstacles+1] = {x = x_spawn, y = 104, width = 4, height = 4, color = rgb, bouncing = false, harmful = false}
    x_spawn += x_adders_no_downward_force[i]
  end
  obstacles[#obstacles+1] = {x = x_spawn, y = 104, width = 4, height = 4, color = rgb, bouncing = false, harmful = false}
end

```





Help me add parallax scrolling. below is the `_draw()` function with the background and the foreground:
```lua
map_pattern = 0
screen_speed = 2
function _draw()
  cls()
  --make this part go slower than... 
  map(0,0,bg_map_pattern,0,16,10)
  map(0,0,bg_map_pattern+128,0,16,10)
  
  -- all of this stuff down here
  if show_new_pattern then
    if framecount > 192 then
     map(normal_map.three,14,map_pattern,tmpy,8,16)
     map(normal_map.four,14,map_pattern+64,tmpy,8,16)
     map(normal_map.one,14,map_pattern+128,tmpy,8,16)
     map(normal_map.two,14,map_pattern+192,tmpy,8,16)
    else
     map(normal_map.one,14,map_pattern,tmpy,8,16)
     map(normal_map.two,14,map_pattern+64,tmpy,8,16)
     map(normal_map.three,14,map_pattern+128,tmpy,8,16)
     map(normal_map.four,14,map_pattern+192,tmpy,8,16)
    end 
   else
    -- draw the current map pattern
    for i=0,2 do 
      map(normal_map.one,14,map_pattern+(i*128),tmpy,8,16)
      map(normal_map.two,14,map_pattern+(i*128)+64,tmpy,8,16)
    end
   end
  cursor(0,0)
  --other code here...  
end
```
below you'll find how map_pattern is manipulated

```lua 
function _update()
  map_pattern -= screen_speed
  if map_pattern <-127 then map_pattern = 0 end
  --other code...
end
```