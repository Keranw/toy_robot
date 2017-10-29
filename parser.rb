class Parser
  def initialize

  end

  def cmd(commands)
    if !commands.nil?
      commands.each do |f|
        case f[0] # 数组，前面命令，后面参数
        when "place"
          Robot.place(f)
        when "move"
          Robot.move
        when "left"
          Robot.left
        when "right"
          Robot.right
        when "report"
          Robot.report
        else
          puts "invalid 啊啊啊"
        end
      end
    end
  end
end
