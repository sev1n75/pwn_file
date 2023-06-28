#a's story

NAME='a'
WHERE='b'

echo "$NAME came from $WHERE. They always liked living there."
echo "They had 3 pets:"

types[0]="dog"
types[1]="cat"
types[2]="fish"

names[0]="Bella"
names[1]="Max"
names[2]="Luna"


for i in 1 2 3
do
  size1=${#types[@]}
  index1=$(($RANDOM % $size1))
  size2=${#names[@]}
  index2=$(($RANDOM % $size2))
  echo "- a ${types[$index1]} named ${names[$index2]}"
done

echo

echo "Well, I'm not a good writer, you can write the rest... Hope this is a good starting point!"
echo "If not, try running the script again."