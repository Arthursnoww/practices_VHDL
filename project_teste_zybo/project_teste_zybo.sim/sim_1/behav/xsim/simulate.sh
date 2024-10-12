#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2022.2 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Thu Mar 14 23:42:02 -03 2024
# SW Build 3671981 on Fri Oct 14 04:59:54 MDT 2022
#
# IP Build 3669848 on Fri Oct 14 08:30:02 MDT 2022
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# simulate design
echo "xsim and_teste_behav -key {Behavioral:sim_1:Functional:and_teste} -tclbatch and_teste.tcl -log simulate.log"
xsim and_teste_behav -key {Behavioral:sim_1:Functional:and_teste} -tclbatch and_teste.tcl -log simulate.log

