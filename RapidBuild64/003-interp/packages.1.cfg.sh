# 003-interp options
if [ "${INCMOD003INTERP}" == "Y" ]; then
  INCPERL="Y"
  INCPYTHON="Y"
  INCRUBY="N"
  INCLUA="N"
  INCTCL="N"

  INCPYTHONSETUPTOOLS="Y"

# just about everything needs db48
  INCDB48="Y"
fi