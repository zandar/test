/*
 * AVR microcontroler testing program.
*/
#include <avr/io.h>
#define F_CPU 16000000  	/* 16MHz - takt MCU*/
#include <util/delay.h>


int main(void){

DDRB = 0xff;

while (1) {
	// red LED blinking
        PORTB = 2; // led ON
        _delay_ms(50);
        PORTB = 0;	// led OFF
        _delay_ms(500);
	}
	
}
