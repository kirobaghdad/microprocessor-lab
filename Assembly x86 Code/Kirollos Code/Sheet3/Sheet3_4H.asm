.model small
.stack 64
.data
.code

start:
; set segment registers:
    mov ax, @data
    mov ds, ax
    mov es, ax

    ; Changing the screen to the graphical mode
    mov ah, 0
    mov al, 13h
    int 10h
    
    
    ;Changing the background color to white
    mov ah, 0ch
    mov al, 0fh
    mov dx, 0
    
    row:
    mov cx, 0
    col:
    int 10h
    inc cx
    cmp cx, 320
    jne col
    inc dx
    cmp dx, 200
    jne row 
    
    
    
    ;Drawing a triangle
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov ah, 0ch
    mov cx, 100     ;Col
    mov si, 100     ;Col
    mov al, 2h
    mov dx, 30      ;Row
    
    
    int 10h
    
    triangle0:
    inc dx
    inc si
    dec cx
    int 10h
    push cx
    mov cx, si
    int 10h
    pop cx
    cmp dx, 50
    jne triangle0  
    
    
    inc dx
    dec cx
    inc si
    
    triangle1:
    int 10h
    inc cx
    cmp cx, si
    jne triangle1   
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   
    
    
    
    
    ;Drawing a square 
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov al, 1
    add dx, 20
    mov cx, 80
    mov si, 40
    
    
    square0:
    int 10h
    push dx
    add dx, si
    int 10h
    pop dx
    inc cx
    cmp cx, 121
    jne square0
         
    
    inc dx
    mov cx, 80     
         
    square1:
    int 10h
    push cx
    add cx, si
    int 10h
    pop cx
    inc dx
    cmp dx, 112
    jne square1
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    
    ;Drawing a rectangle
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov al, 0eh 
    add dx, 20
    mov cx, 80
    mov si, 40
    mov di, 60
    
    
    rect0:
    int 10h
    push dx
    add dx, si
    int 10h
    pop dx
    inc cx
    cmp cx, 140
    jne rect0
    
     
    inc dx
    mov cx, 80     
         
    rect1:
    int 10h
    push cx
    add cx, di
    int 10h
    pop cx
    inc dx
    cmp dx, 171
    jne rect1 
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
            
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
end start

.end ; set entry point and stop the assembler.
