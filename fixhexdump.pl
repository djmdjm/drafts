#!/usr/bin/perl

# Rewrite a `hexdump -C` to a form that fits more neatly into a I-D.

while (my $line = <>) {
	chomp $line;
	next if $line =~ /^\s*$/;
	if (my ($addr, $hex, $txt) = $line =~ /^(\S+)\s+([^|]+ ) \|(.*)\|$/) {
		#print "$line\n";
		#print "A $addr\n";
		#print "H $hex\n";
		#print "T $txt\n";
		$addr =~ s/^0000/    /;
		$hex =~ s/(\S\S)\s+(\S\S)\s+/$1$2 /g;
		printf "%s: %-40s %s\n", $addr, $hex, $txt;
	} elsif (my ($addr) = $line =~ /^(\S+)$/) {
		# Ok
	} else {
		die "wtf";
	}
}
