%define NULL 0
; Completar!
%define offset_comision 0
; Completar!
%define offset_nombre 8
; Completar!
%define offset_edad 16

; En mac, las funciones llevan un _ adelante
; En caso de mac, _printf
extern printf

; En caso de mac, global _mostrarAlumno
global mostrarAlumno

section .data
	texto: db "Nombre: %s, comision: %d, edad: %d", 0x0a, 0x00

section .text

; En caso de mac, _mostrarAlumno
; Me llega por RDI el PUNTERO a la estructura
mostrarAlumno:
	push rbp
	mov rbp, rsp
	mov r8, rdi
	; Pila alineada
	; Recordar pushear RBX, R12, R13, R14 y R15 si se utilizan
	xor rdx, rdx
	xor rcx, rcx
	mov rdi, texto
	mov rsi, [r8+offset_nombre] ; usa los 8 bytes porque es un ptr en 64 bits
	mov dx, [r8+offset_comision] ; usa 2 bytes porque es short
	mov ecx, [r8+offset_edad] ; usa 4 bytes porque es int

	call printf


	; Desencolo
	pop rbp
	ret
