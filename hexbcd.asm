TITLE Hello World Program
.model small
.stack 100
.data
array db 1,79,32,32,53
.code 
main proc far
    mov ax,@data
    mov ds,ax

        mov si,offset array
        mov bx,0
        mov ax,0
        mov cx,05
        l:
        add al,byte ptr [si]
        inc si
        loop l
        mov cx,10
        mov bx,00
        m:
        mov dx,0000
        div cx
        add dx,30h
        push dx
        inc bx
        cmp ax,0000h
        jne m

        mov cx,bx
        mov ah,02h
        
        n:
        pop dx
        int 21h
        loop n




    mov ax,4c00h
    int 21h
main endp
end