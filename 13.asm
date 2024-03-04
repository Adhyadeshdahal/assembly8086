;Write an assembly language program to convert the vowels to uppercase from a
;string entered by the user.
checkVowel macro 
        push cx
        push si
        mov cx,10
        lea si,vowels
        checkagain:
        cmp al,[si]
        jne inmacro
            sub al,32
            jmp outmacro
        inmacro:
        inc si
        loop checkagain
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
vowels db "aeiou$"
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
        checkVowel
        mov byte ptr [si],al
        inc si
        jmp loopc

        lo:
            mov ax,0003h
            int 10h

            mov ah,09h
            lea dx,user
            add dx,02h
            int 21h

    mov ax,4c00h
    int 21h
main endp
end