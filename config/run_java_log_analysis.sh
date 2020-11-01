#!/bin/bash

# test the hadoop cluster by running wordcount
# run wordcount 

javac -cp `hadoop classpath` LogAnalysis.java
jar cf la.jar LogAnalysis*.class
rm LogAnalysis*.class
hadoop jar la.jar LogAnalysis input output2
# print the output of wordcount
# echo -e "\nwordcount output:"
# cat output/*
