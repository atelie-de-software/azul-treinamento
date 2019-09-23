require 'dispel'
require './src/jogo.rb'

jogo = Jogo.new

Dispel::Screen.open do |screen|
  Dispel::Keyboard.output timeout: 0.5 do |key|
    jogo.esquerda if key == :left
    jogo.direita  if key == :right
    jogo.sobe     if key == :up
    jogo.desce    if key == :down

    screen.draw jogo.tela

    next          unless key
    next          if     key == :timeout

    exit(true)    if key == :"Ctrl+c"
  end
end
