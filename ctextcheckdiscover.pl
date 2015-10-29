#!/usr/bin/perl

use strict;

my $first = 1;

print "{\n";
print "\t\"data\":[\n\n";


my $CTID = shift(@ARGV);
if ($CTID =~ /(\d+)$/ ) {$CTID = $1; }

my $CTNAME = `/usr/sbin/vzlist $CTID -a -o hostname -H 2>/dev/null`;
#cut end string
$CTNAME = substr($CTNAME, 0, -1);


my $vzresult = `/usr/sbin/vzctl exec2 $CTID "if test -e /etc/zabbix/ct_check.sh; then /etc/zabbix/ct_check.sh; fi" 2>/dev/null`;
my @lines = split /\n/, $vzresult;

foreach my $l (@lines) {
        if ($l =~ /^(.*);(.*)$/)
        {
                my $key = $1;
                my $descr = $2;
                print ",\n" if not $first;
                $first = 0;

                print "\t{\n";
                print "\t\t\"{#CTID}\":\"$CTID\",\n";
                print "\t\t\"{#CTNAME}\":\"$CTNAME\",\n";
                print "\t\t\"{#KEY}\":\"$key\",\n";
                print "\t\t\"{#DESCR}\":\"$descr\"\n";
                print "\t}";
        }
}

print "\n\t]\n";
print "}\n";

