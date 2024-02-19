map_pattern = 0
spike_map_offset = 0
framecount = 0
screen_speed = 2
screen_partitions = {
  {{0,0}, {10,10}, {0, 64}, {80,80}, {8,8}, {16,16}},
  {{16,0}, {10,10}, {0, 64}, {80,80}, {8,8}, {16,16}},
}

function _init()
  framecount = 0
  map_pattern = 0
end

-- add a flag to control when to draw the new pattern
show_new_pattern = false
remaining_pattern = false
new_pattern_offset = 128 -- this is the offset for the new pattern on the map
tmpy = 80
bongo = 0
--##^^^^##^^^^^^## - 16, 26
--##^^##^^##^^^^## -  
 
spike_map = {0, 8, 16, 24, 26, 32}

normal_map = {
  one=0, 
  two=0,
  three=0,
  four = 0,
}

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
  print("tile start at: 0 ")
  for i=0,2 do 
    map(normal_map.one,10,map_pattern+(i*128),tmpy,8,16)
    map(normal_map.two,10,map_pattern+(i*128)+64,tmpy,8,16)
  end
 end
  print("map_pattern = "..map_pattern)
  print("map_pattern+128 = "..map_pattern+128)
  cursor(0,0)
end

function _update()
  -- map_pattern = (map_pattern - screen_speed)%128
  map_pattern -= screen_speed
  if map_pattern <-127 then 
    map_pattern = 0
  end
  framecount += 1
  -- if framecount == 32 and remaining_pattern then
  --   normal_map.four = 0
  --   remaining_pattern = false
  -- end

  -- example condition to show the new pattern
  -- you can replace this with your own logic
  if framecount == 128 then
    show_new_pattern = true
    normal_map.three = spike_map[flr(rnd(#spike_map))]
    normal_map.four = spike_map[flr(rnd(#spike_map))]
  elseif framecount == 256 then
    -- reset to the original pattern and add an obstacle
    show_new_pattern = false
    -- remaining_pattern = true
    normal_map.three = 0
    framecount=0
    --addobstacle()
  end
end
