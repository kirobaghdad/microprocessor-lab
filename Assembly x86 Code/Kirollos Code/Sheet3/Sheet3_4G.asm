; multi-segment executable file template.

data segment
    ; add your data here!
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

    ;Changing the screen to graphical mode
    mov ah, 0
    mov al, 13h
    int 10h       
    
    
    ;Drawing the horizontal line
    mov al, 2h  ;Green Color
    mov ah, 0ch
    mov dx, 100
    
    mov cx, 0
    
    horizontal_line:
    int 10h
    inc cx
    cmp cx, 320 
    jne horizontal_line
    
    
    
    ;Drawing the vertical line
    mov al, 0Eh  ;Yellow Color
    mov cx, 160
    
    mov dx, 0
    
    vertical_line:
    int 10h
    inc dx
    cmp dx, 200
    jne vertical_line:
            
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
