# 006-devel options
if [ "${INCMOD006DEVEL}" == "Y" ]; then
# Departure from Default
  INCDOXYGEN="Y"
  INCEMACS="N"
  INCMERCURIAL="Y"

# Custom Additions
  INCANJUTA="N"
  INCASTYLE="Y"
  INCCGDB="Y"
  INCCODEEXAMPLES="Y"
  INCMEDIT="Y"
  INCVALGRIND="Y"
  INCVALKYRIE="N"
fi
