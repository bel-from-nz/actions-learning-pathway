#!/bin/bash
while IFS= read -r line || [[ -n "$line" ]]; do
    echo $line
done < dev-vars.env

while IFS= read -r line || [[ -n "$line" ]]; do
    echo $line
done < test-vars.env