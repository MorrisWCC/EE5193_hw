#!/bin/bash

mapred streaming \
-file mapper.py -mapper mapper.py \
-file reducer.py -reducer reducer.py \
-input input -output log_output

echo -e "\nwordcount output:"
cat log_output/*
