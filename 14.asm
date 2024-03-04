;Write an assembly language program to get string input from the user convert it to
;capital case display the attributed string at the center of the defined window (2,10
;to 22,70).

capital macro 
    push cx
    push si 
        cmp al,'a'
        jb outmacro
        cmp al,'z'
        ja outmacro
        sub al,32
    outmacro:
    pop si
    pop cx
endm

page 100,100
.model small
.stack 100
.data
user db 100,?,101 dup('$')
msg db "enter text:$"

.code 
main proc far
    mov ax,@data
    mov ds,ax

        mov ah,00h
        mov al,03h
        int 10h
        
        mov ah,09h
        mov dx,offset msg
        int 21h

        mov ah,0ah
        mov dx,offset user
        int 21h

   
        mov bx,00
        lea si,user
        inc si
        mov cx,0000
        mov cl,[si]
        add si,1


        mov ah,00
        loopc:
        mov al,[si]
        cmp al,'$'
        je lo
        capital
        mov byte ptr [si],al
        inc si
        jmp loopc

        lo:
            mov ax,0003h
            int 10h

            mov ah,02h
            mov bh,00h
            mov dh,03h
            mov dl,0fh
            int 10h

            mov ax,0614h
            mov bh,61h
            mov cx,020ah
            mov dx,1646h
            int 10h
            
            


            mov ah,09h
            lea dx,user
            add dx,02h
            int 21h

    mov ax,4c00h
    int 21h
main endp
end