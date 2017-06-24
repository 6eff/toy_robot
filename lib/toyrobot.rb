class Toyrobot

  attr_reader :coordinates

  def initialize
    @coordinates = []
    @facing = ["south","west","north","east"]
  end

  def place_error tabletop
    print "Please place you robot on tabletop of #{tabletop[:x_axe].last} X #{tabletop[:y_axe].last} units"
  end

  def place coordinates, tabletop
    @coordinates.replace coordinates
    if on_tabletop? tabletop
      @coordinates
    else
      place_error tabletop
      @coordinates = []
    end
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

  def error
    print "Make a turn, you've reached the edge"
  end

  def move tabletop
    case @coordinates[2]
      when "north"
        @coordinates[1] += 1
        if on_tabletop? tabletop
          @coordinates
        else
          error
          @coordinates[1] -= 1
        end
      when "south"
        @coordinates[1] -= 1
        if on_tabletop? tabletop
          @coordinates
        else
         error
         @coordinates[1] += 1
        end
      when "east"
        @coordinates[0] += 1
        if on_tabletop? tabletop
          @coordinates
        else
         error
         @coordinates[0] -= 1
        end
      when "west"
        @coordinates[0] -= 1
        if on_tabletop? tabletop
          @coordinates
        else
          error
          @coordinates[0] += 1
        end
    end
  end

end
