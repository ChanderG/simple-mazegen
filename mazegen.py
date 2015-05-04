import sys

def maze_gen(w = 10, h = 5):
  visited = [[0] * w + [1]] * h + [[1] * (w+1)]
  hor = [['+--'] * w + ['+']] * (h + 1)
  ver = [['|  '] * (w+1)] * h + [[]]

  print visited    
  for (a,b) in zip(hor, ver):
    for i in a:
      sys.stdout.write(i)
    print 
    for j in b:
      sys.stdout.write(j)
    print 

maze_gen()
