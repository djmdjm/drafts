#!/usr/bin/perl

# Rewrite a sshbuf_dump() to a form that fits more neatly into a I-D.

while (my $line = <>) {
	chomp $line;
	next if $line =~ /^\s*$/;
	if (my ($addr, $hex, $txt) = $line =~ /^(\S+): (.* ) (.*)$/) {
		#print "$line\n";
		#print "A $addr\n";
		#print "H $hex\n";
		#print "T $txt\n";
		$hex =~ s/(\S\S)\s+(\S\S)\s+/$1$2 /g;
		printf "    %04x: %-40s %s\n", $addr + 0, $hex, $txt;
	} elsif (my ($addr) = $line =~ /^buffer len.*$/) {
		# Ok
	} else {
		die "wtf: $line";
	}
}
