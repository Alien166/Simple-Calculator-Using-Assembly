org 100h    


.data 

 m1 db "Enter the limit of loop $"
 m2 db 10,13, "$"
 m3 db 10,13, "sucsessfully terminted $"
 
 
 
.code  

mov ah,09
mov dx,offset m1
int 21h

mov ah,01
int 21h

sub al ,48
mov cl,al


mov ah,09
mov dx,offset m2
int 21h

mov bl,0
cmp cl,bl
je finish


start:
add bl ,30h
mov dl,bl
mov ah,02
int 21h

inc bl

sub bl,30h

mov ah,09
mov dx,offset m2
int 21h

cmp cl,bl
jne start 

finish:
mov ah,09
mov dx,offset m3
int 21h
