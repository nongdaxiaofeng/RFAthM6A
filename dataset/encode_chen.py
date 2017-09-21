#from __future__ import division
import sys
from functools import reduce
f=open(sys.argv[1])
fw=open(sys.argv[2],'w')
#w=int(sys.argv[3])
w=50

dict1={'A':[1,1,1],'T':[0,1,0],'C':[0,0,1],'G':[1,0,0],'N':[0,0,0]}
                
for line in f:
    col=line.split(',')
    if col[2]=='1':
        fw.write('+1 ')
    else:
        fw.write('-1 ')
    seq=col[3].rstrip()
    v=[]
    p=0
    dict2={'A':0,'T':0,'C':0,'G':0,'N':0}
    for n in seq[50-w:50+w+1]:
        p=p+1
        dict2[n]+=1
        v.extend(dict1[n]+[dict2[n]/p])
        
    out=reduce(lambda x,y:x+' '+y,map(lambda x,y:str(x)+":"+str(y),range(1,len(v)+1),v))
    fw.write(out+'\n')

fw.close()
f.close()
