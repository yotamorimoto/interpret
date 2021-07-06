-- 
-- 
-- just-interpret-engine

engine.name = 'Interpret'

-- quote is ok for single line code
local on1 = '~f1={SinOsc.ar([440,320].choose)*0.1}.play'

-- use [[ ]] for multiline code
local on2 = [[
~f2={
Klank.ar(`[
 Array.exprand(12, 200, 4000),
 nil,
 Array.exprand(12, 0.1, 2)
 ], Decay.ar(Dust.ar(10), 0.01, PinkNoise.ar(0.01))
 )
}.play;
]]
local off1 = '~f1.release'
local off2 = '~f2.release'

-- should global to fire from maiden REPL
function interpret(txt)
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
  if n == 2 then
    if z == 1 then interpret(on1) else interpret(off1) end
  elseif n == 3 then 
    if z == 1 then interpret(on2) else interpret(off2) end
  end
end