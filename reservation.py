#!/usr/local/bin/python3
from html.parser import HTMLParser
class GMReservationParser(HTMLParser):
	num_count = 0

	def handle_data(self, data):
		if data.find("잔여") != -1:
			rev_data = data.split(':')
			if len(rev_data) > 0:
				out_count = int(rev_data[1])
				self.num_count += out_count

parser = GMReservationParser()
f = open("input.html", 'r')
parser.feed(f.read())
f.close()
print(parser.num_count)