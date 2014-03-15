import sys

from operator import attrgetter


class Point:

    def __init__(self, x=-1, y=-1):
        self.x, self.y = x, y
    
    def __str__(self):
        return "%d %d" % (self.x, self.y)

class Player:

    def __init__(self, nbr_drones, id=-1):
        self.drones = [Drone() for i in xrange(nbr_drones)]
        self.id = id


class Drone:
    nbr_instances = 0
    point = None
    
    def __init__(self):
        Drone.nbr_instances += 1
        
    def __del__(self):
        Drone.nbr_instances -= 1
        
    
class Zone:
    
    def __init__(self, centre=None, dominant=None):
        self.centre, self.dominant = centre, dominant



players = drones = zones = nbr_drones = None
my_id = None

# Read init information from standard input
def init():
    global players, drones, zones, my_id, nbr_drones
    nbr_players, id, nbr_drones, nbr_zones = [int(x) for x in raw_input().split()]
    my_id = id
    
    #create a sorted list of players, so that the player's index is the id
    players = sorted([Player(nbr_drones, i) for i in xrange(nbr_players)], key=attrgetter('id'))
    
    #create zones
    zones = [Zone(Point(*[int(x) for x in raw_input().split()])) for i in xrange(nbr_zones)]
    

init()

while 1:
    for i in xrange(len(zones)):
        id = int(raw_input())
        if id == -1:
            #...
        else:
            zones[i].dominant = players[i]
    
    for i in xrange(len(players)):
        for j in xrange(nbr_drones):
            players[i].drones[j].point = Point(*[int(x) for x in raw_input().split()])
            
        
        

    # Compute logic here

    # print >> sys.stderr, "Debug messages..."

    # Write action to standard output
    print "3999 1799"
