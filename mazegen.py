import sys
from random import shuffle, randrange

def maze_gen(w = 10, h = 5):
  # extreme syntax - * is used to duplicate
  # rewrite with dictionary as 2d matrix

  #visited = [[0] * (w) + [1] for _ in range(h)]  + [[1] * (w+1)]
  visited = {}
  for i in range(h):
    for j in range(w):
      visited[i,j] = 0
    visited[i,j+1] = 1

  for j in range(w+1):
    visited[h,j] = 1

  #hor = [['+--'] * (w) + ['+'] for _ in range(h + 1)] 
  hor = {}
  for i in range(h+1):
    for j in range(w):
      hor[i,j] = '+--'
    hor[i,j+1] = '+' 

  #ver = [['|  '] * (w+1) for _ in range(h)] + [[]]
  ver = {}
  for i in range(h):
    for j in range(w+1):
      ver[i,j] = '|  '
  for j in range(w+1):
    ver[h,j] = ''

  """
  print visited
  print hor
  print ver
  """

  def visit_room(x, y):
    if x == -1: x = w
    if y == -1: y = h

    visited[y,x] = 1

    neighbours = [(x, y-1), (x, y+1), (x+1, y), (x-1, y)]
    shuffle(neighbours)

    for (xx, yy) in neighbours:
      if xx == -1: xx = w
      if yy == -1: yy = h

      if visited[yy,xx] == 1:
	#print "Visited ", xx, yy
	continue
      if xx == x: hor[max(yy, y),x] = '+  '
      if yy == y: ver[y,max(xx,x)] = '   '
      visit_room(xx, yy)	
    
    return

  visit_room(randrange(w),randrange(h))
  #visit_room(0,0)

  for i in range(h+1):
    for j in range(w+1):
      sys.stdout.write(hor[i,j])
    print  
    for j in range(w+1):
      sys.stdout.write(ver[i,j])
    print  


maze_gen(16, 8)
