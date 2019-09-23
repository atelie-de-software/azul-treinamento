require './src/jogo'

describe 'Tela inicial' do
  it 'deve ter o pacman no centro' do
    jogo = Jogo.new
    expected = "     \n"+
               "     \n"+
               "  c  \n"+
               "     \n"+
               "     \n"

    expect(jogo.tela).to eq expected
  end
  xit 'deve ter o pacman anda para direita' do
    jogo.direita
    expected = "     \n"+
               "     \n"+
               "   c \n"+
               "     \n"+
               "     \n"
    expect(jogo.tela).to eq expected
  end
end
