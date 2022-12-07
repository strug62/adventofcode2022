use List::Util 'min';

$struct = {};
$curr = $struct;

foreach $line (<>) {
	if ( $line =~ /^\$ cd (.*)$/ ) {
		if ( $1 eq '/' ) {
			$curr = $struct;
		} elsif ( $1 eq '..' ) {
			$curr = $curr->{'_parent_'};
		} else {
			$curr->{$1} = { '_parent_' => $curr };
			$curr = $curr->{$1};
		}
	} elsif ( $line =~ /^(\d+) (.*)$/ ) {
		$curr->{$2} = $1;
	}
}

sub dir_size {
	my $s = shift;
	
	my $total = 0;
	for my $entry ( grep { $_ !~ /^_.*_$/ } keys %$s) {
		if ( ref($s->{$entry}) eq 'HASH' ) {
			$total += dir_size($s->{$entry});
		} else {
			$total += $s->{$entry};
		}
	}
	$s->{'_total_'} = $total;

	if ($total<100000) { $part1 += $total; }
	
	return $total;
}
dir_size($struct);

$space2free = $struct->{'_total_'} - 40000000;
@candids_part2 = ();

sub part2 {
	my $s = shift;

	for my $entry ( grep { $_ !~ /^_.*_$/ } keys %$s) {
		part2($s->{$entry}) if ( ref($s->{$entry}) eq 'HASH' );
	}
	push @candids_part2, $s->{'_total_'} if ( $s->{'_total_'} > $space2free );
}
part2($struct);
$part2 = min(@candids_part2);

print "part1 : " . $part1 . " - part2 : " . $part2 . "\n";

