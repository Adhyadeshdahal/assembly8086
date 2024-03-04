;Write a program to add the sequence 1+3-+-4+... up to 100 steps display the result
;in hexadecimal format.

TITLE addition of sequence 1+3+5+...+100term
.model small
.stack 100
.data
.code 
main proc far
    mov ax,@data
    mov ds,ax


        mov cx,64h
        mov bx,01h
        mov ax,00h

        sum:
        add ax,bx
        add bx,02h
        loop sum

        mov cx,10
        mov bx,00
        string:
        xor dx,dx
        inc bx
        div cx
        add dx,'0'
        push dx
        cmp ax,0
        jne string

        mov cx,bx
        mov ah,02h
        display:
        pop dx
        int 21h
        loop display


    mov ax,4c00h
    int 21h
main endp
end