; multi-segment executable file template.

data segment
    ; add your data here!
    msg db "What is your name?$"
    InData db 20 Dup(0)
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

    ;Clear Screen
    mov ax, 3
    int 10h
    
    ;Move the Cursor to X = 20 and Y = 15
    mov dl, 14H  ;X
    mov dh, 0FH  ;Y
    mov ah, 02H
    int 10H 
          
          
    ;Display the message
    lea dx, msg
    mov ah, 9
    int 21h
            
    
    ;Get Response  
    lea bx, InData
    read:
    mov ah, 01H
    int 21H
    cmp al, 13
    je move_cursor
    mov [bx], al
    inc bx
    jmp read 
          
          
    move_cursor:
    mov [bx], '$'
      
    ;Move the Cursor to X = 20 and Y = 17
    mov dl, 14H   ;X
    mov dh, 11H   ;Y
    mov ah, 02H
    int 10H
       
       
    ;Display the user Response
    lea dx, InData
    mov ah, 9
    int 21h 
     
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
