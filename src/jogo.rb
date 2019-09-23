class Jogo
  def initialize(pac_position_x = 2, pac_position_y = 2)
    @pac_position_x = pac_position_x
    @pac_position_y = pac_position_y
  end

  def sobe
    @pac_position_y -= 1
  end

  def desce
    @pac_position_y += 1
  end

  def esquerda
    @pac_position_x -= 1
  end

  def direita
    @pac_position_x += 1
  end

  def tiro; end

  def tela
    tela_default = ""

    5.times do |y|
      5.times do |x|
        if @pac_position_x == x && @pac_position_y == y
          tela_default += "c"
          next
        end

        tela_default += " "
        tela_default += "\n" if x == 4
      end
    end

    tela_default
  end

  def tick; end
end