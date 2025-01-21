#!/bin/sh

docker version
pre-commit --version

pre-commit install

long_path=some/deeply/nested/path/just/to/provoke/xargs/split

mkdir -pv ${long_path}

for i in $(seq ${1-1} ${2-10})
do
	fn=${long_path}/filename${i}
	echo $i >> $fn
	git add $fn
done

git commit -m "./test-pre-commit.sh $*"
