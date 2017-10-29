require 'spec_helper'

describe Robot do

  before :each do
    @robot = Robot.new(5, 5)
  end

  describe "#new" do
    it "generate a robot object" do
      expect(@robot).to be_an_instance_of Robot
    end
  end

  describe "#new" do
    it "generate a robot object" do
      expect(@robot.position).to eq([0, 0])
    end
  end

  describe "#new" do
    it "generate a robot object" do
      expect(@robot.face_to).to eq("")
    end
  end

  describe "#place" do
    it "place a robot object when arguments are acceptable" do
      @robot.place(1, 1, "north")
      expect(@robot.position).to eq([1, 1])
      expect(@robot.face_to).to eq("north")
    end
  end

  describe "#place" do
    it "won't place a robot object when x is smaller than 0" do
      @robot.place(-1, 1, "north")
      expect(@robot.position).to eq([0, 0])
      expect(@robot.face_to).to eq("")
    end
  end

  describe "#place" do
    it "won't place a robot object when x is bigger than 4" do
      @robot.place(5, 1, "north")
      expect(@robot.position).to eq([0, 0])
      expect(@robot.face_to).to eq("")
    end
  end

  describe "#place" do
    it "won't place a robot object when x is not an integer object" do
      @robot.place(nil, 1, "north")
      expect(@robot.position).to eq([0, 0])
      expect(@robot.face_to).to eq("")
    end
  end

  describe "#place" do
    it "won't place a robot object when y is smaller than 0" do
      @robot.place(1, -1, "north")
      expect(@robot.position).to eq([0, 0])
      expect(@robot.face_to).to eq("")
    end
  end

  describe "#place" do
    it "won't place a robot object when y is bigger than 4" do
      @robot.place(1, 5, "north")
      expect(@robot.position).to eq([0, 0])
      expect(@robot.face_to).to eq("")
    end
  end

  describe "#place" do
    it "won't place a robot object when y is not an integer" do
      @robot.place(1, nil, "north")
      expect(@robot.position).to eq([0, 0])
      expect(@robot.face_to).to eq("")
    end
  end

  describe "#place" do
    it "won't place a robot object when face is not direction" do
      @robot.place(1, 1, "notdirection")
      expect(@robot.position).to eq([0, 0])
      expect(@robot.face_to).to eq("")
    end
  end

  describe "#move" do
    it "move forward when it is allowed" do
      @robot.place(1, 1, "north")
      @robot.move
      expect(@robot.position).to eq([1, 2])
    end
  end

  describe "#move" do
    it "won't move when the robot will fall out from North" do
      @robot.place(1, 4, "north")
      @robot.move
      expect(@robot.position).to eq([1, 4])
    end
  end

  describe "#move" do
    it "won't move when the robot will fall out from South" do
      @robot.place(1, 0, "south")
      @robot.move
      expect(@robot.position).to eq([1, 0])
    end
  end

  describe "#move" do
    it "won't move when the robot will fall out from East" do
      @robot.place(4, 0, "east")
      @robot.move
      expect(@robot.position).to eq([4, 0])
    end
  end

  describe "#move" do
    it "won't move when the robot will fall out from West" do
      @robot.place(0, 0, "west")
      @robot.move
      expect(@robot.position).to eq([0, 0])
    end
  end

  describe "#left" do
    it "turn left without other movements (N to W)" do
      @robot.place(0, 0, "north")
      @robot.left
      expect(@robot.face_to).to eq("west")
    end
  end

  describe "#left" do
    it "turn left without other movements (W to S)" do
      @robot.place(0, 0, "west")
      @robot.left
      expect(@robot.face_to).to eq("south")
    end
  end

  describe "#left" do
    it "turn left without other movements (S to E)" do
      @robot.place(0, 0, "south")
      @robot.left
      expect(@robot.face_to).to eq("east")
    end
  end

  describe "#left" do
    it "turn left without other movements (E to N)" do
      @robot.place(0, 0, "east")
      @robot.left
      expect(@robot.face_to).to eq("north")
    end
  end

  describe "#right" do
    it "move right without other movements (N to E)" do
      @robot.place(0, 0, "north")
      @robot.right
      expect(@robot.face_to).to eq("east")
    end
  end

  describe "#right" do
    it "move right without other movements (E to S)" do
      @robot.place(0, 0, "east")
      @robot.right
      expect(@robot.face_to).to eq("south")
    end
  end

  describe "#right" do
    it "move right without other movements (S to W)" do
      @robot.place(0, 0, "south")
      @robot.right
      expect(@robot.face_to).to eq("west")
    end
  end

  describe "#right" do
    it "move right without other movements (W to N)" do
      @robot.place(0, 0, "west")
      @robot.right
      expect(@robot.face_to).to eq("north")
    end
  end

  describe "#report" do
    it "report current states when it is allowed" do
      @robot.place(0, 0, "west")
      expect { @robot.report }.to output("0,0,west\n").to_stdout
    end
  end
end
