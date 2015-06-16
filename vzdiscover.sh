#!/usr/bin/perl

use strict;

my $first = 1;

print "{\n";
print "\t\"data\":[\n\n";

my $VEname = `hostname`;
#cut end string
$VEname = substr($VEname, 0, -1);

my $vzresult = `/usr/sbin/vzlist -a -o veid,hostname,status,laverage -H`;

my @lines = split /\n/, $vzresult;


foreach my $l (@lines) {
        if ($l =~ /^(\s*?)(\d+) (.*?)(\s+)(\S+)/)
        {
                my $id = $2;
                my $hostname = $3;
                my $status = $5;
                print ",\n" if not $first;
                $first = 0;

                print "\t{\n";
                print "\t\t\"{#CTID}\":\"$id\",\n";
                print "\t\t\"{#CTHOST}\":\"$hostname\",\n";
                print "\t\t\"{#CTSTATUS}\":\"$status\",\n";
                print "\t\t\"{#VENAME}\":\"$VEname\"\n";
                print "\t}";
        }
}

print "\n\t]\n";
print "}\n";
