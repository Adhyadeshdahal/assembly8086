;Write an assembly language program to count the number of vowels in a string
;entered by the user. Display the result in decimal format.

page 100,122
.model small
.stack 100
.data
user db 100,?,101 dup('$')
msg db "enter text:$"
vowels db "aeiouAEIOU$"
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

        checkVowel macro 
        push cx
        push si
        mov cx,10
        lea si,vowels
        checkagain:
        cmp al,[si]
        jne inmacro
            inc bx
            jmp outmacro
        inmacro:
        inc si
        loop checkagain
        outmacro:
        pop si
        pop cx
    endm

        mov ah,00
        loopc:
        mov al,[si]
        cmp al,'$'
        je lo
        checkVowel
        inc si
        jmp loopc

        lo:
            mov ax,bx
            mov cx,10
            mov bx,00

            convert:
                mov dx,0
                inc bx
                div cx
                add dx,30h
                push dx
                cmp ax,0
            jne convert

            mov ax,0003h
            int 10h

            mov cx,bx
            mov ah,02h
            displayl:
                pop dx
                int 21h
            loop displayl

    mov ax,4c00h
    int 21h
main endp
end