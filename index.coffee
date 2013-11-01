Long = require 'long'

exports.join = (w,e) ->
	size = 0
	size += b.length for b in arguments
	buf = new Buffer size

	offset = 0
	for b in arguments
		b.copy buf, offset
		offset += b.length
	buf

exports.stringToBytes = (o) ->
	new Buffer o

exports.bytesToString = (o) ->
	o.toString()

exports.longToBytes = (o) ->
	if o.charAt
		l = Long.fromString o, yes
	else
		l = Long.fromInt o, yes

	b = new Buffer 8
	b.writeInt32BE l.high, 0
	b.writeInt32BE l.low, 4
	b

exports.bytesToLong = (o) ->
	high = o.readInt32BE 0
	low = o.readInt32BE 4
	x = Long.fromBits low, high, no
	x


exports.intToBytes = (o) ->
	b = new Buffer 4
	b.writeInt32BE o, 0
	b

exports.bytesToInt = (b) ->
	b.readInt32BE 0