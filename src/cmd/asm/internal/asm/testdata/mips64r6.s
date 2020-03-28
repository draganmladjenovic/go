// Copyright 2015 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// This input was created by taking the mips64 testcase and modified
// by hand.

#include "../../../../../runtime/textflag.h"

TEXT foo(SB),DUPOK|NOSPLIT,$0
//	LBRA addr
//	{
//		outcode(int($1), &nullgen, 0, &$2);
//	}
	JMP	0(R1)		// JMP (R1)	// 00200009

//
// floating point conditional branch
//
//	LBRA rel
label4:
	BFPT	F1, 1(PC)	// BFPT F1, 1(PC)		// 45a1000100000000
	BFPT	F1, label4	// BFPT F1, 3			// 45a1fffd00000000
	BFPF	F1, 1(PC)	// BFPF F1, 1(PC)		// 4521000100000000
	BFPF	F1, label4	// BFPF F1, 3			// 4521fff900000000

//	LLL addr ',' rreg
//	{
//		outcode(int($1), &$2, 0, &$4);
//	}
	LL	(R1), R2	// 7c220036
	LLV	(R1), R2	// 7c220037

//	LSC rreg ',' addr
//	{
//		outcode(int($1), &$2, 0, &$4);
//	}
	SC R2, (R1)		// 7c220026
	SCV	R2, (R1)	// 7c220027

//	LADD imm ',' sreg ',' rreg
//	{
//		outcode(int($1), &$2, int($4), &$6);
//	}
	ADD	$-9, R5, R8		// 24a8fff7
	ADDV	$-9, R5, R8	// 64a8fff7

//	LADD imm ',' rreg
//	{
//		outcode(int($1), &$2, 0, &$4);
//	}
	ADD	$-7193, R24		// 2718e3e7
	ADDV	$-7193, R24	// 6718e3e7

//	LMUL rreg ',' sreg ',' rreg
//	{
//		outcode(int($1), &$2, int($4), &$6);
//	}
	MULV	R5, R8, R9		// 0105489c
	MULVU	R5, R8, R9		// 0105489d
	HMULV	R5, R8, R9		// 010548dc
	HMULVU	R5, R8, R9		// 010548dd

//	LDIV rreg ',' sreg ',' rreg
//	{
//		outcode(int($1), &$2, int($4), &$6);
//	}
	DIVV	R8, R13, R7		// 01a8389e
	DIVVU	R8, R13, R7		// 01a8389f
	REMV	R8, R13, R7		// 01a838de
	REMVU	R8, R13, R7		// 01a838df

//	LFCMP freg ',' freg ',' freg
//	{
//		outcode(int($1), &$2, int($4), &$6);
//	}
	CMPEQF	F1, F2, F3  //468110c2
	CMPEQD	F1, F2, F3  //46a110c2
	CMPGEF	F1, F2, F3  //468110c6
	CMPGED	F1, F2, F3  //46a110c6
	CMPGTF	F1, F2, F3  //468110c4
	CMPGTD	F1, F2, F3  //46a110c4
