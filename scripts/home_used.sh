#!/bin/bash
du -h --exclude Vids $HOME |tail -n1| awk '{print $1"B"}'
