require "toyrobot.rb"

describe Toyrobot do

context "toyrobot is placed on tabletop" do

    it "can be palced on tabletop" do
      toyrobot = Toyrobot.new
      toyrobot.place([1,2,"east"])
      expect(toyrobot.coordinates).to eq [1,2,"east"]
    end

    it "can be rotated left" do
      toyrobot = Toyrobot.new
      toyrobot.place([1,2,"east"])
      toyrobot.rotate("left")
      expect(toyrobot.coordinates).to eq [1,2,"north"]
    end

    it "can be rotated right" do
      toyrobot = Toyrobot.new
      toyrobot.place([1,2,"east"])
      toyrobot.rotate("right")
      expect(toyrobot.coordinates).to eq [1,2,"south"]
    end

  end

  context "toyrobot is placed outside tabletop" do

    let(:tabletop) { {x_axe: 0..5, y_axe: 0..5} }

    it "can be palced only on a tabletop" do
      toyrobot = Toyrobot.new
      toyrobot.place([0,6,"east"])
      expect(toyrobot.on_tabletop? tabletop).to be false
    end

  end

end
