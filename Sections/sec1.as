org 100h    


.data
 m1 db "Enter The number :$ "
 m2 db 10,13, " Your number is above five $"
 m3 db 10,13, "Your number is bolw five $"
 m4 db 10,13, "Your number is equal five $"
 
.code

mov ah,09
mov dx,offset m1
int 21h

mov ah ,01
int 21h

sub al ,48
cmp al ,5

ja above
jb blow
je equal


above:
mov ah,09
mov dx,offset m2
int 21h
jmp finish

blow:
mov ah,09
mov dx,offset m3
int 21h
jmp finish    

equal:
mov ah,09
mov dx,offset m4
int 21h
jmp finish




finish :
mov ah ,00
int 21h
