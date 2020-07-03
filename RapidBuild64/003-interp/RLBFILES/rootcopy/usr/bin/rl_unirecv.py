#!/bin/env python3

import os
import time
import socket
import pickle
from optparse import OptionParser

if __name__=='__main__':
    parser = OptionParser(usage="%prog: [options]")
    parser.add_option("", "--ip", dest="ip", type="string", default="172.31.1.10",
                        help="IP Address to send to [default=%default]")
    parser.add_option("", "--port", dest="port", type="int", default=10000,
                        help="IP Address to send to [default=%default]")

    (options, args) = parser.parse_args()

    IPADDR = options.ip
    PORTNUM = options.port

    print("Waiting for a file on", IPADDR, "port", PORTNUM)

    rec_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
    rec_sock.bind((IPADDR, PORTNUM))

    segments = {}
    total = 1
    fname = "bufferout.dat"

    while len(segments) < total:
        data, addr = rec_sock.recvfrom(1400)
        packet = pickle.loads(data)
        segments[packet["num"]] = packet
        total = packet["total"]
        fname = packet["fname"]
        if packet["num"] % 1000 == 0:
            print("Got packet ", packet["num"], "of", total)

    ff = open(fname, "wb")
    # we now have all the packets
    for cnt in range(total):
        packet = segments[cnt]
        ff.write(packet["data"])
    ff.close()
    print("Done")
