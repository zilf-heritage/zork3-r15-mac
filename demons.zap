

	.FUNCT	I-SWORD,DEM,NG=0,P,T,L
	CALL	INT,I-SWORD >DEM
	IN?	SWORD,ADVENTURER \?ELS5
	EQUAL?	HERE,CLIFF \?ELS8
	ZERO?	MAN-GONE \?ELS8
	SET	'NG,1
	JUMP	?CND6
?ELS8:	EQUAL?	HERE,CLIFF-LEDGE \?ELS12
	ZERO?	MAN-FLAG /?ELS12
	SET	'NG,1
	JUMP	?CND6
?ELS12:	CALL	INFESTED?,HERE
	ZERO?	STACK /?ELS16
	SET	'NG,2
	JUMP	?CND6
?ELS16:	SET	'P,0
?PRG19:	NEXTP	HERE,P >P
	ZERO?	P \?ELS23
	JUMP	?CND6
?ELS23:	LESS?	P,LOW-DIRECTION /?PRG19
	GETPT	HERE,P >T
	PTSIZE	T >L
	EQUAL?	L,UEXIT,CEXIT,DEXIT \?PRG19
	GETB	T,0
	CALL	INFESTED?,STACK
	ZERO?	STACK /?PRG19
	SET	'NG,1
?CND6:	EQUAL?	NG,SWORD-STATE /FALSE
	EQUAL?	NG,2 \?ELS36
	PRINTI	"Your sword has begun to glow very brightly."
	CRLF	
	JUMP	?CND32
?ELS36:	EQUAL?	NG,1 \?ELS40
	PRINTI	"Your sword is glowing with a faint blue glow."
	CRLF	
	JUMP	?CND32
?ELS40:	ZERO?	NG \?CND32
	PRINTI	"Your sword is no longer glowing."
	CRLF	
?CND32:	SET	'SWORD-STATE,NG
	RTRUE	
?ELS5:	PUT	DEM,0,0
	RFALSE	


	.FUNCT	INFESTED?,R,F
	FIRST?	R >F /?KLU12
?KLU12:	
?PRG1:	ZERO?	F /FALSE
	FSET?	F,VILLAIN \?ELS7
	FSET?	F,INVISIBLE /?ELS7
	RETURN	F
?ELS7:	NEXT?	F >F /?PRG1
	RFALSE	

	.ENDI
