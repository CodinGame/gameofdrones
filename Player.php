<?php

/**
 * Defines the point object
 */
class Point {

	/**
	 * X position on the map
	 * @var int
	 */
	public $x = 0;

	/**
	 * Y position on the map
	 * @var int
	 */
	public $y = 0;

	public function __toString() {
		return sprintf('%d %d', $this->x, $this->y);
	}

}

/**
 * Drone object referring the position on the map
 */
class Drone {

	/**
	 * Position of the drone
	 * @var Point
	 */
	public $pos;

	public function __construct() {
		$this->pos = new Point();
	}

}

/**
 * Zone object referencing the position on the map
 */
class Zone {

	/**
	 * The center of the zone
	 * (circle radius  = 100 units)
	 * @var Point
	 */
	public $center;

	/**
	 * The owner ID
	 * @var int
	 */
	public $ownerId = -1;

	public function __construct() {
		$this->center = new Point();
	}

}

/**
 * Team object referencing their drones
 */
class Team {

	/**
	 * List of drones
	 * @var array
	 */
	public $drones = array();

}

/**
 * Game logic
 */
class Game {

	/**
	 * List of zones
	 * @var array
	 */
	public $zones = array();

	/**
	 * List of teams
	 * @var array
	 */
	public $teams = array();

	/**
	 * My team ID
	 * @var int
	 */
	public $myTeamId = -1;

	/**
	 * Read initialization data from standard input
	 */
	public function init() {
		// p = number of players in the game 2 to 4
		// i = id of your player(0,1,2 or 3)
		// d = number of drones in each team(3 to 11)
		// z =  number of zones in map(4 to 8)
		list($p, $i, $d, $z) = explode(' ', trim(fgets(STDIN)), 4);

		// Set my team id
		$this->myTeamId = $i;

		// Each zone
		for ($areaId = 0; $areaId < $z; $areaId++) {
			$z1 = new Zone();

			list($z1->center->x, $z1->center->y) = explode(' ', trim(fgets(STDIN)), 2);

			$this->zones[$areaId] = $z1;
		}

		// Each team
		for ($teamId = 0; $teamId < $p; $teamId++) {
			$t1 = new Team();

			// Add the drones to the team
			for ($droneId = 0; $droneId < $d; $droneId++) {
				$t1->drones[$droneId] = new Drone();
			}

			$this->teams[$teamId] = $t1;
		}
	}

	/**
	 * Called during each round
	 * reads input datas (zone ownerid and the coordinates of drones of all teams)
	 */
	public function run() {
		while (1) {
			foreach ($this->zones as $zone) {
				$zone->ownerId = (int) trim(fgets(STDIN));
			}

			foreach ($this->teams as $team) {
				foreach ($team->drones as $drone) {
					list($drone->pos->x, $drone->pos->y) = explode(' ', trim(fgets(STDIN)), 2);
				}
			}

			$this->play();
		}
	}

	/**
	 * Your logic goes here
	 */
	public function play() {
		$myDrones = $this->teams[$this->myTeamId]->drones;

		foreach ($myDrones as $droneId => $drone) {
			print "3999 1799\n";
		}
	}

}

$g = new Game();
$g->init();
$g->run();

?>
