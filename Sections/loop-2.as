org 100h    


.data 

 m1 db "Enter the number $"
 m2 db 10,13, "$"
 m3 db 10,13, "Enter Your counter $"
 num db 00
 count db ?
 
 
 
.code  

mov ah,09
mov dx,offset m1
int 21h

mov ah,01
int 21h

sub al ,48
mov num,al


mov ah,09
mov dx,offset m3
int 21h

mov ah,01
int 21h

sub al ,48
mov count,al

mov cl ,count

mov ah,09
mov dx,offset m2
int 21h


begin:
mov dl ,num
add dl ,30h

mov ah,02
int 21h

inc num

mov ah ,09
mov dx,offset m2
int 21h

loop begin
