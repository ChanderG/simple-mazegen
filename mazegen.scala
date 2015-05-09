import scala.util.Random

object MazeHelpers {
  case class Direction(val dx: Int, val dy: Int)

  case class Loc(val x: Int, val y: Int) {

    def +(delta: Direction): Loc = {
      Loc( x + delta.dx, y + delta.dy)
    }

    override def toString: String = x.toString + ',' + y.toString
  }

  case class Door(val from: Loc, val to: Loc)

  val North = Direction(0, 1)
  val East = Direction(1, 0)
  val South = Direction(0, -1)
  val West = Direction(-1, 0)

  val Directions = Set(North, East, South, West)
}

import MazeHelpers._

//using Set for visited because the locations are unique
class Grid(val w: Int, val h: Int, val visited: Set[Loc], val doors: Set[Door]) {
  override def toString: String = {
    List(w, h).mkString("X").concat(" maze coming soon...").concat(" ").concat(visited.mkString).concat(" ").concat(doors.mkString)
  }

  def markVisited(loc: Loc): Grid = {
    new Grid(w, h, visited + loc, doors)
  }

  private def inBounds(loc: Loc): Boolean = {
    loc.x >=0 && loc.x < w && loc.y >= 0 && loc.y < h
  }

  // filter out as much as possible here
  // remove the out of bounds neighbours
  // and then remove visited neighbours
  def getValidNeighbours(loc: Loc): Set[Loc] = {
    Directions.map{ loc + _ }.filter(inBounds(_)) -- visited
  }

  def isVisited(loc: Loc): Boolean = visited.contains(loc)

  def addDoor(from: Loc, to: Loc): Grid = {
    new Grid(w, h, visited, doors + Door(from, to))
  }
}

object MazeGen {
  import MazeHelpers._

  def buildMaze(grid: Grid, curr: Loc): Grid = {
    var newgrid = grid.markVisited(curr)
    val neighbours = Random.shuffle(grid.getValidNeighbours(curr))
    //println(curr)
    //println(neighbours)
    neighbours.foreach { n =>
      if(!newgrid.isVisited(n)) {
        newgrid = buildMaze(newgrid.addDoor(curr, n), n)
      }
    }
    newgrid
  }

  def genMaze(w: Int, h: Int) {
    val grid = new Grid(w, h, Set(), Set())
    val startLoc = Loc(Random.nextInt(w), Random.nextInt(h))
    println(buildMaze(grid, startLoc))
  }
}

MazeGen.genMaze(16, 8)
