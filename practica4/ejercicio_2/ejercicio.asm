; En mac, las llamadas a funcion llevan _ adelante
; global _borrarUltimo
; global _agregarPrimero
; extern _free
; extern _malloc



global borrarUltimo
global agregarPrimero
extern free
extern malloc

%define NULL 0
; Definir los offsets para nodo

; Definir los offsets para lista

; Definir el tamaño de un nodo para malloc
%define list_offset_root 0
%define nodo_dato 0
%define nodo_next 8
%define nodo_size 16

; Recibo por RDI un puntero a la estructura lista
borrarUltimo:
	; Armo stackframe
	; Recordar! Si modifico rbx, r12, r13, r14 o r15 debo pushearlos
	; Alinear pila si está desalineada
	push rbp
	mov rbp, rsp
	mov r8, [rdi] ;r8 -> primerNodo de la lista
	cmp r8, 0
	je .vacia
	.ciclo:
	mov rsi, r8 ; rsi es el anterior a rdi
	mov r8, [r8+nodo_next] ; rdi -> siguienteNodo
	cmp r8, NULL
	je .ultimo
	jmp .ciclo
	.ultimo:
	;en rsi tengo el hay que borrar
	; en rsi tengo el anterior a r8
	mov qword [rsi+nodo_next], NULL
	mov rdi, r8
	call free
	.vacia:
	pop rbp
	ret


; Recibo por RDI un puntero a la estructura lista
; Recibo por RSI el dato, un entero (4 bytes), cuidado al copiar datos!
agregarPrimero:
	; Armo stackframe
	; Recordar! Si modifico rbx, r12, r13, r14 o r15 debo pushearlos
	; Alinear pila si está desalineada
	; en rdi recibe ptr a lista
	; en rsi recibe el int a agregar . o sea en esi.
	push rbp
	mov rbp, rsp

	mov r8, rdi
	mov r9, rsi
	push r8
	push r9

	mov rdi, nodo_size
	call malloc
	pop r9
	pop r8
	mov [rax+nodo_dato], r9
	mov r9, [r8] ; r9 es el primer nodo de la lista
	mov [rax+nodo_next], r9
	mov [r8], rax


	.fin:
	pop rbp
	ret
