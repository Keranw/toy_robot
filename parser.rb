class Parser
  attr_accessor :path

  def initialize(path, robot)
    @path = path
    @robot = robot
  end

  # transfer input data to the form the program can deal with
  def parse
    begin
      input_commands = File.read(@path)
    rescue
      puts "Invalid Path."
    end
    if !input_commands.nil?
      input_commands.each_line do |f|
        if !f.nil?
          result = f.strip.downcase
          result = result.split(/\s+/, 2)
          if result.length > 1
            result[1] = result[1].split(/\s*,\s*/)
            result[1][0] = Parser.convert(result[1][0])
            result[1][1] = Parser.convert(result[1][1])
          end
          self.cmd(result)
        end
      end
    end
  end

  # send command and arguments to robot to act
  def cmd(command)
    case command[0]
    when "place"
      @robot.place(command[1][0], command[1][1], command[1][2])
    when "move"
      @robot.move
    when "left"
      @robot.left
    when "right"
      @robot.right
    when "report"
      @robot.report
    else
      #skip invalid command
    end
  end

  def self.convert(aim)
    if !aim.nil? && aim.match(/\A\d+\Z/)
      return aim.to_i
    else
      return aim
    end
  end

end
