#!/bin/bash

qlop -Hr | awk '{for (i=3; i<NF; i++) printf $i " "; print $NF}'
