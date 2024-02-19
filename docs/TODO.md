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