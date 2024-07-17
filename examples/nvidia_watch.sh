#!/bin/bash

echo -e "Regularly call NVIDIA-SMI and output appends to log file ($1)"
while true; do nvidia-smi | tee -a $1 && sleep 60; done

                                                             
