//Participating Game of Drones by CodinGame
package main

import "fmt"

// import "os"

const (
	DEBUG       = false //True iff traces are activated
	ZONE_RADIUS = 100   //Radius of the zones
)

var (
	players []player //all the player of drones. Array index = player's ID
	whoami  int      //index of my player in the array of players
	zones   []zone   //all game zones
)

type point struct {
	x, y int
}

type player struct {
	drones []point //position of each drone
}

//Contains the center of the zone and current owner
type zone struct {
	pos   point
	owner int
}

func newZone() zone {
	return zone{point{-1, -1}, -1}
}

//Reads the game initialization information
func readInit() {
	var numPlayers, numZones, numDronesPerplayer int
	fmt.Scanf("%d %d %d %d\n", &numPlayers, &whoami, &numDronesPerplayer, &numZones)
	players = make([]player, numPlayers)
	for i, _ := range players {
		players[i].drones = make([]point, numDronesPerplayer)
	}
	zones = make([]zone, numZones)
	for i, _ := range zones {
		zones[i] = newZone()
		fmt.Scanf("%d %d\n", &zones[i].pos.x, &zones[i].pos.y)
	}
}

//Reads the information of a turn
func parseTurn() bool {
	for i, _ := range zones {
		_, err := fmt.Scanf("%d\n", &zones[i].owner)
		if err != nil {
			fmt.Println("Error reading turn zones owners:", err)
			return false
		}
	}
	for i, _ := range players {
		for j, _ := range players[i].drones {
			_, err := fmt.Scanf("%d %d\n", &players[i].drones[j].x, &players[i].drones[j].y)
			if err != nil {
				fmt.Println("Error reading turn drones:", err)
				return false
			}
		}
	}
	return true
}

//Prints the movements of own drones
func play() {
	// Do not move any drone
	for _, d := range players[whoami].drones {
		fmt.Println(d.x, d.y)
	}
}

func main() {
	readInit()
	debug("Current status:", players, whoami, zones)
	for parseTurn() {
		debug("Current status:", players, whoami, zones)
		play()
	}
}

func debug(x ...interface{}) {
	if DEBUG {
		fmt.Println(x)
	}
}
