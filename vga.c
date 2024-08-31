#include "vga.h"

uint16_t column = 0;
uint16_t line = 0;
uint16_t* const vga =  (uint16_t* const) 0xB8000;
const uint16_t defaultColor =(COLOR8_BLACK << 8) | (COLOR8_LIGHT_GRRY << 12);
uint16_t currentColor = defaultColor;


void Reset(){

    line =0;
    column =0;
    currentColor = defaultColor;

    for(uint16_t y=0; y < height; y++){
        for(uint16_t x=0; x < width;  x++ ){
            vga[y * width + x] =' ' | defaultColor;
        }
        
    }

}

void NewLine(){
    if(line < height -1){
        line++;
        column = 0;
    }else{
        ScrollUp();
        column = 0;
    }

}


void ScrollUp(){


         for(uint16_t y=0; y < height;  y++ ){
                for(uint16_t x=0; x < width;  x++ ){
                vga[(y-1) * width + x] = vga[y*width+x] ; 
            }

            }
         for(uint16_t x=0; x < width;  x++ ){
            vga[(height-1) * width + x] =' ' | currentColor;

            }


}


void print(const char* S){

    while (*S)
    {
       switch (*S)
       {
       case '\n':
            newLine();
            break;
        case '\r':
            column = 0;
            break;      
        case '\t':
            if(column == width){
                 newLine();
            }
            uint16_t tabLen = 4 -(column % 4 );
            while (tabLen != 0)
            {
                vga[line * width +(column++)] = ' ' | currentColor;
                tabLen--;
            }
            

            break;  
       default:
            if (column == width)
            {
                newLine();
            }
                vga[line * width +(column++)] = *S | currentColor;
        break;
       }
       S++;
    }
    
}