# 003-interp options
if [ "${INCMOD003INTERP}" == "Y" ]; then
  INCPERL="Y"
  INCPYTHON="Y"
  INCPYTHONTWO="N"
  INCRUBY="N"
  INCLUA="N"
  INCTCL="N"

  INCPYTHONSETUPTOOLS="Y"

# n family of packages
  INCPSSH="N"

# just about everything needs db48
  INCDB48="Y"
fi
