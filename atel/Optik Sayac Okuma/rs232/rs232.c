#include <18F452.h>

#use delay(clock=10000000)
#FUSES NOWDT                    //No Watch Dog Timer
#FUSES WDT128                   //Watch Dog Timer uses 1:128 Postscale
#FUSES HS                       //High speed Osc (> 4mhz)
#FUSES NOPROTECT                //Code not protected from reading
#FUSES NOBROWNOUT               //No brownout reset
#FUSES NOPUT                    //No Power Up Timer
#FUSES NOCPD                    //No EE protection
#FUSES STVREN                   //Stack full/underflow will cause reset
#FUSES NODEBUG                  //No Debug mode for ICD
#FUSES LVP                      //Low Voltage Programming on B3(PIC16) or B5(PIC18)


//====== LCD Tan?t?l?yor ==========//
#include <lcd.c>
#define use portd_lcd TRUE

//==============================/

//=======RS232 AYARLARI========//

#use rs232 (baud=9600,  xmit=pin_C6, rcv=pin_C7, parity=N, stop=1)

//=============================//



void main()
{

   setup_adc_ports(NO_ANALOGS);
   setup_adc(ADC_OFF);
   setup_psp(PSP_DISABLED);
   setup_spi(FALSE);
   setup_timer_0(RTCC_INTERNAL|RTCC_DIV_1);
   setup_timer_1(T1_DISABLED);
   setup_timer_2(T2_DISABLED,0,1);

while (TRUE) {

      printf("\r\nSinyali Baslatmak icin B tusuna basiniz");
      if (getchar() == 'b')         //e?er b tu?una basarsan
      {
         printf("\n1 hz sinyal aktif edildi\r");
            while (1) {
               output_high(PIN_B0);
               delay_ms(500);
               output_low(PIN_B0);
               delay_ms(500);
            }
      }
   }
}

