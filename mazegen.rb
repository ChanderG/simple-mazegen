class Maze
  # class constants
  DIR = [[-1, 0],[+1, 0],[0,+1],[0,-1]]

  def initialize(w, h)
    # @ means the data memebers of this class
    @width = w
    @height = h
   
    setup
  end

  def print()
    puts @width,@height
  end

  private

  def setup()
    @hor = Array.new(@height+1){ Array.new(@width+1, true) }
    @ver = Array.new(@height+1){ Array.new(@width+1, true) }
    @visited = Array.new(@height+1){ Array.new(@width+1, false) }

    for i in 0 .. @height-1 do
      @visited[i][@width] = true
    end
    @visited[@height] = (0 .. @width).map{ |i| true }

    visit_cell(Random.rand(@width), Random.rand(@height))
  end

  def visit_cell(x, y)
    puts x,y
  end


end

m = Maze.new(2,3)
m.print

