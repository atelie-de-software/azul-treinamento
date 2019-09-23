class Jogo
  def sobe; end

  def desce; end

  def esquerda; end

  def direita; end

  def tiro; end

  def tela(pac_position_x = 2, pac_position_y = 2)
    tela_default = ""

    5.times do |y|
      5.times do |x|
        if pac_position_x == x && pac_position_y == y
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
