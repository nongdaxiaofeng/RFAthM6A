import sys

f=open(sys.argv[1])
fw=open(sys.argv[2],'w')
kn=5
for line in f:
    freq=[]
    for i in range(kn):
        freq.append({})
        for n1 in ['A','C','T','G']:
            freq[i][n1]={}
            for n2 in ['A','C','T','G']:
                freq[i][n1][n2]=0
    col=line.split(',')
    seq=col[2].rstrip()
    seq=seq.strip('N')
    seq_len=len(seq)
    for k in range(kn):
        for i in range(seq_len-k-1):
            n1=seq[i]
            n2=seq[i+k+1]
            if n1 in 'ATCG' and n2 in 'ATCG':
                freq[k][n1][n2]+=1
    fw.write(col[0]+','+col[1])
    for i in range(kn):
        for n1 in ['A','C','T','G']:
            for n2 in ['A','C','T','G']:
                fw.write(','+ str(freq[i][n1][n2]/(seq_len-i-1)))
    fw.write('\n')
fw.close()
f.close()
