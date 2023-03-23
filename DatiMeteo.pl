################################
# * DatiMeteo.pl PERL program  #
################################

########################################################################################################################
# In weather.dat ci sono dei dati con rilevazioni meteorologiche. La prima colonna contiene 
# il giorno del mese, mentre la seconda e la terza contengono rispettivamente la temperatura
# massima e minima per quel giorno. 
# Scrivere un programma che dato il file in input ritorni il giorno con l'escursione termica più piccola.
########################################################################################################################

# Modules used
#
#!/usr/bin/env perl

use strict;
use warnings;

# Turn on autoflush
# 
local $| = 1;

use Scalar::Util qw(looks_like_number);

#########################
# * Dati meteo          #
#########################
print "--------------------\n";
print("* Dati meteo\n");
print "--------------------\n";

# Input Human Interface Machine
#
print "The file name please\\:> ";
my $filename = <STDIN>;
chomp $filename;

print "Your filename is '$filename'\n";

if($filename eq '') {
    print "Fatal Error: undefined filename\n";
    exit;
}

# Check existing filename
#
unless (-f $filename) {
        print "Error: File does not exist\n";
        exit;
}

# start new custom package
#
package datimeteo;

# constructor of datimeteo_data
#
sub datimeteo_data
{ 
    my $class_name = shift;
    my $self = {
                'Dy' => shift,
                'MxT' => shift,
                'MnT' => shift
               };

    # Using bless function
    # 
    bless $self, $class_name;
     
    # returning object from constructor
    # 
    return $self;
}

# Object creating and constructor calling
#
my $ok_read;
my $escursione_termica_piccola = 1000;
my $giorno_escursione_termica_piccola = "";
 
open(FH, '<', $filename) or die $!;

while(<FH>){

    # check protocol of input
    # 
    if(!$ok_read && $_ ne '  Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP
') {
        print $_;
        print "Wrong: File not supported for this program\n";
        exit;
    }

    $ok_read = 1;

    # using split() function
    #
    my @spl = split(' ', $_);

    my $Data = datimeteo_data datimeteo($spl[0],$spl[1],$spl[2]);
    
    if(defined $Data->{'Dy'} && $Data->{'Dy'} ne 'mo' && $Data->{'Dy'} ne 'Dy') {
        # using Scalar functions
        #
        if(Scalar::Util::looks_like_number($Data->{'MxT'}) &&  Scalar::Util::looks_like_number($Data->{'MnT'})) {
            my $MxT = int($Data->{'MxT'});
            my $MnT = int($Data->{'MnT'});
            my $escursione_termica = $MxT - $MnT;
            if($escursione_termica_piccola > $escursione_termica) {
                $escursione_termica_piccola = $escursione_termica;
                $giorno_escursione_termica_piccola = $Data->{'Dy'};
                # DEBUG
                # print "$Data->{'Dy'}, $escursione_termica\n";
            }
        } else {
                # ERROR
                #
                print "Sorry, I don't get it: $Data->{'Dy'}, $Data->{'MxT'}, $Data->{'MnT'}\n";
        }
    }    
}

close(FH);

#
# Printing the data results
#
print "--------------------\n";
print "Il giorno con l'escursione termica più piccola e' $giorno_escursione_termica_piccola.\n";
print "--------------------\n";
