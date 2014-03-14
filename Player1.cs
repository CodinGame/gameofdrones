using System;
using System.IO;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

class Drone
{
    public int X;
    public int Y;
    public int TargetX;
    public int TargetY;
    public int PlayerId;
}

class Zone
{
    public int X;
    public int Y;
    public int? PlayerId;
}

class Player
{
    public int Id;
    public Drone[] Drones;
}

class Game
{
    public const int Width = 4000;
    public const int Height = 1800;
    
    public Player[] Players;
    public Player MyPlayer;

    public Zone[] Zones;

    public void Init()
    {
        var pidz = Console.ReadLine().Split(' ').Select(i => int.Parse(i)).ToArray();
        var P = pidz[0];
        var I = pidz[1];
        var D = pidz[2];
        var Z = pidz[3];
        Zones = new Zone[Z];
        for (var z = 0; z < Z; z++)
        {
            var zoneXY = Console.ReadLine().Split(' ').Select(i => int.Parse(i)).ToArray();
            Zones[z] = new Zone { X = zoneXY[0], Y = zoneXY[1] };
        }
        Players = new Player[P];
        for (var i = 0; i < P; i++)
        {
            Players[i] = new Player { Id = i, Drones = new Drone[D] };
            for (var d = 0; d < D; d++)
            {
                Players[i].Drones[d] = new Drone();
            }
        }
        MyPlayer = Players[I];
    }
    
    public void Update()
    {
        foreach (var zone in Zones)
        {
            var playerId = int.Parse(Console.ReadLine());
            zone.PlayerId = playerId != -1 ? playerId : (int?)null;
        }
        foreach (var player in Players)
        {
            foreach (var drone in player.Drones)
            {
                var droneXY = Console.ReadLine().Split(' ').Select(i => int.Parse(i)).ToArray();
                drone.X = droneXY[0];
                drone.Y = droneXY[1];
            }
        }
    }
    
    public void Play()
    {
        // analyse game and set desire direction for all my drones
        // for now, they all just love first zone :)
        foreach (var drone in MyPlayer.Drones)
        {
            drone.TargetX = Zones[0].X;
            drone.TargetY = Zones[0].Y;
        }
    }
}

class GameOfDrones
{
    static void Main(String[] args) {

        var game = new Game();
        game.Init();

        while (true) {
            game.Update();
            game.Play();
            foreach (var drone in game.MyPlayer.Drones)
            {
                Console.WriteLine(String.Format("{0} {1}", drone.TargetX, drone.TargetY));
            }
	    }
	}
}
