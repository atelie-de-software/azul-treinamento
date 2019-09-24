class Jogo
  def initialize(pac_position_x = 2, pac_position_y = 2)
    @tela_calculada = ""
    @pac_position_x = pac_position_x
    @pac_position_y = pac_position_y
    @ball_1 = [0,0]
    @ball_1_live = true
    @ball_2 = [4,4]
    @ball_2_live = true
  end

  def tela
    @tela_calculada == "" if calcular_tela
    @tela_calculada
  end

  def sobe
    @pac_position_y -= 1 if @pac_position_y - 1 >= 0
    calcular_tela
  end

  def desce
    @pac_position_y += 1 if @pac_position_y + 1 < 5
    calcular_tela
  end

  def esquerda
    @pac_position_x -= 1 if @pac_position_x - 1 >= 0
    calcular_tela
  end

  def direita
    @pac_position_x += 1 if @pac_position_x + 1 < 5
    calcular_tela
  end

  def calcular_tela
    @tela_calculada = ""

    5.times do |y|
      5.times do |x|
        if [[x,y]].include? [@pac_position_x, @pac_position_y]
          @tela_calculada += (x == 4 ? "c\n" : "c")
          next
        end

        @ball_1_live = false if @ball_1 == [@pac_position_x, @pac_position_y]
        @ball_2_live = false if @ball_2 == [@pac_position_x, @pac_position_y]

        if @ball_1 ==  [x,y]
          if @ball_1_live
            @tela_calculada += (x == 4 ? "*\n" : "*")
            next
          end
        end

        if @ball_2 ==  [x,y]
          if @ball_2_live
            @tela_calculada += (x == 4 ? "*\n" : "*")
            next
          end
        end

        @tela_calculada += " "
        @tela_calculada += "\n" if x == 4
      end
    end
  end

  def tick
  end
end
