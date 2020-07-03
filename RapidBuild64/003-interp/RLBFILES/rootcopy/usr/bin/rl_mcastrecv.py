#!/bin/env python3

import os
import time
import socket
import pickle
import struct
from optparse import OptionParser

if __name__=='__main__':
    parser = OptionParser(usage="%prog: [options]")
    parser.add_option("", "--mcast", dest="ip", type="string", default="224.1.1.5",
                        help="IP Address to send to [default=%default]")
    parser.add_option("", "--port", dest="port", type="int", default=10000,
                        help="IP Address to send to [default=%default]")

    (options, args) = parser.parse_args()

    MCAST_GRP = options.ip
    MCAST_PORT = options.port

    print("Waiting for a file on", MCAST_GRP, "port", MCAST_PORT)

    rec_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
    rec_sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    rec_sock.setsockopt(socket.IPPROTO_IP, socket.IP_MULTICAST_TTL, 2)

    rec_sock.bind((MCAST_GRP, MCAST_PORT))
    mreq = struct.pack("4sl", socket.inet_aton(MCAST_GRP), socket.INADDR_ANY)
    rec_sock.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, mreq)
 
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
