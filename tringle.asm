PrintStr		macro string     ;
			mov ah,09h
			lea dx,string
			int 21h
			endm

GetChar_stop		macro char
			mov ah,01h
			mov dl,0ffh
			int 21h
			mov Char,al
			endm

GetChar			macro char
			mov ah,06h
			mov dl,0ffh
			int 21h
			mov Char,al
			endm

Input_str		macro	buffer
			lea	dx,buffer
			mov	ah,0ah
			int	21h
			mov	bx,0
			mov	bl,buffer[1]
			mov	buffer[bx+2],'$'
			endm

SetBackColor		macro mode,color
			mov ah,0bh
			mov bh,mode
			mov bl,color
			int 10h
			endm

SetMode			macro mode
			mov ah,00h
			mov al,mode
			int 10h
			endm

WrPixel			macro row,col,color
			mov ah,0ch
			mov bh,00h
			mov al,color
			mov cx,col
			mov dx,row
			int 10h
			endm

Borderstart		macro

		stsetbup:
			mov cx,0
			mov dx,0
		stbup:
			WrPixel dx,cx,07h
			cmp cx,639
			je stsetbleft
			add cx,1
			jmp stbup

		stsetbleft:
			mov cx,0
			mov dx,0
		stbleft:
			WrPixel dx,cx,07h
			cmp dx,480
			je stsetbright
			add dx,1
			jmp stbleft

		stsetbright:
			mov cx,639
			mov dx,0
		stbright:
			WrPixel dx,cx,07h
			cmp dx,479
			je stsetbdown
			add dx,1
			jmp stbright

		stsetbdown:
			mov cx,0
			mov dx,479
		stbdown:
			WrPixel dx,cx,07h
			cmp cx,640
			je stbdone
			add cx,1
			jmp stbdown
		stbdone:
			endm			

Borderstart2		macro
		s2tsetbup:
			mov cx,0
			mov dx,0
		s2tbup:
			WrPixel dx,cx,07h
			cmp cx,639
			je s2tsetbleft
			add cx,1
			jmp s2tbup

		s2tsetbleft:
			mov cx,0
			mov dx,0
		s2tbleft:
			WrPixel dx,cx,07h
			cmp dx,480
			je s2tsetbright
			add dx,1
			jmp s2tbleft

		s2tsetbright:
			mov cx,639
			mov dx,0
		s2tbright:
			WrPixel dx,cx,07h
			cmp dx,479
			je s2tsetbdown
			add dx,1
			jmp s2tbright

		s2tsetbdown:
			mov cx,0
			mov dx,479
		s2tbdown:
			WrPixel dx,cx,07h
			cmp cx,640
			je s2tbdone
			add cx,1
			jmp s2tbdown
		s2tbdone:
			endm

Borderstart3		macro
		s3tsetbup:
			mov cx,0
			mov dx,0
		s3tbup:
			WrPixel dx,cx,07h
			cmp cx,639
			je s3tsetbleft
			add cx,1
			jmp s3tbup

		s3tsetbleft:
			mov cx,0
			mov dx,0
		s3tbleft:
			WrPixel dx,cx,07h
			cmp dx,480
			je s3tsetbright
			add dx,1
			jmp s3tbleft

		s3tsetbright:
			mov cx,639
			mov dx,0
		s3tbright:
			WrPixel dx,cx,07h
			cmp dx,479
			je s3tsetbdown
			add dx,1
			jmp s3tbright

		s3tsetbdown:
			mov cx,0
			mov dx,479
		s3tbdown:
			WrPixel dx,cx,07h
			cmp cx,640
			je s3tbdone
			add cx,1
			jmp s3tbdown
		s3tbdone:
			endm

Border			macro
		setbup:
			mov cx,0
			mov dx,0
		bup:
			WrPixel dx,cx,07h
			cmp cx,639
			je setbleft
			add cx,1
			jmp bup

		setbleft:
			mov cx,0
			mov dx,0
		bleft:
			WrPixel dx,cx,07h
			cmp dx,480
			je setbright
			add dx,1
			jmp bleft

		setbright:
			mov cx,639
			mov dx,0
		bright:
			WrPixel dx,cx,07h
			cmp dx,479
			je setbdown
			add dx,1
			jmp bright

		setbdown:
			mov cx,0
			mov dx,479
		bdown:
			WrPixel dx,cx,07h
			cmp cx,640
			je bdone
			add cx,1
			jmp bdown

		bdone:
			endm			

dcheckshoot		macro	row,column
			mov ah,0dh
			mov dx,row
			mov cx,column
			mov bh,0
			int 10h
			cmp al,07h
			je gotu
			jmp doverc
		gotu:
			sub ulive,1
			mov ubeshot,1
		doverc:
			endm

ucheckshoot		macro	row,column
			mov ah,0dh
			mov dx,row
			mov cx,column
			mov bh,0
			int 10h
			cmp al,07h
			je gotd
			jmp uoverc
		gotd:
			sub dlive,1
			mov dbeshot,1
		uoverc:
			endm
			
playerA			macro
		local printA,overptA
		printA:
			mov bl,bufferA[1]
			cmp playerAc,bl
			jae overptA
			mov ah,02h	
			mov dh,1
			mov dl,pAc
			int 10h
			mov ah,09h
			mov al,bufferA[si]
			mov bl,07h
			mov cx,1
			int 10h
			add si,1
			add playerAc,1
			add pAc,1
			jmp printA
		overptA:
			mov si,2
			mov playerAc,0
			mov pAc,0
			endm

playerB			macro
		printB:
			mov bl,bufferB[1]
			cmp playerBc,bl
			jae overptB
			mov ah,02h	
			mov dh,1
			mov dl,pBc
			int 10h
			mov ah,09h
			mov al,bufferB[si]
			mov bl,07h
			mov cx,1
			int 10h
			add si,1
			add playerBc,1
			add pBc,1
			jmp printB
		overptB:
			mov si,2
			mov playerBc,0
			mov pBc,8
			endm

Ddlive3			macro		
			mov ah,02h	
			mov dh,1
			mov dl,20
			int 10h
			mov ah,09h
			mov al,03h
			mov bl,04h
			mov cx,3
			int 10h
			endm

Ddlive2			macro		
			mov ah,02h	
			mov dh,1
			mov dl,20
			int 10h
			mov ah,09h
			mov al,03h
			mov bl,04h
			mov cx,2
			int 10h
			mov ah,02h	
			mov dh,1
			mov dl,22
			int 10h
			mov ah,09h
			mov al,00h
			mov bl,04h
			mov cx,1
			int 10h
			endm

Ddlive1			macro		
			mov ah,02h	
			mov dh,1
			mov dl,20
			int 10h
			mov ah,09h
			mov al,03h
			mov bl,04h
			mov cx,1
			int 10h
			mov ah,02h	
			mov dh,1
			mov dl,21
			int 10h
			mov ah,09h
			mov al,00h
			mov bl,04h
			mov cx,2
			int 10h
			endm

Ddlive0			macro		
			mov ah,02h	
			mov dh,1
			mov dl,20
			int 10h
			mov ah,09h
			mov al,00h
			mov bl,04h
			mov cx,3
			int 10h
			endm

Uulive3			macro		
			mov ah,02h	
			mov dh,1
			mov dl,8
			int 10h
			mov ah,09h
			mov al,03h
			mov bl,04h
			mov cx,3
			int 10h
			endm

Uulive2			macro		
			mov ah,02h	
			mov dh,1
			mov dl,8
			int 10h
			mov ah,09h
			mov al,03h
			mov bl,04h
			mov cx,2
			int 10h
			mov ah,02h	
			mov dh,1
			mov dl,10
			int 10h
			mov ah,09h
			mov al,00h
			mov bl,04h
			mov cx,1
			int 10h
			endm

Uulive1			macro		
			mov ah,02h	
			mov dh,1
			mov dl,8
			int 10h
			mov ah,09h
			mov al,03h
			mov bl,04h
			mov cx,1
			int 10h
			mov ah,02h	
			mov dh,1
			mov dl,9
			int 10h
			mov ah,09h
			mov al,00h
			mov bl,04h
			mov cx,2
			int 10h
			endm

Uulive0			macro		
			mov ah,02h	
			mov dh,1
			mov dl,8
			int 10h
			mov ah,09h
			mov al,00h
			mov bl,04h
			mov cx,3
			int 10h
			endm

thewinner		macro
			cmp win,1
			je Awin
			cmp win,2
			je Bwin
		Awin:
			mov bl,bufferA[1]
			cmp playerAc,bl
			jae endAwin
			mov ah,02h
			mov bh,0	
			mov dh,13
			mov dl,winc
			int 10h
			mov ah,09h
			mov al,bufferA[si]
			mov bl,07h
			mov cx,1
			int 10h
			add si,1
			add playerAc,1
			add winc,1
			jmp Awin
		endAwin:
			mov si,2
			mov playerAc,0
			mov winc,0
			jmp Winnerend
		Bwin:
			mov bl,bufferB[1]
			cmp playerBc,bl
			jae endBwin
			mov ah,02h
			mov bh,0	
			mov dh,13
			mov dl,winc
			int 10h
			mov ah,09h
			mov al,bufferB[si]
			mov bl,07h
			mov cx,1
			int 10h
			add si,1
			add playerBc,1
			add winc,1
			jmp Bwin
		endBwin:
			mov si,2
			mov playerBc,0
			mov winc,14;not yet
		Winnerend:
			endm

Delay1			macro
			mov cx,0000h
		L1:
			mov bp,0010h
		L2:	
			dec bp
			cmp bp,0
			jnz L2
			loop L1
			endm

Delay2			macro
			mov cx,0000h
		L3:
			mov bp,0010h
		L4:	
			dec bp
			cmp bp,0
			jnz L4
			loop L3
			endm

Delay3			macro
			mov cx,0000h
		L5:
			mov bp,0010h
		L6:	
			dec bp
			cmp bp,0
			jnz L6
			loop L5
			endm

Delay4			macro
			mov cx,0000h
		L7:
			mov bp,0010h
		L8:	
			dec bp
			cmp bp,0
			jnz L8
			loop L7
			endm

Delay5			macro
			mov cx,0000h
		L9:
			mov bp,0010h
		L10:	
			dec bp
			cmp bp,0
			jnz L10
			loop L9
			endm

Delay6			macro
			mov cx,0000h
		L11:
			mov bp,0010h
		L12:	
			dec bp
			cmp bp,0
			jnz L12
			loop L11
			endm

Delay7			macro
			mov cx,0000h
		L13:
			mov bp,0005h
		L14:	
			dec bp
			cmp bp,0
			jnz L14
			loop L13
			endm

.8086
.model small
.stack 1024
.data
	midcx		dw	320
	midcxc		dw	320
	midcxpa 	dw	320
	midcxcpa 	dw	320
	opmidcx 	dw	320
	opmidcxc 	dw	320
	opmidcxpa 	dw	320
	opmidcxcpa 	dw	320
	middx		dw	400
	middxpa 	dw	400
	opmiddx 	dw	80
	opmiddxpa 	dw	80
	co		dw	1
	tc		dw	1
	counter 	db	1
	color		db	06h
	shootin		dw	?
	shootco		dw	?
	shootout	dw	?
	shootoco 	dw	?
	shootoverc 	dw 	?
	opshootin	dw	?
	opshootco	dw	?
	opshootout 	dw	?
	opshootoco 	dw	?
	opshootoverc 	dw 	?
	mode		dw	?   ; 1 for dshoot ; 2 for ushoot
	dlive		dw	3
	ulive		dw	3
	dbeshot		dw	?
	ubeshot		dw	?
	playerAc	db	?
	pAc		db	2
	playerBc	db	?
	pBc		db	14
	bufferA		db 	6,0,6 dup(0)
	bufferB		db	6,0,6 dup(0)
	win		dw	?  ;playerA for 1 ; player2 for 2
	winc		db	40

	ptr1		db	"                          ++++   +++++     +      ++++               ",0Ah,0Dh,
				"                         |         +      / \     |   | 		   ",0Ah,0Dh,
				"                          +++      +     |   |    ++++       	   ",0Ah,0Dh,
				"                             |     +     |+++|    +  \               ",0Ah,0Dh,
				"                         ++++      +     |   |    +   \              ",0Ah,0Dh,"$"

	ptr2		db	"                       +  +  +    +     ++++      ++++     --	   ",0Ah,0Dh,
				"                       |  |  |   / \    |   |    |         ||        ",0Ah,0Dh,
				"                       |  |  |  |   |   ++++      +++      ||        ",0Ah,0Dh,
				"                       |  |  |  |+++|   +  \         |     --        ",0Ah,0Dh,
				"                        ++ ++   |   |   +   \    ++++      ()        ",0Ah,0Dh,"$"
	
	ptrname1	db	"                              Player1 : ","$" 
	ptrname2	db	"                              Player2 : ","$"
	
	ptrwinner	db	"                        The winner is : ","$"
	ptr3		db	"                      -- press 'n' to end the game --",0Ah,0Dh,"$"
	blank		db	0Ah,0Dh,"$"
.code  
.startup
Game:
	SetMode 12h
	SetBackColor 00h,00h
	PrintStr blank
	PrintStr blank
	PrintStr blank
	PrintStr ptr1
	PrintStr blank
	PrintStr blank
	PrintStr ptr2
	PrintStr blank
	PrintStr blank
	PrintStr blank
	PrintStr blank
	PrintStr blank
	Borderstart
	PrintStr ptrname1
	Borderstart2
	Input_str bufferA
	PrintStr blank
	PrintStr blank
	PrintStr ptrname2
	Borderstart3
	Input_str bufferB

start:
	SetMode 12h
	SetBackColor 00h,00h
	Border
	mov si,2
	playerA
	playerB

Removetringle:	
	;Delay
	mov counter,1
	mov tc,1
	mov cx,midcxpa
	mov dx,middxpa
	mov midcxcpa,cx
Removeprttringle:	
	WrPixel dx,cx,00h
	mov bx,co
	mov ax,tc
	cmp bx,ax
	je  RemoveNextRow
	add co,1
	add cx,1
	jmp Removeprttringle

RemoveNextRow:
	sub midcxcpa,1
	mov cx,midcxcpa
	mov co,1
	cmp counter,40
	je  Tringle
	add counter,1
	add dx,1
	add tc,2
	jmp Removeprttringle

Tringle:
	mov counter,1
	mov tc,1
	mov cx,midcx
	mov dx,middx
	mov midcxc,cx

Printtringle:	
	WrPixel dx,cx,07h
	mov bx,co
	mov ax,tc
	cmp bx,ax
	je  NextRow
	add co,1
	add cx,1
	jmp Printtringle
	
NextRow:
	sub midcxc,1
	mov cx,midcxc
	mov co,1
	cmp counter,40
	je  opRemovetringle
	add counter,1
	add dx,1
	add tc,2
	jmp Printtringle
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
opRemovetringle:	
	;Delay
	mov counter,1
	mov tc,1
	mov cx,opmidcxpa
	mov dx,opmiddxpa
	mov opmidcxcpa,cx
opRemoveprttringle:	
	WrPixel dx,cx,00h
	mov bx,co
	mov ax,tc
	cmp bx,ax
	je  opRemoveNextRow
	add co,1
	add cx,1
	jmp opRemoveprttringle

opRemoveNextRow:
	sub opmidcxcpa,1
	mov cx,opmidcxcpa
	mov co,1
	cmp counter,40
	je  oppoTringle
	add counter,1
	sub dx,1
	add tc,2
	jmp opRemoveprttringle

oppoTringle:
	;add opmiddx,1
	;add opmiddxpa,1
	mov counter,1
	mov tc,1
	mov cx,opmidcx
	mov dx,opmiddx
	mov opmidcxc,cx

oppoPrinttringle:	
	WrPixel dx,cx,07h
	mov bx,co
	mov ax,tc
	cmp bx,ax
	je  oppoNextRow
	add co,1
	add cx,1
	jmp oppoPrinttringle
	
oppoNextRow:
	sub opmidcxc,1
	mov cx,opmidcxc
	mov co,1
	cmp counter,40
	je  Enter
	add counter,1
	sub dx,1
	add tc,2
	jmp oppoPrinttringle
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Enter:
	cmp dlive,3
	je dlivee3
	cmp dlive,2
	je dlivee2
	cmp dlive,1
	je dlivee1	
	cmp dlive,0
	je dlivee0
kpenter1:
	cmp ulive,3
	je ulivee3
	cmp ulive,2
	je ulivee2
	cmp ulive,1
	je ulivee1
	cmp ulive,0
	je ulivee0

kpenter2:
	
	cmp dlive,0
	je over
	cmp ulive,0
	je over

	GetChar al
	cmp mode,0
	je mmode0
	cmp mode,1
	je mmode1
	cmp mode,2
	je mmode2
	
mmode1:
	cmp al,'q'
	je uleft
	cmp al,'e'
	je uright
	cmp al,'p'
	je over
	jmp shoot
mmode2:
	cmp al,'u'
	je dleft
	cmp al,'o'
	je dright
	cmp al,'p'
	je over
	jmp ushoot
mmode0:
	cmp al,'q'
	je uleft
	cmp al,'e'
	je uright
	cmp al,'u'
	je dleft
	cmp al,'o'
	je dright
	cmp al,'i'
	je dshootinset
	cmp al,'w'
	je ushootinset
	cmp al,'p'
	je over
	jmp Enter

dleft:
	mov cx,midcx
	mov dx,middx
	mov midcxpa,cx
	mov midcxcpa,cx
	mov middxpa,dx
	sub midcx,15
	jmp checkxr
dright:
	mov cx,midcx
	mov dx,middx
	mov midcxpa,cx
	mov midcxcpa,cx
	mov middxpa,dx
	add midcx,15
	jmp checkxr

uleft:
	mov cx,opmidcx
	mov dx,opmiddx
	mov opmidcxpa,cx
	mov opmidcxcpa,cx
	mov opmiddxpa,dx
	sub opmidcx,15
	jmp opcheckxr
uright:
	mov cx,opmidcx
	mov dx,opmiddx
	mov opmidcxpa,cx
	mov opmidcxcpa,cx
	mov opmiddxpa,dx
	add opmidcx,15
	jmp opcheckxr
chcolor:
	add color,1
	mov counter,1
	mov tc,1
	jmp Removetringle
checkxr:
	add midcx,40
	cmp midcx,638
	ja outxr
checkxl:
	sub midcx,40
	cmp midcx,40
	jb outxl	
	mov counter,1
	mov tc,1
	jmp Removetringle
outxr:
	sub midcx,40
	sub midcx,15
	mov counter,1
	mov tc,1
	jmp Removetringle
outxl:
	mov midcx,40
	mov counter,1
	mov tc,1
	jmp Removetringle
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
opcheckxr:
	add opmidcx,40
	cmp opmidcx,638
	ja opoutxr
opcheckxl:
	sub opmidcx,40
	cmp opmidcx,40
	jb opoutxl	
	mov counter,1
	mov tc,1
	jmp Removetringle
opoutxr:
	sub opmidcx,40
	sub opmidcx,15
	mov counter,1
	mov tc,1
	jmp Removetringle
opoutxl:
	mov opmidcx,40
	mov counter,1
	mov tc,1
	jmp Removetringle
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
dshootinset:
	mov mode,1
	mov ax,middx
	mov shootin,ax
	mov shootout,ax
	sub shootin,10
	sub shootout,10
	mov cx,midcx
	mov dx,shootin
	WrPixel dx,cx,0fh
	add cx,1
	WrPixel dx,cx,0fh
	add dx,1
	WrPixel dx,cx,0fh
	sub cx,1
	WrPixel dx,cx,0fh
	sub dx,1
shoot:	
	cmp shootco,350
	ja shootover1
	mov cx,midcx
	mov dx,shootin
	cmp ubeshot,0
	je dcheck
dkpshoot:
	WrPixel dx,cx,0fh
	add cx,1
	WrPixel dx,cx,0fh
	add dx,1
	WrPixel dx,cx,0fh
	sub cx,1
	WrPixel dx,cx,0fh
	sub dx,1
	cmp shootoco,60
	jae shot
	add shootoco,1
shooot:
	delay1
	sub shootin,1
	add shootco,1
	add shootoco,1
	jmp Enter
shootover1:
	delay3
	cmp shootoverc,30
	jae shootover2
	mov cx,midcx
	mov dx,shootout
	WrPixel dx,cx,00h
	add cx,1
	WrPixel dx,cx,00h
	add dx,1
	WrPixel dx,cx,00h
	sub cx,1
	WrPixel dx,cx,00h
	sub dx,1
	sub shootout,1
	add shootoverc,1
	jmp shootover1
shootover2:
	mov shootco,0
	mov shootoco,0
	mov shootoverc,0
	mov ubeshot,0
	mov mode,0
	jmp Enter
shot:	
	delay2
	mov cx,midcx
	mov dx,shootout
	WrPixel dx,cx,00h
	add cx,1
	WrPixel dx,cx,00h
	add dx,1
	WrPixel dx,cx,00h
	sub cx,1
	WrPixel dx,cx,00h
	sub dx,1
	sub shootout,1
	jmp shooot
dcheck:
	dcheckshoot dx,cx
	jmp dkpshoot
;;;;;;;;;;;;;;;;;;;;;;;;;;;
ushootinset:
	mov mode,2
	mov ax,opmiddx
	mov opshootin,ax
	mov opshootout,ax
	add opshootin,10
	add opshootout,10
	mov cx,opmidcx
	mov dx,opshootin
	WrPixel dx,cx,0fh
	sub cx,1
	WrPixel dx,cx,0fh
	sub dx,1
	WrPixel dx,cx,0fh
	add cx,1
	WrPixel dx,cx,0fh
	add dx,1
ushoot:	
	cmp opshootco,350
	ja ushootover1
	mov cx,opmidcx
	mov dx,opshootin
	cmp dbeshot,0
	je ucheck
ukpshoot:
	WrPixel dx,cx,0fh
	sub cx,1
	WrPixel dx,cx,0fh
	sub dx,1
	WrPixel dx,cx,0fh
	add cx,1
	WrPixel dx,cx,0fh
	add dx,1
	cmp opshootoco,60
	jae ushot
	add opshootoco,1
ushooot:
	delay4
	add opshootin,1
	add opshootco,1
	add opshootoco,1
	jmp Enter
ushootover1:
	delay6
	cmp opshootoverc,30
	jae ushootover2
	mov cx,opmidcx
	mov dx,opshootout
	WrPixel dx,cx,00h
	sub cx,1
	WrPixel dx,cx,00h
	sub dx,1
	WrPixel dx,cx,00h
	add cx,1
	WrPixel dx,cx,00h
	add dx,1
	add opshootout,1
	add opshootoverc,1
	jmp ushootover1
ushootover2:
	mov opshootco,0
	mov opshootoco,0
	mov opshootoverc,0
	mov dbeshot,0
	mov mode,0
	jmp Enter
ushot:	
	delay5
	mov cx,opmidcx
	mov dx,opshootout
	WrPixel dx,cx,00h
	sub cx,1
	WrPixel dx,cx,00h
	sub dx,1
	WrPixel dx,cx,00h
	add cx,1
	WrPixel dx,cx,00h
	add dx,1
	add opshootout,1
	jmp ushooot
ucheck:
	ucheckshoot dx,cx
	jmp ukpshoot
;;;;;;;;;;;;;;;;;;;;;;;;;;;
dlivee3:
	Ddlive3
	jmp kpenter1
dlivee2:
	Ddlive2
	jmp kpenter1
dlivee1:
	Ddlive1
	jmp kpenter1
dlivee0:
	Ddlive0
	mov win,1
	jmp kpenter1
ulivee3:
	Uulive3
	jmp kpenter2
ulivee2:
	Uulive2
	jmp kpenter2
ulivee1:
	Uulive1
	jmp kpenter2
ulivee0:
	Uulive0
	mov win,2
	jmp kpenter2
over:
	SetMode 12h
	SetBackColor 00h,00h
	PrintStr blank
	PrintStr blank
	PrintStr blank
	PrintStr blank
	PrintStr blank
	PrintStr blank
	PrintStr blank
	PrintStr blank
	PrintStr blank
	PrintStr blank
	PrintStr blank
	PrintStr blank
	PrintStr blank	
	PrintStr ptrwinner
	thewinner
	PrintStr blank
	PrintStr blank
	PrintStr ptr3
waitforend:
	GetChar_stop al
	cmp al,'n'
	je theend
	jmp waitforend
theend:
	SetMode 03h


.exit
end