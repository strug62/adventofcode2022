use List::Util qw(uniq);

@input = map { chomp; split // }  <>;

for (4,14) {
	$i=0; $i++ while ( scalar(uniq(@input[$i..$i+$_-1])) != $_);
	print "part" . ++$p . " : " . ($i+$_) . "\n";
}
