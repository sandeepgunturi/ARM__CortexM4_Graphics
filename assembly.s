     AREA     appcode, CODE, READONLY
     EXPORT __main
	 IMPORT printMsg 	 
	 IMPORT printMsg2p
	 IMPORT printMsg4p
     ENTRY 
__main  FUNCTION	
; IGNORE THIS PART 	
	    VLDR.F32 s15,=100;radius is 2
		
		VLDR.F32 s12,=0.0;-->angle in degrees
		VLDR.F32 s18,=319.0;-->offset in x
		VLDR.F32 s19,=239.0;-->offset in y

		
		MOV R6,#360;
loop2	VLDR.F32 s13,=3.14;--->pi as const
		VLDR.F32 s14,=180.0;---->const
		VMUL.F32 s21,s12,s13;
		VDIV.F32 s0,s21,s14;so has radians
		
		
		;VMOV.F32 s0,#6.0;x----in radians
		MOV R5,#10;n
		VMOV.F32 s7,#1.0;i
		VMOV.F32 s1,s0;t
		VMOV.F32 s2,s0;S2 has answer(sum)
		VMOV.F32 s6,#-1.0;const
		VMOV.F32 s8,#2.0;const
		VMOV.F32 s9,#1.0;const
		
loop	VMUL.F32 s3,s1,s6;
		VMUL.F32 s3,s3,s0;
		VMUL.F32 s3,s3,s0;(t*(-1)*x*x)
		VMUL.F32 s4,s7,s8;2*i
		VADD.F32 s5,s4,s9;2*i+1
		VMUL.F32 s4,s4,s5;(2*i*(2*i+1)
		VDIV.F32 s1,s3,s4;t=(expression)
		VADD.F32 s2,s2,s1;sum=sum+t
		VADD.F32 s7,s7,s9;i=i+1
		SUB R5,R5,#1;
		CMP R5,#0;
		BNE loop

		
		MOV R5,#10;n
		VMOV.F32 s7,#1.0;i
		VMOV.F32 s1,#1.0;t
		VMOV.F32 s10,#1.0;sum
		
loop1	VMUL.F32 s3,s1,s6;
		VMUL.F32 s3,s3,s0;
		VMUL.F32 s3,s3,s0;(t*(-1)*x*x)
		VMUL.F32 s4,s7,s8;2*i
		VSUB.F32 s5,s4,s9;2*i-1
		VMUL.F32 s4,s4,s5;(2*i*(2*i-1)
		VDIV.F32 s1,s3,s4;t=(expression)
		VADD.F32 s10,s10,s1;sum=sum+t
		VADD.F32 s7,s7,s9;i=i+1
		SUB R5,R5,#1;
		CMP R5,#0;
		BNE loop1
		
		VMUL.F32 s16,s15,s10;storing rcos in s16
		VADD.F32 s16,s16,s18;
		VMUL.F32 s17,s15,s2;storing rsin in s17
		VADD.F32 s17,s17,s19;
	  
		
		VMOV.F32 R3,s15
		VMOV.F32 R2,s12
		VMOV.F32 R1,s16
		VMOV.F32 R0,s17
		
		BL printMsg
		
		VADD.F32 s12,s12,s9;increment angle in s12
		SUB R6,R6,#1;
		CMP R6,#1;
		BNE loop2;
		
		
stop B stop ; stop program
     ENDFUNC
	 END 