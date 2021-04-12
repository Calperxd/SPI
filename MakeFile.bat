ECHO OFF
CLS
ghdl -a main.vhd
ghdl -e fsm_entity
DEL *cf