while (<>)  {
	chomp; $line = $_; next unless $_;
	if ( $_ =~ /move (\d+) from (\d+) to (\d+)/ ) {
		push @moves, [@{^CAPTURE}];
	} else {
		$i = 0;
		while ( $_ =~ /(?: {3}|\[(\S)\]) ?/g ) {
			unshift @{$stacks[$i]}, $1 if $1;
			$i++;
		}
	}
}
foreach $m (@moves) {
	for (1..$m->[0]) {
		push @{$stacks[$m->[2]-1]}, pop @{$stacks[$m->[1]-1]};
	}
}
print "part1 : " . join('', map { pop @{$_} } @stacks) . "\n";





