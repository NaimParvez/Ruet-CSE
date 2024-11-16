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
 
 ; R1 = 0x46A1F1B7
 MOV R1,#50
while
 CMP R1,#0
 BEQ Done
 SUB R1,R1,#10
 B while
  
Done
 END ;End of the program
