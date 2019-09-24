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

  xit 'deve iniciar com bolinhas nas extremidades' do
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
    let!(:jogo) { Jogo.new(4) }

    context 'andando para a direita' do
      it 'deve o pacman permanecer parado' do
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
    let!(:jogo) { Jogo.new(0) }

    context 'andando para a esquerda' do
      it 'deve o pacman permanecer parado' do
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
    let!(:jogo) {Jogo.new(2, 0)}
    context 'andando para cima' do
      it 'deve o pacman permanecer parado' do
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
    let!(:jogo) {Jogo.new(2, 4)}
    context 'andando para baixo' do
      it 'deve o pacman permanecer parado' do
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
    xit 'deve sumir com ela' do
      inicio = "*    \n"+
               "     \n"+
               "  c  \n"+
               "     \n"+
               "    *\n"
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

  xit 'Após 5 ticks deve aparecer um fantasma' do
    inicio = "*    \n"+
             "     \n"+
             "  c  \n"+
             "     \n"+
             "    *\n"
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
end
