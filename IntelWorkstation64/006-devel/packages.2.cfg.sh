# 006-devel options
if [ "${INCMOD006DEVEL}" == "Y" ]; then
# Departure from Default
  INCCVS="Y"
  INCDOXYGEN="Y"
  INCEMACS="Y"
  INCMERCURIAL="Y"
  INCOPENCLHEADERS="Y"
  INCSUBVERSION="N"

# Custom Additions
  INCASTYLE="Y"
  INCCGDB="Y"
  INCCODEEXAMPLES="Y"
  INCVALGRIND="Y"
  INCVALKYRIE="N"
fi
