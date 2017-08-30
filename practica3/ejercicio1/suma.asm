global suma
section .text
    suma: 
        xor rcx, rcx
        mov cx, si ; esta es otra manera en vez de expandir el valor.
        ;dec rcx
        mov rdx, 0
        xor rax, rax
        .cicloSuma:
            add dx, [rdi]; + rcx*2] ; no modifico el ptr al vector. Sumo desde atras para adelante
            lea rdi, [rdi + 2] ; -> avanzo el ptr al vector.
            loop .cicloSuma
        mov rax, rdx
        ret


