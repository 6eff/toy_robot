class Toyrobot

  attr_reader :coordinates

  def initialize
    @coordinates = []
  end

  def place coordinates
    @coordinates.replace coordinates
  end

end
