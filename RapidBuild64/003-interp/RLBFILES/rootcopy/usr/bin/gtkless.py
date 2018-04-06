#!/usr/bin/env python

import gtk, sys

class textwindow:
	def close_application(self, widget):
		gtk.mainquit()

	def __init__(self):
		window = gtk.Window(gtk.WINDOW_TOPLEVEL)
		rootbox = gtk.VBox(gtk.FALSE, 0)
		sw = gtk.ScrolledWindow()
		textview = gtk.TextView()
		button = gtk.Button("close window")
		
		window.connect("destroy", self.close_application)
		window.set_title("gtkless.py")
		window.set_border_width(3)
		window.set_size_request(640, 480)
		window.set_resizable(gtk.TRUE)  
		window.add(rootbox)
		rootbox.pack_start(sw, gtk.TRUE, gtk.TRUE, 0)
		rootbox.pack_start(button, gtk.FALSE, gtk.TRUE, 2)
		sw.set_policy(gtk.POLICY_AUTOMATIC, gtk.POLICY_AUTOMATIC)
		sw.add(textview)
		textbuffer = textview.get_buffer()
		try:
			infile = open(sys.argv[1],"r")
		except IndexError:
			string = sys.stdin.read()
		except IOError:
			string = "no file called " + sys.argv[1] + " found"
		else:
			string = infile.read()
			infile.close()
		textbuffer.set_text(string)
		button.connect("clicked", self.close_application)
		button.set_flags(gtk.CAN_DEFAULT)
		button.grab_default()
		window.show_all()

def main():
	gtk.main()
	return 0       

if __name__ == "__main__":
	textwindow()
	main()