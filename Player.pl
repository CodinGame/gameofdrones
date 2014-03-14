select(STDOUT); $| = 1;

# init part
($nbPlayer, $position, $nbDrone, $nbZone) = split(/ /, <STDIN>);
$nbZone =~ s/\n//g;

# define coord of each zone
my %zone;
for ($i = 1 ; $i <= $nbZone ; $i++)
{
    ($zone->{$i}->{"x"}, $zone->{$i}->{"y"}) = split(/ /, <STDIN>);
    $zone->{$i}->{"y"} =~ s/\n//g;
}

# Turn by turn part
while (1) {

    # get coord of each drone
    for ($i = $nbPlayer*$nbDrone ; $i > 0 ; $i--)
    {
        $n = <STDIN>;
    }

    # move your drone to a zone
    for ($i = 0 ; $i < $nbDrone ; $i++)
    {
        $target = ($i % $nbZone) +1 ;
        print $zone->{$target}->{"x"} . " " .$zone->{$target}->{"y"}. "\n";
    }
}
