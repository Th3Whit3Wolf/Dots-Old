#/bin/bash
sensors | grep 'Package id 0' | awk '{print $4}' | cut -c2-