;Write an assembly language program to generate a multiplication table of any
;number entered by the user. Display the table in the screen.
.model small
.stack 100
.data 
msg db "enter no(0-9):$"
n db ?
mulp db 10 dup(?)
amulp db 30 dup("$")
.code 
main proc far
    mov ax,@data
    mov ds,ax

    mov ax,0003h
    int 10h

    mov ah,01h
    int 21h

    sub al,30h
    mov byte ptr n,al

    mov ax,0003h
    int 10h

    lea di,mulp
    mov cx,10
    mov al,n
    mov bl,0
    mult:
        add al,bl
        mov [di],al
        inc di
        mov bl,byte ptr n
    loop mult

    lea si,mulp
    lea di,amulp
    mov cx,10

    again:
        push cx
        mov cx,00
        mov bx,10
        mov ax,0
        mov al,[si]
        inc si
        stackop:
            mov dx,00
            inc cx
            div bx
            add dx,30h
            push dx
            cmp al,0
        jne stackop

        mov ah,02h
        displ:
            pop dx
            int 21h
        loop displ
        mov dl,' '
        int 21h
        pop cx
    loop again
    call delay
main endp
delay proc   
  mov cx, 7      ;HIGH WORD.
  mov dx, 0A120h ;LOW WORD.
  mov ah, 86h    ;WAIT.
  int 15h
  ret
delay endp 
end