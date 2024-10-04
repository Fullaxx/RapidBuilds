# 006-devel options
if [ "${INCMOD006DEVEL}" == "Y" ]; then
# Departure from Default
  INCDOXYGEN="Y"
  INCLLVM="Y"
  INCMERCURIAL="Y"
  INCOPENCLHEADERS="Y"

# Custom Additions
  INCASTYLE="Y"
  INCCGDB="Y"
  INCCODEEXAMPLES="N"
  INCCYBERCHEF="Y"
  INCQLIBC="Y"
  INCVALGRIND="Y"
  INCVALKYRIE="N"
fi
