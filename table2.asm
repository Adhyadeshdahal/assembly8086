TITLE add all the elements of a table 30,100
.model small
.stack 100
.data
array db 50,70,32,53,12,50
sized db 6
.code 
main proc far
    mov ax,@data
    mov ds,ax
    
        lea si,array
        mov dx,00
        mov cx,byte ptr sized
        l:
            mov ax,byte ptr [si]
            cmp al,30
            jb down
            cmp al,100
            ja down
            add dx,al
        down:
            inc si
            loop l

        mov ax,dx
        mov cx,16
        mov ah,00
        mov al,'$'
        push ax
        mov ax,dx
        again:
        mov dx,0000
        div cx
        cmp dx,09
        jbe t
        add dx,07h
        t:
        add dx,30h
        push dx
        cmp ax,00
        jne again
        mov ah,02h

        up: 
            pop dx
            cmp dl,'$'
            je out
            int 21h
            jmp up
        

    out:
    mov ax,4c00h
    int 21h
main endp
end