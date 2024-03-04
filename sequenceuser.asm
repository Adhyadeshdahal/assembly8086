;Write a program to add the sequence 1+3+4+... up to the desired steps entered by
;the user and display the result in decimal format. Assume user enters numbers
;from 1 to 9.

TITLE addition of sequence 1+3+5+...+100term
.model small
.stack 100
.data
msg db "enter the no of terms:$"

.code 
main proc far
    mov ax,@data
    mov ds,ax

        mov ah,09h
        mov dx,offset msg
        int 21h

        mov ah,01h
        int 21h
        sub al,30h
        mov ah,00h
        mov cx,ax

        mov ah,02h
        mov dl,' '
        int 21h

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