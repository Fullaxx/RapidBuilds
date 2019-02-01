#!/bin/bash

source ../spec.sh
source ./module_spec.sh

if [ "${INCBLEACH}" == "Y" ]; then
# bleach needs html5lib
  linkpackage "${PACKAGESDIR}/python_mods/html5lib-0.999999999-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/bleach-2.1.4-${ARCH}-bksrc1.xzm"
fi

if [ "${INCCHEETAHTHREE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/cheetah3-2.4.4-${ARCH}-bksrc1.xzm"
fi

if [ "${INCDSTAT}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/dstat-0.7.3-noarch-bksrc1.xzm"
fi

if [ "${INCFTPSYNC}" == "Y" ]; then
# ftpsync needs File-Listing
# File-Listing needs HTTP-Date
  linkpackage "${PACKAGESDIR}/perl_mods/HTTP-Date-6.02-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/perl_mods/File-Listing-6.04-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/perl_mods/ftpsync-20180521-noarch-bksrc1.xzm"
fi

if [ "${INCFUNCTOOLSLRUCACHE}" == "Y" ]; then
# http://slackbuilds.org/repository/14.2/python/functools-lru-cache/
  linkpackage "${PACKAGESDIR}/python_mods/backports.functools_lru_cache-1.3-x86_64-bksrc1.xzm"
fi

if [ "${INCFUNCTOOLSTHIRTYTWO}" == "Y" ]; then
# http://slackbuilds.org/repository/14.2/python/functools32/
  linkpackage "${PACKAGESDIR}/python_mods/functools32-3.2.3-1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCGITPYTHON}" == "Y" ]; then
# GitPython needs gitdb2, gitdb2 needs smmap2
  linkpackage "${PACKAGESDIR}/python_mods/smmap2-2.0.3-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/gitdb2-2.0.2-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/GitPython-2.1.9-${ARCH}-bksrc1.xzm"
fi

if [ "${INCGNURADIO}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/gnuradio-3.7.13.4-${ARCH}-bksrc1.xzm"
fi

if [ "${INCJEDI}" == "Y" ]; then
# jedi needs backports.shutil_get_terminal_size
  linkpackage "${PACKAGESDIR}/python_mods/backports.shutil_get_terminal_size-1.0.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/jedi-0.12.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCJINJATWO}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/MarkupSafe-1.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/Jinja2-2.10-${ARCH}-bksrc1.xzm"
fi

if [ "${INCJSONSCHEMA}" == "Y" ]; then
# jsonschema needs vcversioner,functools32
  linkpackage "${PACKAGESDIR}/python_mods/vcversioner-2.16.0.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/jsonschema-2.5.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCJUPYTER}" == "Y" ]; then
# ipykernel needs tornado, jupyter_client, ipython, ptyprocess, pyzmq
# ipython needs traitlets, decorator, Pygments, pexpect, prompt_toolkit1, pickleshare, simplegeneric
  linkpackage "${PACKAGESDIR}/python_mods/Pygments-2.1.3-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/decorator-4.3.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/pexpect-4.6.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/ptyprocess-0.6.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/scandir-1.9.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/simplegeneric-0.8.1-${ARCH}-bksrc1.xzm"

# do we actually need functools-lru-cache? or can we just use functools32??
# nbdime needs colorama,GitPython,shutil_which,python-requests
  linkpackage "${PACKAGESDIR}/python_mods/backports.shutil_which-3.5.1-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/colorama-0.3.7-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/nbdime-1.0.1-${ARCH}-bksrc1.xzm"

# nbconvert needs bleach,Pygments,configparser,defusedxml,entrypoints,mistune,pandocfilters,testpath
  linkpackage "${PACKAGESDIR}/python_mods/configparser-3.5.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/defusedxml-0.5.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/entrypoints-0.2.3-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/mistune-0.8.3-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/pandocfilters-1.4.2-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/testpath-0.3.1-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/nbconvert-5.4.0-${ARCH}-bksrc1.xzm"

# notebook need ipaddress,singledispatch,terminado,send2trash,Jinja2,prometheus_client
  linkpackage "${PACKAGESDIR}/python_mods/ipaddress-1.0.17-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/singledispatch-3.4.0.3-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/send2trash-1.4.2-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/client_python-0.3.1-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/notebook-5.7.0-${ARCH}-bksrc1.xzm"

# nbformat need jsonschema
  linkpackage "${PACKAGESDIR}/python_mods/nbformat-4.4.0-${ARCH}-bksrc1.xzm"

# ipyleaflet needs ipywidgets, ipywidgets needs widgetsnbextension
  linkpackage "${PACKAGESDIR}/python_mods/widgetsnbextension-3.4.2-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/ipywidgets-7.4.2-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/ipyleaflet-0.9.0-${ARCH}-bksrc1.xzm"

# jupyter_client needs decorator,python-dateutil,pyzmq,traitlets
  linkpackage "${PACKAGESDIR}/python_mods/ipykernel-4.9.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/ipython-5.8.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/jupyter_console-5.2.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/jupyter_client-5.2.3-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/jupyter_core-4.4.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCKEEPNOTE}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/keepnote-0.7.8-${ARCH}-bksrc1.xzm"
fi

if [ "${INCLXML}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/lxml-4.2.6-${ARCH}-bksrc1.xzm"
fi

if [ "${INCNUMPY}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/numpy-1.15.2-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPASTEBINIT}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/pastebinit-1.5-noarch-bksrc1.xzm"
fi

if [ "${INCPICKLESHARE}" == "Y" ]; then
# pickleshare needs pathlib2
  linkpackage "${PACKAGESDIR}/python_mods/pathlib2-2.3.2-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/pickleshare-0.7.4-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPROMPTTOOLKIT}" == "Y" ]; then
# prompt_toolkit1 needs wcwidth
  linkpackage "${PACKAGESDIR}/python_mods/wcwidth-0.1.7-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/prompt_toolkit-1.0.15-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPSUTIL}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/psutil-5.4.8-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPYTHONDATEUTIL}" == "Y" ]; then
# python-dateutil needs six,setuptools_scm??
# http://slackbuilds.org/repository/14.2/python/python-dateutil/
  linkpackage "${PACKAGESDIR}/python_mods/python-dateutil-2.7.3-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPYXDG}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/pyxdg-0.26-${ARCH}-bksrc1.xzm"
fi

if [ "${INCPYZMQ}" == "Y" ]; then
# pyzmq needs zmq,Cython
  linkpackage "${PACKAGESDIR}/python_mods/pyzmq-17.1.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCSETUPTOOLSSCM}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/setuptools_scm-3.1.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCTERMINADO}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/terminado-0.8.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCTERMINATOR}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/terminator-1.91-${ARCH}-bksrc1.xzm"
fi

if [ "${INCTORNADO}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/tornado-5.1.1-${ARCH}-bksrc1.xzm"
fi

if [ "${INCTRAITLETS}" == "Y" ]; then
# traitlets needs enum34, six, ipython_genutils
  linkpackage "${PACKAGESDIR}/python_mods/enum34-1.1.6-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/ipython_genutils-0.2.0-${ARCH}-bksrc1.xzm"
  linkpackage "${PACKAGESDIR}/python_mods/traitlets-4.3.2-${ARCH}-bksrc1.xzm"
fi

if [ "${INCVIRTUALENV}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/virtualenv-16.1.0-${ARCH}-bksrc1.xzm"
fi

if [ "${INCWEBSOCKIFY}" == "Y" ]; then
  linkpackage "${PACKAGESDIR}/python_mods/websockify-20181217-noarch-bksrc1.xzm"
fi
