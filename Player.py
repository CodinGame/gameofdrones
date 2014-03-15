import sys


class Point:

    def __init__(self, x=-1, y=-1):
        self.x, self.y = x, y


class Player:
    id = -1
    is_me = False

    def __init__(self, nbr_drones):
        self.drones = [Drone() for i in xrange(nbr_drones)]


class Drone:
    nbr_instances = 0
    p = Point()
    
    def __init__(self):
        Drone.nbr_instances += 1
        
    def __del__(self):
        Drone.nbr_instances -= 1
        
    
class Zone:
    centre = Point()
    
    def __init__(self):
        pass
    
    def __init__(self, centre):
        self.centre = centre


# Read init information from standard input, if any
players = drones = Zones = None
def init():
    global players, drones, zones
    nbr_players, id, nbr_drones, nbr_zones = [int(x) for x in raw_input().split()]
    
    #create players
    players = [Player(nbr_drones) for i in xrange(nbr_players)]
    players[0].is_me, players[0].id = True, id
    
    #create zones
    zones = [Zone(Point(*[int(x) for x in raw_input().split()])) for i in xrange(nbr_zones)]
    
    
    print >> 'test'
    
init()

while 1:
    #do your stuff
    pass
