# 003-interp options
if [ "${INCMOD003INTERP}" == "Y" ]; then
# Departure from Default
  INCEXPECT="Y"
  INCPYTHONTWO="Y"

# n family of packages
  INCPSSH="N"

# Custom Additions
  INCFTPSYNC="N"
  INCKEEPNOTE="Y"
  INCPANDAS="Y"
  INCPASTEBINIT="N"
# INCNOVNC pulls INCWEBSOCKIFY
# INCOPENBOX pulls INCPYXDG
  INCTERMINATOR="Y"
  INCVIRTUALENV="Y"
fi
