#!/bin/bash
# Simply sync static files directory with remote server.

set -e

rsync -az --no-o --no-p hisquare/home/static/ hsma01p:/www/hisquare/static/
