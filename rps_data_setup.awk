#!/usr/bin/awk -f
# Supply an input file of the format:
#
# DEFEATMETHOD1 DEFEATEDITEM1
# DEFEATMETHOD2 DEFEATEDITEM2
# Where defeat method can be any number of words as long as defeated item is only one word.
# This will produce JSON in the following format (the filename is used as the item unless another argument is supplied):
#
# "filename":{
# "DEFEATEDITEM1":"DEFEAT METHOD1",
# "DEFEATEDITEM2":"DEFEAT METHOD2"
# },

BEGIN {
	# TODO: allow support for using stdin as input
	if (ARGC > 1) {
		item=ARGV[1]
	} else {
		item=ARGV[0]
	}
	print "\""item"\":{"
}

{
	defeatedItem=$NF
	sub(FS $NF,x)
	print "\""tolower(defeatedItem "\":\""$0)"\","
}

END {
	print "},"
}
