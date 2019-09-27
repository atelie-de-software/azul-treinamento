require './src/game'

describe 'RSpecMan' do
  let!(:game) { Game.new }

  context 'Ao iniciar um game' do
    context 'e não pressionar nenhuma tecla' do
      it 'deve ter o RSpecMan no centro' do
        expected = "*    \n" \
                   "     \n" \
                   "  c  \n" \
                   "     \n" \
                   "    *\n"

        expect(game.screen).to eq(expected)
      end

      it 'deve ter bolinhas nas extremidades' do
        expected = "*    \n" \
                   "     \n" \
                   "  c  \n" \
                   "     \n" \
                   "    *\n"

        expect(game.screen).to eq(expected)
      end
    end

    context 'e pressionar para a right' do
      it 'o RSpecMan deve andar para right' do
        game.right

        expected = "*    \n" \
                   "     \n" \
                   "   c \n" \
                   "     \n" \
                   "    *\n"

        expect(game.screen).to eq(expected)
      end
    end

    context 'e pressionar para a left' do
      it 'o RSpecMan deve andar para left' do
        game.left

        expected = "*    \n" \
                   "     \n" \
                   " c   \n" \
                   "     \n" \
                   "    *\n"

        expect(game.screen).to eq(expected)
      end
    end

    context 'e pressionar para cima' do
      it 'o RSpecMan deve andar para cima' do
        game.up

        expected = "*    \n" \
                   "  c  \n" \
                   "     \n" \
                   "     \n" \
                   "    *\n"

        expect(game.screen).to eq(expected)
      end
    end

    context 'e pressionar para baixo' do
      it 'o RSpecMan deve andar para baixo' do
        game.left
        game.down

        expected = "*    \n" \
                   "     \n" \
                   "     \n" \
                   " c   \n" \
                   "    *\n"

        expect(game.screen).to eq(expected)
      end
    end

    context 'e chegar na extremidade' do
      context 'a right' do
        it 'o RSpecMan deve permanecer parado' do
          game.right
          game.right
          game.right

          expected = "*    \n" \
          "     \n" \
          "    c\n" \
          "     \n" \
          "    *\n"

          expect(game.screen).to eq(expected)
        end
      end

      context 'a left' do
        it 'o RSpecMan deve permanecer parado' do
          game.left
          game.left
          game.left

          expected = "*    \n" \
                     "     \n" \
                     "c    \n" \
                     "     \n" \
                     "    *\n"

          expect(game.screen).to eq(expected)
        end
      end

      context 'superior' do
        it 'o RSpecMan deve permanecer parado' do
          game.up
          game.up
          game.up

          expected = "* c  \n" \
                     "     \n" \
                     "     \n" \
                     "     \n" \
                     "    *\n"

          expect(game.screen).to eq(expected)
        end
      end

      context 'inferior' do
        it 'o RSpecMan deve permanecer parado' do
          game.left
          game.down
          game.down
          game.down

          expected = "*    \n" \
                     "     \n" \
                     "     \n" \
                     "     \n" \
                     " c  *\n"

          expect(game.screen).to eq(expected)
        end
      end
    end

    context 'e o RSpecMan passar por uma bolinha' do
      it 'ela deve sumir' do
        game.right
        game.right
        game.down
        game.down
        game.up

        expected = "*    \n" \
                   "     \n" \
                   "     \n" \
                   "    c\n" \
                   "     \n"

        expect(game.screen).to eq(expected)
      end
    end

    context 'após 5 ticks' do
      it 'deve aparecer um fantasma' do
        game.tick
        game.tick
        game.tick
        game.tick
        game.tick

        expected =  "*   f\n" \
                    "     \n" \
                    "  c  \n" \
                    "  #  \n" \
                    "    *\n"

        expect(game.screen).to eq(expected)
      end
    end

    context 'quando o pacman entrar em contato com o fantasma' do
      xit 'deve aparecer a tela de game over' do
        21.times { game.tick }

        expected = 'GAME OVER'

        expect(game.screen).to eq(expected)
      end
    end

    context 'Quando nao houver mais comidas' do
      xit 'deve aparecer a tela de congratulations' do

        2.times { game.left }
        2.times { game.up }
        4.times { game.down }
        4.times { game.right }

        expected = 'Congratulations'

        expect(game.screen).to eq(expected)
      end
    end

    context 'após 1 tick' do
      it 'deve aparecer uma parede' do
        game.tick

        expected =  "*    \n" \
                    "     \n" \
                    "  c  \n" \
                    "  #  \n" \
                    "    *\n"

        expect(game.screen).to eq(expected)
      end
    end

    context 'Quando houver barreiras' do
      it 'pacman nao deve atravessar os blocos' do
        game.tick
        game.down

        expected =  "*    \n" \
                    "     \n" \
                    "  c  \n" \
                    "  #  \n" \
                    "    *\n"

        expect(game.screen).to eq(expected)

        game.left
        game.down
        game.right

        expected =  "*    \n" \
                    "     \n" \
                    "     \n" \
                    " c#  \n" \
                    "    *\n"

        expect(game.screen).to eq(expected)

        game.down
        game.right
        game.up

        expected =  "*    \n" \
                    "     \n" \
                    "     \n" \
                    "  #  \n" \
                    "  c *\n"

        expect(game.screen).to eq(expected)

        game.right
        game.up
        game.left

        expected =  "*    \n" \
                    "     \n" \
                    "     \n" \
                    "  #c \n" \
                    "    *\n"

        expect(game.screen).to eq(expected)
      end
    end
  end
end