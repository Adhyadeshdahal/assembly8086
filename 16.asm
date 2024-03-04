;Write an assembly language program that takes a string input from user and clear
;the screen and move the string from right edge of the screen to left edge. The
;movement should be noticeable.

lower macro 
    push cx
    push si 
        cmp al,'A'
        jb outmacro
        cmp al,'Z'
        ja outmacro
        add al,32
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
startaddr db ?
exitaddr db ?

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
        lower
        mov byte ptr [si],al
        inc si
        jmp loopc

        lo:
            mov ax,0003h
            int 10h            

            mov startaddr,46h
            mov exitaddr,00h

            dloop:
                call delay
                
                mov ax,0003h
                int 10h

                mov ah,02h
                mov bh,00h
                mov dh,16h
                mov dl,startaddr
                int 10h

                inc byte ptr startaddr

                mov ah,09h
                lea dx,user
                add dx,02h
                int 21h

                mov al,startaddr
                cmp al,exitaddr
            jne dloop

    mov ax,4c00h
    int 21h
main endp
delay proc   
  mov cx, 7      ;HIGH WORD.
  mov dx, 0A120h ;LOW WORD.
  mov ah, 86h    ;WAIT.
  int 15h
  ret
delay endp 
end