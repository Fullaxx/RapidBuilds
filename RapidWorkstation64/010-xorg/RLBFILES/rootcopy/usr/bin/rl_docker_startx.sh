#!/bin/bash

# Tell the viewers what's going to happen (in the docker container).
echo "Setting up X for docker ..."

# Update all the shared library links:
if [ -x /sbin/ldconfig ]; then
  echo "Updating shared library links:  /sbin/ldconfig"
  /sbin/ldconfig
else
  echo "Could not update shared library links!"
  exit 1
fi

# Screen blanks after 15 minutes idle time, and powers down in one hour
# if the kernel supports APM or ACPI power management:
/bin/setterm -blank 15 -powersave powerdown -powerdown 60

# Start D-Bus:
if [ -x /etc/rc.d/rc.messagebus ]; then
  /etc/rc.d/rc.messagebus start
fi

# Make sure X knows about all the installed fonts
if [ -x /usr/bin/mkfontdir ]; then
  for FDIR in /usr/share/fonts/*; do
    mkfontdir ${FDIR}
  done
fi

# Update the X font indexes:
if [ -x /usr/bin/fc-cache ]; then
  echo "Updating X font indexes:  /usr/bin/fc-cache -f &"
  /usr/bin/fc-cache -f &
fi

if [ -x /usr/sbin/makewhatis ]; then
  makewhatis &
fi

# Update any existing icon cache files:
if find /usr/share/icons -maxdepth 2 2> /dev/null | grep -q icon-theme.cache ; then
  for theme_dir in /usr/share/icons/* ; do
    if [ -r ${theme_dir}/icon-theme.cache ]; then
      echo "Updating icon-theme.cache in ${theme_dir}..."
      /usr/bin/gtk-update-icon-cache -t -f ${theme_dir} 1> /dev/null 2> /dev/null &
    fi
  done
  # This would be a large file and probably shouldn't be there.
  if [ -r /usr/share/icons/icon-theme.cache ]; then
    echo "Deleting icon-theme.cache in /usr/share/icons..."
    #/usr/bin/gtk-update-icon-cache -t -f /usr/share/icons 1> /dev/null 2> /dev/null &
    rm -f /usr/share/icons/icon-theme.cache
  fi
fi

# Update mime database:
if [ -x /usr/bin/update-mime-database -a -d /usr/share/mime ]; then
  echo "Updating MIME database:  /usr/bin/update-mime-database /usr/share/mime &"
  /usr/bin/update-mime-database /usr/share/mime 1> /dev/null 2> /dev/null &
fi

# These GTK+/pango files need to be kept up to date for
# proper input method, pixbuf loaders, and font support.
if [ -x /usr/bin/update-gtk-immodules ]; then
  echo "Updating gtk.immodules:"
  echo "  /usr/bin/update-gtk-immodules &"
  /usr/bin/update-gtk-immodules > /dev/null 2>&1 &
fi
if [ -x /usr/bin/update-gdk-pixbuf-loaders ]; then
  echo "Updating gdk-pixbuf.loaders:"
  echo "  /usr/bin/update-gdk-pixbuf-loaders &"
  HOME=/root /usr/bin/update-gdk-pixbuf-loaders > /dev/null 2>&1 &
fi
if [ -x /usr/bin/update-pango-querymodules ]; then
  echo "Updating pango.modules:"
  echo "  /usr/bin/update-pango-querymodules &"
  /usr/bin/update-pango-querymodules > /dev/null 2>&1 &
fi
if [ -x /usr/bin/glib-compile-schemas ]; then
  echo "Compiling GSettings XML schema files:"
  echo "  /usr/bin/glib-compile-schemas /usr/share/glib-2.0/schemas &"
  /usr/bin/glib-compile-schemas /usr/share/glib-2.0/schemas >/dev/null 2>&1 &
fi

# Start udev
udevd --daemon
udevadm trigger

# Can we use X -configure to find the correct keyboard/mouse?
# X -configure

# Well this should be obvious ...
startx
