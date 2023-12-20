org 100h    


.data
 m1 db 10,13, "Enter The first number :$ "
 m2 db 10,13, "Enter The second number $"
 m3 db 10,13, "Enter your operator option" ,10,13, "$"
 m4 db 10,13, "$"
 m5 db 10,13, " Do you want to anther operation ? if yes press 1 , if no press 0 " ,10,13, "$" 
 m6 db 10,13, "Worng input" ,10,13, "$"
 
.code


cal:
mov ah,09
mov dx,offset m1
int 21h

mov ah ,01
int 21h

mov bl ,al
sub bl ,30h

mov ah,09
mov dx,offset m2
int 21h

mov ah ,01
int 21h

mov cl ,al
sub cl ,30h


mov ah,09
mov dx,offset m3
int 21h 

mov ah,01
int 21h 


cmp al , '+'
je toadd 

cmp al , '-'
je tosub 

cmp al , '*'
je tomul 

cmp al , '/'
je todiv 



toadd:
mov ah,09
mov dx,offset m4
int 21h  

add bl,cl
add bl,30h

mov dl,bl
mov ah,02 
int 21h
jmp repeat
         
         

tosub:
mov ah,09
mov dx,offset m4
int 21h  

sub bl,cl
add bl,30h

mov dl,bl
mov ah,02
int 21h
jmp repeat

    

tomul:
mov ah,09
mov dx,offset m4
int 21h  

mov al,bl
mul cl
mov dl,al
add dl,30h
mov ah,02
int 21h
jmp repeat   


todiv:
mov ah,09
mov dx,offset m4
int 21h  

mov ah,00
mov al,bl
div cl
mov dl,al
add dl ,30h
mov ah,02 
int 21h
jmp repeat



towrong:
mov ah,09
mov dx,offset m6
int 21h

repeat:
mov ah,09
mov dx ,offset m5
int 21h

mov ah,01
int 21h

sub al ,30h

cmp al , 1
je cal

cmp al,0
je finish


finish :
mov ah ,00
