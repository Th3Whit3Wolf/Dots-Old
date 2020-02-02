#!/bin/bash
df -h | grep nvme0n1p2 | awk '{print $3"B"}'