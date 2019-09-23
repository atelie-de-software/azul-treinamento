require './src/board'

RSpec.describe Board do
  describe 'method #build_map' do
    context 'given width' do
      context 'and given heigth' do
        it 'must build the map' do
          width  = 10
          heigth = 10
          output = "+--------+\n" +
                   "|        |\n" +
                   "|        |\n" +
                   "|        |\n" +
                   "|        |\n" +
                   "|        |\n" +
                   "|        |\n" +
                   "|        |\n" +
                   "|        |\n" +
                   "+--------+"

          expect(Board.build_map(width, heigth)).to eq(output)
        end
      end
    end

  end
  # describe "method #truthy" do
  #   subject { Test.new.is_truthy }
  #
  #   it "return truthy" do
  #     expect(subject).to be_truthy
  #   end
  # end
end
