ASxxxx Assembler V05.00  (Motorola 6809), page 1.
Hexidecimal [16-Bits]



                              1 .module	utilidades
                              2 
                              3 
                              4 
                     FF01     5 fin		.equ	0xFF01
                     FF02     6 teclado		.equ	0xFF02
                     FF00     7 pantalla	.equ	0xFF00
                              8 
                              9 	.globl	imprime_cadena
                             10 	.globl	limpia_pantalla
                             11 	.globl	salto_de_carro
                             12 	.globl	calcular_desplazamiento
                             13 	.globl	imprime_tablero
                             14 	.globl	nfila
                             15 	.globl	ncol
                             16 	.globl	contador_par
                             17 	.globl	clear_screen
                             18 	.globl	retorno_carro
                             19 	.globl	desplazamiento
                             20 	.globl	contador_char
                             21 	.globl	salto_de_carro
                             22 
                             23 ; UTILIDADES
                             24 
   02E1 1B 5B 32 4A 20 1B    25 clear_screen:	.asciz	"\33[2J \33[1;1H"
        5B 31 3B 31 48 00
   02ED 0A 00                26 retorno_carro:	.asciz	"\n"
                             27 
   02EF 00                   28 desplazamiento:	.byte	0
                             29 
                             30 
                             31 
                             32 
   02F0                      33 imprime_cadena:
                             34 
   02F0 34 02         [ 6]   35         pshs a
                             36 
   02F2 A6 80         [ 6]   37 sgte:   lda ,x+
   02F4 27 05         [ 3]   38         beq ret_imprime_cadena
   02F6 B7 FF 00      [ 5]   39         sta pantalla
   02F9 20 F7         [ 3]   40         bra sgte
   02FB                      41 ret_imprime_cadena:
   02FB 35 02         [ 6]   42         puls a
   02FD 39            [ 5]   43         rts
                             44 
   02FE                      45 limpia_pantalla:
                             46 
   02FE 8E 02 E1      [ 3]   47 	ldx	#clear_screen
   0301 BD 02 F0      [ 8]   48 	jsr	imprime_cadena
   0304 39            [ 5]   49 	rts
                             50 
   0305                      51 salto_de_carro:
                             52 
   0305 8E 02 ED      [ 3]   53 	ldx	#retorno_carro
   0308 BD 02 F0      [ 8]   54 	jsr	imprime_cadena
ASxxxx Assembler V05.00  (Motorola 6809), page 2.
Hexidecimal [16-Bits]



   030B 39            [ 5]   55 	rts
                             56 
   030C                      57 calcular_desplazamiento:
                             58 		
   030C 86 31         [ 2]   59 	lda #nfila
   030E C6 04         [ 2]   60 	ldb #4
                             61 
   0310 3D            [11]   62 	mul
                             63 
   0311 C3 00 32      [ 4]   64 	addd #ncol
   0314 FD 02 EF      [ 6]   65 	std desplazamiento	
                             66  	
   0317 39            [ 5]   67     	rts
                             68 
   0318                      69 imprime_tablero: 
   0318 C6 30         [ 2]   70         ldb 	#'0	
   031A F7 00 35      [ 5]   71         stb 	contador_char
   031D                      72 sgte_c:  
   031D F6 00 35      [ 5]   73 	ldb 	contador_char
                             74 	
   0320 C1 34         [ 2]   75 	cmpb 	#'4	
   0322 27 0D         [ 3]   76 	beq 	sgte_linea
   0324 5C            [ 2]   77 	incb
   0325 F7 00 35      [ 5]   78 	stb 	contador_char
                             79 	
   0328 A6 A0         [ 6]   80 	lda 	,y+
   032A 27 12         [ 3]   81         beq 	ret_imprime_tb
   032C B7 FF 00      [ 5]   82         sta 	pantalla
   032F 20 EC         [ 3]   83         bra 	sgte_c
                             84 
   0331                      85 sgte_linea: 
   0331 C6 30         [ 2]   86 	ldb 	#'0
   0333 F7 00 35      [ 5]   87 	stb 	contador_char
   0336 BD 03 05      [ 8]   88 	jsr	salto_de_carro
   0339 BD 02 F0      [ 8]   89 	jsr 	imprime_cadena
   033C 20 DF         [ 3]   90 	bra 	sgte_c
                             91 
                             92 ;sgte_tablero:
                             93 	;ldx	#show_jug
                             94 	;jsr	imprime_cadena
                             95 
                             96 	
   033E                      97 ret_imprime_tb:
   033E 39            [ 5]   98  	rts
ASxxxx Assembler V05.00  (Motorola 6809), page 3.
Hexidecimal [16-Bits]

Symbol Table

    .__.$$$.       =   2710 L   |     .__.ABS.       =   0000 G
    .__.CPU.       =   0000 L   |     .__.H$L.       =   0001 L
  0 calcular_despl     002B GR  |   0 clear_screen       0000 GR
    contador_char      **** GX  |     contador_par       **** GX
  0 desplazamiento     000E GR  |     fin            =   FF01 
  0 imprime_cadena     000F GR  |   0 imprime_tabler     0037 GR
  0 limpia_pantall     001D GR  |     ncol               **** GX
    nfila              **** GX  |     pantalla       =   FF00 
  0 ret_imprime_ca     001A R   |   0 ret_imprime_tb     005D R
  0 retorno_carro      000C GR  |   0 salto_de_carro     0024 GR
  0 sgte               0011 R   |   0 sgte_c             003C R
  0 sgte_linea         0050 R   |     teclado        =   FF02 

ASxxxx Assembler V05.00  (Motorola 6809), page 4.
Hexidecimal [16-Bits]

Area Table

[_CSEG]
   0 _CODE            size   5E   flags C180
[_DSEG]
   1 _DATA            size    0   flags C0C0

