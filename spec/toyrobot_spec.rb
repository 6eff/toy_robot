require "toyrobot.rb"

describe Toyrobot do

  context "toyrobot is placed on tabletop" do

    let(:tabletop) { {x_axe: 0..5, y_axe: 0..5} }

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

    it "can move if not facing tabletop edge" do
      toyrobot = Toyrobot.new
      toyrobot.place([1,2,"east"])
      toyrobot.rotate("left")
      toyrobot.move(tabletop)
      expect(toyrobot.coordinates).to eq [1,3,"north"]
    end

    it "can't move if facing tabletop edge" do
      toyrobot = Toyrobot.new
      toyrobot.place([0,2,"north"])
      toyrobot.rotate("left")
      expect{toyrobot.move(tabletop)}.to output.to_stdout
      expect(toyrobot.coordinates).to eq [0,2,"west"]
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
