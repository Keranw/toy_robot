require_relative 'parser'
require_relative 'robot'

if !ARGV[0].nil?
  @robot = Robot.new(5,5)
  @parser = Parser.new(ARGV[0], @robot)
  @parser.parse
else
  puts "please input the path to input command data"
end
