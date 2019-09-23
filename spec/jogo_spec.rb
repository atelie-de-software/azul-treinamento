require './src/jogo'

describe 'Tela inicial' do
  let!(:jogo) { Jogo.new }

  it 'deve ter o pacman no centro' do
    expected = "     \n"+
               "     \n"+
               "  c  \n"+
               "     \n"+
               "     \n"
    expect(jogo.tela).to eq expected
  end

  it 'deve o pacman andar para direita' do
    jogo.direita
    expected = "     \n"+
               "     \n"+
               "   c \n"+
               "     \n"+
               "     \n"

    expect(jogo.tela).to eq expected
  end

  it 'deve o pacman andar para esquerda' do
    jogo.esquerda
    expected = "     \n"+
               "     \n"+
               " c   \n"+
               "     \n"+
               "     \n"

    expect(jogo.tela).to eq expected
  end

  it 'deve o pacman andar para cima' do
    jogo.sobe
    expected = "     \n"+
               "  c  \n"+
               "     \n"+
               "     \n"+
               "     \n"

    expect(jogo.tela).to eq expected
  end

  it 'deve o pacman andar para baixo' do
    jogo.desce
    expected = "     \n"+
               "     \n"+
               "     \n"+
               "  c  \n"+
               "     \n"

    expect(jogo.tela).to eq expected
  end

  context 'chegando na extremidade a direita' do
    let!(:jogo) {Jogo.new(5)}
    context 'andando para a direita' do
      it 'deve o pacman permanecer parado' do
        jogo.direita
        expected = "     \n"+
                   "     \n"+
                   "    c\n"+
                   "     \n"+
                   "     \n"

        expect(jogo.tela).to eq expected
      end
    end
  end
end
