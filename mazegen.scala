import scala.util.Random

object MazeHelpers {
  case class Loc(val x: Int, val y: Int)
}

class Grid(val w: Int, val h: Int) {
  override def toString: String = List(w, h).mkString("X").concat(" maze coming soon...")
}

object MazeGen {
  import MazeHelpers._

  def buildMaze(grid: Grid, curr: Loc): Grid = {
    grid
  }

  def genMaze(w: Int, h: Int) {
    val grid = new Grid(w, h)
    val startLoc = Loc(Random.nextInt(w), Random.nextInt(h))
    println(buildMaze(grid, startLoc))
  }
}

MazeGen.genMaze(16, 8)
