#!/bin/bash
kill $( ps aus | grep polybar | grep -v grep | awk '{print $2}')
sleep 5
polybar example
