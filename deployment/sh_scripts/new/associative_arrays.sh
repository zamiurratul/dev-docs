#!/bin/sh

declare -A server_port=(
    [bll]=9000
    [cbs]=9001
    [crm]=9002
    [sts]=9003
    [cbvmp]=9004
    [ec]=9005
    [ups]=9006
    [gateway]=9007
    [smsc]=9008
    [txndb]=9009
    [cpdb]=9010
    [el]=9011
)

echo ${server_port}
