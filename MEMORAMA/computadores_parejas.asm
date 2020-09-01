.module		main

fin		.equ	0xFF01
teclado		.equ	0xFF02
pantalla	.equ	0xFF00
pilaU		.equ	0xF000
pilaS		.equ	0xFF00

	.globl 	programa
	.globl 	nfila
	.globl	ncol
	.globl	contador_char
	.globl	contador_tblro
	.globl	show_intentos
	.globl	show_tablero
	.globl	pantalla_menu
	.globl	contador_par
	.globl	salto_de_carro
	.globl	limpia_pantalla
	.globl	imprime_tablero
	.globl	pedir_coordenadas
	.globl	show_marcador
	.globl	imprime_cadena
	.globl	pantalla_juego
	.globl	tablero1
	.globl	solucion1
	

; DECLARACIONES DE TEXTO


show_jug:	.asciz	"\nHas seleccionado juego \n"

show_intentos:	.asciz	"Intentos: "
show_tablero:	.asciz	"Tablero n: "

; DECLARACIONES NUMERICAS (VALORES)

nfila:		.byte	0
ncol:		.byte	0
nintentos:	.byte	0
ntablero:	.byte	0
contador_char:	.byte	0
contador_tblro:	.byte	0

; DECLARACIONES TABLEROS.

tablero1:	.asciz	"XXXXXXXXXXXXXXXX"
solucion1:	.asciz	"ABCDEFGHIJKLMNOP"
	

; INICIO PROGRAMA

programa:
	ldu	#pilaU
	lds	#pilaS
	jsr	pantalla_menu

pantalla_juego:
	lda	#'0
	sta	nintentos
	
	ldb	#'1
	stb	ntablero

	ldx	#solucion1
	ldy	#tablero1
	
nivel:	
	ldb	#'0
	stb	contador_par
	jsr	limpia_pantalla
	
	jsr	show_marcador
	
	jsr	imprime_tablero

	jsr 	pedir_coordenadas
	bra 	nivel


show_marcador:

	ldx	#show_intentos
	jsr	imprime_cadena

	ldx	#nintentos
	jsr	imprime_cadena
	
	jsr	salto_de_carro

	ldx	#show_tablero
	jsr	imprime_cadena

	ldx	#ntablero
	jsr	imprime_cadena

	jsr 	salto_de_carro
	jsr	salto_de_carro



.area	FIJA (ABS)

	.org	0xFFFE	;vector de RESET
	.word	programa







	
