#!/bin/bash
df -h | grep sda3 | awk '{print $3"B"}'