# 003-interp options
if [ "${INCMOD003INTERP}" == "Y" ]; then
  INCPERL="Y"
  INCPYTHON="Y"
  INCRUBY="N"
  INCTCL="N"

  INCPYTHONIMPORTLIBMETADATA="Y"
  INCPYTHONPIP="Y"
  INCPYTHONSETUPTOOLS="Y"

# n family of packages
  INCPSSH="N"

# just about everything needs db48
  INCDB48="Y"
fi
