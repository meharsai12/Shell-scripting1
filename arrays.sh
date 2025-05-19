#!/bin/bash

#storing multiple vales in one variable

MOVIES=("HIT" "LAMAN" "SALAAR")

echo "First movie is :" ${MOVIES[0]} #we need to add flower brackets for output because the index 0 is not considering as variable 
echo "second movie is :" ${MOVIES[1]} # aboove and this command for single single movie name output for single movie or any variable outputs

echo "all movies :" ${MOVIES[@]} #by using ths command we can get the variable in arrays in by using [@]