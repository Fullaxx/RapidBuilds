# 003-interp options
if [ "${INCMOD003INTERP}" == "Y" ]; then
  INCPERL="N"
  INCPYTHON="N"
  INCRUBY="N"
  INCLUA="N"
  INCTCL="N"

  INCPYTHONSETUPTOOLS="N"

# just about everything needs db48
  INCDB48="N"
fi