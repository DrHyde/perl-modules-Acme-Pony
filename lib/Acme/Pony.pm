package Acme::Pony;

$VERSION = '1.1.2';

open 0 or print "Can't Pony '$0'\n" and exit;
(my $code = join "", <0>) =~ s/.*^\s*use\s+Acme::Pony\s*;\n//sm;

if($code!~/^[buffyX\s]*$/i) { # if it hasn't been encoded
	my $code=ponyize("$code\n__END__");
	open(0, ">$0") or print "Can't Ponyize $0\n" and exit();
	print {0} "use Acme::Pony;\n$code" and exit();
} else {
	$code=unpony($code); # $code=~s/\n__END__//;
	eval($code);
	exit();
}

sub ponyize {
	my @chars = split(//, unpack "b*", pop);
	my $i=0;
	my @BUFFY=qw(B U F F Y);
	my @buffy=qw(b u f f y);
	foreach (@chars) {
		$_ = $_ ? $BUFFY[$i] : $buffy[$i];
		$i++; $i %= 5;
	}
	
	@chars=scalepony(@chars);

	join('',@chars);
}

sub unpony {
	my @chars=grep { /[buffy]/i; } split(//, pop);
	foreach (@chars) {
		$_=($_=~/[buffy]/)?0:1;
	}
	pack "b*", join '', @chars;
}

sub scalepony {
	my @chars = @_;
	my $chars = join '', @chars;
  my $wantlength = length $chars;
  my $scale;

  # What scale do we want?
  if ($wantlength > 201242) {
    $scale = 1000 * sqrt($wantlength / 201242);
  } else {
    $scale = 1000 / sqrt(201242 / $wantlength);
  }
  $scale *= 0.95;

  # These were worked out by hand with very accurate graph paper
  my @xpoints = (0.26735840061026, 0.290728815714195, 0.297102536393109, 0.299227321848579, 0.322598690483758, 0.348092937511919, 0.36933761362914, 0.403331002479181, 0.430951624181552, 0.450073104062043, 0.471317780179264, 0.484066492912084, 0.496812027207425, 0.498938401881635, 0.505311169029305, 0.524432648909796, 0.547803699701227, 0.581797088551268, 0.6349119572818, 0.692276396923272, 0.728392982010044, 0.766635941771025, 0.773008708918696, 0.775135083592906, 0.781507850740576, 0.792130188799186, 0.809128472442947, 0.828249952323438, 0.847368253766448, 0.866489733646939, 0.88561121352743, 0.89835992626025, 0.915355031466531, 0.930226940436082, 0.940852456932172, 0.957847562138453, 0.964220329286123, 0.968469900197063, 0.972719471108003, 0.981218612929884, 0.983341809166614, 0.976969042018944, 0.976969042018944, 0.976969042018944, 0.968469900197063, 0.955724365901723, 0.947225224079842, 0.934476511347022, 0.911108638993071, 0.90048312249698, 0.88136164261649, 0.870739304557879, 0.855867395588329, 0.847368253766448, 0.843121861292988, 0.836745915707838, 0.826123577649228, 0.826123577649228, 0.817624435827347, 0.824000381412498, 0.832496344796898, 0.834622719471108, 0.828249952323438, 0.828249952323438, 0.828249952323438, 0.815501239590617, 0.802752526857797, 0.792130188799186, 0.777258279829636, 0.756013603712415, 0.762386370860085, 0.775135083592906, 0.792130188799186, 0.794256563473396, 0.790006992562456, 0.783631046977306, 0.781507850740576, 0.753887229038205, 0.736892123831924, 0.724143411099104, 0.707148305892823, 0.715644269277223, 0.726269785773314, 0.719893840188163, 0.705021931218613, 0.688026826012332, 0.675278113279512, 0.671028542368572, 0.675278113279512, 0.685900451338122, 0.711397876803763, 0.724143411099104, 0.719893840188163, 0.707148305892823, 0.671028542368572, 0.649783866251351, 0.63066238637086, 0.613664102727099, 0.594545801284089, 0.564798804907507, 0.532931790731676, 0.505311169029305, 0.471317780179264, 0.450073104062043, 0.426702053270612, 0.413953340537792, 0.413953340537792, 0.407580573390121, 0.401207806242451, 0.392708664420571, 0.392708664420571, 0.38420952259869, 0.38208632636196, 0.3650880427182, 0.350216133748649, 0.339593795690039, 0.326848261394698, 0.297102536393109, 0.288604348102473, 0.303476574915771, 0.318349119572818, 0.335344224779099, 0.348092937511919, 0.350216133748649, 0.348092937511919, 0.345966562837709, 0.345966562837709, 0.341720170364249, 0.337470599453309, 0.337470599453309, 0.318349119572818, 0.299227321848579, 0.273732439132922, 0.243987985506325, 0.224866823469582, 0.186624499396097, 0.163254084292162, 0.137758883732757, 0.122886974763206, 0.108014747949908, 0.0952673065920793, 0.0846443328459729, 0.0761461445553366, 0.0931428389803573, 0.1122640010171, 0.125011442374928, 0.131385163053843, 0.129260695442121, 0.11013921556163, 0.0931428389803573, 0.0676476384209523, 0.0485264763842095, 0.035779035026381, 0.0166576822833895, 0.0166576822833895, 0.0336542495709109, 0.0570246646748458, 0.0718968914881444, 0.0931428389803573, 0.1122640010171, 0.139883669188227, 0.169627804971076, 0.184499713940627, 0.197247155298455, 0.199371940753925, 0.195122687686733, 0.212119382111754, 0.218493102790668, 0.231240544148497, 0.239739050282881, 0.243987985506325, 0.229116076536775, 0.203620875977369, 0.188748967007819, 0.17387674019452, 0.165378551903884, 0.17387674019452, 0.182375246328905, 0.192998220075011, 0.203620875977369, 0.224866823469582, 0.235489797215689, 0.243987985506325, 0.252486491640709, 0.258860212319624, 0.263109465386816, 0.26948318606573);
  # ... or I may have used Sketch...
  my @ypoints = (0.0303060573188429, 0.0417852818858603, 0.0264797254557372, 0.0150004436442946, 0.0417852818858603, 0.0666571259291486, 0.0685702346162763, 0.0915289699724368, 0.118313922702853, 0.141272371836888, 0.169970719476557, 0.210148005461118, 0.256065189951314, 0.328766182283423, 0.363204428428726, 0.393815884755523, 0.416773761445307, 0.430168956920708, 0.433992884517959, 0.439734500356346, 0.443561290174853, 0.447385217772104, 0.437819674336466, 0.420600551263814, 0.395730710775404, 0.384250341319885, 0.361292464630101, 0.361292464630101, 0.370858008065739, 0.388077131138391, 0.407208218009669, 0.437819674336466, 0.497130623191434, 0.52582725349835, 0.548787992409389, 0.598530535607463, 0.608096079043102, 0.642534325188406, 0.669318991696696, 0.688450078567973, 0.715237607297519, 0.736280657967422, 0.770718904112726, 0.814722693693668, 0.839595396403333, 0.87020685273013, 0.898903483037046, 0.918037432129578, 0.90847188869394, 0.881687222185649, 0.839595396403333, 0.799418396640897, 0.75732657085858, 0.726715114531784, 0.699930448023493, 0.680799361152216, 0.686538114769348, 0.715237607297519, 0.747761027422942, 0.763065324475713, 0.791764817003884, 0.837680570383452, 0.851075765858852, 0.877860432367143, 0.948648888456375, 0.956302468093389, 0.963953185509146, 0.979260344783172, 0.984999098400304, 0.979260344783172, 0.965868011529027, 0.950560852255001, 0.933341729182349, 0.918037432129578, 0.885511149782901, 0.849160939838971, 0.820464309532056, 0.805157150258029, 0.80707197627791, 0.814722693693668, 0.826203063149188, 0.835768606584826, 0.852987729657478, 0.874033642548636, 0.883599185984275, 0.893164729419914, 0.872118816528755, 0.849160939838971, 0.83194181676632, 0.812810729895042, 0.791764817003884, 0.774545693931232, 0.763065324475713, 0.749672991221567, 0.715237607297519, 0.696103658204987, 0.682711324950841, 0.671233817716577, 0.671233817716577, 0.673145781515203, 0.663580238079564, 0.657838622241177, 0.652099868624044, 0.652099868624044, 0.659753448261057, 0.682711324950841, 0.71906153489477, 0.764980150495594, 0.80707197627791, 0.839595396403333, 0.868292026710249, 0.902730272855552, 0.927602975565217, 0.93525655520223, 0.954387642073507, 0.969694801347534, 0.973518728944785, 0.973518728944785, 0.967779975327653, 0.944822098637869, 0.931429765383724, 0.918037432129578, 0.906557062674059, 0.868292026710249, 0.845334150020465, 0.797503570621016, 0.755414607059955, 0.726715114531784, 0.678884535132335, 0.659753448261057, 0.64062236138978, 0.627230028135635, 0.613834832660234, 0.60235732542597, 0.587050166151944, 0.556438709825147, 0.539219586752495, 0.520088499881218, 0.510522956445579, 0.510522956445579, 0.52582725349835, 0.550699956208015, 0.562180325663534, 0.573657832897799, 0.587050166151944, 0.600442499406089, 0.623403238317128, 0.644446288987031, 0.648273078805538, 0.638707535369899, 0.610010905062983, 0.59087695597045, 0.57557265891768, 0.556438709825147, 0.546873166389508, 0.522000463679843, 0.493303833372927, 0.464604340844756, 0.453126833610492, 0.449300043791985, 0.46269237704613, 0.477996674098901, 0.491389007353046, 0.481823463917408, 0.460780413247505, 0.443561290174853, 0.412949833848056, 0.391903920956898, 0.368946044267114, 0.349812095174581, 0.328766182283423, 0.323027428666291, 0.313461885230652, 0.303896341795013, 0.286677218722362, 0.269457809427584, 0.250325577667805, 0.231193345908025, 0.204408393177609, 0.181449944043574, 0.141272371836888, 0.122140426299234, 0.101094799630201, 0.0762232418090383, 0.0704836295255296, 0.0609175136456398, 0.0570910100492588);

  # Scale the points (with ASCII 'fixed' font size scaling too)
  @xpoints = map { $_ *= $scale; $_ = int($_) } @xpoints;
  @ypoints = map { $_ *= $scale * 5 / 9; $_ = int($_) } @ypoints;
  my $n = @xpoints;

  return if ($n < 3); # not even a triangle, boring

  # Find the min and max y values
  my($miny, $maxy) = ($ypoints[0], $ypoints[0]);
  foreach my $y (@ypoints) {
    if ($y < $miny) {
      $miny = $y;
    } elsif ($y > $maxy) {
      $maxy = $y}
  }

  my @ascii;

  # Can you say "generic polygon scanline fill"?
  foreach my $y ($miny .. $maxy) {
    my($ind1, $ind2, $y1, $y2, $x1, $x2, @polyints);

    foreach my $i (0 .. $n-1) {
      if (!$i) {
	$ind1 = $n-1;
	$ind2 = 0;
      } else {
	$ind1 = $i-1;
	$ind2 = $i;
      }
      $y1 = $ypoints[$ind1];
      $y2 = $ypoints[$ind2];
      if ($y1 < $y2) {
	$x1 = $xpoints[$ind1];
	$x2 = $xpoints[$ind2];
      } elsif ($y1 > $y2) {
	$y2 = $ypoints[$ind1];
	$y1 = $ypoints[$ind2];
	$x2 = $xpoints[$ind1];
	$x1 = $xpoints[$ind2];
      } else {
	next;
      }
      if (($y >= $y1) && ($y < $y2)) {
	push @polyints, ($y-$y1) * ($x2-$x1) / ($y2-$y1) + $x1;
      } elsif (($y == $maxy) && ($y > $y1) && ($y <= $y2)) {
	push @polyints, ($y-$y1) * ($x2-$x1) / ($y2-$y1) + $x1;
      }
    }

    @polyints = sort { $a <=> $b } @polyints;

    while (@polyints) {
      my($x1, $x2) = (pop @polyints, pop @polyints);
      ($x1, $x2) = ($x2, $x1) if $x1 > $x2;

      foreach my $x ($x1 .. $x2) {
	$ascii[$y][$x1++] = 'X';
      }
    }
  }

  my $ascii;

  foreach my $x (0 .. $scale) {
    foreach my $y (0 .. $scale) {
      $ascii .= $ascii[$x][$y] || ' ';
    }
    $ascii .= "\n";
  }

  $ascii =~ s|^\s*$||mg;

  $chars = reverse $chars;
  $ascii =~ s/X/chop $chars || 'X'/eg; # use X if we need more chars

  # More chars to go?
  $ascii .= "\n\n" . reverse($chars) . "\n" if $chars;

  return $ascii;
 }
 
1;

__END__

=head1 NAME

Acme::Pony - An encoding scheme for Silly People

=head1 SYNOPSIS

  use Acme::Pony;

  print "Hello world";

=head1 DESCRIPTION

The first time you run a program under C<use Acme::Pony>, the module
removes all that nasty text stuff from your source file, turning
it into a lovely ASCII-art rendition of a pony.  In the spirit of
other london.pm modules, the ASCII-art will consist entirely of
the characters matching /[buffy]+/i, thus fulfilling Greg, Leon
and Dave's fantasy of seeing Buffy riding a Pony.

=head1 DIAGNOSTICS

=over 4

=item C<Can't pony '%s'>

Acme::Pony couldn't access the source file for modification.

=item C<Can't unpony '%s'>

Acme::Pony couldn't access the source file for execution.

=head1 AUTHOR

David Cantrell <david@cantrell.org.uk>

This is based on Leon Brocard's 'Buffy' module and inspired by Damian
Conway's brief talk on his Bleach module.

Leon contributed the code for scaling a vector Pony and filling it,
replacing the bitmap Pony from the previous versions.

=head1 COPYRIGHT

Copyright (c) 2001, David Cantrell.  The Artistic Licence applies.