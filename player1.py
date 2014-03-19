class Point(object):
    """Defines the point object
    Has data attributes the x and y position"""

    def __init__(self):
        self.x = 0
        self.y = 0
    def __str__(self):
        return (str(self.x) + ' ' + str(self.y))

class Drone(object):
  """Drone object referring to the drone and 
  contains an object referencing the position of the drone"""
  def __init__(self):
    self.pos = Point() # position of the drone
   
  
class Zone(object):
  """Zone object referencing the zones in the map
  Data attributes are the coordinates of the center and 
  the ownerid"""
  def __init__(self):
    self.center = Point() # center of the zone (circle radius  = 100 units)
    ownerId = -1 

class Team(object):
  """One single team containing multiple drones"""
  def __init__(self):
    self.drones = []


class Game(object):

  def __init__(self):

    self.zones = [] # list of zone objects
    self.teams = [] # list of team objects
    self.myTeamId = -1 # my team id
        
  def init(self):
    """Function to read initialization data
    from standard input """

    # print 'Enter first data'
    s = raw_input()
    # p = number of players in the game 2 to 4
    # i = id of your player(0,1,2 or 3)
    # d = number of drones in each team(3 to 11)
    # z =  number of zones in map(4 to 8)

    
    p,i,d,z = [int(var) for var in s.split()]  # enter the input for initialization
        
    myTeamId = i # set my team id
        
    #z1 = [Zone() for areaId in xrange(z)]

    # Enter details for each zone
    for areaId in xrange(z):

      z1 = Zone() # for each zone create a zone object
      
      # print 'Enter center of zone'    
      s = raw_input() # take as input the center of the zone
      z1.center.x , z1.center.y = [int(var) for var in s.split()]
   
      # print z1[areaId].center

      if z1 not in self.zones:
        self.zones.append(z1) # add the zone to the list of zones
     

    # assign teams
    t1 = [Team() for teamId in xrange(p)] # for each team create a team object

    for teamId in xrange(p):
            
      t1[teamId].drones = []  

      d1 = [Drone() for droneId in xrange(d)] # for each drone create a drone object

      for droneId in xrange(d):
        
        t1[teamId].drones.append(d1[droneId]) # add the drones to the team
            
      self.teams.append(t1[teamId]) # add each team to the teams list 

  
  def run(self):
    """Function running during each round, takes as input 
    zone ownerid and the coordinates of drones of all teams"""  
    
    while 1:
      
      for zone in self.zones:
        #print 'Enter zone id'
        zone.ownerId = int(raw_input())

      for team in self.teams:
        for drone in team.drones:
          # print 'Enter drone points'
          s = raw_input()
          drone.pos.x, drone.pos.y = [int(var) for var in s.split()]
      
      self.play()



  def play(self):
    """Your logic goes here"""

    myDrones = self.teams[self.myTeamId].drones
    for drone in myDrones:
      print "3999 1799"


g = Game()
g.init()
g.run()






            
        
    