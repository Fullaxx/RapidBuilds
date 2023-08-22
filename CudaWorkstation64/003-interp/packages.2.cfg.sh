# 003-interp options
if [ "${INCMOD003INTERP}" == "Y" ]; then
# Departure from Default
  INCEXPECT="Y"

# n family of packages
  INCPSSH="N"

# Custom Additions
  INCFTPSYNC="N"
  INCPANDAS="N"
  INCPASTEBINIT="N"
# INCNOVNC pulls INCWEBSOCKIFY
# INCOPENBOX pulls INCPYXDG
  INCTERMINATOR="Y"
  INCVIRTUALENV="N"
fi
