#!/bin/bash

TEXMFMAIN=$(kpsewhich -expand-var='$TEXMFMAIN')

mkdir -p "$TEXMFMAIN"/{tex/latex,fonts/tfm/public,fonts/vf/public,fonts/type1/public,fonts/afm/public,doc/fonts,dvips,fonts/map,fonts/enc}/pscyr
cp dvips/pscyr/* "$TEXMFMAIN"/dvips/pscyr
cp tex/latex/pscyr/* "$TEXMFMAIN"/tex/latex/pscyr
cp fonts/tfm/public/pscyr/* "$TEXMFMAIN"/fonts/tfm/public/pscyr
cp fonts/vf/public/pscyr/* "$TEXMFMAIN"/fonts/vf/public/pscyr
cp fonts/type1/public/pscyr/* "$TEXMFMAIN"/fonts/type1/public/pscyr
cp fonts/afm/public/pscyr/* "$TEXMFMAIN"/fonts/afm/public/pscyr
cp fonts/map/pscyr.map "$TEXMFMAIN"/fonts/map/pscyr.map
cp fonts/enc/t2a.enc "$TEXMFMAIN"/fonts/enc/t2a.enc
cp fonts/enc/t2d.enc "$TEXMFMAIN"/fonts/enc/t2d.enc

VARTEXFONTS=$(kpsewhich -expand-var='$VARTEXFONTS')
rm -f "$VARTEXFONTS"/pk/modeless/public/pscyr/*

# TEXMFSYS=$(kpsewhich -expand-var='$TEXMFSYSCONFIG')
# sed -i '$a# PSCyr\nMap pscyr.map' "$TEXMFSYS"/web2c/updmap.cfg

texhash
mktexlsr
updmap --sys --enable Map=pscyr.map
