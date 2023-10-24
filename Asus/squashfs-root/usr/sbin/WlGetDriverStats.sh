#!/bin/sh
#
# WlGetDriverStats.sh <ucast|mcast> <WiFi interface name> <NrRetries> <enable|disable>
#
# Copyright (C) 2022, Broadcom. All Rights Reserved.
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
# SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
# OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
# CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
# <<Broadcom-WL-IPTag/Proprietary,Open:.*>>
#

WLCMD=wl
DHDCMD=dhd
IFNAME=$1
DUMPPATH=/tmp
DUMPDIR=${DUMPPATH}/$(date +"%d:%m:%Y_%H:%M")
LOOP_TIME=10
NR_RUNS=0
HOSTAPD_CONF=/tmp/wlX_hapd.conf
HOSTAPD_CONF_1=/tmp/wlX.1_hapd.conf
WPASUPP_CONF=/tmp/wlX_wpa_supplicant.conf
MODE="auto"
NR_REPEATS=0
DUMP_CLEAR=0
MODE="auto"
ENABLE_SOCRAM_DUMP="disable"
VERSION=1

show_help () {
    echo "Two input formats are supported by this script."
    echo "First one is for backward compatibility."
    echo "Second one to make it more user friendly, and developer friendly for future expansion."
    echo -e "\nFirst input format:"
    echo "Syntax: $0 <WiFi interface name> <NrRetries> <SOCRAMDUMP: enable|disable>"
    echo "  or  : $0 <WiFi interface name> [<Driver mode: auto|nic|dhd>] <NrRetries> <SOCRAMDUMP: enable|disable>"
    echo "Example 1: $0 wl1 (infinite loop)"
    echo "Example 2: $0 wl1 dhd (for FD driver; infinite loop)"
    echo "Example 3: $0 eth5 auto 12 enable (for any driver; 12 loops - 10s between loops; dump socram also)"
    echo "Try \`$0 --help' for more information."
    echo -e "\nSecond input format:"
    echo "Syntax: $0 [-i ifname] [-m mode] [-r repeat_count] [-t interval_time_sec] [-c] [-s enable|disable]"
    echo "Options:"
    echo -e "\t-i ifname: Name of the WLAN driver interface. Default is wl0."
    echo -e "\t-m mode: Valid driver modes: auto|nic|dhd. Default is auto."
    echo -e "\t-r repeater_count: Number of iterations driver?s data collection. Default infinite loop."
    echo -e "\t-t interval_time_sec: Sleep time between two intervals. Default 10 sec."
    echo -e "\t-c: Clear wlan driver dumps wherever applicable. Default is not clear."
    echo -e "\t-s enable|disable: SOCRAMDUMP enable or disable. Default is disable."
    exit
}

dump_hapd () {
   for i in 0 1 2 3
   do
       HAPDFILE=${HOSTAPD_CONF//X/$i}
       if test -f $HAPDFILE; then
           echo "------- Dumping $HAPDFILE ----------"
           cat $HAPDFILE
       fi

       HAPDFILE_1=${HOSTAPD_CONF_1//X/$i}
       if test -f $HAPDFILE_1; then
           echo "------- Dumping $HAPDFILE_1 ----------"
           cat $HAPDFILE_1
       fi
   done
}

dump_wpasupp () {
   for i in 0 1 2 3
   do
       WPASUPPFILE=${WPASUPP_CONF//X/$i}
       if test -f $WPASUPPFILE; then
           echo "------- Dumping $WPASUPPFILE ----------"
           cat $WPASUPPFILE
       fi
   done
}

# $1 Heading
# $2 cmd to execute
display_cmd_op(){
    cmd="$2"
    echo "---------------------------------------------"
    echo -e "$1"
	if [ -n "$3" ] && [ "$DUMP_CLEAR" -eq 1 ] && [ $NR_RUNS -ne 0 ]; then
		echo "This Dump/Stats was cleared after last display"
	fi
    echo "---------------------------------------------"
    $cmd |
    while IFS= read -r line
    do
    echo -e "\t""$line"
    done
	if [ -n "$3" ] && [ "$DUMP_CLEAR" -eq 1 ]; then
		echo "CLEAR: $WLCMD -i $IFNAME $3 $4"
		$WLCMD -i $IFNAME $3 $4
	fi
}

# Help option
if [[ $# -eq 1 ]] && [[ $1 == "--help" ]]; then
    show_help
    exit 0
fi

if [ $# -eq 0 ]; then
    show_help
    exit 0
fi

OPT=$1
if [[ ${OPT:0:1} == - ]]; then
    VERSION=2
	IFNAME=wl0
    while [[ $# -gt 0 ]]
    do
    key="$1"

    case $key in
            -i|--interface)
            IFNAME="$2"
            shift # past argument
            shift # past value
            ;;
            -m|--mode)
            MODE="$2"
            shift # past argument
            shift # past value
            ;;
            -r|--repeatcount)
            NR_REPEATS="$2"
            shift # past argument
            shift # past value
            ;;
            -c|--clear)
            shift # past argument
	        DUMP_CLEAR=1
            ;;
            -s|--socramdump)
            ENABLE_SOCRAM_DUMP="$2"
            shift # past argument
            shift # past value
            ;;
            -t|--timeinterval)
            LOOP_TIME="$2"
            shift # past argument
            shift # past value
            ;;
            -h|--help)
        show_help
        exit 0
        ;;
            *)    # unknown option
        echo "Unknown Option $1"
        show_help
        exit 0;
    esac
    done

    if ! [ "$LOOP_TIME" -eq "$LOOP_TIME" ] 2>/dev/null; then
        echo "Time interval between repeat should be number in sec."
        show_help
        exit 0;
    fi

else

    VERSION=1
    IFNAME=$1
    if [ $# -eq 4 ]; then
        MODE=$2
        NR_REPEATS=$3
        ENABLE_SOCRAM_DUMP=$4
    elif [ $# -eq 3 ]; then
        if [[ $2 != "nic" ]] && [[ $2 != "dhd" ]] && [[ $2 != "auto" ]]; then
            NR_REPEATS=$2
            ENABLE_SOCRAM_DUMP=$3
        else
            MODE=$2
            NR_REPEATS=$3
        fi
    elif [ $# -eq 2 ]; then
        if [[ $2 != "nic" ]] && [[ $2 != "dhd" ]] && [[ $2 != "auto" ]]; then
            NR_REPEATS=$2
        else
            MODE=$2
        fi
    fi

fi # end of input argument parsing

:<< 'END'
echo "============================="
echo "Input info::::"
echo "IFNAME: $IFNAME"
echo "Mode: $MODE"
echo "NR_REPEATS: $NR_REPEATS"
echo "ENABLE_SOCRAM_DUMP: $ENABLE_SOCRAM_DUMP"
echo "LOOP_TIME: $LOOP_TIME"
echo "DUMP_CLEAR: $DUMP_CLEAR"
echo "============================="
END

if ! [ "$NR_REPEATS" -eq "$NR_REPEATS" ] 2>/dev/null; then
    echo "Repeat count should be a number"
    show_help
    exit 0;
fi

if [[ $ENABLE_SOCRAM_DUMP != "enable" ]] && [[ $ENABLE_SOCRAM_DUMP != "disable" ]] ; then
    echo "Valid input for srom dump are enable/disable"
    exit 0;
fi

if [ $MODE = "auto" ]; then
    fwid=$(wl -i $IFNAME ver | grep -c FWID)
    if [ $fwid = "1" ]; then
        MODE="dhd"
    else
        MODE="nic"
    fi
fi

if [[ $MODE != "nic" ]] && [[ $MODE != "dhd" ]]; then
    echo "UNKNOWN driver mode!"
    show_help
    exit 0
fi

SOCRAMDUMPFILE=${DUMPDIR}/socram_${IFNAME}

# Overwrite msglevel
WLMSGLVL=`wl -i $IFNAME msglevel | cut -d ' ' -f1`
wl -i $IFNAME msglevel 0
if [[ $MODE == "dhd" ]]; then
  echo -n $IFNAME DHD version = ; echo $($DHDCMD -i $IFNAME version)
  DHDMSGLVL=`dhd -i $IFNAME msglevel | cut -d ' ' -f1`
  $DHDCMD -i $IFNAME msglevel 0
fi

driver_init () {
    if [ $($WLCMD -i $IFNAME isup) -ne 1 ]; then
    echo -e "Interface $IFNAME is not up"
    exit 0
    fi
    $WLCMD -i $IFNAME bs_data -noreset > /dev/NULL 2>&1
    $WLCMD -i $IFNAME pktq_stats c:// a: m: p: n: b: > /dev/NULL 2>&1
    $WLCMD -i $IFNAME rx_report -noidle > /dev/NULL 2>&1
}

driver_info () {
    echo "============================="
    echo "$IFNAME Driver info"
    echo "============================="

    display_cmd_op "WLVERSION: wl -i $IFNAME ver" "$WLCMD -i $IFNAME ver"
    display_cmd_op "REVINFO: wl -i $IFNAME revinfo" "$WLCMD -i $IFNAME revinfo"
    display_cmd_op "DHDVERSION: dhd -i $IFNAME version" "$DHDCMD -i $IFNAME version"
    display_cmd_op "WLCAP: wl -i $IFNAME cap" "$WLCMD -i $IFNAME cap"
    display_cmd_op "UPTIME (sec): [System uptime] [sum of how much time each core spent idle] " "cat /proc/uptime"
}

wl_stats () {
    echo "============================================="
    echo "WL Statistics for $IFNAME"
    echo "============================================="

    display_cmd_op "STATUS: wl -i $IFNAME status" "$WLCMD -i $IFNAME status"
    display_cmd_op "ASSOCLIST: wl -i $IFNAME assoclist" "$WLCMD -i $IFNAME assoclist"
    for x in $($WLCMD -i $IFNAME assoclist);
    do
    if [ $x != assoclist ] ; then
        display_cmd_op "STAINFO: stainfo for $x" "$WLCMD -i $IFNAME sta_info $x"
    fi
    done
    for x in $($WLCMD -i $IFNAME assoclist);
    do
    if [ $x != assoclist ] ; then
        display_cmd_op "RSSI: rssi for $x" "$WLCMD -i $IFNAME rssi $x"
    fi
    done
    display_cmd_op "AUTH STA LIST: wl -i $IFNAME authe_sta_list" "$WLCMD -i $IFNAME authe_sta_list"
    display_cmd_op "SMFSTATS: wl -i $IFNAME smfstats" "$WLCMD -i $IFNAME smfstats" "smfstats" "clear"
    display_cmd_op "6G RATE: wl -i $IFNAME 6g_rate" "$WLCMD -i $IFNAME 6g_rate"
    display_cmd_op "5G RATE: wl -i $IFNAME 5g_rate" "$WLCMD -i $IFNAME 5g_rate"
    display_cmd_op "2G RATE: wl -i $IFNAME 2g_rate" "$WLCMD -i $IFNAME 2g_rate"
    display_cmd_op "NRATE: wl -i $IFNAME nrate" "$WLCMD -i $IFNAME nrate"
    display_cmd_op "RATE: wl -i $IFNAME rate" "$WLCMD -i $IFNAME rate"
    display_cmd_op "RATEDUMP: wl -i $IFNAME ratedump" "$WLCMD -i $IFNAME ratedump"
    display_cmd_op "11H SPECT: wl -i $IFNAME spect" "$WLCMD -i $IFNAME spect"
    display_cmd_op "PHY_ED_THRESH: wl -i $IFNAME phy_ed_thresh" "$WLCMD -i $IFNAME phy_ed_thresh"
    display_cmd_op "OPER MODE: wl -i $IFNAME oper_mode" "$WLCMD -i $IFNAME oper_mode"
    display_cmd_op "CHANIMSTATS: wl -i $IFNAME chanim_stats" "$WLCMD -i $IFNAME chanim_stats"
    display_cmd_op "INTERFERENCE: wl -i $IFNAME interference" "$WLCMD -i $IFNAME interference"
    display_cmd_op "INTERFERENCE_OVR: wl -i $IFNAME interference_override" "$WLCMD -i $IFNAME interference_override"
    display_cmd_op "BSDATA: wl -i $IFNAME bs_data -noreset" "$WLCMD -i $IFNAME bs_data -noreset"
    display_cmd_op "PKTQSTATS: wl -i $IFNAME pktq_stats" "$WLCMD -i $IFNAME pktq_stats c:// a: m: p: n: b:"
    display_cmd_op "RXREPORT: wl -i $IFNAME rx_report" "$WLCMD -i $IFNAME rx_report -noidle"
    display_cmd_op "TAF ATOS DUMP: wl -i $IFNAME dump taf -atos" "$WLCMD -i $IFNAME dump taf -atos"
    display_cmd_op "TXFIFO DUMP: wl -i $IFNAME dump txfifo" "$WLCMD -i $IFNAME dump txfifo"
    display_cmd_op "TXQ DUMP: wl -i $IFNAME dump txq" "$WLCMD -i $IFNAME dump txq"
    display_cmd_op "PERFSTATS DUMP: wl -i $IFNAME dump perf_stats" "$WLCMD -i $IFNAME dump perf_stats"
    display_cmd_op "AMPDU DUMP: wl -i $IFNAME dump ampdu" "$WLCMD -i $IFNAME dump ampdu" "dump_clear" "ampdu"
    display_cmd_op "AMSDU DUMP: wl -i $IFNAME dump amsdu" "$WLCMD -i $IFNAME dump amsdu"  "dump_clear" "amsdu"
    display_cmd_op "WLC DUMP: wl -i $IFNAME dump wlc" "$WLCMD -i $IFNAME dump wlc"
    display_cmd_op "TXBF DUMP: wl -i $IFNAME dump txbf" "$WLCMD -i $IFNAME dump txbf" "dump_clear" "txbf"
    display_cmd_op "MUTX DUMP: wl -i $IFNAME dump mutx" "$WLCMD -i $IFNAME dump mutx" "dump_clear" "mutx"
    display_cmd_op "MURX DUMP: wl -i $IFNAME dump murx" "$WLCMD -i $IFNAME dump murx"
    display_cmd_op "MSCHED DUMP: wl -i $IFNAME dump msched" "$WLCMD -i $IFNAME dump msched" "dump_clear" "msched"
    display_cmd_op "UMSCHED DUMP: wl -i $IFNAME dump umsched" "$WLCMD -i $IFNAME dump umsched" "dump_clear" "umsched"
    display_cmd_op "TWT DUMP: wl -i $IFNAME dump twt" "$WLCMD -i $IFNAME dump twt" "dump_clear" "twt"
    display_cmd_op "D11CNTS DUMP: wl -i $IFNAME dump d11cnts" "$WLCMD -i $IFNAME dump d11cnts" "dump_clear" "d11cnts"
    display_cmd_op "WME COUNTERS: wl -i $IFNAME wme counters" "$WLCMD -i $IFNAME wme_counters" "wme_clear_counters"
    display_cmd_op "INTERFACE COUNTERS: wl -i $IFNAME if_counters" "$WLCMD -i $IFNAME if_counters"
    display_cmd_op "COUNTERS: wl -i $IFNAME counters" "$WLCMD -i $IFNAME counters" "reset_cnts"
    display_cmd_op "MEMORY USAGE: wl -i $IFNAME memuse" "$WLCMD -i $IFNAME memuse"
    display_cmd_op "CHANNEL INFO: wl -i $IFNAME chan_info" "$WLCMD -i $IFNAME chan_info"
    display_cmd_op "DFS STATUS: wl -i $IFNAME dfs_status_all" "$WLCMD -i $IFNAME dfs_status_all"
    display_cmd_op "NOISE: wl -i $IFNAME noise" "$WLCMD -i $IFNAME noise"
    display_cmd_op "TEMPERATURE SENSOR: wl -i $IFNAME phy_tempsense" "$WLCMD -i $IFNAME phy_tempsense"
    display_cmd_op "BAND: wl -i $IFNAME band" "$WLCMD -i $IFNAME band"
    display_cmd_op "SCAN RESULTS: wl -i $IFNAME scanresults" "$WLCMD -i $IFNAME scanresults"
    display_cmd_op "MACMODE DUMP: wl -i $IFNAME macmode" "$WLCMD -i $IFNAME macmode"
    display_cmd_op "MAC DUMP: wl -i $IFNAME mac" "$WLCMD -i $IFNAME mac"
    display_cmd_op "RATELINKMEM: wl -i $IFNAME dump ratelinkmem" "$WLCMD -i $IFNAME dump ratelinkmem"
    display_cmd_op "LAST ADJ EST POWER: wl -i $IFNAME txpwr_adj_est" "$WLCMD -i $IFNAME txpwr_adj_est"
    display_cmd_op "BSS: wl -i $IFNAME bss" "$WLCMD -i $IFNAME bss"
    display_cmd_op "KEEP AP UP: wl -i $IFNAME keep_ap_up" "$WLCMD -i $IFNAME keep_ap_up"
    display_cmd_op "CEVENT: ceventc -i $IFNAME dump" "ceventc -i $IFNAME dump"
    ## Flush ceventc log
    #ceventc -i $IFNAME flush > /dev/NULL 2>&1
}

dhd_stats () {
    echo "================================="
    echo "DHD Statistics for $IFNAME"
    echo "================================="
    display_cmd_op "DHDDUMP: dhd -i $IFNAME DHD dump" "$DHDCMD -i $IFNAME dump"
    if [ $ENABLE_SOCRAM_DUMP = "enable" ] ; then
    mkdir $DUMPDIR
    display_cmd_op "SOCRAMDUMP: Uploading DUMP to $1" "$DHDCMD -i $IFNAME upload $1"
    fi
    $DHDCMD -i $IFNAME cons mu
}

host_side_dump () {
    ### host side dump
    echo "================================="
    echo "HOST Statistics"
    echo "================================="

    fcctl status;
    cat /proc/wfd/stats;
    cat /proc/fcache/stats/errors;
    cat /proc/fcache/stats/slow_path;
    if [[ $MODE == "dhd" ]]; then
    bs /d/r/pddc;
    bs /d/rdd pdfrc;
    fi

    cat /proc/net/igmp_snooping;
    cat /proc/fcache/misc/mcastlist;
    bs /b/e mcast;
    bs /b/e wlan_mcast;
    bs /b/e l2_ucast;
    ###
}

beacon_info () {
    echo "================================="
    echo "beacon content for $IFNAME"
    echo "================================="

    display_cmd_op "BEACON INFO: wl -i $IFNAME beacon_info" "$WLCMD -i $IFNAME beacon_info"
}

loop_commands () {
    NR_RUNS=`expr $NR_RUNS + 1`
    if [[ "$VERSION" -eq 2 ]]; then
        echo -e "\n==== Collecting data for run $NR_RUNS. Interval: $LOOP_TIME sec ===="
        if [[ "$DUMP_CLEAR" -eq 1 ]]; then
            echo "==== Previous WL dumps are cleared ===="
        fi
    fi
    sleep $LOOP_TIME
    echo "================================="
    echo "CPU Stats"
    echo "================================="
    mpstat -P ALL
    echo "================================="
    echo "Process status"
    echo "================================="
    ps -ax
    if [ $? != 0 ]; then
        ps
    fi
    top -n 1
    echo "================================="
    echo "Memory status"
    echo "================================="
    cat /proc/meminfo
    echo "================================="
    echo "Statistics for $IFNAME run $NR_RUNS/$NR_REPEATS @$LOOP_TIME s"
    echo "================================="
    wl_stats
    if [[ $MODE == "dhd" ]]; then
    dhd_stats "${SOCRAMDUMPFILE}_${NR_RUNS}"
    fi

    host_side_dump
    dmesg -c
}

if [ $MODE == "dhd" ]; then
$DHDCMD -i $IFNAME version > /dev/NULL 2>&1
if [ $? -ne 0 ] ; then
    echo -e "Bad Interface $IFNAME $?"
    show_help
    exit 0
fi
fi

$WLCMD -i $IFNAME ver > /dev/NULL 2>&1
if [ $? -ne 0 ] ; then
    echo "########### Dongle trap detected on $IFNAME ################"
    exit 0
fi

#driver_init
driver_info
#display_cmd_op "IFCONFIG: ifconfig -a" "ifconfig -a"
$WLCMD -i $IFNAME cevent 1 > /dev/NULL 2>&1
echo "================================="
echo "Statistics for $IFNAME first run"
echo "================================="

wl_stats

if [[ $MODE == "dhd" ]]; then
    $DHDCMD -i $IFNAME dconpoll 250
    dhd_stats "${SOCRAMDUMPFILE}_${NR_RUNS}"
    dmesg -c
fi

if [[ $NR_REPEATS -eq 0 ]]; then
    while true; do
        loop_commands
    done
else
while [[ $NR_REPEATS -gt $NR_RUNS ]]; do
    loop_commands
done
beacon_info
dump_hapd
dump_wpasupp
# restore msglevel
wl -i $IFNAME msglevel $WLMSGLVL
if [ $MODE == "dhd" ]; then
  dhd -i $IFNAME msglevel $DHDMSGLVL
fi

fi
