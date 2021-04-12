-- Gabriel Calper
-- Serial Peripheral Interface
library ieee;
use ieee.std_logic_1164.all;

-- Finity State Machine
entity fsm_entity is 
    port
    (
    -- INPUT
        clk             : in std_logic;
        rst             : in std_logic;
        tx_enable       : in std_logic;
    -- OUTPUT
        mosi            : out std_logic;
        ss              : out std_logic;
        sclk            : out std_logic
    );
end entity;

architecture Behavior of fsm_entity is
    -- state enumaration
    type state is 
    (
        st_idle,    -- State Idle
        st_txBit7,
        st_txBit6,
        st_txBit5,
        st_txBit4,
        st_txBit3,
        st_txBit2,
        st_txBit1,
        st_txBit0
    );
    signal present_state, next_state: state;
    signal spi_sclk: std_logic;         -- the signal used for the clock of the SPI protocol
    constant data: std_logic_vector(7 downto 0):= "00001111";
begin
    p1: process (spi_sclk,rst)
    -- Update the state
    begin
        if(rst = '1' or (tx_enable = '0')) then
            present_state <= st_idle;
        elsif(spi_sclk'event and spi_sclk = '0') then
            present_state <= next_state;
        end if;
    end process;

    -- Circuit output and next states
    p2: process(present_state,tx_enable)
    -- Output the next stage
    begin
        case( present_state ) is
        
            when st_idle =>
                ss                  <=      '1';
                sclk                <=      '0';
                mosi                <=      'X';
            when st_txBit7 =>
                ss                  <=      '0';
                mosi                <=      data(7);
                next_state          <=      st_txBit6;
            when st_txBit6 =>
                ss                  <=      '0';
                mosi                <=      data(7);
                next_state          <=      st_txBit(6);
            when st_txBit4 =>
                ss                  <=      '0';
                mosi                <=      data(7);
                next_state          <=      st_txBit(6);
            when st_txBit3 =>
                ss                  <=      '0';
                mosi                <=      data(7);
                next_state          <=      st_txBit(6);
            when st_txBit2 =>
                ss                  <=      '0';
                mosi                <=      data(7);
                next_state          <=      st_txBit(6);
            when st_txBit1 =>
                ss                  <=      '0';
                mosi                <=      data(7);
                next_state          <=      st_txBit(6);
            when st_txBit0 =>
                ss                  <=      '0';
                mosi                <=      data(7);
                next_state          <=      st_txBit(6);
            
        end case ;

    end process;


end architecture;