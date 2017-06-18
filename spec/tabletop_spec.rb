require "tabletop.rb"

describe Tabletop do

  it "can create tabletops of randome size" do
    x_axe_size = 5
    y_axe_size = 5
    tabletop = Tabletop.new x_axe_size, y_axe_size
    expect(tabletop.tabletop).to eq ({x_axe: (0..5), y_axe: (0..5)})
  end

end
