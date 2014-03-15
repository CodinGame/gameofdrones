object Player extends App {

  class Point(val x: Int, val y: Int) {
    override def toString: String = x.toString + " " + y.toString
  }
  object Point {
    implicit def apply(e: String): Point = {
      val Array(x, y) = e.split(" ").map(_.toInt)
      new Point(x, y)
    }
  }

  class Drone {
    var pos: Point = _
  }

  class Zone(val center: Point, var owner: Int = -1) {
  }
  object Zone {
    implicit def apply(e: String): Zone = new Zone(Point(e))
  }

  class Team(nbDrones: Int) {
    val drones: Seq[Drone] = for (i <- 0 until nbDrones) yield new Drone
  }

  class Game(p: Int, m: Int, d: Int, z: Int) {
    val me   : Int       = m
    val zones: Seq[Zone] = for (i <- 0 until z) yield Zone(readLine)
    val teams: Seq[Team] = for (i <- 0 until p) yield new Team(d)

    def play() {
      while (true) {
        // Update owner of each zone
        for (i <- 0 until z) zones(i).owner = readLine.toInt
        // Update position of each drone
        for (i <- 0 until p; j <- 0 until d) teams(i).drones(j).pos = Point(readLine)
        move()
      }
    }

    // Implement your code in this function
    def move() {
      val t = teams(me)
      t.drones.foreach(drone => println(drone.pos))
    }
  }

  val Array(p, i, d, z) = readLine.split(" ").map(_.toInt)
  val g = new Game(p, i, d, z)
  g.play()

}
