TITLE add all the elements of a table 50,150
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
            cmp al,50
            jb down
            cmp al,150
            ja down
            add dx,al
            daa
        down:
            inc si
            loop l

        mov ax,dx
        mov cx,10
        mov ax,'$'
        push ax
        mov ax,dx
        again:
        mov dx,0000
        div cx
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