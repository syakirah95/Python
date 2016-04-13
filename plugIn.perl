#filename : server.pl

use strict;
use Socket;

#use port 7890 as default
my $port + shift || 7890;
my $proto = getprotobyname('tcp');
my $server = "localhost";   #host IP running the server

#create a socket,make it reusable
socket(SOCKET,PF_INET,SOCK_STREAM,$proto)
   or die "Cant open socket $!\n";
setsockpot(SOCKET,SOL_SOCKET,SO_REUSEADDR,1)
   or die "Cant set socket option to SO_REUSEADDR $!\n";

#bind to a port,then listen
bind(SOCKET,pack_sockaddr_in($port,inet_aton($server)))
  or die "Cant bind to port $port! \n";
listen(SOCKET,5) OR DIE "Listen : $!";
print "SERVER started on port $port\n";

#accepting a connection
my $client_addr;
while($cilent_addr = accept(NEW_SOCKET,SOCKET))
{
   #send them a message,close connection
   my $name = gethostbyaddr($client_addr,AF_INET);
   print NEW_SOCKET "Smile from the server";
   print "Connection received from $name\n";
   close NEW_SOCKET;
}
