require 'socket'

def local_ip_and_port
  orig, Socket.do_not_reverse_lookup = Socket.do_not_reverse_lookup, true

  UDPSocket.open do |s|
    s.connect '64.233.187.99', 1
    s.addr.last
    [s.addr.last, s.addr[1]]
  end
ensure
  Socket.do_not_reverse_lookup = orig
end
