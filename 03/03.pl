use Array::Utils qw(intersect);
use List::Util qw(uniq sum);

@input=<>;
sub valueof { $c=ord(shift); ($c<91?$c-38:$c-96);}

$part1=sum map {
	chomp; @l = split //;
	@l1 = @l[0..($#l/2)];
	@l2 = @l[($#l/2+1)..$#l];
	valueof((uniq(intersect(@l1, @l2)))[0]);
} @input;

while (@input) {
	@l1=split(//,shift(@input)); @l2=split(//,shift(@input)); @l3=split(//,shift(@input));
	$part2 += valueof(uniq(intersect(@{[intersect(@l1,@l2)]},@l3)));
}

print "part1 : $part1 - part2 : $part2\n";
