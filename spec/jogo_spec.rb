require './src/jogo'

describe 'Tela inicial' do
  let!(:jogo) { Jogo.new }

  it 'deve ter o pacman no centro' do
    expected = "*    \n"+
               "     \n"+
               "  c  \n"+
               "     \n"+
               "    *\n"
    expect(jogo.tela).to eq expected
  end

  it 'deve iniciar com bolinhas nas extremidades' do
    expected = "*    \n"+
               "     \n"+
               "  c  \n"+
               "     \n"+
               "    *\n"
    expect(jogo.tela).to eq expected
  end

  it 'deve o pacman andar para direita' do
    jogo.direita
    expected = "*    \n"+
               "     \n"+
               "   c \n"+
               "     \n"+
               "    *\n"

    expect(jogo.tela).to eq expected
  end

  it 'deve o pacman andar para esquerda' do
    jogo.esquerda
    expected = "*    \n"+
               "     \n"+
               " c   \n"+
               "     \n"+
               "    *\n"

    expect(jogo.tela).to eq expected
  end

  it 'deve o pacman andar para cima' do
    jogo.sobe
    expected = "*    \n"+
               "  c  \n"+
               "     \n"+
               "     \n"+
               "    *\n"

    expect(jogo.tela).to eq expected
  end

  it 'deve o pacman andar para baixo' do
    jogo.desce
    expected = "*    \n"+
               "     \n"+
               "     \n"+
               "  c  \n"+
               "    *\n"

    expect(jogo.tela).to eq expected
  end

  context 'chegando na extremidade a direita' do
    let!(:jogo) { Jogo.new }

    context 'andando para a direita' do
      it 'deve o pacman permanecer parado' do
        jogo.direita
        jogo.direita
        jogo.direita

        expected = "*    \n"+
                   "     \n"+
                   "    c\n"+
                   "     \n"+
                   "    *\n"

        expect(jogo.tela).to eq expected
      end
    end
  end

  context 'chegando na extremidade a esquerda' do
    let!(:jogo) { Jogo.new }

    context 'andando para a esquerda' do
      it 'deve o pacman permanecer parado' do
        jogo.esquerda
        jogo.esquerda
        jogo.esquerda

        expected = "*    \n"+
                   "     \n"+
                   "c    \n"+
                   "     \n"+
                   "    *\n"

        expect(jogo.tela).to eq expected
      end
    end
  end

  context 'chegando na extremidade superior' do
    let!(:jogo) {Jogo.new}
    context 'andando para cima' do
      it 'deve o pacman permanecer parado' do
        jogo.sobe
        jogo.sobe
        jogo.sobe

        expected = "* c  \n"+
                   "     \n"+
                   "     \n"+
                   "     \n"+
                   "    *\n"

        expect(jogo.tela).to eq expected
      end
    end
  end

  context 'chegando na extremidade inferior' do
    let!(:jogo) {Jogo.new}
    context 'andando para baixo' do
      it 'deve o pacman permanecer parado' do
        jogo.desce
        jogo.desce
        jogo.desce

        expected = "*    \n"+
                   "     \n"+
                   "     \n"+
                   "     \n"+
                   "  c *\n"

        expect(jogo.tela).to eq expected
      end
    end
  end

  context 'quando o pacman passar pela bolinha' do
    it 'deve sumir com ela' do
      jogo.desce
      jogo.desce
      jogo.direita
      jogo.direita
      jogo.sobe

      expected = "*    \n"+
                 "     \n"+
                 "     \n"+
                 "    c\n"+
                 "     \n"
      expect(jogo.tela).to eq expected
    end
  end

  it 'Após 5 ticks deve aparecer um fantasma' do
    jogo.tick
    jogo.tick
    jogo.tick
    jogo.tick
    jogo.tick

    expected = "*   f\n"+
               "     \n"+
               "  c  \n"+
               "     \n"+
               "    *\n"

    expect(jogo.tela).to eq expected
  end

  xit 'Fantasma anda para a esquerda a cada tick' do
    jogo.tick

    expected = "*  f \n"+
               "     \n"+
               "  c  \n"+
               "     \n"+
               "    *\n"

    expect(jogo.tela).to eq expected
  end

  context "Quando pac man relar no fantasma" do
    xit "Dar game over no jogo" do
      jogo.sobe
      jogo.sobe
      jogo.direita

      expected = "     \n"+
                 " game\n"+
                 " over\n"+
                 "     \n"+
                 "     \n"

      expect(jogo.tela).to eq expected
    end
  end

  xit 'Após 10 ticks deve aparecer a frutinha' do
    jogo.tick
    jogo.tick
    jogo.tick
    jogo.tick
    jogo.tick
    jogo.tick
    jogo.tick
    jogo.tick
    jogo.tick
    jogo.tick

    expected = "*   f\n"+
               "     \n"+
               "  c  \n"+
               "     \n"+
               "6   *\n"

    expect(jogo.tela).to eq expected
  end

  context "Quando pac man passar na frutinha" do
    xit "Deve sumir com a frutinha e ficar grande" do
      jogo.desce
      jogo.desce
      jogo.esquerda
      jogo.esquerda
      jogo.sobe

      expected = "*   f\n"+
                 "     \n"+
                 "     \n"+
                 "C    \n"+
                 "    *\n"
      expect(jogo.tela).to eq expected
    end
  end
end
