ASxxxx Assembler V05.00  (Motorola 6809), page 1.
Hexidecimal [16-Bits]



                              1 .module	pedir_datos
                              2 
                     FF01     3 fin		.equ	0xFF01
                     FF02     4 teclado		.equ	0xFF02
                     FF00     5 pantalla	.equ	0xFF00
                              6 
                              7 	.globl	pedir_coordenadas
                              8 	.globl	contador_par
                              9 	.globl	calcular_desplazamiento
                             10 	.globl	desplazamiento
                             11 	.globl	mov1
                             12 	.globl	solucion1
                             13 	.globl	carta1
                             14 	.globl	carta2
                             15 	.globl	mov2
                             16 	.globl	tablero1
                             17 	.globl	imprime_cadena
                             18 	.globl	salto_de_carro
                             19 	.globl	nfila
                             20 	.globl 	ncol
                             21 
   0228 53 65 6C 65 63 63    22 show_pide_fila:	.asciz	"Seleccione la fila : "
        69 6F 6E 65 20 6C
        61 20 66 69 6C 61
        20 3A 20 00
   023E 53 65 6C 65 63 63    23 show_pide_col:	.asciz	"Seleccione la columna : "
        69 6F 6E 65 20 6C
        61 20 63 6F 6C 75
        6D 6E 61 20 3A 20
        00
                             24 
   0257 00                   25 carta1:		.byte	0
   0258 00                   26 carta2:		.byte	0
   0259 00                   27 mov1:		.byte	0
   025A 00                   28 mov2:		.byte	0
   025B 00                   29 contador_par:	.byte	0
                             30 
   025C                      31 pedir_coordenadas:
   025C F6 02 5B      [ 5]   32 	ldb 	contador_par
                             33 	
   025F BD 02 AF      [ 8]   34 	jsr 	pedir_fila
   0262 BD 02 C8      [ 8]   35 	jsr 	pedir_col
                             36 
   0265 BD 03 0C      [ 8]   37 	jsr	calcular_desplazamiento
                             38 
   0268 C1 30         [ 2]   39 	cmpb	#'0
   026A 27 05         [ 3]   40 	beq	carta_a
                             41 
   026C C1 31         [ 2]   42 	cmpb	#'1
   026E 27 20         [ 3]   43 	beq	carta_b
                             44 
   0270 39            [ 5]   45 	rts
                             46 
                             47 
   0271                      48 carta_a:
ASxxxx Assembler V05.00  (Motorola 6809), page 2.
Hexidecimal [16-Bits]



   0271 F6 02 5B      [ 5]   49 	ldb	contador_par
   0274 5C            [ 2]   50 	incb
   0275 F7 02 5B      [ 5]   51 	stb	contador_par
                             52 
   0278 B6 02 EF      [ 5]   53 	lda 	desplazamiento
   027B B7 02 59      [ 5]   54 	sta	mov1
                             55 
   027E 8E 00 48      [ 3]   56 	ldx	#solucion1
   0281 A6 86         [ 5]   57 	lda	a, x
   0283 B7 02 57      [ 5]   58 	sta	carta1
                             59 
   0286 8E 00 37      [ 3]   60 	ldx	#tablero1
   0289 E6 86         [ 5]   61 	ldb	a, x
   028B F7 FF 00      [ 5]   62 	stb	pantalla
   028E 20 CC         [ 3]   63 	bra	pedir_coordenadas
                             64 
   0290                      65 carta_b:
   0290 F6 02 5B      [ 5]   66 	ldb	contador_par
   0293 5C            [ 2]   67 	incb
   0294 F7 02 5B      [ 5]   68 	stb	contador_par
                             69 
   0297 B6 02 EF      [ 5]   70 	lda 	desplazamiento
   029A B7 02 5A      [ 5]   71 	sta	mov2
                             72 
   029D 8E 00 48      [ 3]   73 	ldx	#solucion1
   02A0 A6 86         [ 5]   74 	lda	a, x
   02A2 B7 02 58      [ 5]   75 	sta	carta2
                             76 
   02A5 8E 00 37      [ 3]   77 	ldx	#tablero1
   02A8 E6 86         [ 5]   78 	ldb	a, x
   02AA F7 FF 00      [ 5]   79 	stb	pantalla
   02AD 20 AD         [ 3]   80 	bra	pedir_coordenadas
                             81 
                             82 
   02AF                      83 pedir_fila:
   02AF BD 03 05      [ 8]   84 	jsr	salto_de_carro
   02B2 8E 02 28      [ 3]   85 	ldx	#show_pide_fila
   02B5 BD 02 F0      [ 8]   86 	jsr	imprime_cadena
                             87 
   02B8 B6 FF 02      [ 5]   88 	lda	teclado
                             89 	
   02BB 81 31         [ 2]   90 	cmpa	#'1
   02BD 25 F0         [ 3]   91 	blo	pedir_fila
                             92 
   02BF 81 34         [ 2]   93 	cmpa	#'4
   02C1 22 EC         [ 3]   94 	bhi	pedir_fila
                             95 	
   02C3 4A            [ 2]   96 	deca
   02C4 B7 00 31      [ 5]   97 	sta	nfila
   02C7 39            [ 5]   98 	rts
   02C8                      99 pedir_col:
   02C8 BD 03 05      [ 8]  100 	jsr	salto_de_carro
                            101 
   02CB 8E 02 3E      [ 3]  102 	ldx	#show_pide_col
   02CE BD 02 F0      [ 8]  103 	jsr	imprime_cadena
ASxxxx Assembler V05.00  (Motorola 6809), page 3.
Hexidecimal [16-Bits]



                            104 
   02D1 B6 FF 02      [ 5]  105 	lda	teclado
                            106 	
   02D4 81 31         [ 2]  107 	cmpa	#'1
   02D6 25 F0         [ 3]  108 	blo	pedir_col	
                            109 	
   02D8 81 34         [ 2]  110 	cmpa	#'4
   02DA 22 EC         [ 3]  111 	bhi	pedir_col
                            112 
   02DC 4A            [ 2]  113 	deca
   02DD B7 00 32      [ 5]  114 	sta	ncol
                            115 	
   02E0 39            [ 5]  116 	rts
ASxxxx Assembler V05.00  (Motorola 6809), page 4.
Hexidecimal [16-Bits]

Symbol Table

    .__.$$$.       =   2710 L   |     .__.ABS.       =   0000 G
    .__.CPU.       =   0000 L   |     .__.H$L.       =   0001 L
    calcular_despl     **** GX  |   0 carta1             002F GR
  0 carta2             0030 GR  |   0 carta_a            0049 R
  0 carta_b            0068 R   |   0 contador_par       0033 GR
    desplazamiento     **** GX  |     fin            =   FF01 
    imprime_cadena     **** GX  |   0 mov1               0031 GR
  0 mov2               0032 GR  |     ncol               **** GX
    nfila              **** GX  |     pantalla       =   FF00 
  0 pedir_col          00A0 R   |   0 pedir_coordena     0034 GR
  0 pedir_fila         0087 R   |     salto_de_carro     **** GX
  0 show_pide_col      0016 R   |   0 show_pide_fila     0000 R
    solucion1          **** GX  |     tablero1           **** GX
    teclado        =   FF02 

ASxxxx Assembler V05.00  (Motorola 6809), page 5.
Hexidecimal [16-Bits]

Area Table

[_CSEG]
   0 _CODE            size   B9   flags C180
[_DSEG]
   1 _DATA            size    0   flags C0C0

