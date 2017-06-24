class Tabletop
  attr_reader :tabletop

  def initialize(x_axe_size, y_axe_size)
    @x_axe = Range.new(0, x_axe_size)
    @y_axe = Range.new(0, y_axe_size)
    @tabletop = Hash[x_axe: @x_axe, y_axe: @y_axe]
  end
end
