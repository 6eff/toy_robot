class Toyrobot
  attr_reader :coordinates

  def initialize
    @coordinates = []
    @facing = %w(south west north east)
  end

  def place_error(tabletop)
    puts "\e[31m#{"Please place you robot on tabletop of 0 to #{tabletop[:x_axe].last} on X axis and 0 to #{tabletop[:y_axe].last} on Y axis"}\e[0m"
  end

  def place(coordinates, tabletop)
    @coordinates.replace coordinates
    if on_tabletop? tabletop
      @coordinates
    else
      place_error tabletop
      @coordinates = []
    end
  end

  def on_tabletop?(tabletop)
    tabletop.values[0].include?(@coordinates[0]) && tabletop.values[1].include?(@coordinates[1])
  end

  def rotate(direction)
    if direction == 'left'
      @coordinates[2] = @facing[@facing.index(@coordinates[2]) - 1]
    elsif direction == 'right'
      facing_reverse = @facing.reverse
      @coordinates[2] = facing_reverse[facing_reverse.index(@coordinates[2]) - 1]
    else
      puts "\e[31mCheck FACING spelling\e[0m"
    end
  end

  def error
    puts "\e[31mMake a turn, you've reached the edge\e[0m"
  end

  def move(tabletop)
    if on_tabletop? tabletop
      case @coordinates[2]
      when 'north'
        @coordinates[1] += 1
        if on_tabletop? tabletop
          @coordinates
        else
          error
          @coordinates[1] -= 1
        end
      when 'south'
        @coordinates[1] -= 1
        if on_tabletop? tabletop
          @coordinates
        else
          error
          @coordinates[1] += 1
        end
      when 'east'
        @coordinates[0] += 1
        if on_tabletop? tabletop
          @coordinates
        else
          error
          @coordinates[0] -= 1
        end
      when 'west'
        @coordinates[0] -= 1
        if on_tabletop? tabletop
          @coordinates
        else
          error
          @coordinates[0] += 1
        end
      end
    else
      place_error tabletop
    end
  end
end
