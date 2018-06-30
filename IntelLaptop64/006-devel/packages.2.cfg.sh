# 006-devel options
if [ "${INCMOD006DEVEL}" == "Y" ]; then
# Departure from default
  INCDOXYGEN="Y"
  INCMERCURIAL="Y"
  INCEMACS="N"

# Custom Additions
  INCASTYLE="Y"
  INCCGDB="Y"
  INCVALGRIND="Y"
  INCVALKYRIE="N"
fi
