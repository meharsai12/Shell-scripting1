#!/bin/bash

#storing multiple vales in one variable

MOVIES=("HIT" "LAMAN" "SALAAR")

echo "First movie is :" ${MOVIES[0]} #we need to add flower brackets for output because the index 0 is not considering as variable 
echo "second movie is :" ${MOVIES[1]}