;Write an assembly language program to display graphical ASCII characters from
;32 to 127 on a defined window (5,10 and 20,70) with white on blue attribute.
.model small
.stack 100
.data
.code 
main proc far
    mov ax,@data
    mov ds,ax

        mov ah,00h
        mov al,03h
        int 10h
        

        mov ah,02
        mov dh,0
        mov dl,10
        int 10h

        mov al,32
        mov bl,20h
        mov cx,1
        mov ah,09h
        display_l:
        mov ah,09h
        int 10h
        inc al
        mov ah,02
        inc dh
        int 10h
        cmp al,127
        jne display_l






    mov ax,4c00h
    int 21h
main endp
end
