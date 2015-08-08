`timescale 1 ns / 1 ps

module top(
//	inout  FTDI_DCD,
//	inout  FTDI_DSR,
	input  FTDI_DTR, // AKA reset pin
//	inout  FTDI_CTS,
//	inout  FTDI_RTS,
//	output FTDI_TX, // USB serial port transmit
//	input  FTDI_RX, // USE serial port recieve

	input ICE_CLK, // Oscilator clock

//	inout  EXPAN_J3_07,
//	inout  EXPAN_J3_10,
//	inout  EXPAN_J3_09,
//	inout  EXPAN_J3_08,
//	inout  EXPAN_J3_06,
//	inout  EXPAN_J3_05,
//	inout  EXPAN_J3_04,
//	inout  EXPAN_J3_03,

//	output SPI_SCLK, // SPI is connected to the flash
//	input  SPI_SI,
//	output SPI_SO,
//	output SPI_SS,

//	inout  PMOD_LEFT1,
//	inout  PMOD_LEFT2,
//	inout  PMOD_LEFT3,
//	inout  PMOD_LEFT4,
//	inout  PMOD_RIGHT1,
//	inout  PMOD_RIGHT2,
//	inout  PMOD_RIGHT3,
//	inout  PMOD_RIGHT4,

	output LED0, // Green 'PWR' LED
	output LED1,
	output LED2,
	output LED3,
	output LED4,

//	output IRDA_TXD,
//	input  IRDA_RXD,
//	output IRDA_SD,

//	inout  EXPAN_J1_03,
//	inout  EXPAN_J1_04,
//	inout  EXPAN_J1_05,
//	inout  EXPAN_J1_06,
//	inout  EXPAN_J1_07,
//	inout  EXPAN_J1_08,
//	inout  EXPAN_J1_09,
//	inout  EXPAN_J1_10

);
	localparam LOG2DELAY = 21;

	reg [5+LOG2DELAY-1:0] counter = 0;
	reg [4:0] grey;

	always@(posedge ICE_CLK) counter = counter + 1;
	bin2grey_5bit b2g( 
		.bin(counter>>LOG2DELAY),
		.grey(grey) 
	);

	assign { LED0, LED1, LED2, LED3, LED4 } = grey;

endmodule	
