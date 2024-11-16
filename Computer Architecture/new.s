;;; Directives
 PRESERVE8
 THUMB 
; Vector Table Mapped to Address 0 at Reset
; Linker requires __Vectors to be exported
 AREA RESET, DATA, READONLY
 EXPORT __Vectors
__Vectors 
 DCD 0x20001000 
 ; stack pointer value when stack is empty
 DCD Reset_Handler ; reset vector
 ALIGN
; The program
; Linker requires Reset_Handler
 AREA MYCODE, CODE, READONLY
 ENTRY
 EXPORT Reset_Handler
Reset_Handler
;;;;;;;;;;User Code Starts from the next 
line;;;;;;;;;;;;

 MOV R0, #50 ; R0 = 4
 WHILE
 CMP R0, #0 
 BEQ THERE 
 SUB R0, R0, #10
 B WHILE 
THERE
STOP  
 
 END 