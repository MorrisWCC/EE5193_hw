#!/bin/bash

sudo docker rm -f hadoop_c &> /dev/null
sudo docker run -itd --name=hadoop_c hadoop_stand &> /dev/null
