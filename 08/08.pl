@input = map { chomp; [ split // ] }  <>;
$highest_scenic_score=0;

sub visible {
	($i, $j) = @_;

	$visible=0;
	$scenic_score=1;

	# gauche
	$v=1; $s=0;
	for ( $a=($j-1); $a>=0; $a-- ) {
		$s++;
		if ( $input[$i][$a] >= $input[$i][$j] ) {
			$v=0; last;
		}
	}
	$visible=1 if ($v);
	$scenic_score*=($s?$s:1);

	# droite
	$v=1; $s=0;
	for $a ( ($j+1)..(scalar(@{$input[$i]})-1) ) {
		$s++;
		if ( $input[$i][$a] >= $input[$i][$j] ) {
			$v=0; last;
		}
	}
	$visible=1 if ($v);
	$scenic_score*=($s?$s:1);

	# haut
	$v=1; $s=0;
	for ( $a=($i-1); $a>=0; $a-- ) {
		$s++;
		if ( $input[$a][$j] >= $input[$i][$j] ) {
			$v=0; last;
		}
	}
	$visible=1 if ($v);
	$scenic_score*=($s?$s:1);

	# bas
	$v=1; $s=0;
	for $a ( ($i+1)..(scalar(@input-1)) ) {
		$s++;
		if ( $input[$a][$j] >= $input[$i][$j] ) {
			$v=0; last;
		}
	}
	$visible=1 if ($v);
	$scenic_score*=($s?$s:1);

	$highest_scenic_score = $scenic_score if ($scenic_score>$highest_scenic_score);

	return $visible;
}

$visibles = (scalar(@input)*2)+(scalar(@{$input[0]})*2)-4;
for $i ( 1..($#input-1) ) {
	for $j ( 1..(scalar(@{$input[$i]})-2) ) {
		$visibles++ if visible($i,$j);
	}
}

print "part1: $visibles - part2: $highest_scenic_score\n";
