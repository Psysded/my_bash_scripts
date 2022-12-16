#!/bin/bash

# Find folders in path that match "node_modules" then deleted

find /home -type d -name "node_modules" -exec rm -rf {} +
echo "Node modules has been deleted"

