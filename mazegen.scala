import scala.util.Random

object MazeHelpers {
  case class Direction(val dx: Int, val dy: Int)
  case class Loc(val x: Int, val y: Int) {

    def +(delta: Direction): Loc = {
      Loc( x + delta.dx, y + delta.dy)
    }

    override def toString: String = x.toString + ',' + y.toString
  }

  val North = Direction(0, 1)
  val East = Direction(1, 0)
  val South = Direction(0, -1)
  val West = Direction(-1, 0)

  val Directions = Set(North, East, South, West)
}

import MazeHelpers._

//using Set for visited because the locations are unique
class Grid(val w: Int, val h: Int, val visited: Set[Loc]) {
  override def toString: String = List(w, h).mkString("X").concat(" maze coming soon...")

  def markVisited(loc: Loc): Grid = {
    new Grid(w, h, visited + loc)
  }
}

object MazeGen {
  import MazeHelpers._

  def buildMaze(grid: Grid, curr: Loc): Grid = {
    val newgrid = grid.markVisited(curr)
    val neighbours = Directions.map{ curr + _ }
    //println(curr)
    //println(neighbours)
    newgrid
  }

  def genMaze(w: Int, h: Int) {
    val grid = new Grid(w, h, Set())
    val startLoc = Loc(Random.nextInt(w), Random.nextInt(h))
    println(buildMaze(grid, startLoc))
  }
}

MazeGen.genMaze(16, 8)
