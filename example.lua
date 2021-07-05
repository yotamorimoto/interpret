-- 
-- 
-- just-interpret-engine

engine.name = 'Interpret'

local on1 = 'f={SinOsc.ar([440,320].choose)*0.1}.play'
local on2 = [[f={
Klank.ar(`[
 Array.exprand(12, 200, 4000),
 nil,
 Array.exprand(12, 0.1, 2)
 ], Decay.ar(Dust.ar(10), 0.01, PinkNoise.ar(0.01))
 )
}.play
]]
local off = 'f.release'

local function interpret(txt)
  engine.interpret(txt)
  screen.clear()
  screen.move(0,20)
  screen.level(5)
  screen.text('interpret:')
  screen.move(0,30)
  screen.level(15)
  screen.text(txt)
  screen.update()
end

function redraw()
  screen.clear()
  screen.move(0,20)
  screen.level(15)
  screen.text('press key1 or key2')
  screen.stroke()
  screen.update()
end

function key(n,z)
  -- print('key #' .. n .. " is " .. z)
  if n == 2 and z == 1 then interpret(on1)
  elseif n == 3 and z == 1 then interpret(on2)
  end
  if z == 0 then interpret(off) end
end