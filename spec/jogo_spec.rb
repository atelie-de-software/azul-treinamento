require './src/jogo'

describe 'Tela inicial' do
  jogo = Jogo.new

  it 'deve ter o pacman no centro' do
    expected = "     \n"+
               "     \n"+
               "  c  \n"+
               "     \n"+
               "     \n"

    expect(jogo.tela).to eq expected
  end

  xit 'o pacman deve andar para direita' do
    jogo.direita

    expected = "     \n"+
               "     \n"+
               "   c \n"+
               "     \n"+
               "     \n"

    expect(jogo.tela).to eq expected
  end
end
