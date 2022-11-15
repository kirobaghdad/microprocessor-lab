; multi-segment executable file template.   
include 'emu8086.inc'
data segment
    ; add your data here!
    h db 2 dup(0),":","$"
    m db 2 dup(0),":","$"
    s db 2 dup(0),"$"
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

    ;Moving the cursor of the upper right corner of the screen
    mov ah, 02h
    mov dh, 0
    mov dl, 70
    int 10h


    ;Getting the system time
    mov ah, 2Ch
    int 21h

     
    ;Storing the time in the memory  
    mov ah, 0  
    mov al, ch 
    
    call number2string
    
    mov h+1, ah
    mov h, al  
    
    
    mov ah, 0
    mov al, cl 
    
    call number2string

    mov m+1, ah
    mov m, al   
    
    
    mov ah, 0
    mov al, dh   
    
    call number2string
    
    mov s+1, ah
    mov s, al
              
              
              
        
    ;Printing the system time
    mov dx, offset h
    mov ah, 9
    int 21h 

    mov dx, offset m
    mov ah, 9
    int 21h 
    
    mov dx, offset s
    mov ah, 9
    int 21h  
    
    
    ;Moving the cursor to the next line
    mov ah, 02h
    mov dh, 1
    mov dl, 70
    int 10h
    
    
    ;Getting the system date
    mov ah, 2ah
    int 21h  
    
      
    ;Printing the system date
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
    cmp al, 0
    je sun
    
    cmp al, 1
    je mon
    
    cmp al, 2
    je tue
    
    cmp al, 3
    je wed
    
    cmp al, 4
    je thu
    
    cmp al, 5
    je fri
    
    cmp al, 6
    je sat
    
    
    sun:
    print "Sunday"
    jmp cont
    
    mon:
    print "Monday"
    jmp cont
    
    tue:
    print "Tuesday"
    jmp cont
    
    wed:
    print "Wednesday"
    jmp cont
    
    thu:
    print "Thursday"
    jmp cont
    
    fri:
    print "Friday"
    jmp cont
    
    sat:
    print "Saturday"
    jmp cont
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        
    cont:
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends 


number2string proc
    mov ah, 0
    mov bl, 10
    
    div bl

    add ah, 30h
    
    add al, 30h
    
    ret 
number2string endp
    

end start ; set entry point and stop the assembler.
    
    