.model small
.stack 64
.data
row db 0
.code
start:

mov ah, 1
int 21h

sub al, 30h
push ax  

mov dx,13
mov ah,2
int 21h  
mov dx,10
mov ah,2
int 21h  

mov ah, 03h
mov bh, 0
int 10h 

mov row, dh
     
pop ax



mov ah, 0 
mov bx, 0


timer:
push ax
add ah, 30h 
mov dl, ah
mov ah, 02h
int 21h
pop ax  

push ax
add al, 30h 
mov dl, al
mov ah, 02h
int 21h
pop ax  

push ax  
mov cx, 0fh
mov dx, 4240h
mov ah, 86h
int 15h
pop ax   

cmp al, 9

je incTen
inc al
jmp continue
incTen:
mov al, 0
inc ah 

continue:
push ax
mov ah, 01h
int 16h
             
lahf
and ah, 01000000b    
cmp ah, 0   

je cont                     
           
mov ah, 02h
mov dh, row
mov dl, 0
mov bh, 0
int 10h 

pop ax

cmp ah, 0Ah

jne timer
  
cont:   
  
mov ax, 4c00h
int 21h
end start
.end