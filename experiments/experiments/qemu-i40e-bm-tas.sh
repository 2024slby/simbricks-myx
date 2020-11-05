#!/bin/bash

source common-functions.sh

init_out qemu-i40e-bm-tas $1
run_i40e_bm a
run_i40e_bm b
sleep 0.5
run_wire ab a b
run_qemu a a build/qemu-tas-server.tar tas "-smp 4"
run_qemu b b build/qemu-tas-client.tar tas "-smp 4"
client_pid=$!
wait $client_pid
cleanup