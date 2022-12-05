use Clone 'clone';
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
@stacks_p1 = @{clone(\@stacks)};
@stacks_p2 = @{clone(\@stacks)};
foreach $m (@moves) {
	@part1 = (); @part2 = ();
	for (1..$m->[0]) {
		push @part1, pop @{$stacks_p1[$m->[1]-1]};
		unshift @part2, pop @{$stacks_p2[$m->[1]-1]};
	}
	push @{$stacks_p1[$m->[2]-1]}, @part1;
	push @{$stacks_p2[$m->[2]-1]}, @part2;
}
print "part1 : " . join('', map { pop @{$_} } @stacks_p1) . " - part2 : " . join('', map { pop @{$_} } @stacks_p2) . "\n";









