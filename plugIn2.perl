#Filename : client.pl

use strict;
use Socket;

#initialize host and port

my $host = shift || 'localhost';
my $port = shift || 7890;
my $server = "localhost";  #host IP running the server

#create the socket connect to internet

socket(SOCKET,PF_INET,SOCK_STREAM,(getprotobyname('tcp'))[2])
   or die "Cant create a socket $!\n";
connect(SOCKET,pack_sockaddr_in($port,inet_aton($server)))
   or die "Cant connect to port $port! \n";

my $line;
while($line = < Socket >)
{
   print "$line\n";
}
close SOCKET or die "close: $!";

