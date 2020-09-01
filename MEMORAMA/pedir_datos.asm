.module	pedir_datos

fin		.equ	0xFF01
teclado		.equ	0xFF02
pantalla	.equ	0xFF00

	.globl	pedir_coordenadas
	.globl	contador_par
	.globl	calcular_desplazamiento
	.globl	desplazamiento
	.globl	mov1
	.globl	solucion1
	.globl	carta1
	.globl	carta2
	.globl	mov2
	.globl	tablero1
	.globl	imprime_cadena
	.globl	salto_de_carro
	.globl	nfila
	.globl 	ncol

show_pide_fila:	.asciz	"Seleccione la fila : "
show_pide_col:	.asciz	"Seleccione la columna : "

carta1:		.byte	0
carta2:		.byte	0
mov1:		.byte	0
mov2:		.byte	0
contador_par:	.byte	0

pedir_coordenadas:
	ldb 	contador_par
	
	jsr 	pedir_fila
	jsr 	pedir_col

	jsr	calcular_desplazamiento

	cmpb	#'0
	beq	carta_a

	cmpb	#'1
	beq	carta_b

	rts


carta_a:
	ldb	contador_par
	incb
	stb	contador_par

	lda 	desplazamiento
	sta	mov1

	ldx	#solucion1
	lda	a, x
	sta	carta1

	ldx	#tablero1
	ldb	a, x
	stb	pantalla
	bra	pedir_coordenadas

carta_b:
	ldb	contador_par
	incb
	stb	contador_par

	lda 	desplazamiento
	sta	mov2

	ldx	#solucion1
	lda	a, x
	sta	carta2

	ldx	#tablero1
	ldb	a, x
	stb	pantalla
	bra	pedir_coordenadas


pedir_fila:
	jsr	salto_de_carro
	ldx	#show_pide_fila
	jsr	imprime_cadena

	lda	teclado
	
	cmpa	#'1
	blo	pedir_fila

	cmpa	#'4
	bhi	pedir_fila
	
	deca
	sta	nfila
	rts
pedir_col:
	jsr	salto_de_carro

	ldx	#show_pide_col
	jsr	imprime_cadena

	lda	teclado
	
	cmpa	#'1
	blo	pedir_col	
	
	cmpa	#'4
	bhi	pedir_col

	deca
	sta	ncol
	
	rts
