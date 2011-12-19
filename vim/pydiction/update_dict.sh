#!/bin/sh

rm -f complete-dict
cat import | xargs python pydiction_shlee.py
echo "" >> complete-dict
cat complete-dict.manual >> complete-dict
