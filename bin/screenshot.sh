#!/bin/sh

DIR=~/archive/shots
FILE="$(date "+%F-%H-%M-%S").png"
import -window root "$DIR/$FILE"
aplay ~/bin/done.wav