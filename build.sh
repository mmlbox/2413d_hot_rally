#!/bin/bash

KSS2VGM=../../dsa/kss2vgm/build/kss2vgm

mkdir -p mgs vgm

for F in mml/*.mml ; do
  N=${F#mml/}
  N=${N%.mml}

  mgsc-js -o mgs/$N.mgs $F
  $KSS2VGM -l2 -p300 -ovgm/$N.vgm mgs/$N.mgs
  gzip -n --stdout vgm/$N.vgm > vgm/$N.vgz
  rm vgm/$N.vgm
done
