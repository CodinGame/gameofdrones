import java.util.*;
import java.io.*;
import java.math.*;
import java.awt.Point;

class Player {

	Team[] teams; // all the team of drones. Array index = team's ID
	int myTeamIdx; // index of my team in the array of teams
	Zone[] zones; // all game zones

	static class Team {
		Point[] drones; // position of the drones
	}

	static class Zone {
		Point pos = new Point(); // center of this zone (circle radius = 100 units)
		int owner = -1; // ID of the team which owns this zone, -1 otherwise
	}

	/**
	 * Compute logic here. This method is called for each game round.
	 */
	void play() {
		Team me = teams[myTeamIdx];
		// here I always ask my drones to reach the bottom right corner... stupid :-)
		for (Point drone : me.drones) {
			System.out.println("3999 1799");
		}
	}

	// program entry point
	public static void main(String args[]) {
		Scanner in = new Scanner(System.in);

		Player p = new Player();
		p.parseInit(in);

		while (true) {
			p.parseContext(in);
			p.play();
		}
	}

	// parse games data (one time at the beginning of the game: P I D Z...)
	void parseInit(Scanner in) {
		teams = new Team[in.nextInt()]; // P
		myTeamIdx = in.nextInt(); // I

		int cntDronesPerTeam = in.nextInt(); // D
		for (int i = 0; i < teams.length; i++) {
			Team t = new Team();
			t.drones = new Point[cntDronesPerTeam];
			teams[i] = t;
		}

		zones = new Zone[in.nextInt()]; // Z

		for (int i = 0; i < zones.length; i++) {
			Zone z = new Zone();
			z.pos.x = in.nextInt();
			z.pos.y = in.nextInt();
			zones[i] = z;
		}
	}

	// parse contextual data to update the game's state (called for each game round)
	void parseContext(Scanner in) {
		for (Zone z : zones) {
			z.owner = in.nextInt(); // update zones owner
		}

		for (int i = 0; i < teams.length; i++) {
			Team t = teams[i];
			for (int j = 0; j < t.drones.length; j++) {
				t.drones[j] = new Point(in.nextInt(), in.nextInt()); // update drones position
			}
		}
	}
}
