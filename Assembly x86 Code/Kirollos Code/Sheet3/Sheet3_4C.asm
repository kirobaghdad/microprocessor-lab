; multi-segment executable file template.

data segment
    ; add your data here!
    OutData db 10 dup(0), "$"
    num dw 02h
    pkey db "press any key...$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here 
     
    mov ah, 1
    mov dl, 0
    
    
    ;Reading the 3 decimal digits
    mov ah, 1
    
    read:
    int 21h
    sub al, 30h
    mov bx, 64h
    mov ah, 0
    mul bx
    
    mov si, ax
    
    mov ah, 0
    mov dx, ax
     
    mov ah, 1
     
    int 21h
    
    mov bx, 10
    
    sub al, 30h 
    mov ah, 0
    mul bx
          
    add si, ax
    
    
    
          
    mov ah, 1
    
    int 21h
    sub al, 30h
    mov ah, 0
    
    add si, ax 
    
    
    
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    lea bx, OutData
    add bx, 9
    
    mov cx, 10
    mov dx, 0
    
    number:
    mov ax, si
    mov dx, 0
    div num
    add dl, 30h
    mov [bx], dl
    mov si, ax
    
    
    dec bx
    
    sub cx, 1
    jnz number  
    
    
    
    mov dx,13
    mov ah,2
    int 21h  
    mov dx,10
    mov ah,2
    int 21h
    
    
    lea dx, OutData
    mov ah, 9
    int 21h  
           
           
     mov dx,13
    mov ah,2
    int 21h  
    mov dx,10
    mov ah,2
    int 21h       
    
    
    
    
    
 ;   lea bx, InData
;    lea si, OutData
;    add si, 9
;        
;    ;From decimal to binary
;    
;    mov dx, [bx]
;    mov dh, 0
;    mov al, [bx+2]
;    mov ah, [bx+1]
;    
;    div num
;    
;    mov [si], ah
;      
;     
 
    
            
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
