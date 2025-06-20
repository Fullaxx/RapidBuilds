# 006-devel options
if [ "${INCMOD006DEVEL}" == "Y" ]; then
# ap family of packages
  INCBC="N"
  INCLINUXDOCTOOLS="N"
  INCRPM="N"
  INCTEXINFO="N"
  INCVIM="N"

# d family of packages
  INCAUTOCONF="Y"
  INCAUTOMAKE="Y"
  INCBINUTILS="Y"
  INCBISON="Y"
  INCCMAKE="N"
  INCCVS="N"
  INCDOXYGEN="N"
# expat found in 009-xmodlibs
  INCEXPAT="Y"
  INCFLEX="Y"
  INCGCC="Y"
  INCGCCGO="N"
  INCGCCGPLUSPLUS="Y"
  INCGDB="N"
  INCGETTEXT="N"
  INCGETTEXTTOOLS="N"
  INCGPERF="N"
  INCGUILE="N"
  INCINTLTOOL="N"
  INCLIBTOOL="N"
  INCLLVM="N"
  INCMFOUR="Y"
  INCMAKE="Y"
  INCMERCURIAL="N"
  INCNASM="N"
  INCNINJA="N"
  INCOPENCLHEADERS="N"
  INCPARALLEL="N"
  INCPATCHELF="N"
  INCPKGCONF="N"
  INCPMAKE="N"
  INCRETWOC="N"
  INCRUST="N"
  INCSTRACE="N"
  INCSUBVERSION="N"
  INCYASM="N"

# e family of packages
  INCEMACS="N"
fi
