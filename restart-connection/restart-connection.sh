#!/bin/bash

killall iwd
sleep 3
systemctl enable --now iwd
echo Finish
