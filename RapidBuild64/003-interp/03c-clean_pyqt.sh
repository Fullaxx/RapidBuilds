#!/bin/bash                     
                                
source ../spec.sh               
source ./module_spec.sh         
                                
# Clean up pyqt, if we dont have phonon
if [ "${INCPYQT}" == "Y" -a "${INCPHONON}" != "Y" ]; then
  rm ${DIR}/usr/lib64/python*/site-packages/PyQt4/phonon.so
fi
