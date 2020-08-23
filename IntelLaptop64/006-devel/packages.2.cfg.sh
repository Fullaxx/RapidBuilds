# 006-devel options
if [ "${INCMOD006DEVEL}" == "Y" ]; then
# Departure from Default
  INCDOXYGEN="Y"
  INCEMACS="N"
  INCLLVM="Y"
  INCMERCURIAL="Y"

# Custom Additions
  INCASTYLE="Y"
  INCCGDB="Y"
  INCCODEEXAMPLES="Y"
  INCVALGRIND="Y"
  INCVALKYRIE="N"
fi
