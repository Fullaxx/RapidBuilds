if [ "${INCWIRESHARK}" == "Y" ]; then
  INCLZFOUR="Y"
  INCPORTAUDIO="Y"
# PORTAUDIO is brought in with INCWIRESHARK at extra/012-apps/01a-mod_linkadds.sh at the moment
fi