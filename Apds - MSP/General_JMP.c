#include <msp430.h>
#include "General_JMP.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
/*
 * General_JMP.c
 *
 *  Created on: Oct 26, 2016
 *      Author: jose.montes1
 *
 * A collection of of general methods utilized
 * for the msp430 platform
 *
 *
 */

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////// Timer Commands ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

char delayC;			// Determines wether the interrupt utilizes the timer for delayCs or other functions



/*\****************************************************************
 *Function Description
 *		Disables interrupts that you dont want to interrupt a delay
 *Parameters
 *		On - set 1 to enable interrupts and set a 0 to disable the
 *			interrupts
 *
 *\****************************************************************/

void interrupts(char on){
	if(on){

	}
	else{
	}
}

/*\****************************************************************
 *Function Description
 *		Delays the micro a certain amount of time while setting
 *		it in low power mode.
 *Parameters
 *		Miliseconds - miliseconds to wait
 *
 *\****************************************************************/

void delay(unsigned long miliSeconds){
	delayC = 1;						// Turn on timer delayCs
	unsigned long operations = (32768*miliSeconds)/1000;
	TB0CTL |= TBCLR; 				// Clear Timer content
	TB0CCR0 = operations;			// Set the timer period
	TB0CTL |= TBSSEL_1;				// Use aclk
	TB0CTL |= MC_1;					// Use up mode

	interrupts(0);					// Disable interrupts
	TB0CCTL0 |= CCIE;				// Enable Interrupt
	__bis_SR_register(GIE + LPM0_bits);	// halt cpu
	interrupts(1);					// Enable interrupts


	return;
}

/*\****************************************************************
 *Function Description
 *		Delays the micro a certain amount of time while setting
 *		it in low power mode.
 *Parameters
 *		Miliseconds - miliseconds to wait
 *
 *\****************************************************************/

void delaySeconds(unsigned long seconds){
	delayC = 1;						//Turns off timer delayCs
	unsigned long operations = 512*seconds;
	TB0CTL |= TBCLR; 				// Clear Timer content
	TB0CCR0 = operations;			// Set the timer period
	TB0CTL |= TBSSEL_1 + ID_3;		// Use aclk and divide by 8
	TB0EX0 |= 0b111;				// Divide by 8
	TB0CTL |= MC_1;					// Use up mode
	TB0CCTL0 |= CCIE;				// Enable Interrupt
	__bis_SR_register(GIE + LPM0_bits);	// halt cpu
	return;
}

unsigned char *timeExcedded;
void timeExceed(int seconds, unsigned char *dest){
	delayC = 0;						//Turns off timer delayCs
	timeExcedded = dest;			//Set the external variable
	*timeExcedded = 0;				//Initialize value to zero
	unsigned long operations = 512*(seconds);
	TB0CTL |= TBCLR; 				// Clear Timer content
	TB0CCR0 = operations;			// Set the timer period
	TB0CTL |= TBSSEL_1 + ID_3;		// Use aclk and divide by 8
	TB0EX0 |= 0b111;				// Divide by 8
	TB0CTL |= MC_1;					// Use up mode
	TB0CCTL0 |= CCIE;				// Enable Interrupt
}


/*\****************************************************************
 *Function Description
 *		Stops the current timer without affecting its value
 *Parameters
 *
 *
 *\****************************************************************/

void inline stopDelay(){
	TB0CTL &= ~MC_1;					// Use up mode
}

/*\****************************************************************
 *Function Description
 *		Starts the current timer wihtout affecting its value
 *Parameters
 *
 *
 *\****************************************************************/


void inline startDelay(){
	TB0CTL |= MC_1;					// Use up mode
}



/*\****************************************************************
 *Function Description
 *		Timer B interrupt. Disables the running timer delayC
 *Parameters
 *
 *
 *\****************************************************************/

#pragma vector = TIMER0_B0_VECTOR
__interrupt void TIMER_B0(void){
	if(delayC){
		LPM0_EXIT;
	}else{
		*timeExcedded = 1;
	}
	TB0CTL &= ~MC_1;				//Stop timer
	TB0CTL |= MC_0;					//Make sure its stopped
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////// Number methods

/*\****************************************************************
 *Function Description
 *		Reverse the char array you input
 *Parameters
 *
 *
 *\****************************************************************/


void reverse(char s[]){
    int i, j;
    char c;

    for (i = 0, j = strlen(s)-1; i<j; i++, j--) {
        c = s[i];
        s[i] = s[j];
        s[j] = c;
    }
}

/*\****************************************************************
 *Function Description
 *		Converts an integet into a char array
 *Parameters
 *		n - number to convert
 *		s - array to fill
 *
 *\****************************************************************/


void itoa(int n, char s[]){
     int i, sign;

     if ((sign = n) < 0)  /* record sign */
         n = -n;          /* make n positive */
     i = 0;
     do {       /* generate digits in reverse order */
         s[i++] = n % 10 + '0';   /* get next digit */
     } while ((n /= 10) > 0);     /* delete it */
     if (sign < 0)
         s[i++] = '-';
     s[i] = '\0';
     reverse(s);
 }

