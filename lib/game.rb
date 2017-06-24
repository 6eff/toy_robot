require_relative 'toyrobot.rb'
require_relative 'tabletop.rb'

puts 'Lets play! Please define tabletop size you want to place robot on. Enter X axis size, any positve integer, and hit Enter'

x_axe_size = gets.chomp.to_i

puts 'Now enter Y axis size, any positive integer, and hit Enter'

y_axe_size = gets.chomp.to_i

@tabletop = Tabletop.new x_axe_size, y_axe_size
@toyrobot = Toyrobot.new

puts 'Now you can place, turn or move your robot'

def actions(action = '')
  message = "
    ************
  Select action and hit enter:
    1. PLACE
    2. MOVE
    3. rotate RIGHT
    4. rotate LEFT
    5. REPORT postion
    6. EXIT
    ************"
  until [1, 2, 3, 4, 5, 6].include? action
    printf "%-20s %s\n", message, ''
    action = gets.chomp.to_i
  end
  play action
end

def play(action)
  case action
  when 1
    puts 'Please enter X coordinte and hit enter'
    x_coordinate = gets.chomp.to_i
    puts 'Pleas enter Y coordinte and hit enter'
    y_coordinate = gets.chomp.to_i
    puts 'Now enter what direction your robot is facing - south, west, north or east. Hit enter'
    facing = gets.chomp.downcase
    until @toyrobot.instance_variable_get('@facing').include? facing
      puts "\e[31mWrong spelling, please enter again\e[0m"
      facing = gets.chomp.downcase
    end
    @toyrobot.place([x_coordinate, y_coordinate, facing], @tabletop.tabletop)
    actions
  when 2
    if @toyrobot.on_tabletop? @tabletop.tabletop
      @toyrobot.move @tabletop.tabletop
    else
      puts "\e[31mCan't move, robot not on tabletop\e[0m"
    end
    actions
  when 3
    if @toyrobot.on_tabletop? @tabletop.tabletop
      @toyrobot.rotate 'right'
    else
      puts "\e[31mCan't rotate, robot is not on tabletop\e[0m"
    end
    actions
  when 4
    if @toyrobot.on_tabletop? @tabletop.tabletop
      @toyrobot.rotate 'left'
    else
      puts "\e[31mCan't rotate, robot is not on tabletop\e[0m"
    end
    actions
  when 5
    if @toyrobot.on_tabletop? @tabletop.tabletop
      printf "%-20s %s\n", "Current robot position:
      X axis - #{@toyrobot.coordinates[0]}
      Y axis - #{@toyrobot.coordinates[1]}
      Facing - #{@toyrobot.coordinates[2].upcase}", ''
    else
      puts "\e[31mCan't report position, robot not on tabletop\e[0m"
    end
    actions
  when 6
    exit
  end
end

actions
