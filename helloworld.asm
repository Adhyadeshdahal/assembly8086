TITLE Hello World Program
.model small
.stack 100
.data
msg db "Hello World!$"
.code 
main proc far
    mov ax,@data
    mov ds,ax
    lea dx,msg
    mov ah,09h
    int 21h
    mov ax,4c00h
    int 21h
main endp
end