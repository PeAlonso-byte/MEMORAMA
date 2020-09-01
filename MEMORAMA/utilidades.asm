.module	utilidades



fin		.equ	0xFF01
teclado		.equ	0xFF02
pantalla	.equ	0xFF00

	.globl	imprime_cadena
	.globl	limpia_pantalla
	.globl	salto_de_carro
	.globl	calcular_desplazamiento
	.globl	imprime_tablero
	.globl	nfila
	.globl	ncol
	.globl	contador_par
	.globl	clear_screen
	.globl	retorno_carro
	.globl	desplazamiento
	.globl	contador_char
	.globl	salto_de_carro

; UTILIDADES

clear_screen:	.asciz	"\33[2J \33[1;1H"
retorno_carro:	.asciz	"\n"

desplazamiento:	.byte	0




imprime_cadena:

        pshs a

sgte:   lda ,x+
        beq ret_imprime_cadena
        sta pantalla
        bra sgte
ret_imprime_cadena:
        puls a
        rts

limpia_pantalla:

	ldx	#clear_screen
	jsr	imprime_cadena
	rts

salto_de_carro:

	ldx	#retorno_carro
	jsr	imprime_cadena
	rts

calcular_desplazamiento:
		
	lda #nfila
	ldb #4

	mul

	addd #ncol
	std desplazamiento	
 	
    	rts

imprime_tablero: 
        ldb 	#'0	
        stb 	contador_char
sgte_c:  
	ldb 	contador_char
	
	cmpb 	#'4	
	beq 	sgte_linea
	incb
	stb 	contador_char
	
	lda 	,y+
        beq 	ret_imprime_tb
        sta 	pantalla
        bra 	sgte_c

sgte_linea: 
	ldb 	#'0
	stb 	contador_char
	jsr	salto_de_carro
	jsr 	imprime_cadena
	bra 	sgte_c

;sgte_tablero:
	;ldx	#show_jug
	;jsr	imprime_cadena

	
ret_imprime_tb:
 	rts
