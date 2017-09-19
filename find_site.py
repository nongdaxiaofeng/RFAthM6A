import re
import sys

p=re.compile('[AG][AG]AC[ACT]')
p1=re.compile('chr\w:(\d+)-(\d+) (\w+) LENGTH=(\d+)')
p2=re.compile('(\d+)-(\d+)')

locus=[]
exon=[]
f=open(sys.argv[1])
i=-1
for line in f:
    if line[0]=='>':
        i=i+1
        locus.append(line[1:].strip())
        exon.append('')
    else:
        exon[i]+=line.strip()
f.close()

fw=open(sys.argv[2],'w')
for k in range(len(locus)):
    exon_seq=exon[k]
    position=1
    i=p.search(exon_seq,position-1)
    while i:
        position=i.start()+2
        fw.write(locus[k] + ',' + str(position+1) + ",")
        if position < 50:
            fw.write('N'*(50-position) + exon_seq[0:position+51])
        else:
            fw.write(exon_seq[position-50:position+51])
        ne=len(exon_seq)-1-position
        fw.write('N' * (50-ne))
        fw.write('\n')
        i=p.search(exon_seq,position-1)
fw.close()
