#!/bin/env/python

import time
import config
import socket
import multiprocessing
import os



def read(data):
	args = dict(item.split(" ") for item in data.split(";"))
	H1 = "echo " + config.H1motor + "=" + args[horizontal1] + " > /dev/servoblaster"
	H2 = "echo " + config.H2motor + "=" + args[horizontal1] + " > /dev/servoblaster"
	V1 = "echo " + config.V1motor + "=" + args[vertical1] + " > /dev/servoblaster"
	V2 = "echo " + config.V2motor + "=" + args[vertical2] + " > /dev/servoblaster"
	F = "echo " + config.Fmotor + "=" + args[forward] + " > /dev/servoblaster"
	ledUP = "echo " + config.ledDwn + "=" + args[ledDwn] + " > /dev/servoblaster"
	ledStr = "echo " + config.ledStr + "=" + args[ledStr] + " > /dev/servoblaster"
	os.system(H1)
	os.system(H2)
	os.system(V1)
	os.system(V2)
	os.system(F)
	os.system(ledUP)
	os.system(ledStr)


def send(CONNECTION_LIST1, RaspServer,  sock, message):
	for socket in CONNECTION_LIST1:
		if socket != RaspServer:
			try:
				message = message.encode(encoding='UTF-8')
				socket.sendall(message)
			except:
				socket.close()
				CONNECTION_LIST1.remove(socket)

class RaspServer1:
	__init__(self):
		CONNECTION_LIST1 = []
		RaspServer = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		RaspServer.setsockopt(socket.SOL_SOCKET, socket.SOCK_STREAM, 1)
		RaspServer.bind((config.HOST, config.OCUPort))
		print "Starting RaspServer..."
		RaspServer.listen(10)

		CONNECTION_LIST1.append(RaspServer)

		while 1:
			read_sockets,write_sockets,error_sockets = select.select(CONNECTION_LIST1, [], [])

			for sock in read_sockets:
				if sock == RaspServer:
					sock, addr = OCUserver.accept()
					CONNECTION_LIST1.append(sock)
					send(CONNECTION_LIST1, RaspServer, sock, "Connected: Horizontal and Rear Thrusters")
				else:
					try:
						data = sock.recv(config.RECV_BUFFER)
						read(data)

					except:
						send(CONNECTION_LIST1, OCUserver, sock, "Kicking from OCUserver")
						sock.close()
						CONNECTION_LIST1.remove(sock)
						continue
