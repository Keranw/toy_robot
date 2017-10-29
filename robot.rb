class Robot
  attr_accessor :position, :face_to

  def initialize (x_range, y_range)
    @position = [0,0]
    @face_to = ""
    @x_range = x_range
    @y_range = y_range
    @directions = ["north", "east", "south", "west"]
  end

  def place(x, y, face)
    if (self.valid_x(x)) && (self.valid_y(y)) && (self.valid_direction(face))
      @position = [x, y]
      @face_to = face.downcase
    end
  end

  def move
    if !@face_to.empty?
      case @face_to
      when "north"
        @position[1] += 1 if position[1] < (@y_range - 1)
      when "south"
        @position[1] -= 1 if position[1] > 0
      when "east"
        @position[0] += 1 if position[0] < (@x_range - 1)
      when "west"
        @position[0] -= 1 if position[0] > 0
      end
    end
  end

  def left
    if !@face_to.empty?

      @face_to = @directions[@directions.index(@face_to) - 1]
    end
  end

  def right
    if !@face_to.empty?
      @face_to = @directions.reverse[@directions.reverse.index(@face_to) - 1]
    end
  end

  def report
    if !@face_to.empty?
      puts @position[0].to_s + "," + @position[1].to_s + "," + @face_to
    end
  end

  def valid_x(x)
    return (x.kind_of? Integer) && (x >= 0) && (x < @x_range)
  end

  def valid_y(y)
    return (y.kind_of? Integer) && (y >= 0) && (y < @y_range)
  end

  def valid_direction(d)
    return @directions.include?(d.downcase)
  end
end
