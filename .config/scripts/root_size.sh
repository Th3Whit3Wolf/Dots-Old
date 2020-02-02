#!/bin/bash

df -h / | awk '{print $4 "B"}' | tail -n1