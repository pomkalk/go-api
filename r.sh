#!/usr/bin/env sh

source_file=coverage.out
out_file=cover.txt

# run test
make test

# calculate coverage to file
# skip: main.go, *_mock files
calculate_coverage() {
  cat $source_file | grep -v "main.go" > $source_file.tmp
  cat $source_file.tmp | grep -v "_mock" > $source_file.tmp
  go tool cover -func $source_file.tmp | grep "total:" | awk '{split($0,a," "); print substr(a[3], 1, length(a[3])-1)}' > $out_file
  rm $source_file.tmp
}

commit_coverage() {
  git add $out_file
  git commit -m "coverage"
}

if [ -e cover.txt ]
then
  last_coverage=`cat $out_file`
  calculate_coverage
  current_coverage=`cat $out_file`
  if (( $(echo "$last_coverage > $current_coverage" | bc -l) ))
  then
    echo "WARNING: current coverage is less ($last_coverage > $current_coverage)"
  fi
  commit_coverage
else
  calculate_coverage
  commit_coverage
fi

