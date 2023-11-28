org 100h

.data
     
m1 db 10,13, "enter the first number: $"
m2 db 10,13, "enter the second number: $"
m3 db 10,13, "enter the operator: $"
m4 db 10,13, "the result = $"
m5 db 10,13, "do you want another operation? if yes press 1 if no press 0",10,13, "$"
m6 db 10,13, "wrong input",10,13,"$"

.code

calc:
mov ah,09
mov dx,offset m1
int 21h

mov ah,01
int 21h

mov bl,al
sub bl,30h

mov ah,09
mov dx,offset m2
int 21h

mov ah,01
int 21h

mov bh,al
sub bh,30h

mov ah,09
mov dx,offset m3
int 21h

mov ah,01
int 21h

cmp al,'+'
je addition

cmp al,'-'
je subtraction 

cmp al,'*'
je multiplication

cmp al,'/'
je division

addition:
mov ah,09
mov dx,offset m4
int 21h

add bl,bh
add bl,30h

mov dl,bl  

mov ah,02
int 21h
jmp repeat

subtraction: 
mov ah,09
mov dx,offset m4
int 21h

sub bl,bh
add bl,30h

mov dl,bl 

mov ah,02
int 21h
jmp repeat

multiplication: 
mov ah,09
mov dx,offset m4
int 21h

mov al,bl
mul bh

mov dl,al
add dl,30h  

mov ah,02
int 21h
jmp repeat

division:   
mov ah,09
mov dx,offset m4
int 21h

mov ah,00
mov al,bl
div bh 

mov dl,al
add dl,30h

mov ah,02
int 21h
jmp repeat

repeat:
mov ah,09
mov dx,offset m5
int 21h

mov ah,01
int 21h

cmp al,'1'
je calc

cmp al,'0'
je finish

jne wrong

wrong:
mov ah,09
mov dx,offset m6
int 21h
mov ah,00
int 21h

finish:
mov ah,00
int 21h
