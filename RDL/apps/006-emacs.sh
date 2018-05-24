if [ "${INCEMACS}" == "Y" ]; then
  INCALSA="Y"

# X is optional for emacs
# but if we have X, then we depend on these
  if [ "${INCMOD010XORG}" == "Y" ]; then
    INCFRIBIDI="Y"
    INCGIFLIB="Y"
    INCGTKTHREE="Y"
    INCIMAGEMAGICK="Y"
    INCLIBPNG="Y"
    INCLIBRSVG="Y"
  fi

fi
