# download text
wget https://www.gutenberg.org/cache/epub/1513/pg1513.txt
dos2unix pg1513.txt
iconv -f UTF-8 -t ASCII//TRANSLIT pg1513.txt -o Romeo_and_Juliet.txt

# check all characters in text: letters, punctuation (.,;:'"!?-) and []&_
# TODO: fix []
egrep '[^\\[\\]a-zA-Z .,;:'\''"?!&_-]' Romeo_and_Juliet.txt

# get character names and appearences
egrep '^[A-Z .'\'']+$' Romeo_and_Juliet.txt | egrep -v '^(ACT |THE PROLOGUE|THE TRAGEDY OF)' | sort | uniq -c | sort -nr

# hacker speak
cat Romeo_and_Juliet.txt | sed 's/[Aa]/4/g' | sed 's/[Ee]/3/g' | sed 's/[Ii]/1/g' | sed 's/[Oo]/0/g'

# sed . > :
cat Romeo_and_Juliet.txt | sed -E 's/^([A-Z]+[A-Z '\'']+)\.$/\1:/'


# letter frequency (all works of Shakespeare)
fold -w 1 pg100.txt | tr 'A-Z' 'a-z' | sort | uniq -c | sort -nr | grep '[a-z]'


# download text
wget https://imsdb.com/scripts/Star-Wars-A-New-Hope.html

# get character names and appearences
egrep '^ {37}[A-Z][A-Z '\'']+$' sw4.txt | sed -E 's/^ {37}//' | sort | uniq -c | sort -nr | head

# count words
cat sw4.txt | tr ' "()!?.,;:0-9[]/' '\n' | tr 'A-Z' 'a-z' | grep -v '^$' | grep -v '^-$' | sed 's/'\''s//' | sort | uniq -c | sort -n

# letter frequency
fold -w 1 sw4.txt | tr 'A-Z' 'a-z' | sort | uniq -c | sort -nr | grep '[a-z]'
