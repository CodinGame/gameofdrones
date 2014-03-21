import 'dart:io';

var players, drones, zones, my_id, nbr_drones;

class Zone {
    int x;
    int y;
    int etat;
    
    Zone(this.x, this.y, [this.etat = -1]);
    
    String toString() => "$x $y $etat";
}

class Drone {
    int x;
    int y;
    
    Drone(this.x, this.y);
    
    Drone.origin(){
        x = 0;
        y = 0;
    }
    
    String toString() => "$x $y";
}
    

class Player {
    List<Drone> drones = <Drone>[];
    
    Player();
    
    String toString() => "$drones";
}

void init() {
    
    var infos = readValues();
    var nbr_players = infos[0];
    my_id = infos[1];
    nbr_drones = infos[2];
    var nbr_zones = infos[3];
    
    zones = new List.generate(nbr_zones,(_){
        var positions = readValues();
        return new Zone(positions[0], positions[1]);
    });
    
    players = new List.generate(nbr_players, (_) =>
      new Player()..drones = new List.generate(nbr_drones, (_) => new Position.origin())
    );

}

void printZones() =>
    zones.forEach(stderr.writeln); 


void printPlayer() =>
    players.forEach(stderr.writeln);

List<int> readValues() =>
    stdin.readLineSync().split(' ').map(int.parse).toList();

void main() {
    init();
    
    while (true) {
        zones.forEach((Zone z) => z.etat = readValues()[0]);
        
        players.forEach((player) =>
            player.drones.forEach((drone) {
                var positions = readValues();
                drone..x = positions[0]
                     ..y = positions[1]; 
            })
        );

        //  What to do?
        
        //  Print new pos for my drone
        players[my_id].drones.forEach((_) => print("3999 1799"));
    }
  
}