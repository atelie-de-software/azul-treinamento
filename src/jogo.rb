class Jogo
  def initialize(pac_position_x = 2, pac_position_y = 2)
    @pac_position_x = pac_position_x
    @pac_position_y = pac_position_y
  end

  def sobe; end

  def desce; end

  def esquerda; end

  def direita; end

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
