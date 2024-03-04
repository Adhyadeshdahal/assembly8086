TITLE Hello World Program
.model small
.stack 100
.data
array db "hellOwOrld!",'$'
.code 
main proc far
    mov ax,@data
    mov ds,ax

        mov si,offset array
        again:
        mov al,byte ptr [si]
        cmp al,'$'
        je exit
        cmp al,'A'
        jb new
        cmp al,'Z'
        ja new
        add al,32
        mov byte ptr[si],al
        new:
            inc si
        jmp again
        exit:

        lea dx,array
        mov ah,09h
        int 21h
        


    mov ax,4c00h
    int 21h
main endp
end