use List::Util qw(sum);
map { $_ > 0 ? $list[$index] += $_ : $index++ } <>;
@list = reverse sort { $a <=> $b } @list;
print $list[0] . ' ' . sum( @list[0..2]);
