module DE2_TOP (
    // Clock Input
    input         CLOCK_27,    // 27 MHz
    input         CLOCK_50,    // 50 MHz
    input         EXT_CLOCK,   // External Clock
    // Push Button
    input  [3:0]  KEY,         // Pushbutton[3:0]
    // DPDT Switch
    input  [17:0] SW,          // Toggle Switch[17:0]
    // 7-SEG Dispaly
    output [6:0]  HEX0,        // Seven Segment Digit 0
    output [6:0]  HEX1,        // Seven Segment Digit 1
    output [6:0]  HEX2,        // Seven Segment Digit 2
    output [6:0]  HEX3,        // Seven Segment Digit 3
    output [6:0]  HEX4,        // Seven Segment Digit 4
    output [6:0]  HEX5,        // Seven Segment Digit 5
    output [6:0]  HEX6,        // Seven Segment Digit 6
    output [6:0]  HEX7,        // Seven Segment Digit 7
    // LED
    output [8:0]  LEDG,        // LED Green[8:0]
    output [17:0] LEDR,        // LED Red[17:0]
    // UART
    output        UART_TXD,    // UART Transmitter
    input         UART_RXD,    // UART Receiver
    // IRDA
    output        IRDA_TXD,    // IRDA Transmitter
    input         IRDA_RXD,    // IRDA Receiver
    // SDRAM Interface
    inout  [15:0] DRAM_DQ,     // SDRAM Data bus 16 Bits
    output [11:0] DRAM_ADDR,   // SDRAM Address bus 12 Bits
    output        DRAM_LDQM,   // SDRAM Low-byte Data Mask 
    output        DRAM_UDQM,   // SDRAM High-byte Data Mask
    output        DRAM_WE_N,   // SDRAM Write Enable
    output        DRAM_CAS_N,  // SDRAM Column Address Strobe
    output        DRAM_RAS_N,  // SDRAM Row Address Strobe
    output        DRAM_CS_N,   // SDRAM Chip Select
    output        DRAM_BA_0,   // SDRAM Bank Address 0
    output        DRAM_BA_1,   // SDRAM Bank Address 0
    output        DRAM_CLK,    // SDRAM Clock
    output        DRAM_CKE,    // SDRAM Clock Enable
    // Flash Interface
    inout  [7:0]  FL_DQ,       // FLASH Data bus 8 Bits
    output [21:0] FL_ADDR,     // FLASH Address bus 22 Bits
    output        FL_WE_N,     // FLASH Write Enable
    output        FL_RST_N,    // FLASH Reset
    output        FL_OE_N,     // FLASH Output Enable
    output        FL_CE_N,     // FLASH Chip Enable
    // SRAM Interface
    inout  [15:0] SRAM_DQ,     // SRAM Data bus 16 Bits
    output [17:0] SRAM_ADDR,   // SRAM Address bus 18 Bits
    output        SRAM_UB_N,   // SRAM High-byte Data Mask 
    output        SRAM_LB_N,   // SRAM Low-byte Data Mask 
    output        SRAM_WE_N,   // SRAM Write Enable
    output        SRAM_CE_N,   // SRAM Chip Enable
    output        SRAM_OE_N,   // SRAM Output Enable
    // ISP1362 Interface
    inout  [15:0] OTG_DATA,    // ISP1362 Data bus 16 Bits
    output [1:0]  OTG_ADDR,    // ISP1362 Address 2 Bits
    output        OTG_CS_N,    // ISP1362 Chip Select
    output        OTG_RD_N,    // ISP1362 Write
    output        OTG_WR_N,    // ISP1362 Read
    output        OTG_RST_N,   // ISP1362 Reset
    output        OTG_FSPEED,  // USB Full Speed, 0 = Enable, Z = Disable
    output        OTG_LSPEED,  // USB Low Speed,  0 = Enable, Z = Disable
    input         OTG_INT0,    // ISP1362 Interrupt 0
    input         OTG_INT1,    // ISP1362 Interrupt 1
    input         OTG_DREQ0,   // ISP1362 DMA Request 0
    input         OTG_DREQ1,   // ISP1362 DMA Request 1
    output        OTG_DACK0_N, // ISP1362 DMA Acknowledge 0
    output        OTG_DACK1_N, // ISP1362 DMA Acknowledge 1
    // LCD Module 16X2
    inout  [7:0]  LCD_DATA,    // LCD Data bus 8 bits
    output        LCD_ON,      // LCD Power ON/OFF
    output        LCD_BLON,    // LCD Back Light ON/OFF
    output        LCD_RW,      // LCD Read/Write Select, 0 = Write, 1 = Read
    output        LCD_EN,      // LCD Enable
    output        LCD_RS,      // LCD Command/Data Select, 0 = Command, 1 = Data
    // SD Card Interface
    inout         SD_DAT,      // SD Card Data
    inout         SD_DAT3,     // SD Card Data 3
    inout         SD_CMD,      // SD Card Command Signal
    output        SD_CLK,      // SD Card Clock
    // I2C
    inout         I2C_SDAT,    // I2C Data
    output        I2C_SCLK,    // I2C Clock
    // PS2
    input         PS2_DAT,     // PS2 Data
    input         PS2_CLK,     // PS2 Clock
    // USB JTAG link
    input         TDI,         // CPLD -> FPGA (data in)
    input         TCK,         // CPLD -> FPGA (clk)
    input         TCS,         // CPLD -> FPGA (CS)
    output        TDO,         // FPGA -> CPLD (data out)
    // VGA
    output        VGA_CLK,     // VGA Clock
    output        VGA_HS,      // VGA H_SYNC
    output        VGA_VS,      // VGA V_SYNC
    output        VGA_BLANK,   // VGA BLANK
    output        VGA_SYNC,    // VGA SYNC
    output [9:0]  VGA_R,       // VGA Red[9:0]
    output [9:0]  VGA_G,       // VGA Green[9:0]
    output [9:0]  VGA_B,       // VGA Blue[9:0]
    // Ethernet Interface
    inout  [15:0] ENET_DATA,   // DM9000A DATA bus 16Bits
    output        ENET_CMD,    // DM9000A Command/Data Select, 0 = Command, 1 = Data
    output        ENET_CS_N,   // DM9000A Chip Select
    output        ENET_WR_N,   // DM9000A Write
    output        ENET_RD_N,   // DM9000A Read
    output        ENET_RST_N,  // DM9000A Reset
    input         ENET_INT,    // DM9000A Interrupt
    output        ENET_CLK,    // DM9000A Clock 25 MHz
    // Audio CODEC
    inout         AUD_ADCLRCK, // Audio CODEC ADC LR Clock
    input         AUD_ADCDAT,  // Audio CODEC ADC Data
    inout         AUD_DACLRCK, // Audio CODEC DAC LR Clock
    output        AUD_DACDAT,  // Audio CODEC DAC Data
    inout         AUD_BCLK,    // Audio CODEC Bit-Stream Clock
    output        AUD_XCK,     // Audio CODEC Chip Clock
    // TV Decoder
    input  [7:0]  TD_DATA,     // TV Decoder Data bus 8 bits
    input         TD_HS,       // TV Decoder H_SYNC
    input         TD_VS,       // TV Decoder V_SYNC
    output        TD_RESET,    // TV Decoder Reset
    // GPIO
    inout  [35:0] GPIO_0,      // GPIO Connection 0
    inout  [35:0] GPIO_1       // GPIO Connection 1
);

   // Turn on all display
   assign LCD_ON    = 1'b1;
   assign LCD_BLON  = 1'b1;
   
   // All inout port turn to tri-state
   assign FL_DQ     = 8'hzz;
   assign SRAM_DQ   = 16'hzzzz;
   assign OTG_DATA  = 16'hzzzz;
   assign LCD_DATA  = 8'hzz;
   assign SD_DAT    = 1'bz;
   assign ENET_DATA = 16'hzzzz;
   assign GPIO_0    = 36'hzzzzzzzzz;
   assign GPIO_1    = 36'hzzzzzzzzz;

   wire   clk_200;
   wire   clk_50, clk_50_m3ns;
   wire   clk_16_8;
   wire   pll_locked;
   assign clk_50 = CLOCK_50;
   system_pll system_pll0(.inclk0(clk_50),
                          .c0(clk_200),
                          .c1(clk_16_8),
                          .c2(clk_50_m3ns),
                          .locked(pll_locked));

   wire   global_reset;
   assign global_reset = ~pll_locked | ~KEY[0];

   wire [7:0] leds;
   wire [7:0] gps_data;
   data_feed_nios data_feed(.clk_0(clk_50),
                            .reset_n(~global_reset),
                            .rxd_to_the_data_uart(UART_RXD),
                            .txd_from_the_data_uart(UART_TXD),
                            .out_port_from_the_gps_data(gps_data),
                            .out_port_from_the_leds(leds),
                            .zs_addr_from_the_sdram(DRAM_ADDR),
                            .zs_ba_from_the_sdram({DRAM_BA_1,DRAM_BA_0}),
                            .zs_cas_n_from_the_sdram(DRAM_CAS_N),
                            .zs_cke_from_the_sdram(DRAM_CKE),
                            .zs_cs_n_from_the_sdram(DRAM_CS_N),
                            .zs_dq_to_and_from_the_sdram(DRAM_DQ),
                            .zs_dqm_from_the_sdram({DRAM_UDQM, DRAM_LDQM}),
                            .zs_ras_n_from_the_sdram(DRAM_RAS_N),
                            .zs_we_n_from_the_sdram(DRAM_WE_N),
                            .in_port_to_the_start(~KEY[3]));
   assign DRAM_CLK = clk_50_m3ns;

   reg [7:0] count;
   always @(posedge gps_data[3]) begin
      count <= gps_data[7] ? 'h0 : count+'h1;
   end
   
   assign HEX7 = gps_data[7] ? 7'h7F : {~gps_data[2],6'h3F};
   HexDriver gps_display1(gps_data[7] ? 4'h8 : {2'h0,gps_data[1:0]},HEX6);

   wire [15:0] accumulator;
   wire [9:0] codeShift;
   wire ca_bit;
   wire ca_clk;
   Track track(.clk(gps_data[3]),
               .reset(gps_data[7]),
               .enable(1'b1),
               .prn(SW[4:0]),
               .basebandInput(gps_data[2:0]),
               .caBit(ca_bit),
               .caClk(ca_clk),
               .codeShift(codeShift),
               .accumulator(accumulator));

   assign HEX5 = gps_data[7] ? 7'h7F : {ca_bit,6'h3F};
   HexDriver gps_display0(gps_data[7] ? 4'h8 : 4'h1,HEX4);
   
   assign LEDR[17] = gps_data[7];
   assign LEDR[16] = gps_data[3];
   assign LEDR[15] = ca_clk;
   assign LEDR[14:12] = gps_data[2:0];
   assign LEDR[11:5] = 'h0;
   assign LEDR[4:0] = SW[4:0];
   assign LEDG = codeShift[8:0];
   HexDriver acc_display3(SW[17] ? count[7:4] :
                          ~KEY[2] ? 'h0 :
                          accumulator[15:12],
                          HEX3);
   HexDriver acc_display2(SW[17] ? count[3:0] :
                          ~KEY[2] ? 'h0 :
                          accumulator[11:8],
                          HEX2);
   HexDriver acc_display1(~SW[17] && ~KEY[2] ? count[7:4] : accumulator[7:4],HEX1);
   HexDriver acc_display0(~SW[17] && ~KEY[2] ? count[3:0] : accumulator[3:0],HEX0);
endmodule