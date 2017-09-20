import sys
from functools import reduce
f=open(sys.argv[1])
fw=open(sys.argv[2],'w')

nset=set('ATCG')
for line in f:
    mer2={}
    mer3={}
    mer4={}
    for n1 in 'ATCG':
        for n2 in 'ATCG':
            mer2[n1 + n2]=0
            for n3 in 'ATCG':
                mer3[n1+n2+n3]=0
                for n4 in 'ATCG':
                    mer4[n1+n2+n3+n4]=0
    col=line.split(',')
    seq=col[2].rstrip()
    seq=seq.strip('N')
    seq_len=len(seq)
    for p in range(seq_len-3):
        if set(seq[p:p+2]) <= nset:
            mer2[seq[p:p+2]]+=1
        if set(seq[p:p+3])<=nset:
            mer3[seq[p:p+3]]+=1
        if set(seq[p:p+4])<=nset:
            mer4[seq[p:p+4]]+=1
    if set(seq[p+1:p+3])<=nset:
        mer2[seq[p+1:p+3]]+=1
    if set(seq[p+2:p+4]) <= nset:
        mer2[seq[p+2:p+4]]+=1
    if set(seq[p+1:p+4]) <= nset:
        mer3[seq[p+1:p+4]]+=1
    v2=[]
    v3=[]
    v4=[]
    for n1 in 'ATCG':
        for n2 in 'ATCG': 
            v2.append(mer2[n1+n2]/(seq_len-1))
            for n3 in 'ATCG':
                v3.append(mer3[n1+n2+n3]/(seq_len-2))
                for n4 in 'ATCG':
                    v4.append(mer4[n1+n2+n3+n4]/(seq_len-3))
    out=','.join(col[0:2]+[str(i) for i in (v2+v3+v4)])
    fw.write(out+'\n')

fw.close()
f.close()
