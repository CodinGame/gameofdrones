#include <iostream>
#include <string>
#include <cmath>
#include <vector>
#include <cstdlib>
#include <ctime>

using namespace std;

static const int AREA_RADIUS = 100;

typedef struct Point_ {
    int x = 0;
    int y = 0;
} Point;

typedef struct Drone_ {
    Point pos; // position of the drone
} Drone;

typedef struct Zone_ {
    Point center; // center of this zone  (circle radius = 100 units)
    int ownerId = -1; // ID of the team which owns this zone, -1 otherwise
} Zone;

typedef struct Team_ {
    vector<Drone*> drones; // drones of the team
} Team;

typedef struct Game_ {
  vector<Zone*> zones; // all game zones
  vector<Team*> teams; // all the team of drones. Array index = team's ID
  int myTeamId; // index of my team in the array of teams

  // read initial games data (one time at the beginning of the game: P I D Z...)
  void init() {
      int p, i, d, z;
      cin >> p >> i >> d >> z;
      
      myTeamId = i;
      for(int areaId = 0; areaId < z; areaId++) {
          int x, y;
          Zone *z = new Zone();
          cin >> z->center.x >> z->center.y;
          zones.push_back(z);
      }
      
      for(int teamId = 0; teamId < p; teamId++) {
          Team *t = new Team();
          teams.push_back(t);
          for(int droneId = 0; droneId < d; droneId++) {
              Drone *drone = new Drone();
              t->drones.push_back(drone);
          }
      }
  }
  
  // Run the main loop (parse inputs and play)
  void run() {
      while (true) {
          for(Zone *zone : zones) {
              cin >> zone->ownerId; // update zones owner
          }
          
          for(Team *team : teams) {
              for(Drone * drone : team->drones) {
                  cin >> drone->pos.x >> drone->pos.y; // update drones position
              }
          }
          
          play();
      }
  }
  
  // Compute logic here. This method is called for each game round. 
  void play() {
      vector<Drone*> myDrones = teams[myTeamId]->drones;
       // here I always ask my drones to reach the bottom right corner... stupid :-) 
      for(Drone *drone : myDrones) {
          cout << "3999 1799" << endl;
      }
  }
  
} Game;


int main()
{
    Game g;
    g.init();
    g.run();

    return 0;
}
