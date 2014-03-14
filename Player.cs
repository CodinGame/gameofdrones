using System;
using System.Collections.Generic;
using System.Linq;

namespace Player
{
    class Point
    {
        public int X { get; set; }
        public int Y { get; set; }
    }

    class Drone
    {
        public Point Position { get; set; } 
    }

    class Zone
    {
        public const int Radius = 100;

        public Point Center { get; set; }
        public int OwnerId { get; set; } // -1 if no owner
    }

    class Team
    {
        public Team(int droneCount)
        {
            Drones = new List<Drone>(droneCount);
            for (var droneId = 0; droneId < droneCount; droneId++)
                Drones.Add(new Drone());
        }

        public IList<Drone> Drones { get; private set; }
    }

    class Game
    {
        List<Zone> zones; // all game zones
        List<Team> teams; // all the team of drones. Array index = team's ID
        int myTeamId; // index of my team in the array of teams

        // read initial games data (one time at the beginning of the game: P I D Z...)
        public void Init()
        {
            var pidz = ReadIntegers();

            myTeamId = pidz[1];
            zones = ReadZones(pidz[3]).ToList();
            teams = ReadTeams(pidz[0], pidz[2]).ToList();
        }

        IEnumerable<Zone> ReadZones(int zoneCount)
        {
            for (var areaId = 0; areaId < zoneCount; areaId++)
                yield return new Zone {Center = ReadPoint()};
        }

        IEnumerable<Team> ReadTeams(int teamCount, int dronesPerTeam)
        {
            for (var teamId = 0; teamId < teamCount; teamId++)
                yield return new Team(dronesPerTeam);
        }

        public void ReadContext()
        {
            foreach (var zone in zones)
                zone.OwnerId = ReadIntegers()[0];

            foreach (var team in teams)
                foreach (var drone in team.Drones)
                    drone.Position = ReadPoint();
        }

        // Compute logic here. This method is called for each game round. 
        public void Play()
        {
            var myDrones = teams[myTeamId].Drones;

            // here I always ask my drones to reach the bottom right corner... stupid :-) 
            foreach (var drone in myDrones)
            {
                Console.WriteLine("3999 1799");

            }
        }

        static int[] ReadIntegers()
        {
            // ReSharper disable once PossibleNullReferenceException
            return Console.ReadLine().Split(' ').Select(int.Parse).ToArray();
        }

        static Point ReadPoint()
        {
            var xy = ReadIntegers();
            return new Point { X = xy[0], Y = xy[1] };
        }
    }

    static class Program
    {
        static void Main()
        {
            var game = new Game();

            game.Init();
            
            while (true)
            {
                game.ReadContext();
                game.Play();
            }
        }
    }
}