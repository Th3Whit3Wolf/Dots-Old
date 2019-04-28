#!/bin/bash
df -h | rg sda3 | awk '{print $2"B"}'