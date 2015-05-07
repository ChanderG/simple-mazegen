class Maze
  # class constants
  DIR = [[-1, 0],[+1, 0],[0,+1],[0,-1]]

  def initialize(w, h)
    # @ means the data memebers of this class
    @width = w
    @height = h
   
    setup
  end

  def printMaze
    for i in (0 .. @height) do
      for j in (0 .. @width-1) do
	if (@hor[i][j] == true)
	  print '+--'
	else
	  print '+  '
	end
      end 
      if (@hor[i][@width] == true)
	print '+'
	else
	  print ' '
      end

      puts

      if (i == @height)
	next
      end	
      for j in (0 .. @width-1) do
	if (@ver[i][j] == true)
	  print '|  '
	else
	  print '   '
	end
      end 	  
      if (@ver[i][@width] == true)
	print '|'
      end

      puts
    end 
  end

  private

  def setup
    @hor = Array.new(@height+1){ Array.new(@width+1, true) }
    @ver = Array.new(@height+1){ Array.new(@width+1, true) }
    @visited = Array.new(@height+1){ Array.new(@width+1, false) }

    for i in 0 .. @height-1 do
      @visited[i][@width] = true
    end
    @visited[@height] = (0 .. @width).map{ |i| true }

    visit_cell(Random.rand(@width), Random.rand(@height))
    #visit_cell 0,0
  end

  def visit_cell(x, y)
    neighbours = DIR.shuffle.map { |a, b| [x+a, y+b] }

    if (x == -1)
      x = @width
    end
    if (y == -1)
      y = @height
    end

    @visited[y][x] = true

    for xx, yy in neighbours do
      xx = xx % (@width+1)
      yy = yy % (@height+1)

      if (xx == -1)
	xx = @width
      end
      if (yy == -1)
	yy = @height
      end

      if (@visited[yy][xx] == true) 
        next  # same keyword as Perl
      elsif (xx == x)
	@hor[[y, yy].max][x] = false
      elsif (yy == y)
	@ver[y][[x, xx].max] = false
      else
	;
      end
      visit_cell(xx, yy)
    end	

  end

end

m = Maze.new(16,8)
m.printMaze
