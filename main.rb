require 'dispel'
require './src/jogo.rb'

x      = 0
y      = 0
jogo   = Jogo.new

Dispel::Screen.open do |screen|
  Dispel::Keyboard.output timeout: 0.5 do |key|
    screen.draw jogo.tela
    next unless key
    next if     key == :timeout

    exit(true) if key == :"Ctrl+c"
  end
end
