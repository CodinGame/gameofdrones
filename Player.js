var areaRadius = 100;

function Point(){
    this.x = 0;
    this.y = 0;
}

function Drone(){
    this.position = new Point();
}

function Zone(){
    this.center = new Point();
    this.ownerId = -1;
}

function Team(){
    this.drones = new Array();
}

function Game(){
    this.zones = new Array();
    this.teams = new Array();
    this.myTeamId;
}

Game.prototype.init = function() {
    var inputs = readline().split(' ');
    var p = parseInt(inputs[0]),
        i = parseInt(inputs[1]), 
        d = parseInt(inputs[2]), 
        z = parseInt(inputs[3]);
    this.myTeamId = i;

    for(var areaId = 0; areaId < z; areaId++) {
        var zone = new Zone();
        var coords = readline().split(' ');
        zone.center.x = parseInt(coords[0]);
        zone.center.y = parseInt(coords[1]);
        this.zones.push(zone);
    }

    for(var teamId = 0; teamId < p; teamId++) {
        var t = new Team();
        for(var droneId = 0; droneId < d; droneId++) {
            var drone = new Drone();
            t.drones.push(drone);
        }
        this.teams.push(t);
    }
}

Game.prototype.run = function() {
    while (true) {

        this.zones.forEach(function(zone){
            zone.ownerId = parseInt(readline());
        });

        this.teams.forEach(function(team){
            team.drones.forEach(function(drone){
                var coords = readline().split(' ');
                drone.position.x = parseInt(coords[0]);
                drone.position.y = parseInt(coords[1]);
            });
        });
      
        this.play();
    }
}

Game.prototype.play = function() {
    var myDrones = this.teams[this.myTeamId].drones;

    myDrones.forEach(function(drone){
        print('3999 1799');
    });
}


var g = new Game();
g.init();
g.run();
