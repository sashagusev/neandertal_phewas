cat phewas.vals | awk '{ print int($1 * 50 + 0.5) }' | sort -g | uniq -c | while read line;do
m=`echo $line | awk '{ print $2 }'`
n=`echo $line | awk '{ print $1 }'`
cat hm3.shuffled.vals | awk -vm=$m 'int($1 * 50 + 0.5) == m' | head -n $n
done > phewas.matched.vals
