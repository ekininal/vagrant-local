#!/bin/sh
#gunicorn --chdir /app index:hello_world() -w 2 --threads 2 -b 0.0.0.0:3000
gunicorn --chdir /app app:application -w 2 -b 0.0.0.0:3000