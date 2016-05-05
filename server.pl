#!/usr/bin/perl -w
## -w enables warnings

use strict;
use IO::Socket::INET;

my $port = shift || die "[!]No port given...\n";;
my $socket = IO::Socket::INET->new(
        LocalPort      =>$port,
        Proto          =>'tcp',
        Listen         =>SOMAXCON) || die "[!] Can not establish Socket...\n";

print "Listening for connections on $port\n";

while(my $client = $socket->accept){
       my $addr = gethostbyaddr($client->peeraddr,AF_INET);
       my $port = $client->peerport;

       while(<$client>)
       {
            print"[Client :$port] &_";
ge received
            print $client "$,: $_";
       }

       close $client || die "[!] Connection unable to close...\n";
       die "[!] Can not connect $!\n";
}
