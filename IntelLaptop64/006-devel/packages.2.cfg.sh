# 006-devel options
if [ "${INCMOD006DEVEL}" == "Y" ]; then
# Departure from Default
  INCDOXYGEN="Y"
  INCLLVM="Y"
  INCMERCURIAL="Y"

# Custom Additions
  INCASTYLE="Y"
  INCCGDB="Y"
  INCCODEEXAMPLES="Y"
  INCQLIBC="Y"
  INCVALGRIND="Y"
  INCVALKYRIE="N"
fi
