STDOUT.sync = true

class Point
  attr_accessor :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end
end

class Drone
  attr_accessor :position
  def initialize
    @position = nil
  end
end

class Zone
  attr_accessor :center, :owner_id
  RADIUS = 100
  def initialize(center)
    @center = center
    @owner_id = -1
  end
end

class Team
  attr_accessor :drones
  def initialize(drone_count)
    @drones = []
    (0..drone_count - 1).each do
      @drones.push Drone.new
    end
  end
end

class Game
  def init
    @zones = []
    @teams = []

    @players_count, @my_team_id, @drones_count, @zones_count = read_integers
    read_zones
    read_teams
  end

  # Compute logic here. This method is called for each game round.
  def play
    my_drones = @teams[@my_team_id].drones

    my_drones.each do |drone|
      puts "3999 1799"
    end
  end

  def read_context
    @zones.each do |zone|
      zone.owner_id = read_integers[0]
    end

    @teams.each do |team|
      team.drones.each do |drone|
        drone.position = read_point
      end
    end
  end

  def read_zones
    (0..@zones_count - 1).each do
      @zones.push Zone.new(read_point)
    end
  end

  def read_teams
    (0..@players_count - 1).each do
      @teams.push Team.new(@drones_count)
    end
  end
end

def read_point
  xy = read_integers
  Point.new(xy[0], xy[1])
end

def read_integers
  STDIN.gets.split.map { |s| s.to_i}
end

game = Game.new

game.init

loop do
  game.read_context
  game.play
end

