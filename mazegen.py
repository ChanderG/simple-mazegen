import sys
from random import shuffle, randrange

def maze_gen(w = 10, h = 5):
  # extreme syntax - * is used to duplicate
  # rewrite with dictionary as 2d matrix
  visited = [[0] * (w) + [1] for _ in range(h)]  + [[1] * (w+1)]
  hor = [['+--'] * (w) + ['+'] for _ in range(h + 1)] 
  ver = [['|  '] * (w+1) for _ in range(h)] + [[]]

  def visit_room(x, y):
    visited[y][x] = 1

    neighbours = [(x, y-1), (x, y+1), (x+1, y), (x-1, y)]
    shuffle(neighbours)

    for (xx, yy) in neighbours:
      if visited[yy][xx] == 1:
	#print "Visited ", xx, yy
	continue
      if xx == x: hor[max(yy, y)][x] = '+  '
      if yy == y: ver[y][max(xx,x)] = '   '
      visit_room(xx, yy)	
    
    return

  visit_room(randrange(w),randrange(h))
  #visit_room(0,0)

  for (a,b) in zip(hor, ver):
    for i in a:
      sys.stdout.write(i)
    print 
    for j in b:
      sys.stdout.write(j)
    print 

maze_gen(16, 8)
