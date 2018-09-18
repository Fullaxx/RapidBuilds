# 006-devel options
if [ "${INCMOD006DEVEL}" == "Y" ]; then
# Departure from Default
  INCCVS="Y"
  INCDOXYGEN="Y"
  INCMERCURIAL="Y"
  INCEMACS="Y"
  INCOPENCLHEADERS="Y"
  INCSUBVERSION="Y"

# Custom Additions
  INCASTYLE="Y"
  INCCGDB="Y"
  INCVALGRIND="Y"
  INCVALKYRIE="N"
fi
