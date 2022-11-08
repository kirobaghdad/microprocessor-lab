; multi-segment executable file template.

data segment
    ; add your data here!    
    data1 dw 0D37EH, 0F8A8H, 5463H
    data2 dw 92C2H, 3408H, 87DEH
    res dw 3 dup(0)
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
    
    lea bx, data1
    lea si, data2
    lea di, res + 4
    mov cx, 3
    mov ah, 0
    mov al, 0
    clc
         
    ;Sum in DX
    sum: 
    
    mov dx , 0
    and ah, 01h
    add dl, ah
    add dx, [bx]
    add dx, [si]
    
    mov [di], dx
    
    lahf     
         
    add bx, 2
    add si, 2
    sub di, 2     
    
    dec cx
    
    jnz sum
     
     
    ;Problem in Printing ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
     
    ;Printing 
    
    
    print_hex:
    mov cx, 3H
    
    
    print:
    mov bx, [res]
     
    ;First Char 
    rol bx, 4
    mov dl, bl
    and dl, 0FH
    add dl, '0'
    cmp dl, '9'
    jbe .ok
    add dl, 7
    
    .ok:
    push bx
    mov ah, 2
    int 21H 
    pop bx
        
        
    ;Second Char     
    rol bx, 4
    mov dl, bl
    and dl, 0FH
    add dl, '0'
    cmp dl, '9'
    jbe .ok1
    add dl, 7
    
    .ok1:
    push bx
    mov ah, 2
    int 21H 
    pop bx
    inc bx     
      
      
    ;Third Char
    rol bx, 4
    mov dl, bl
    and dl, 0FH
    add dl, '0'
    cmp dl, '9'
    jbe .ok2
    add dl, 7
    
    .ok2:
    push bx
    mov ah, 2
    int 21H 
    pop bx
    inc bx 
    
    ;Fourth Char
    rol bx, 4
    mov dl, bl
    and dl, 0FH
    add dl, '0'
    cmp dl, '9'
    jbe .ok3
    add dl, 7
    
    .ok3:
    push bx
    mov ah, 2
    int 21H 
    pop bx
    inc res 
         
    
    loop print
     
;    
;    
;    print: 
;    mov bl, [di]
;    sub bl,
;    mov bx, 07H 
;         
;    lea dx, bx
;    mov ah, 9
;    int 21h        ; output string at ds:dx
;    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
