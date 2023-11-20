# 003-interp options
if [ "${INCMOD003INTERP}" == "Y" ]; then
  INCPERL="Y"
  INCPYTHON="Y"
  INCRUBY="N"
  INCTCL="N"

  INCPYTHONSETUPTOOLS="N"

# n family of packages
  INCPSSH="N"

# just about everything needs db48
  INCDB48="N"

# Custom Additions
  INCTERMINATOR="Y"
fi
