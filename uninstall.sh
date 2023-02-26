#!/bin/env bash

TEXMFMAIN=$(kpsewhich -expand-var='$TEXMFMAIN')

rm -r "$TEXMFMAIN"/{tex/latex,fonts/tfm/public,fonts/vf/public,fonts/type1/public,fonts/afm/public,doc/fonts,dvips}/pscyr
rm "$TEXMFMAIN"/fonts/map/pscyr.map
rm "$TEXMFMAIN"/fonts/enc/t2a.enc
rm "$TEXMFMAIN"/fonts/enc/t2d.enc

VARTEXFONTS=$(kpsewhich -expand-var='$VARTEXFONTS')
rm -f "$VARTEXFONTS"/pk/modeless/public/pscyr/*

# TEXMFSYS=$(kpsewhich -expand-var='$TEXMFSYSCONFIG')
# sed -i '/# PSCyr/d' "$TEXMFSYS/web2c/updmap.cfg"
# sed -i '/Map pscyr.map/d' "$TEXMFSYS/web2c/updmap.cfg"

texhash
mktexlsr
updmap --sys --disable pscyr.map
