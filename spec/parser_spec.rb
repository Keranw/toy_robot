require 'spec_helper'

describe Parser do

  before :each do
    @robot = Robot.new(5,5)
    @parser = Parser.new("mock path", @robot)
  end

  describe "#new" do
    it "generate a parser object" do
      expect(@parser).to be_an_instance_of(Parser)
    end
  end

  describe "#parse" do
    it "read commands and print result" do
      @parser.path = "spec/test1.txt"
      expect { @parser.parse }.to output("3,3,NORTH\n").to_stdout
    end
  end

  describe "#parse" do
    it "ignore any command before the robot is placed" do
      @parser.path = "spec/test2.txt"
      expect { @parser.parse }.to output("3,3,NORTH\n").to_stdout
    end
  end

  describe "#parse" do
    it "won't accept invalid command" do
      @parser.path = "spec/test3.txt"
      expect { @parser.parse }.to output("3,3,NORTH\n").to_stdout
    end
  end

  describe "#parse" do
    it "won't accept invalid path" do
      expect { @parser.parse }.to output("Invalid Path.\n").to_stdout
    end
  end

  describe "#cmd" do
    it "place the robot when command is place" do
      @parser.cmd(["place", [1, 1, "north"]])
      expect(@robot.face_to).to eq("north")
    end
  end

  describe "#cmd" do
    it "skip a command when the command is invalid" do
      @parser.cmd(["plase", [1, 1, "north"]])
      expect(@robot.face_to).to eq("")
    end
  end

  describe "#cmd" do
    it "skip commands before place command" do
      @parser.cmd(["move", ""])
      expect(@robot.position).to eq([0, 0])
    end
  end

  describe "#cmd" do
    it "move the robot when command is move" do
      @parser.cmd(["place", [1, 1, "north"]])
      @parser.cmd(["move", ""])
      expect(@robot.position).to eq([1, 2])
    end
  end

  describe "#cmd" do
    it "turn the robot left when command is left" do
      @parser.cmd(["place", [1, 1, "north"]])
      @parser.cmd(["left", ""])
      expect(@robot.face_to).to eq("west")
    end
  end

  describe "#cmd" do
    it "turn the robot right when command is right" do
      @parser.cmd(["place", [1, 1, "north"]])
      @parser.cmd(["right", ""])
      expect(@robot.face_to).to eq("east")
    end
  end

  describe "#cmd" do
    it "print the robot's position when command is report" do
      @parser.cmd(["place", [1, 1, "north"]])
      expect { @parser.cmd(["report", ""]) }.to output("1,1,NORTH\n").to_stdout
    end
  end

end
