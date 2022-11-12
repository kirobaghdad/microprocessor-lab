; multi-segment executable file template.

data segment
    Num1 db 7 dup(0)
    Num2 db 7 dup(0)
    Res  db 8 dup(0), "$"
    msg1 db "Enter the first number",13, 10,"$" 
    msg2 db "Enter the second number",13,10,"$"
    msg3 db "The total sum is:", 13, 10, "$" 
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
       
    ;First Number prompting message        
    lea dx, msg1
    mov ah, 9
    int 21h 
    
    ;Reading the First Number     
    lea bx, Num1
    read1:
    mov ah, 01H
    int 21H
    cmp al, 13
    je num2_prompt
    sub al, 30h
    mov [bx], al
    inc bx
    jmp read1 
             
    
    num2_prompt:
    ;Moving the Cursor to the next line
    mov dx,13
    mov ah,2
    int 21h  
    mov dx,10
    mov ah,2
    int 21h  
    
    ;Second Number prompting message 
    lea dx, msg2
    mov ah, 9
    int 21h  
    
    ;Reading the Second Number
    lea bx, Num2
    read2:
    mov ah, 01H
    int 21H
    cmp al, 13
    je S 
    sub al, 30h
    mov [bx], al
    inc bx
    jmp read2 
    
    
    ;Adding the 2 numbers
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    S:
    mov bx, offset Num1  
    add bx, 6
    mov si, offset Num2   
    add si, 6
    mov di, offset Res
    add di, 7
    
    mov cx, 7    
    mov ax, 0
    
    Sum:
    mov al, ah
    mov ah, 0
    add al, [bx]
    add al, [si]
    aaa
     
    mov [di], al
    
    dec bx
    dec si
    dec di
    mov [di], ah
    
    loop sum
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
       
       
     
    ;Converting the result into ascii characters
    mov cx, 8h   
           
    toAscii:
    add [di], 30h
    inc di          
    loop toAscii 
                      
                      
    ;Moving the Cursor to the next line   
    mov dx,13
    mov ah,2
    int 21h  
    mov dx,10
    mov ah,2 
    int 21h  
    
       
    ;Printing the Result
    lea dx, msg3
    mov ah, 9
    int 21h   
    
    lea dx, Res
    mov ah, 9
    int 21h

    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
