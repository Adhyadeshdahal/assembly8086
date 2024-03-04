;You have an array of data in one table. Change each element to decimal ASCII
;and store it in the next table. Display the final result in the clear screen.
.model small
.stack 100
.data
    array db 1,4,5,8,12
    asci db 15 dup(?)
    counter db 5
.code 
main proc far
    mov ax,@data
    mov ds,ax

        mov ah,00h
        mov al,03h
        int 10h

            lea si,array
            lea di,asci

            l:
                mov cx,10
                mov bx,0
                mov al,[si]
                convert:
                    xor dx,dx
                    div cx
                    inc bx
                    add dx,30h
                    push dx
                    inc si
                    cmp ax,00
                jnz convert

                    mov cx,bx
                    display_l:
                        pop dx
                        mov [di],dl 
                        inc di
                    loop display_l
                    mov byte ptr [di],' '
                    inc di
                    dec byte ptr [counter]
                    cmp byte ptr counter,00
                    jne l

                    mov byte ptr [di],'$'

                    mov ah,09h
                    mov dx,offset asci
                    int 21h



                  



    mov ax,4c00h
    int 21h
main endp
end
