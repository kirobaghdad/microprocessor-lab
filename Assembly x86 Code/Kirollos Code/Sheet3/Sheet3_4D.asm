; multi-segment executable file template.

data segment
    res db 2 dup(0),"$"
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
     
    lea di, res  
    mov si, 2h  
    
    
    ;Converting from binary to hexdecimal   
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    x:
    mov dx, 0 
    mov cx, 4
    mov bl, 8
    
    read:
    mov ah, 01h
    mov bh, 0
    int 21h
      
    sub al, 30h    
    mul bl
    add dl, al 
    mov ah, 0
    mov al, bl
    mov ch, 2h
    div ch
    mov ch, 0 
    mov bl, al
    loop read
             
    cmp dl, 9
    
    jg y
    sub dl, 7h
    y:
    add dl, 37h
    
    mov [di], dl
    inc di
    sub si, 1   
    jnz x   
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    
    ;Moving the Cursor to the next line
    mov dx,13
    mov ah,2
    int 21h  
    mov dx,10
    mov ah,2
    int 21h   
        
        
    ;Printing the number in hexdecimal form
    lea dx, res
    mov ah, 9
    int 21h
           
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
