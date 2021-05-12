#!/usr/bin/expect -f
set input [lindex $argv 0];
set timeout 15
set count 0
spawn ssh $input

while 1 {
    expect {
        "Enter PIN for 'PIV_II (PIV Card Holder pin)':" { send "3BZHWKXG\r" }
		"$ " {send "\r"}
    }
    incr count
    if { $count == 3 } break
}
interact
