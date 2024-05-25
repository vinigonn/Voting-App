#!/bin/sh

# create 3000 votes (2000 for option a, 1000 for option b)
ab -n 1000 -c 300 -p posta -T "application/x-www-form-urlencoded" http://localhost:6060/vote
ab -n 1000 -c 300 -p postb -T "application/x-www-form-urlencoded" http://localhost:6060/vote
ab -n 1000 -c 300 -p posta -T "application/x-www-form-urlencoded" http://localhost:6060/vote
