#!/bin/bash

test_value=`pwd | grep 'scripts'`

if [[ $test_value ]]; then
    cd ..
fi

cd instructor/

for notebook in *.ipynb; do
    jupyter nbconvert --execute --allow-errors --to python $notebook
    jupyter nbconvert --execute --allow-errors --to latex $notebook
    xelatex --interaction batchmode ${notebook%\.ipynb}
done

rm *.aux *.log *.out *.tex
cd ..

echo "Finished at `date`"
