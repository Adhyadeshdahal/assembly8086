TITLE get input and print at 10,20
.model small
.stack 100
.data
array db 100,?,100 dup('$'),'$'
.code 
main proc far
    mov ax,@data
    mov ds,ax

        mov dx,offset array
        mov ah,0ah
        int 21h

        mov ah,00
        mov al,03
        int 10h

        mov dh,10
        mov dl,20
        mov ah,02
        int 10h

        mov ah,09h
        mov dx,offset array
        add dx,02
        int 21h


    mov ax,4c00h
    int 21h
main endp
end