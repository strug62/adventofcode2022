map {
	chomp; @l = split /[-,]/;
	$part1++ if ( ($l[0]<=$l[2]&&$l[1]>=$l[3]) || ($l[0]>=$l[2]&&$l[1]<=$l[3]) );
	$part2++ unless ( $l[1]<$l[2] || $l[0]>$l[3] );
} <>;
print "part1 : $part1 - part2 : $part2\n";
