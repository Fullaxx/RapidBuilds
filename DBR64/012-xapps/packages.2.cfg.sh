# 012-xapps options
if [ "${INCMOD012XAPPS}" == "Y" ]; then
# Apps
  INCMOZILLAFIREFOX="Y"
  INCRDESKTOP="Y"

# extra family of packages
  INCRECORDMYDESKTOP="Y"
  INCTIGERVNC="Y"
  INCXFE="Y"

# Custom Additions
  INCHSETROOT="Y"

# Tagged for inclusion into Modules dir by baseoutput
  INCCHROME="N"
  INCLIBREOFFICE="Y"
fi
