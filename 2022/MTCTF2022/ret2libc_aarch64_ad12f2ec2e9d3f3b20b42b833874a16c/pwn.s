
pwn：     文件格式 elf64-littleaarch64


Disassembly of section .init:

0000000000400610 <_init>:
  400610:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  400614:	910003fd 	mov	x29, sp
  400618:	9400004a 	bl	400740 <call_weak_fn>
  40061c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  400620:	d65f03c0 	ret

Disassembly of section .plt:

0000000000400630 <.plt>:
  400630:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
  400634:	90000090 	adrp	x16, 410000 <__FRAME_END__+0xf348>
  400638:	f947fe11 	ldr	x17, [x16, #4088]
  40063c:	913fe210 	add	x16, x16, #0xff8
  400640:	d61f0220 	br	x17
  400644:	d503201f 	nop
  400648:	d503201f 	nop
  40064c:	d503201f 	nop

0000000000400650 <exit@plt>:
  400650:	b0000090 	adrp	x16, 411000 <exit@GLIBC_2.17>
  400654:	f9400211 	ldr	x17, [x16]
  400658:	91000210 	add	x16, x16, #0x0
  40065c:	d61f0220 	br	x17

0000000000400660 <setbuf@plt>:
  400660:	b0000090 	adrp	x16, 411000 <exit@GLIBC_2.17>
  400664:	f9400611 	ldr	x17, [x16, #8]
  400668:	91002210 	add	x16, x16, #0x8
  40066c:	d61f0220 	br	x17

0000000000400670 <atoi@plt>:
  400670:	b0000090 	adrp	x16, 411000 <exit@GLIBC_2.17>
  400674:	f9400a11 	ldr	x17, [x16, #16]
  400678:	91004210 	add	x16, x16, #0x10
  40067c:	d61f0220 	br	x17

0000000000400680 <__libc_start_main@plt>:
  400680:	b0000090 	adrp	x16, 411000 <exit@GLIBC_2.17>
  400684:	f9400e11 	ldr	x17, [x16, #24]
  400688:	91006210 	add	x16, x16, #0x18
  40068c:	d61f0220 	br	x17

0000000000400690 <__gmon_start__@plt>:
  400690:	b0000090 	adrp	x16, 411000 <exit@GLIBC_2.17>
  400694:	f9401211 	ldr	x17, [x16, #32]
  400698:	91008210 	add	x16, x16, #0x20
  40069c:	d61f0220 	br	x17

00000000004006a0 <abort@plt>:
  4006a0:	b0000090 	adrp	x16, 411000 <exit@GLIBC_2.17>
  4006a4:	f9401611 	ldr	x17, [x16, #40]
  4006a8:	9100a210 	add	x16, x16, #0x28
  4006ac:	d61f0220 	br	x17

00000000004006b0 <puts@plt>:
  4006b0:	b0000090 	adrp	x16, 411000 <exit@GLIBC_2.17>
  4006b4:	f9401a11 	ldr	x17, [x16, #48]
  4006b8:	9100c210 	add	x16, x16, #0x30
  4006bc:	d61f0220 	br	x17

00000000004006c0 <read@plt>:
  4006c0:	b0000090 	adrp	x16, 411000 <exit@GLIBC_2.17>
  4006c4:	f9401e11 	ldr	x17, [x16, #56]
  4006c8:	9100e210 	add	x16, x16, #0x38
  4006cc:	d61f0220 	br	x17

00000000004006d0 <printf@plt>:
  4006d0:	b0000090 	adrp	x16, 411000 <exit@GLIBC_2.17>
  4006d4:	f9402211 	ldr	x17, [x16, #64]
  4006d8:	91010210 	add	x16, x16, #0x40
  4006dc:	d61f0220 	br	x17

00000000004006e0 <gets@plt>:
  4006e0:	b0000090 	adrp	x16, 411000 <exit@GLIBC_2.17>
  4006e4:	f9402611 	ldr	x17, [x16, #72]
  4006e8:	91012210 	add	x16, x16, #0x48
  4006ec:	d61f0220 	br	x17

Disassembly of section .text:

00000000004006f0 <_start>:
  4006f0:	d280001d 	mov	x29, #0x0                   	// #0
  4006f4:	d280001e 	mov	x30, #0x0                   	// #0
  4006f8:	aa0003e5 	mov	x5, x0
  4006fc:	f94003e1 	ldr	x1, [sp]
  400700:	910023e2 	add	x2, sp, #0x8
  400704:	910003e6 	mov	x6, sp
  400708:	d2e00000 	movz	x0, #0x0, lsl #48
  40070c:	f2c00000 	movk	x0, #0x0, lsl #32
  400710:	f2a00800 	movk	x0, #0x40, lsl #16
  400714:	f280ff80 	movk	x0, #0x7fc
  400718:	d2e00003 	movz	x3, #0x0, lsl #48
  40071c:	f2c00003 	movk	x3, #0x0, lsl #32
  400720:	f2a00803 	movk	x3, #0x40, lsl #16
  400724:	f2813703 	movk	x3, #0x9b8
  400728:	d2e00004 	movz	x4, #0x0, lsl #48
  40072c:	f2c00004 	movk	x4, #0x0, lsl #32
  400730:	f2a00804 	movk	x4, #0x40, lsl #16
  400734:	f2814704 	movk	x4, #0xa38
  400738:	97ffffd2 	bl	400680 <__libc_start_main@plt>
  40073c:	97ffffd9 	bl	4006a0 <abort@plt>

0000000000400740 <call_weak_fn>:
  400740:	90000080 	adrp	x0, 410000 <__FRAME_END__+0xf348>
  400744:	f947f000 	ldr	x0, [x0, #4064]
  400748:	b4000040 	cbz	x0, 400750 <call_weak_fn+0x10>
  40074c:	17ffffd1 	b	400690 <__gmon_start__@plt>
  400750:	d65f03c0 	ret
  400754:	d503201f 	nop

0000000000400758 <deregister_tm_clones>:
  400758:	b0000080 	adrp	x0, 411000 <exit@GLIBC_2.17>
  40075c:	91018000 	add	x0, x0, #0x60
  400760:	b0000081 	adrp	x1, 411000 <exit@GLIBC_2.17>
  400764:	91018021 	add	x1, x1, #0x60
  400768:	eb00003f 	cmp	x1, x0
  40076c:	540000c0 	b.eq	400784 <deregister_tm_clones+0x2c>  // b.none
  400770:	90000001 	adrp	x1, 400000 <_init-0x610>
  400774:	f9452c21 	ldr	x1, [x1, #2648]
  400778:	b4000061 	cbz	x1, 400784 <deregister_tm_clones+0x2c>
  40077c:	aa0103f0 	mov	x16, x1
  400780:	d61f0200 	br	x16
  400784:	d65f03c0 	ret

0000000000400788 <register_tm_clones>:
  400788:	b0000080 	adrp	x0, 411000 <exit@GLIBC_2.17>
  40078c:	91018000 	add	x0, x0, #0x60
  400790:	b0000081 	adrp	x1, 411000 <exit@GLIBC_2.17>
  400794:	91018021 	add	x1, x1, #0x60
  400798:	cb000021 	sub	x1, x1, x0
  40079c:	d37ffc22 	lsr	x2, x1, #63
  4007a0:	8b810c41 	add	x1, x2, x1, asr #3
  4007a4:	eb8107ff 	cmp	xzr, x1, asr #1
  4007a8:	9341fc21 	asr	x1, x1, #1
  4007ac:	540000c0 	b.eq	4007c4 <register_tm_clones+0x3c>  // b.none
  4007b0:	90000002 	adrp	x2, 400000 <_init-0x610>
  4007b4:	f9453042 	ldr	x2, [x2, #2656]
  4007b8:	b4000062 	cbz	x2, 4007c4 <register_tm_clones+0x3c>
  4007bc:	aa0203f0 	mov	x16, x2
  4007c0:	d61f0200 	br	x16
  4007c4:	d65f03c0 	ret

00000000004007c8 <__do_global_dtors_aux>:
  4007c8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  4007cc:	910003fd 	mov	x29, sp
  4007d0:	f9000bf3 	str	x19, [sp, #16]
  4007d4:	b0000093 	adrp	x19, 411000 <exit@GLIBC_2.17>
  4007d8:	39418260 	ldrb	w0, [x19, #96]
  4007dc:	35000080 	cbnz	w0, 4007ec <__do_global_dtors_aux+0x24>
  4007e0:	97ffffde 	bl	400758 <deregister_tm_clones>
  4007e4:	52800020 	mov	w0, #0x1                   	// #1
  4007e8:	39018260 	strb	w0, [x19, #96]
  4007ec:	f9400bf3 	ldr	x19, [sp, #16]
  4007f0:	a8c27bfd 	ldp	x29, x30, [sp], #32
  4007f4:	d65f03c0 	ret

00000000004007f8 <frame_dummy>:
  4007f8:	17ffffe4 	b	400788 <register_tm_clones>

00000000004007fc <main>:
  4007fc:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  400800:	910003fd 	mov	x29, sp
  400804:	9400001c 	bl	400874 <init>
  400808:	9400002f 	bl	4008c4 <menu>
  40080c:	9400003f 	bl	400908 <get_int>
  400810:	b9001fe0 	str	w0, [sp, #28]
  400814:	b9401fe0 	ldr	w0, [sp, #28]
  400818:	71000c1f 	cmp	w0, #0x3
  40081c:	54000061 	b.ne	400828 <main+0x2c>  // b.any
  400820:	52800000 	mov	w0, #0x0                   	// #0
  400824:	97ffff8b 	bl	400650 <exit@plt>
  400828:	b9401fe0 	ldr	w0, [sp, #28]
  40082c:	7100041f 	cmp	w0, #0x1
  400830:	540000c1 	b.ne	400848 <main+0x4c>  // b.any
  400834:	90000000 	adrp	x0, 400000 <_init-0x610>
  400838:	9129a000 	add	x0, x0, #0xa68
  40083c:	97ffff9d 	bl	4006b0 <puts@plt>
  400840:	94000051 	bl	400984 <leak>
  400844:	17fffff1 	b	400808 <main+0xc>
  400848:	b9401fe0 	ldr	w0, [sp, #28]
  40084c:	7100081f 	cmp	w0, #0x2
  400850:	54fffdc1 	b.ne	400808 <main+0xc>  // b.any
  400854:	90000000 	adrp	x0, 400000 <_init-0x610>
  400858:	9129a000 	add	x0, x0, #0xa68
  40085c:	97ffff95 	bl	4006b0 <puts@plt>
  400860:	9400003a 	bl	400948 <overflow>
  400864:	d503201f 	nop
  400868:	52800000 	mov	w0, #0x0                   	// #0
  40086c:	a8c27bfd 	ldp	x29, x30, [sp], #32
  400870:	d65f03c0 	ret

0000000000400874 <init>:
  400874:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  400878:	910003fd 	mov	x29, sp
  40087c:	90000080 	adrp	x0, 410000 <__FRAME_END__+0xf348>
  400880:	f947ec00 	ldr	x0, [x0, #4056]
  400884:	f9400000 	ldr	x0, [x0]
  400888:	d2800001 	mov	x1, #0x0                   	// #0
  40088c:	97ffff75 	bl	400660 <setbuf@plt>
  400890:	90000080 	adrp	x0, 410000 <__FRAME_END__+0xf348>
  400894:	f947e800 	ldr	x0, [x0, #4048]
  400898:	f9400000 	ldr	x0, [x0]
  40089c:	d2800001 	mov	x1, #0x0                   	// #0
  4008a0:	97ffff70 	bl	400660 <setbuf@plt>
  4008a4:	90000080 	adrp	x0, 410000 <__FRAME_END__+0xf348>
  4008a8:	f947e400 	ldr	x0, [x0, #4040]
  4008ac:	f9400000 	ldr	x0, [x0]
  4008b0:	d2800001 	mov	x1, #0x0                   	// #0
  4008b4:	97ffff6b 	bl	400660 <setbuf@plt>
  4008b8:	52800000 	mov	w0, #0x0                   	// #0
  4008bc:	a8c17bfd 	ldp	x29, x30, [sp], #16
  4008c0:	d65f03c0 	ret

00000000004008c4 <menu>:
  4008c4:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  4008c8:	910003fd 	mov	x29, sp
  4008cc:	90000000 	adrp	x0, 400000 <_init-0x610>
  4008d0:	9129e000 	add	x0, x0, #0xa78
  4008d4:	97ffff77 	bl	4006b0 <puts@plt>
  4008d8:	90000000 	adrp	x0, 400000 <_init-0x610>
  4008dc:	912a4000 	add	x0, x0, #0xa90
  4008e0:	97ffff74 	bl	4006b0 <puts@plt>
  4008e4:	90000000 	adrp	x0, 400000 <_init-0x610>
  4008e8:	912a8000 	add	x0, x0, #0xaa0
  4008ec:	97ffff71 	bl	4006b0 <puts@plt>
  4008f0:	90000000 	adrp	x0, 400000 <_init-0x610>
  4008f4:	912aa000 	add	x0, x0, #0xaa8
  4008f8:	97ffff6e 	bl	4006b0 <puts@plt>
  4008fc:	d503201f 	nop
  400900:	a8c17bfd 	ldp	x29, x30, [sp], #16
  400904:	d65f03c0 	ret

0000000000400908 <get_int>:
  400908:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  40090c:	910003fd 	mov	x29, sp
  400910:	b9001fff 	str	wzr, [sp, #28]
  400914:	910043e0 	add	x0, sp, #0x10
  400918:	d2800142 	mov	x2, #0xa                   	// #10
  40091c:	aa0003e1 	mov	x1, x0
  400920:	52800000 	mov	w0, #0x0                   	// #0
  400924:	97ffff67 	bl	4006c0 <read@plt>
  400928:	b9001fe0 	str	w0, [sp, #28]
  40092c:	b9801fe0 	ldrsw	x0, [sp, #28]
  400930:	910043e1 	add	x1, sp, #0x10
  400934:	3820683f 	strb	wzr, [x1, x0]
  400938:	910043e0 	add	x0, sp, #0x10
  40093c:	97ffff4d 	bl	400670 <atoi@plt>
  400940:	a8c27bfd 	ldp	x29, x30, [sp], #32
  400944:	d65f03c0 	ret

0000000000400948 <overflow>:
  400948:	a9b77bfd 	stp	x29, x30, [sp, #-144]!
  40094c:	910003fd 	mov	x29, sp
  400950:	90000000 	adrp	x0, 400000 <_init-0x610>
  400954:	912ac000 	add	x0, x0, #0xab0
  400958:	97ffff5e 	bl	4006d0 <printf@plt>
  40095c:	910043e0 	add	x0, sp, #0x10
  400960:	97ffff60 	bl	4006e0 <gets@plt>
  400964:	90000000 	adrp	x0, 400000 <_init-0x610>
  400968:	912ae000 	add	x0, x0, #0xab8
  40096c:	97ffff51 	bl	4006b0 <puts@plt>
  400970:	910043e0 	add	x0, sp, #0x10
  400974:	97ffff4f 	bl	4006b0 <puts@plt>
  400978:	52800000 	mov	w0, #0x0                   	// #0
  40097c:	a8c97bfd 	ldp	x29, x30, [sp], #144
  400980:	d65f03c0 	ret

0000000000400984 <leak>:
  400984:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  400988:	910003fd 	mov	x29, sp
  40098c:	f9000fff 	str	xzr, [sp, #24]
  400990:	910063e0 	add	x0, sp, #0x18
  400994:	d2800102 	mov	x2, #0x8                   	// #8
  400998:	aa0003e1 	mov	x1, x0
  40099c:	52800000 	mov	w0, #0x0                   	// #0
  4009a0:	97ffff48 	bl	4006c0 <read@plt>
  4009a4:	f9400fe0 	ldr	x0, [sp, #24]
  4009a8:	97ffff42 	bl	4006b0 <puts@plt>
  4009ac:	d503201f 	nop
  4009b0:	a8c27bfd 	ldp	x29, x30, [sp], #32
  4009b4:	d65f03c0 	ret

00000000004009b8 <__libc_csu_init>:
  4009b8:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
  4009bc:	910003fd 	mov	x29, sp
  4009c0:	a90153f3 	stp	x19, x20, [sp, #16]
  4009c4:	90000094 	adrp	x20, 410000 <__FRAME_END__+0xf348>
  4009c8:	9137a294 	add	x20, x20, #0xde8
  4009cc:	a9025bf5 	stp	x21, x22, [sp, #32]
  4009d0:	90000095 	adrp	x21, 410000 <__FRAME_END__+0xf348>
  4009d4:	913782b5 	add	x21, x21, #0xde0
  4009d8:	cb150294 	sub	x20, x20, x21
  4009dc:	2a0003f6 	mov	w22, w0
  4009e0:	a90363f7 	stp	x23, x24, [sp, #48]
  4009e4:	aa0103f7 	mov	x23, x1
  4009e8:	aa0203f8 	mov	x24, x2
  4009ec:	97ffff09 	bl	400610 <_init>
  4009f0:	eb940fff 	cmp	xzr, x20, asr #3
  4009f4:	54000160 	b.eq	400a20 <__libc_csu_init+0x68>  // b.none
  4009f8:	9343fe94 	asr	x20, x20, #3
  4009fc:	d2800013 	mov	x19, #0x0                   	// #0
  400a00:	f8737aa3 	ldr	x3, [x21, x19, lsl #3]
  400a04:	aa1803e2 	mov	x2, x24
  400a08:	91000673 	add	x19, x19, #0x1
  400a0c:	aa1703e1 	mov	x1, x23
  400a10:	2a1603e0 	mov	w0, w22
  400a14:	d63f0060 	blr	x3
  400a18:	eb13029f 	cmp	x20, x19
  400a1c:	54ffff21 	b.ne	400a00 <__libc_csu_init+0x48>  // b.any
  400a20:	a94153f3 	ldp	x19, x20, [sp, #16]
  400a24:	a9425bf5 	ldp	x21, x22, [sp, #32]
  400a28:	a94363f7 	ldp	x23, x24, [sp, #48]
  400a2c:	a8c47bfd 	ldp	x29, x30, [sp], #64
  400a30:	d65f03c0 	ret
  400a34:	d503201f 	nop

0000000000400a38 <__libc_csu_fini>:
  400a38:	d65f03c0 	ret

Disassembly of section .fini:

0000000000400a3c <_fini>:
  400a3c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  400a40:	910003fd 	mov	x29, sp
  400a44:	a8c17bfd 	ldp	x29, x30, [sp], #16
  400a48:	d65f03c0 	ret
