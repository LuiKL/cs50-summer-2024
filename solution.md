# soultion

## A
```
awk -F, 'NR > 1 && $5=="NH" && $1 ~ /^02\/.*\/2022/' vaccine.csv
```

## B
```
tail -n +2 vaccine.csv | cut 4,5,18
```

## C
```
awk -F, 'NR > 1 && $1 ~ /^02\/(15|16|17)\/2022/' vaccine.csv
```

## D
```
awk -F,'$5=="CA" && $18 > 89' vaccine.csv
```

## E
```
cut -d ',' -f 5,18 vaccine.csv | tail -n +2 | grep -E ',[89][0-9]$' | cut -d ',' -f 1 | sort | uniq -c | sort -nr
```

## F
```
cut -d, -f 4,5,18 vaccine.csv | tail -n +2 | sort| uniq | sort -t, -k3 -nr | head -n 10 
```

## G
```
cut -d, -f 4,5,18 vaccine.csv | tail -n +2 | sort | uniq | sort -t, -k3 -nr | head -n 10 | sed 's/^/|/; s/$/|/; s/,/|/g'
```


