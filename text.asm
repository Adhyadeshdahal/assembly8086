TITLE display text 
.model small
.stack 100
.data
msg db 100,?,100 dup('$')
msg1 db "Enter text:$"
.code 
main proc far
    mov ax,@data
    mov ds,ax

    lea dx,msg1
    mov ah,09h
    int 21h

    lea dx,msg
    mov ah,0ah
    int 21h

    mov ah,00h
    mov al,03h
    int 10h

    mov ah,02h
    mov bl,24
    mov dh,12h
    mov dl,20h
    int 10h

    lea dx,msg
    add dx,02h
    mov ah,09h
    int 21h









    mov ax,4c00h
    int 21h
main endp
end