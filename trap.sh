#!/bin/bash

trap "echo Goodbye!; exit" SIGINT

echo "Script is running... press Ctrl+C to exit."
while true; do
  sleep 1
done

