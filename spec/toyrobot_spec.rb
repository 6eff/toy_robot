require "toyrobot.rb"

describe Toyrobot do

  it "can be palced on tabletop" do
    toyrobot = Toyrobot.new
    toyrobot.place([1,2,"right"])
    expect(toyrobot.coordinates).to eq [1,2,"right"]
  end

  context "toyrobot is placed outside tabletop" do

    let(:tabletop) { {x_axe: 0..5, y_axe: 0..5} }

    it "can be palced only on a tabletop" do
      toyrobot = Toyrobot.new
      toyrobot.place([0,6,"right"])
      expect(toyrobot.on_tabletop? tabletop).to be false
    end

  end

end
