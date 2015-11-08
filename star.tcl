#Create a simulator object
set ns [new Simulator]

#Define different colors for data flows (for NAM)
$ns color 1 Blue
$ns color 2 Red
$ns color 3 Green
$ns color 4 Yellow
$ns color 5 Brown
$ns color 6 Orange
$ns color 7 Chocolate
$ns color 8 Orange
$ns color 9 ForestGreen
$ns color 10 DodgerBlue
$ns color 11 HotPink
$ns color 12 IndianRed
$ns color 13 DarkMagenta
$ns color 14 violet
$ns color 15 tan

#Open the NAM trace file
set nf [open out.nam w]
$ns namtrace-all $nf

#Define a 'finish' procedure
proc finish {} {
    global ns nf
    $ns flush-trace
    #Close the NAM trace file
    close $nf
    #Execute NAM on the trace file
    exec nam out.nam 
    exit 0
}

#Create 15 sources, 1 sink, 4 routers nodes 
set s1 [$ns node] 
set s2 [$ns node] 
set s3 [$ns node] 
set s4 [$ns node] 
set s5 [$ns node] 
set s6 [$ns node] 
set s7 [$ns node] 
set s8 [$ns node] 
set s9 [$ns node] 
set s10 [$ns node] 
set s11 [$ns node] 
set s12 [$ns node] 
set s13 [$ns node]
set s14 [$ns node] 
set s15 [$ns node] 
set s16 [$ns node]
set s17 [$ns node]
set r1 [$ns node] 
set r2 [$ns node] 
set r3 [$ns node] 
set r4 [$ns node]

#Create links between the nodes
$ns duplex-link $s1 $r1 4Mb 10ms DropTail
$ns duplex-link $s2 $r1 4Mb 10ms DropTail
$ns duplex-link $s3 $r1 4Mb 10ms DropTail
$ns duplex-link $s4 $r1 4Mb 10ms DropTail
$ns duplex-link $s5 $r1 4Mb 10ms DropTail 

$ns duplex-link $s6 $r3 2Mb 10ms DropTail
$ns duplex-link $s7 $r3 2Mb 10ms DropTail
$ns duplex-link $s8 $r3 2Mb 10ms DropTail
$ns duplex-link $s9 $r3 2Mb 10ms DropTail
$ns duplex-link $s10 $r3 2Mb 10ms DropTail 

$ns duplex-link $s11 $r2 2Mb 10ms DropTail
$ns duplex-link $s12 $r2 2Mb 10ms DropTail
$ns duplex-link $s13 $r2 2Mb 10ms DropTail
$ns duplex-link $s14 $r2 2Mb 10ms DropTail
$ns duplex-link $s15 $r2 2Mb 10ms DropTail

$ns duplex-link $r1 $r4 4Mb 10ms RED
$ns duplex-link $r2 $r4 4Mb 10ms RED
$ns duplex-link $r3 $r4 4Mb 10ms RED
$ns duplex-link $s16 $r4 2Mb 10ms DropTail
$ns duplex-link $s17 $r4 2Mb 10ms DropTail
$ns queue-limit $r1 $r4 50
$ns queue-limit $r2 $r4 50
$ns queue-limit $r3 $r4 50
#

#Set the orientation in NAM
$ns duplex-link-op $s1 $r1 orient down
$ns duplex-link-op $s2 $r1 orient right-down
$ns duplex-link-op $s3 $r1 orient right
$ns duplex-link-op $s4 $r1 orient right-up
$ns duplex-link-op $s5 $r1 orient up 

$ns duplex-link-op $s6 $r3 orient down
$ns duplex-link-op $s7 $r3 orient left-down
$ns duplex-link-op $s8 $r3 orient left
$ns duplex-link-op $s9 $r3 orient left-up
$ns duplex-link-op $s10 $r3 orient up 

$ns duplex-link-op $s11 $r2 orient right
$ns duplex-link-op $s12 $r2 orient right-down
$ns duplex-link-op $s13 $r2 orient down
$ns duplex-link-op $s14 $r2 orient left-down
$ns duplex-link-op $s15 $r2 orient left

$ns duplex-link-op $r1 $r4 orient right-up
$ns duplex-link-op $r2 $r4 orient down
$ns duplex-link-op $r3 $r4 orient left-up
$ns duplex-link-op $s16 $r4 orient up
$ns duplex-link-op $s17 $r4 orient up
#


#Setup TCP connections
set tcp1 [$ns create-connection TCP/Reno $s1 TCPSink $s16 1]
set tcp2 [$ns create-connection TCP/Reno $s2 TCPSink $s16 2]
set tcp3 [$ns create-connection TCP/Reno $s3 TCPSink $s16 3]
set tcp4 [$ns create-connection TCP/Reno $s4 TCPSink $s16 4]
set tcp5 [$ns create-connection TCP/Reno $s5 TCPSink $s16 5]
set tcp6 [$ns create-connection TCP/Reno $s6 TCPSink $s16 6]
set tcp7 [$ns create-connection TCP/Reno $s7 TCPSink $s16 7]
$tcp1 set window_ 15
$tcp2 set window_ 15
$tcp3 set window_ 15
$tcp4 set window_ 15
$tcp5 set window_ 15
$tcp6 set window_ 15
$tcp7 set window_ 15

#Setup FTP connections
set ftp1 [$tcp1 attach-source FTP]
set ftp2 [$tcp2 attach-source FTP]
set ftp3 [$tcp3 attach-source FTP]
set ftp4 [$tcp4 attach-source FTP]
set ftp5 [$tcp5 attach-source FTP]
set ftp6 [$tcp6 attach-source FTP]
set ftp7 [$tcp7 attach-source FTP]

#Setup UDP connections
set udp8 [new Agent/UDP] 
set udp9 [new Agent/UDP] 
set udp10 [new Agent/UDP] 
set udp11 [new Agent/UDP] 
set udp12 [new Agent/UDP] 
set udp13 [new Agent/UDP] 
set udp14 [new Agent/UDP] 
set udp15 [new Agent/UDP] 

$ns attach-agent $s8 $udp8
$ns attach-agent $s9 $udp9
$ns attach-agent $s10 $udp10
$ns attach-agent $s11 $udp11
$ns attach-agent $s12 $udp12
$ns attach-agent $s13 $udp13
$ns attach-agent $s14 $udp14
$ns attach-agent $s15 $udp15

#Define the sink Node
set sink [new Agent/TCPSink]
set udpsink [new Agent/Null]
$ns attach-agent $s17 $udpsink

$udp8 set fid_ 8
$udp9 set fid_ 9
$udp10 set fid_ 10
$udp11 set fid_ 11
$udp12 set fid_ 12
$udp13 set fid_ 13
$udp14 set fid_ 14
$udp15 set fid_ 15

#Setup CBR connections
set cbr8 [new Application/Traffic/CBR]
set cbr9 [new Application/Traffic/CBR]
set cbr10 [new Application/Traffic/CBR]

$cbr8 set packetSize_ 1000
$cbr9 set packetSize_ 1000
$cbr10 set packetSize_ 1000

#Setup VBR connections
set vbr11 [new Application/Traffic/Exponential]
set vbr12 [new Application/Traffic/Exponential]
set vbr13 [new Application/Traffic/Exponential]
set vbr14 [new Application/Traffic/Exponential]
set vbr15 [new Application/Traffic/Exponential]

$vbr11 set rate_ 1200k
$vbr11 set burst_time_ 300ms 
$vbr11 set idle_time_ 20ms
$vbr11 set packetSize_ 1000

$vbr12 set rate_ 1200k
$vbr12 set burst_time_ 150ms 
$vbr12 set idle_time_ 100ms
$vbr12 set packetSize_ 1000

$vbr13 set rate_ 1200k
$vbr13 set burst_time_ 150ms 
$vbr13 set idle_time_ 100ms
$vbr13 set packetSize_ 1000

$vbr14 set rate_ 1200k
$vbr14 set burst_time_ 150ms 
$vbr14 set idle_time_ 100ms
$vbr14 set packetSize_ 1000

$vbr15 set rate_ 1200k
$vbr15 set burst_time_ 150ms 
$vbr15 set idle_time_ 100ms 
$vbr15 set packetSize_ 1000

#Setup CBR connections over UDP connections
$cbr8 attach-agent $udp8
$cbr8 set rate_ 2Mb
$cbr9 attach-agent $udp9
$cbr9 set rate_ 2Mb
$cbr10 attach-agent $udp10
$cbr10 set rate_ 2Mb
$vbr11 attach-agent $udp11
#$vbr11 set rate_ 1Mb
$vbr12 attach-agent $udp12
#$cbr12 set rate_ 0.5Mb
$vbr13 attach-agent $udp13
#$cbr13 set rate_ 0.5Mb
$vbr14 attach-agent $udp14
#$cbr14 set rate_ 0.5Mb
$vbr15 attach-agent $udp15
#$cbr15 set rate_ 0.5Mb

$ns connect $udp8 $udpsink
$ns connect $udp9 $udpsink
$ns connect $udp10 $udpsink
$ns connect $udp11 $udpsink
$ns connect $udp12 $udpsink
$ns connect $udp13 $udpsink
$ns connect $udp14 $udpsink
$ns connect $udp15 $udpsink

#Trace RED1
set traceq1 [open red-queue1.tr w]
set redq1 [[$ns link $r1 $r4] queue]
#$redq1 set queue-in-bytes_ true
$redq1 trace curq_
$redq1 trace ave_
$redq1 attach $traceq1

#Trace RED2
set traceq2 [open red-queue2.tr w]
set redq2 [[$ns link $r2 $r4] queue]
#$redq2 set queue-in-bytes_ true
$redq2 trace curq_
$redq2 trace ave_
$redq2 attach $traceq2

#Trace RED3
set traceq3 [open red-queue3.tr w]
set redq3 [[$ns link $r3 $r4] queue]
#$redq3 set queue-in-bytes_ true
$redq3 trace curq_
$redq3 trace ave_
$redq3 attach $traceq3

#Schedule events for the CBR and FTP agents
$ns at 0.0 "$ftp1 start"
$ns at 0.0 "$ftp2 start"
$ns at 0.0 "$ftp3 start"
$ns at 0.0 "$ftp4 start"
$ns at 0.0 "$ftp5 start"
$ns at 5.0 "$ftp6 start"
$ns at 5.0 "$ftp7 start"
$ns at 5.0 "$cbr8 start"
$ns at 5.0 "$cbr9 start"
$ns at 5.0 "$cbr10 start"
$ns at 10.1 "$vbr11 start"
$ns at 10.2 "$vbr12 start"
$ns at 10.3 "$vbr13 start"
$ns at 10.4 "$vbr14 start"
$ns at 10.5 "$vbr15 start"

$ns at 5.0 "$ftp1 stop"
$ns at 5.0 "$ftp2 stop"
$ns at 5.0 "$ftp3 stop"
$ns at 5.0 "$ftp4 stop"
$ns at 5.0 "$ftp5 stop"
$ns at 10.0 "$ftp6 stop"
$ns at 10.0 "$ftp7 stop"
$ns at 10.0 "$cbr8 stop"
$ns at 10.0 "$cbr9 stop"
$ns at 10.0 "$cbr10 stop"
$ns at 15.0 "$vbr11 stop"
$ns at 15.0 "$vbr12 stop"
$ns at 15.0 "$vbr13 stop"
$ns at 15.0 "$vbr14 stop"
$ns at 15.0 "$vbr15 stop"

#Call the finish procedure after 5 seconds of simulation time
$ns at 15.0 "finish"
#$ns at 4.1 "finish"

#Run the simulation
$ns run
