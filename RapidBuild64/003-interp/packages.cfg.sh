# 003-interp options
if [ "${INCMOD003INTERP}" == "Y" ]; then
  INCPERL="Y"
# INCPYTHON not an option yet
  INCRUBY="N"
  INCLUA="N"
  INCTCL="N"

# just about everything needs db48
  INCDB48="Y"
# python3 needs libtirpc
  INCLIBTIRPC="Y"
fi
