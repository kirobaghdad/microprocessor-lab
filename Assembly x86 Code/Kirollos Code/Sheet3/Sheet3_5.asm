; multi-segment executable file template.

data segment
    ; add your data here!
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
    lea dx, pkey
    mov ah, 9
    int 21h   
    
    mov ah, 05h
    mov al, 01
    int 10h
    
    
    mov ah, 0
    mov al, 13h
    int 10h
    
    mov cx, 0
    
    read:
    mov ah,1
    int 21h
    
    cmp al, 0
    je incr
    jne x
    
    incr:
    inc cx
    jmp read
    
    x:
    mov ah, 0
    mov al, 03h
    int 10h
    
    mov ah, 05h
    mov al, 0
    int 10h
   
    add cx, 30h
    mov bl, cl 
       
    mov dx,13
    mov ah,2
    int 21h  
    mov dx,10
    mov ah,2
    int 21h    
       
    mov al, bl
    mov ah, 0Ah
    mov bh, 0
    mov cx, 1
    int 10h
        
 
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
