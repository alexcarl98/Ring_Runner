-- sprite work : kicked-in-teeth
-- todo: 
--  create tutorial sequence
--  store spring color patterns as tables, then switch to using a single sprite tile for the springs
--  figure out how to get a slightly darker shade of green for the donut-
p={}
obstacles = {}
spikes = {}
floor = {}
score = 0
springcolors = {
  red = {8,2,14},
  blue = {12,1,13},
  green = {11,3,6},
  yellow = {10,4,9},
}
floor_location = 95
map_pattern = 0
spike_map_offset = 0
game_started = false
gameover = false
framecount = 0
screen_speed = 2
collision_cooldown = 0
donut_bread = 43
init_spring_tile = 49



function addobstacle()
  local colors = 1
  if p.s == 3 then
    colors = 2
  elseif p.s == 5 then
    colors = 3
  elseif p.s == 7 then
    colors = 4
  end

  rgb = (init_spring_tile + flr(rnd(colors)))

  x_spawn = 128 
  x_adders_no_downward_force = {55,60,65,70}
  for i = 1, #x_adders_no_downward_force do
    obstacles[#obstacles+1] = {x = x_spawn, y = 104, width = 4, height = 4, color = rgb, bouncing = false, harmful = false}
    x_spawn += x_adders_no_downward_force[i]
  end
  obstacles[#obstacles+1] = {x = x_spawn, y = 104, width = 4, height = 4, color = rgb, bouncing = false, harmful = false}
end

function _init()
  game_setup()
end

function game_setup() 
  framecount = 0
  map_pattern = 0
  obstacles = {}
  score = 0
  gameover = false
  p.x = 10
  p.y = floor_location
  p.vy = 0
  p.a = 0
  p.s = 1
  p.combo = 0
  p.rotspeed = 7
  p.isjumping = false
  p.justpressedtilt = false
end

function main_menu()
  print_layered_text("ring runner", 40, 20,2)
  print_layered_text("on-ground moves: ⬆️-jump", 10, 40,2)
  print_layered_text("mid-air moves:", 8, 55, 2)
  print_layered_text("⬅️,➡️-tilt", 70, 55,2)
  print_layered_text("⬇️-fall", 70, 70,2)
  print_layered_text("press ❎ to start", 35, 90, 2)
end

spike_map = {0, 8, 16, 24, 26, 32}
normal_map = {
  one=0, 
  two=0,
  three=0,
  four = 0,
}
show_new_pattern = false
tmpy = 80
function _draw()
  cls()
  
  if show_new_pattern then
    if framecount > 192 then
     map(normal_map.three,10,map_pattern,tmpy,8,16)
     map(normal_map.four,10,map_pattern+64,tmpy,8,16)
     map(normal_map.one,10,map_pattern+128,tmpy,8,16)
     map(normal_map.two,10,map_pattern+192,tmpy,8,16)
    else
     map(normal_map.one,10,map_pattern,tmpy,8,16)
     map(normal_map.two,10,map_pattern+64,tmpy,8,16)
     map(normal_map.three,10,map_pattern+128,tmpy,8,16)
     map(normal_map.four,10,map_pattern+192,tmpy,8,16)
    end 
   else
    -- draw the current map pattern
    for i=0,2 do 
      map(normal_map.one,10,map_pattern+(i*128),tmpy,8,16)
      map(normal_map.two,10,map_pattern+(i*128)+64,tmpy,8,16)
    end
   end
  cursor(0,0)
  -- print(pget(p.x, p.y+17))
  -- pset(p.x, p.y+17,12)
  -- local player_cell_x = flr(p.x / 8)+1
  -- Convert player's y-coordinate from pixels to map cells and check one tile below
  -- local player_cell_y_below = flr((p.y + 16) / 8)+1
  
  if not game_started then
    spr_r(43,p.x-2,p.y,p.a,2,2)   --:draw()
    spr_r(p.s,p.x,p.y,p.a,2,2)    --:draw()
    main_menu()
  end
  -- print("game over:",0,20,12)
  -- print(gameover, 40,20,12)
  
  if not gameover and game_started then
    print("score:"..score,20,0,7)
    if p.combo > 2 then
      print("streak: "..p.combo, 70, 0, 9)
    end
    -- shx = flr(p.x/8)
    -- shy = flr((p.y+24)/8)
    -- print("p.x:"..shx,0,30,7)
    -- print("p.y:"..shy,0,40,7)
    -- print("mget():"..mget(shx,shy),0,50,8)
    
    spr_r(43,p.x-2,p.y,p.a,2,2)    --:draw()
    spr_r(p.s,p.x,p.y,p.a,2,2)    --:draw()
  end
  
  for obstacle in all(obstacles) do
    if obstacle.bouncing then
      -- assume t is your global time or frame count variable
      local amplitude = 2 -- max height of spring compression/expansion
      local frequency = 0.2 -- controls the speed of the animation
      local height_variation = sin(framecount * frequency) * amplitude
      
      -- adjust obstacle.y based on height_variation for animation
      -- this example assumes obstacle.y is the base position of the spring
      spr(obstacle.color, obstacle.x, obstacle.y + height_variation)
    else
      spr(obstacle.color, obstacle.x, obstacle.y)
    end
  end

  if gameover then
    if not (score == 0)then
        hiscore = max(score,hiscore)
        tmp_col = 2
        if hiscore == score then
            tmp_col = 3
        end
        print("score:"..score,20,0,7)
        print_layered_text(hiscore,99, 0,tmp_col)
        print_layered_text("hiscore:",65, 0, 2)
        print_layered_text("game over!", 45, 88, 2)
        print_layered_text("press ❎ to play", 25, 100, 2)
    end
  end
end

function boxesoverlap(obstacle)
  local playerbox = {
    left = p.x+2,
    right = p.x + 14, -- assuming the player is 16 pixels wide
    top = p.y+2,
    bottom = p.y + 14 -- assuming the player is 16 pixels tall
  }

  local obstaclebox = {
    left = obstacle.x,
    right = obstacle.x + 8,
    top = obstacle.y,
    bottom = obstacle.y + 8
  }

  -- check if player's box and obstacle's box overlap
  return not (playerbox.right < obstaclebox.left or
              playerbox.left > obstaclebox.right or
              playerbox.bottom < obstaclebox.top or
              playerbox.top > obstaclebox.bottom)
end

function pixelcollision(obstacle)
  if obstacle.color == 29 then return false end
  if obstacle.color == 48 then return true end
  if ((obstacle.y == 96) and not p.isjumping) then return false end
  local ob_pix = {x=obstacle.x, y = obstacle.y}
  local obstaclepixelcolor = pget(ob_pix.x, ob_pix.y)
  --debugging
  local matching = 0
  local nonmatching = 0

  for adder = 0, 7 do
    local colors = {pget(ob_pix.x-1+adder, ob_pix.y-1)}
    if adder < 4 then 
      add(colors, pget(ob_pix.x-1, ob_pix.y+adder))
      add(colors, pget(ob_pix.x+7, ob_pix.y+adder))
    end
    
    for i, col in ipairs(colors) do -- corrected iteration over colors
      if col ~= 0 and col ~= 4 and col ~=9 then
        if col == obstaclepixelcolor then
          matching = matching + 1 -- corrected increment operation
        else
          nonmatching = nonmatching + 1 -- corrected increment operation
        end
      end
    end
  end

  if (not p.isjumping and p.x+8 > obstacle.x+1 and nonmatching > matching) then 
    collision_cooldown = 12
    return false
  elseif matching == 0 then
    return false
  else
    collision_cooldown = 6
  end
  if p.s > 5 then 
    nonmatching -= 2
  end
  if matching > nonmatching then
    obstacle.bouncing = true
    if p.isjumping or p.vy > 0 then
      p.vy = max(-5.5, p.vy*-1)
    else
      p.isjumping = true
      p.vy = -3
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

spike_tile = 14--[[ put the actual tile number for the spike here ]]
function _update()
  map_pattern -= screen_speed
  if map_pattern <-127 then map_pattern = 0 end
  framecount += 1

  if ((btnp(⬆️)) and not p.isjumping) then
    p.isjumping = true
    p.vy = -3
  end

  if p.isjumping then
    p.y += p.vy
    if p.rotspeed >= 0 and not(btn(⬅️) or btn(➡️)) then
      p.rotspeed -= 0.1
      if p.rotspeed < 0 then
        p.rotspeed = 0
      end
    end
    if btn(⬅️) then
      -- begin orienting yourself the other way
      p.rotspeed -= 2
      p.rotspeed = max(p.rotspeed, -12)
      p.justpressedtilt = true
    end
    if btn(➡️) then
      p.rotspeed += 2
      p.rotspeed = min(p.rotspeed, 12)
      p.justpressedtilt = true
    end
    if p.justpressedtilt and not(btn(➡️) or btn(⬅️)) then
      p.rotspeed *= 0.27
      p.justpressedtilt = false
    end

    if btn(⬇️) and collision_cooldown == 0 then p.vy +=0.7 end
    p.vy += 0.2
    if p.vy > 5.5 then p.vy = 5.5 end
    
  end
  if not game_started and not gameover then
    if btnp(❎) then
      game_started = true
      game_setup()
      addobstacle()
    end
  end
  if game_started and gameover then
    if btnp(❎) then
      game_setup()
      addobstacle()
    end
  end
  if not gameover and game_started then
    if framecount == 128 then
      show_new_pattern = true
      normal_map.three = spike_map[flr(rnd(#spike_map))]
      normal_map.four = spike_map[flr(rnd(#spike_map))]
    end

    if framecount == 180 then
      addobstacle()
    elseif framecount == 256 then
      -- reset to the original pattern and add an obstacle
      show_new_pattern = false
      normal_map.three = 0
      normal_map.four = 0
      framecount=0
    end
    if not gameover and (framecount%3==0) then 
      score += 1
      if p.s == 3 and score > 2000 then
        sfx(14)
        p.s = 5
        obstacles = {}
      end
      if p.s == 1 and 2000 > score and  score > 1000 then
        sfx(14)
        p.s = 3
        obstacles = {}
      end 
    end
  end
  if #obstacles > 0 then
    if boxesoverlap(obstacles[1]) and (collision_cooldown == 0) then
      pixelcollision(obstacles[1])
    end
    for obstacle in all(obstacles) do
      obstacle.x -= screen_speed
    end
    if obstacles[1].x < -9 then
      del(obstacles, obstacles[1])
    end
  end
  if p.isjumping then
    if p.y > (floor_location+3) then
      p.isjumping = false
      p.y = floor_location
      p.vy = 0
      p.rotspeed = 7 + flr(score/300)
      if p.combo > 2 then score += p.combo * 10 end
      p.combo = 0
    end
  end
  if not gameover then 
    if p.y == floor_location and pget(p.x+6,p.y+17) ==0 then
      local maj = 0
      local blk = 0
      for i=6,12 do
        if pget(p.x+i,p.y+17) == 4 then
          maj += 1
        else
          blk += 1
        end
      end
      gameover = maj < blk
      if gameover then sfx(16) end
    end
  end 

  if gameover then
    if not (score == 0)then
        hiscore = max(score,hiscore)
        tmp_col = 2
        if hiscore == score then
            tmp_col = 3
        end
        print("score:"..score,20,0,7)
        print_layered_text(hiscore,99, 0,tmp_col)
        print_layered_text("hiscore:",65, 0, 2)
        print_layered_text("game over!", 45, 88, 2)
        print_layered_text("press 🅾️ to play", 25, 100, 2)
    end
  end
  if collision_cooldown > 0 then
    collision_cooldown -= 1
  end

  p.a += p.rotspeed
  p.a=p.a%360 
end

function spr_r(s,x,y,a,w,h)
  -- rotate sprite
  -- credit to jihem
  sw=(w or 1)*8     --sw = 16
  sh=(h or 1)*8     --sh = 16
  sx=(s%8)*8        --sx = (1%8)*8 = 8
  sy=flr(s/8)*8     --sy = flr(1/8)
  x0=flr(0.5*sw)    --x0 = 8
  y0=flr(0.5*sh)    --y0 = 8
  a=a/360
  sa=sin(a)
  ca=cos(a)
  for ix=0, sw do
    for iy=0, sh do
      dx=ix-x0
      dy=iy-y0
      xx=flr(dx*ca-dy*sa+x0)
      yy=flr(dx*sa+dy*ca+y0)
      if (xx>=0 and xx<sw and yy>=0 and yy<=sh) then
        local colr = sget(sx+xx,sy+yy)
        if colr ~=0  then
        	pset(x+ix,y+iy,colr)
        end
      end
    end
  end
end

function print_layered_text(text, x, y,col)
  print(text,x+1,y,col)
  print(text,x,y,7)
end