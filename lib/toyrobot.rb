class Toyrobot

  attr_reader :coordinates

  def initialize
    @coordinates = []
  end

  def place coordinates
    @coordinates.replace coordinates
  end

  def on_tabletop? tabletop
    tabletop.values[0].include?(@coordinates[0]) && tabletop.values[1].include?(@coordinates[1])
  end

end
