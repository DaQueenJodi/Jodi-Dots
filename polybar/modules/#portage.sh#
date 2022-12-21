#!/bin/bash

qlop -Hr |awk '{for (i=3; i<NF; i++) printf $i " "; print $NF}' | sed 's/\.//g' | sed 's/ ETA//' | sed 's/ seconds/s/' | sed 's/ of /\//'
