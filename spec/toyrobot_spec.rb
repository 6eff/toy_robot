require "toyrobot.rb"

describe Toyrobot do

  it "can be palced on tabletop" do
    toyrobot = Toyrobot.new
    toyrobot.place([1,2,"right"])
    expect(toyrobot.coordinates).to eq [1,2,"right"]
  end

end
