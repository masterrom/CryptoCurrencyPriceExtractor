echo "Starting Program"

names=()

function check {
for name in $@
do
	names+=($name)
done

echo ${names[*]}
}

check $@
