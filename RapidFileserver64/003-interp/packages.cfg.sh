# 003-interp options
if [ "${INCMOD003INTERP}" == "Y" ]; then
  INCPERL="N"
  INCPYTHON="Y"
  INCRUBY="N"
  INCLUA="N"
  INCTCL="N"

# just about everything needs db48
  INCDB48="Y"
fi
