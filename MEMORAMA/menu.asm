.module		menu
fin		.equ	0xFF01
teclado		.equ	0xFF02
pantalla	.equ	0xFF00

	.globl	pantalla_menu
	.globl	pantalla_inst
	.globl	imprime_cadena
	.globl	limpia_pantalla
	.globl	pantalla_juego
	

show_menu: 	.ascii "1.- Jugar\n"
	 	.ascii "2.- Instrucciones\n"
 		.asciz "3.- Salir\n"

show_inst:	.ascii 	"\nInstrucciones: Las cartas apareceran boca abajo.\n"
		.ascii	"Se selecciona una fila y una columna,"
		.ascii	"la carta se da la vuelta y se repite la seleccion, "
		.ascii	"si las dos son iguales quedan dadas la vuelta.\n"
		.asciz	"Ganas cuando todas las cartas estan dadas la vuelta.\n\n"
show_opc_inc:	.asciz	"\nHas seleccionado una opcion incorrecta (1-3). \n"


pantalla_menu:

	ldx	#show_menu
	jsr	imprime_cadena

teclado_opcion:

	ldb 	teclado
	cmpb	#'1
	lbeq 	pantalla_juego

	cmpb	#'2
	lbeq	pantalla_inst

	cmpb	#'3
	beq	acabar

	bne	default

default:
	
	jsr	limpia_pantalla
	ldx	#show_opc_inc
	jsr	imprime_cadena
	lbra	pantalla_menu

pantalla_inst:
	jsr	limpia_pantalla

	ldx	#show_inst
	jsr	imprime_cadena

	lbra	pantalla_menu

	rts
acabar:
	clra
	sta fin
