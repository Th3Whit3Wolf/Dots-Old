#!/bin/bash
df -h | grep /tmp | awk '{print $3"B"}'