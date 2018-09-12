# 012-xapps options
if [ "${INCMOD012XAPPS}" == "Y" ]; then
# Desktop ENV
  INCFLUXBOX="Y"
  INCOPENBOX="Y"

# Set a default DE, if you desire
  DEFAULTDE="openbox"

# Apps
  INCAUDACIOUS="Y"
  INCGIMP="Y"
  INCGKRELLM="Y"
  INCGPARTED="Y"
  INCMOZILLAFIREFOX="Y"
  INCMOZILLATHUNDERBIRD="N"
  INCMPLAYER="N"
  INCRDESKTOP="Y"
  INCRXVTUNICODE="Y"
  INCSOMA="N"
  INCXINE="N"
  INCXLOCK="Y"
  INCXPAINT="Y"

# extra family of packages
  INCTIGERVNC="Y"

# Custom Additions
  INCBLUEFISH="Y"
  INCBLUEFISHTWO="N"
  INCETERM="Y"
  INCEVINCE="Y"
  INCFBPANEL="Y"
  INCGEANY="Y"
  INCHSETROOT="Y"
  INCOBCONF="Y"
  INCXFE="Y"

# Tagged for inclusion into Modules dir by baseoutput
  INCCHROME="Y"
  INCVSCODE="Y"
fi
