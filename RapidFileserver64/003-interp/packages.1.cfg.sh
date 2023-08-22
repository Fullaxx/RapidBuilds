# 003-interp options
if [ "${INCMOD003INTERP}" == "Y" ]; then
  INCPERL="Y"
  INCPYTHON="Y"
  INCRUBY="N"
  INCLUA="N"
  INCTCL="N"

  INCPYTHONIMPORTLIBMETADATA="N"
  INCPYTHONPIP="Y"
  INCPYTHONSETUPTOOLS="N"

# n family of packages
  INCPSSH="N"

# just about everything needs db48
  INCDB48="Y"
fi
