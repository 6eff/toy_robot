class Toyrobot

  attr_reader :coordinates

  def initialize
    @coordinates = []
    @facing = ["south","west","north","east"]
  end

  def place coordinates
    @coordinates.replace coordinates
  end

  def on_tabletop? tabletop
    tabletop.values[0].include?(@coordinates[0]) && tabletop.values[1].include?(@coordinates[1])
  end

  def rotate direction
    if direction == "left"
      @coordinates[2] = @facing[@facing.index(@coordinates[2])-1]
    elsif direction == "right"
      facing_reverse = @facing.reverse
      @coordinates[2] = facing_reverse[facing_reverse.index(@coordinates[2])-1]
    else
      print "Check FACING spelling"
    end
  end

end
