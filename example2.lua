-- just-interpret-engine

engine.name = 'Interpret'

local synthdef = [[
SynthDef(\fsine, { |out=0, gate=1, freq=440, amp=0.1|
  var sig, env;
  sig = FSinOsc.ar(freq,0,amp);
  env = Env.asr.kr(2,gate);
  sig = sig * env;
  Out.ar(out,sig);
}).add;
]]

-- [[]] will avoid \backslash being escape seq
local toggle1 = [[if(~f1.isPlaying.not, {~f1=Synth(\fsine,[freq:%d]).register},{~f1.release})]]
local toggle2 = [[if(~f2.isPlaying.not, {~f2=Synth(\fsine,[freq:%d,out:1]).register},{~f2.release})]]
local setfreq1 = [[if(~f1.isPlaying, {~f1.set(\freq, %d) })]]
local setfreq2 = [[if(~f2.isPlaying, {~f2.set(\freq, %d) })]]
local freq1 = 440
local freq2 = 440

function init()
  audio.rev_off()
  interpret(synthdef)
end
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
  screen.text('key1 L on/off')
  screen.move(0,30)
  screen.text('key2 R on/off')
  screen.move(0,40)
  screen.text('enc1 L freq')
  screen.move(0,50)
  screen.text('enc2 R freq')
  screen.stroke()
  screen.update()
end

function key(n,z)
  if n == 2 and z == 1 then interpret(string.format(toggle1,freq1)) end
  if n == 3 and z == 1 then interpret(string.format(toggle2,freq2)) end
end

function enc(n,d)
  if n == 2 then freq1=freq1+d interpret(string.format(setfreq1, freq1)) end
  if n == 3 then freq2=freq2+d interpret(string.format(setfreq2, freq2)) end
end