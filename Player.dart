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
    
    String toString() => "$x $y";
}

class Player {
    List    drones = <Drone>[];
    
    Player();
    
    String toString() => "$drones";
}

void init() {
    var infos = stdin.readLineSync();
    var tab = infos.split(' ');
    var nbr_players = int.parse(tab[0]);
    my_id = int.parse(tab[1]);
    nbr_drones = int.parse(tab[2]);
    var nbr_zones = int.parse(tab[3]);
    zones = <Zones>[];
    players = <Player>[];
    
    for (int i = 0; i < nbr_zones; i++) {
        var stringZonesPos = stdin.readLineSync();
        var zones_pos = stringZonesPos.split(' ');
        zones.add(new Zone(int.parse(zones_pos[0]), int.parse(zones_pos[1])));
    }

    for (int i = 0; i < nbr_players; i++) {
        var player = new Player();
        for (int y = 0; y < nbr_drones; y++) {
            player.drones.add(new Drone(0, 0));
        }
        players.add(player);
    }
}

void printZones() {
    zones.forEach((Zone zone) {
        stderr.writeln(zone);
    });
}

void printPlayer() {
    players.forEach((Player player) {
        stderr.writeln(player);
    });
}

void main() {
    init();
    
     
    while (true) {
        for (int i = 0; i < zones.length; i++) {
            var etatZone = stdin.readLineSync();
            zones[i].etat = int.parse(etatZone, onError: (e) => -1);
        }

        for (int p = 0; p < players.length; p++) {
            for (int d = 0; d < players[p].drones.length; d++) {
                var dronePos = stdin.readLineSync();
                var tabDronePos = dronePos.split(' ');
                players[p].drones[d].x = int.parse(tabDronePos[0], onError: (e) => 0);
                players[p].drones[d].y = int.parse(tabDronePos[1], onError: (e) => 0);
            }
        }
        
        //  What to do?


        //  Print new pos for my drone
	for (int i = 0; i < players[my_id].drones.length; i++) {
            print("3999 1799");
	}
    }
}