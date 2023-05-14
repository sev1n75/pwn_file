
fmtstr_ex2：     文件格式 elf64-x86-64


Disassembly of section .init:

00000000000007f0 <.init>:
 7f0:	48 83 ec 08          	sub    $0x8,%rsp
 7f4:	e8 e3 00 00 00       	callq  8dc <__isoc99_scanf@plt+0x44>
 7f9:	e8 82 01 00 00       	callq  980 <__isoc99_scanf@plt+0xe8>
 7fe:	e8 2d 07 00 00       	callq  f30 <__libc_csu_init@@Base+0x90>
 803:	48 83 c4 08          	add    $0x8,%rsp
 807:	c3                   	retq   

Disassembly of section .plt:

0000000000000808 <printf@plt-0x10>:
 808:	ff 35 2a 0d 20 00    	pushq  0x200d2a(%rip)        # 201538 <__libc_csu_init@@Base+0x200698>
 80e:	ff 25 2c 0d 20 00    	jmpq   *0x200d2c(%rip)        # 201540 <__libc_csu_init@@Base+0x2006a0>
 814:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000818 <printf@plt>:
 818:	ff 25 2a 0d 20 00    	jmpq   *0x200d2a(%rip)        # 201548 <printf@GLIBC_2.2.5>
 81e:	68 00 00 00 00       	pushq  $0x0
 823:	e9 e0 ff ff ff       	jmpq   808 <printf@plt-0x10>

0000000000000828 <puts@plt>:
 828:	ff 25 22 0d 20 00    	jmpq   *0x200d22(%rip)        # 201550 <puts@GLIBC_2.2.5>
 82e:	68 01 00 00 00       	pushq  $0x1
 833:	e9 d0 ff ff ff       	jmpq   808 <printf@plt-0x10>

0000000000000838 <exit@plt>:
 838:	ff 25 1a 0d 20 00    	jmpq   *0x200d1a(%rip)        # 201558 <exit@GLIBC_2.2.5>
 83e:	68 02 00 00 00       	pushq  $0x2
 843:	e9 c0 ff ff ff       	jmpq   808 <printf@plt-0x10>

0000000000000848 <read@plt>:
 848:	ff 25 12 0d 20 00    	jmpq   *0x200d12(%rip)        # 201560 <read@GLIBC_2.2.5>
 84e:	68 03 00 00 00       	pushq  $0x3
 853:	e9 b0 ff ff ff       	jmpq   808 <printf@plt-0x10>

0000000000000858 <__libc_start_main@plt>:
 858:	ff 25 0a 0d 20 00    	jmpq   *0x200d0a(%rip)        # 201568 <__libc_start_main@GLIBC_2.2.5>
 85e:	68 04 00 00 00       	pushq  $0x4
 863:	e9 a0 ff ff ff       	jmpq   808 <printf@plt-0x10>

0000000000000868 <__cxa_finalize@plt>:
 868:	ff 25 02 0d 20 00    	jmpq   *0x200d02(%rip)        # 201570 <__cxa_finalize@GLIBC_2.2.5>
 86e:	68 05 00 00 00       	pushq  $0x5
 873:	e9 90 ff ff ff       	jmpq   808 <printf@plt-0x10>

0000000000000878 <setbuf@plt>:
 878:	ff 25 fa 0c 20 00    	jmpq   *0x200cfa(%rip)        # 201578 <setbuf@GLIBC_2.2.5>
 87e:	68 06 00 00 00       	pushq  $0x6
 883:	e9 80 ff ff ff       	jmpq   808 <printf@plt-0x10>

0000000000000888 <strcpy@plt>:
 888:	ff 25 f2 0c 20 00    	jmpq   *0x200cf2(%rip)        # 201580 <strcpy@GLIBC_2.2.5>
 88e:	68 07 00 00 00       	pushq  $0x7
 893:	e9 70 ff ff ff       	jmpq   808 <printf@plt-0x10>

0000000000000898 <__isoc99_scanf@plt>:
 898:	ff 25 ea 0c 20 00    	jmpq   *0x200cea(%rip)        # 201588 <__isoc99_scanf@GLIBC_2.7>
 89e:	68 08 00 00 00       	pushq  $0x8
 8a3:	e9 60 ff ff ff       	jmpq   808 <printf@plt-0x10>

Disassembly of section .text:

00000000000008b0 <main@@Base-0x538>:
 8b0:	31 ed                	xor    %ebp,%ebp
 8b2:	49 89 d1             	mov    %rdx,%r9
 8b5:	5e                   	pop    %rsi
 8b6:	48 89 e2             	mov    %rsp,%rdx
 8b9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
 8bd:	50                   	push   %rax
 8be:	54                   	push   %rsp
 8bf:	4c 8b 05 1a 0c 20 00 	mov    0x200c1a(%rip),%r8        # 2014e0 <__libc_csu_init@@Base+0x200640>
 8c6:	48 8b 0d 3b 0c 20 00 	mov    0x200c3b(%rip),%rcx        # 201508 <__libc_csu_init@@Base+0x200668>
 8cd:	48 8b 3d 54 0c 20 00 	mov    0x200c54(%rip),%rdi        # 201528 <__libc_csu_init@@Base+0x200688>
 8d4:	e8 7f ff ff ff       	callq  858 <__libc_start_main@plt>
 8d9:	f4                   	hlt    
 8da:	90                   	nop
 8db:	90                   	nop
 8dc:	48 83 ec 08          	sub    $0x8,%rsp
 8e0:	48 8b 05 01 0c 20 00 	mov    0x200c01(%rip),%rax        # 2014e8 <__libc_csu_init@@Base+0x200648>
 8e7:	48 85 c0             	test   %rax,%rax
 8ea:	74 02                	je     8ee <__isoc99_scanf@plt+0x56>
 8ec:	ff d0                	callq  *%rax
 8ee:	48 83 c4 08          	add    $0x8,%rsp
 8f2:	c3                   	retq   
 8f3:	90                   	nop
 8f4:	90                   	nop
 8f5:	90                   	nop
 8f6:	90                   	nop
 8f7:	90                   	nop
 8f8:	90                   	nop
 8f9:	90                   	nop
 8fa:	90                   	nop
 8fb:	90                   	nop
 8fc:	90                   	nop
 8fd:	90                   	nop
 8fe:	90                   	nop
 8ff:	90                   	nop
 900:	55                   	push   %rbp
 901:	80 3d 08 0e 20 00 00 	cmpb   $0x0,0x200e08(%rip)        # 201710 <__bss_start@@Base+0x8>
 908:	48 89 e5             	mov    %rsp,%rbp
 90b:	41 54                	push   %r12
 90d:	53                   	push   %rbx
 90e:	75 62                	jne    972 <__isoc99_scanf@plt+0xda>
 910:	48 83 3d e0 0b 20 00 	cmpq   $0x0,0x200be0(%rip)        # 2014f8 <__libc_csu_init@@Base+0x200658>
 917:	00 
 918:	74 0c                	je     926 <__isoc99_scanf@plt+0x8e>
 91a:	48 8d 3d 27 0a 20 00 	lea    0x200a27(%rip),%rdi        # 201348 <__libc_csu_init@@Base+0x2004a8>
 921:	e8 42 ff ff ff       	callq  868 <__cxa_finalize@plt>
 926:	48 8d 1d 0b 0a 20 00 	lea    0x200a0b(%rip),%rbx        # 201338 <__libc_csu_init@@Base+0x200498>
 92d:	4c 8d 25 fc 09 20 00 	lea    0x2009fc(%rip),%r12        # 201330 <__libc_csu_init@@Base+0x200490>
 934:	48 8b 05 dd 0d 20 00 	mov    0x200ddd(%rip),%rax        # 201718 <__bss_start@@Base+0x10>
 93b:	4c 29 e3             	sub    %r12,%rbx
 93e:	48 c1 fb 03          	sar    $0x3,%rbx
 942:	48 83 eb 01          	sub    $0x1,%rbx
 946:	48 39 d8             	cmp    %rbx,%rax
 949:	73 20                	jae    96b <__isoc99_scanf@plt+0xd3>
 94b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 950:	48 83 c0 01          	add    $0x1,%rax
 954:	48 89 05 bd 0d 20 00 	mov    %rax,0x200dbd(%rip)        # 201718 <__bss_start@@Base+0x10>
 95b:	41 ff 14 c4          	callq  *(%r12,%rax,8)
 95f:	48 8b 05 b2 0d 20 00 	mov    0x200db2(%rip),%rax        # 201718 <__bss_start@@Base+0x10>
 966:	48 39 d8             	cmp    %rbx,%rax
 969:	72 e5                	jb     950 <__isoc99_scanf@plt+0xb8>
 96b:	c6 05 9e 0d 20 00 01 	movb   $0x1,0x200d9e(%rip)        # 201710 <__bss_start@@Base+0x8>
 972:	5b                   	pop    %rbx
 973:	41 5c                	pop    %r12
 975:	c9                   	leaveq 
 976:	c3                   	retq   
 977:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
 97e:	00 00 
 980:	48 83 3d b8 09 20 00 	cmpq   $0x0,0x2009b8(%rip)        # 201340 <__libc_csu_init@@Base+0x2004a0>
 987:	00 
 988:	55                   	push   %rbp
 989:	48 89 e5             	mov    %rsp,%rbp
 98c:	74 1a                	je     9a8 <__isoc99_scanf@plt+0x110>
 98e:	48 8b 05 5b 0b 20 00 	mov    0x200b5b(%rip),%rax        # 2014f0 <__libc_csu_init@@Base+0x200650>
 995:	48 85 c0             	test   %rax,%rax
 998:	74 0e                	je     9a8 <__isoc99_scanf@plt+0x110>
 99a:	48 8d 3d 9f 09 20 00 	lea    0x20099f(%rip),%rdi        # 201340 <__libc_csu_init@@Base+0x2004a0>
 9a1:	c9                   	leaveq 
 9a2:	ff e0                	jmpq   *%rax
 9a4:	0f 1f 40 00          	nopl   0x0(%rax)
 9a8:	c9                   	leaveq 
 9a9:	c3                   	retq   
 9aa:	90                   	nop
 9ab:	90                   	nop
 9ac:	55                   	push   %rbp
 9ad:	48 89 e5             	mov    %rsp,%rbp
 9b0:	48 8d 3d c5 05 00 00 	lea    0x5c5(%rip),%rdi        # f7c <__libc_csu_init@@Base+0xdc>
 9b7:	e8 6c fe ff ff       	callq  828 <puts@plt>
 9bc:	48 8d 3d d5 05 00 00 	lea    0x5d5(%rip),%rdi        # f98 <__libc_csu_init@@Base+0xf8>
 9c3:	e8 60 fe ff ff       	callq  828 <puts@plt>
 9c8:	48 8d 3d e5 05 00 00 	lea    0x5e5(%rip),%rdi        # fb4 <__libc_csu_init@@Base+0x114>
 9cf:	e8 54 fe ff ff       	callq  828 <puts@plt>
 9d4:	48 8d 3d f5 05 00 00 	lea    0x5f5(%rip),%rdi        # fd0 <__libc_csu_init@@Base+0x130>
 9db:	e8 48 fe ff ff       	callq  828 <puts@plt>
 9e0:	48 8d 3d 95 05 00 00 	lea    0x595(%rip),%rdi        # f7c <__libc_csu_init@@Base+0xdc>
 9e7:	e8 3c fe ff ff       	callq  828 <puts@plt>
 9ec:	c9                   	leaveq 
 9ed:	c3                   	retq   
 9ee:	55                   	push   %rbp
 9ef:	48 89 e5             	mov    %rsp,%rbp
 9f2:	48 8b 05 07 0b 20 00 	mov    0x200b07(%rip),%rax        # 201500 <__libc_csu_init@@Base+0x200660>
 9f9:	48 8b 00             	mov    (%rax),%rax
 9fc:	be 00 00 00 00       	mov    $0x0,%esi
 a01:	48 89 c7             	mov    %rax,%rdi
 a04:	e8 6f fe ff ff       	callq  878 <setbuf@plt>
 a09:	48 8b 05 10 0b 20 00 	mov    0x200b10(%rip),%rax        # 201520 <__libc_csu_init@@Base+0x200680>
 a10:	48 8b 00             	mov    (%rax),%rax
 a13:	be 00 00 00 00       	mov    $0x0,%esi
 a18:	48 89 c7             	mov    %rax,%rdi
 a1b:	e8 58 fe ff ff       	callq  878 <setbuf@plt>
 a20:	48 8b 05 f1 0a 20 00 	mov    0x200af1(%rip),%rax        # 201518 <__libc_csu_init@@Base+0x200678>
 a27:	48 8b 00             	mov    (%rax),%rax
 a2a:	be 00 00 00 00       	mov    $0x0,%esi
 a2f:	48 89 c7             	mov    %rax,%rdi
 a32:	e8 41 fe ff ff       	callq  878 <setbuf@plt>
 a37:	c9                   	leaveq 
 a38:	c3                   	retq   
 a39:	55                   	push   %rbp
 a3a:	48 89 e5             	mov    %rsp,%rbp
 a3d:	48 8d 3d 38 05 00 00 	lea    0x538(%rip),%rdi        # f7c <__libc_csu_init@@Base+0xdc>
 a44:	e8 df fd ff ff       	callq  828 <puts@plt>
 a49:	48 8d 3d 9c 05 00 00 	lea    0x59c(%rip),%rdi        # fec <__libc_csu_init@@Base+0x14c>
 a50:	e8 d3 fd ff ff       	callq  828 <puts@plt>
 a55:	48 8d 3d ac 05 00 00 	lea    0x5ac(%rip),%rdi        # 1008 <__libc_csu_init@@Base+0x168>
 a5c:	e8 c7 fd ff ff       	callq  828 <puts@plt>
 a61:	48 8d 3d bc 05 00 00 	lea    0x5bc(%rip),%rdi        # 1024 <__libc_csu_init@@Base+0x184>
 a68:	e8 bb fd ff ff       	callq  828 <puts@plt>
 a6d:	48 8d 3d cc 05 00 00 	lea    0x5cc(%rip),%rdi        # 1040 <__libc_csu_init@@Base+0x1a0>
 a74:	e8 af fd ff ff       	callq  828 <puts@plt>
 a79:	48 8d 3d fc 04 00 00 	lea    0x4fc(%rip),%rdi        # f7c <__libc_csu_init@@Base+0xdc>
 a80:	e8 a3 fd ff ff       	callq  828 <puts@plt>
 a85:	48 8d 3d d0 05 00 00 	lea    0x5d0(%rip),%rdi        # 105c <__libc_csu_init@@Base+0x1bc>
 a8c:	e8 97 fd ff ff       	callq  828 <puts@plt>
 a91:	c9                   	leaveq 
 a92:	c3                   	retq   
 a93:	55                   	push   %rbp
 a94:	48 89 e5             	mov    %rsp,%rbp
 a97:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
 a9b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
 a9f:	89 55 dc             	mov    %edx,-0x24(%rbp)
 aa2:	89 4d d8             	mov    %ecx,-0x28(%rbp)
 aa5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
 aac:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
 ab0:	eb 13                	jmp    ac5 <__isoc99_scanf@plt+0x22d>
 ab2:	8b 45 f8             	mov    -0x8(%rbp),%eax
 ab5:	48 98                	cltq   
 ab7:	48 03 45 e8          	add    -0x18(%rbp),%rax
 abb:	0f b6 00             	movzbl (%rax),%eax
 abe:	30 45 ff             	xor    %al,-0x1(%rbp)
 ac1:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
 ac5:	8b 45 f8             	mov    -0x8(%rbp),%eax
 ac8:	3b 45 dc             	cmp    -0x24(%rbp),%eax
 acb:	7c e5                	jl     ab2 <__isoc99_scanf@plt+0x21a>
 acd:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
 ad4:	eb 1f                	jmp    af5 <__isoc99_scanf@plt+0x25d>
 ad6:	8b 45 f8             	mov    -0x8(%rbp),%eax
 ad9:	48 98                	cltq   
 adb:	48 03 45 e0          	add    -0x20(%rbp),%rax
 adf:	8b 55 f8             	mov    -0x8(%rbp),%edx
 ae2:	48 63 d2             	movslq %edx,%rdx
 ae5:	48 03 55 e0          	add    -0x20(%rbp),%rdx
 ae9:	0f b6 12             	movzbl (%rdx),%edx
 aec:	32 55 ff             	xor    -0x1(%rbp),%dl
 aef:	88 10                	mov    %dl,(%rax)
 af1:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
 af5:	8b 45 f8             	mov    -0x8(%rbp),%eax
 af8:	3b 45 d8             	cmp    -0x28(%rbp),%eax
 afb:	7c d9                	jl     ad6 <__isoc99_scanf@plt+0x23e>
 afd:	c9                   	leaveq 
 afe:	c3                   	retq   
# --------------------encrypt2------------------------------------------
 aff:	55                   	push   %rbp
 b00:	48 89 e5             	mov    %rsp,%rbp
 b03:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
 b07:	89 75 e4             	mov    %esi,-0x1c(%rbp)
 b0a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
 b11:	eb 6a                	jmp    b7d <__isoc99_scanf@plt+0x2e5>
 b13:	8b 45 fc             	mov    -0x4(%rbp),%eax
 b16:	48 98                	cltq   
 b18:	48 03 45 e8          	add    -0x18(%rbp),%rax
 b1c:	8b 55 fc             	mov    -0x4(%rbp),%edx
 b1f:	48 63 d2             	movslq %edx,%rdx
 b22:	48 03 55 e8          	add    -0x18(%rbp),%rdx
 b26:	0f b6 12             	movzbl (%rdx),%edx
 b29:	0f be d2             	movsbl %dl,%edx
 b2c:	81 e2 c0 00 00 00    	and    $0xc0,%edx
 b32:	c1 fa 06             	sar    $0x6,%edx
 b35:	89 d1                	mov    %edx,%ecx
 b37:	8b 55 fc             	mov    -0x4(%rbp),%edx
 b3a:	48 63 d2             	movslq %edx,%rdx
 b3d:	48 03 55 e8          	add    -0x18(%rbp),%rdx
 b41:	0f b6 12             	movzbl (%rdx),%edx
 b44:	83 e2 30             	and    $0x30,%edx
 b47:	c1 e2 02             	shl    $0x2,%edx
 b4a:	01 d1                	add    %edx,%ecx
 b4c:	8b 55 fc             	mov    -0x4(%rbp),%edx
 b4f:	48 63 d2             	movslq %edx,%rdx
 b52:	48 03 55 e8          	add    -0x18(%rbp),%rdx
 b56:	0f b6 12             	movzbl (%rdx),%edx
 b59:	83 e2 0c             	and    $0xc,%edx
 b5c:	c1 e2 02             	shl    $0x2,%edx
 b5f:	01 d1                	add    %edx,%ecx
 b61:	8b 55 fc             	mov    -0x4(%rbp),%edx
 b64:	48 63 d2             	movslq %edx,%rdx
 b67:	48 03 55 e8          	add    -0x18(%rbp),%rdx
 b6b:	0f b6 12             	movzbl (%rdx),%edx
 b6e:	83 e2 03             	and    $0x3,%edx
 b71:	c1 e2 02             	shl    $0x2,%edx
 b74:	8d 14 11             	lea    (%rcx,%rdx,1),%edx
 b77:	88 10                	mov    %dl,(%rax)
 b79:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
 b7d:	8b 45 fc             	mov    -0x4(%rbp),%eax
 b80:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
 b83:	7c 8e                	jl     b13 <__isoc99_scanf@plt+0x27b>
 b85:	c9                   	leaveq 
 b86:	c3                   	retq   
# ---------------------------------------------------------------------

 b87:	55                   	push   %rbp
 b88:	48 89 e5             	mov    %rsp,%rbp
 b8b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
 b8f:	89 75 e4             	mov    %esi,-0x1c(%rbp)
 b92:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
 b99:	eb 70                	jmp    c0b <__isoc99_scanf@plt+0x373>
 b9b:	8b 45 fc             	mov    -0x4(%rbp),%eax
 b9e:	48 98                	cltq   
 ba0:	48 03 45 e8          	add    -0x18(%rbp),%rax
 ba4:	8b 55 fc             	mov    -0x4(%rbp),%edx
 ba7:	48 63 d2             	movslq %edx,%rdx
 baa:	48 03 55 e8          	add    -0x18(%rbp),%rdx
 bae:	0f b6 12             	movzbl (%rdx),%edx
 bb1:	0f be d2             	movsbl %dl,%edx
 bb4:	81 e2 c0 00 00 00    	and    $0xc0,%edx
 bba:	c1 fa 02             	sar    $0x2,%edx
 bbd:	89 d1                	mov    %edx,%ecx
 bbf:	8b 55 fc             	mov    -0x4(%rbp),%edx
 bc2:	48 63 d2             	movslq %edx,%rdx
 bc5:	48 03 55 e8          	add    -0x18(%rbp),%rdx
 bc9:	0f b6 12             	movzbl (%rdx),%edx
 bcc:	0f be d2             	movsbl %dl,%edx
 bcf:	83 e2 30             	and    $0x30,%edx
 bd2:	c1 fa 02             	sar    $0x2,%edx
 bd5:	01 d1                	add    %edx,%ecx
 bd7:	8b 55 fc             	mov    -0x4(%rbp),%edx
 bda:	48 63 d2             	movslq %edx,%rdx
 bdd:	48 03 55 e8          	add    -0x18(%rbp),%rdx
 be1:	0f b6 12             	movzbl (%rdx),%edx
 be4:	0f be d2             	movsbl %dl,%edx
 be7:	83 e2 0c             	and    $0xc,%edx
 bea:	c1 fa 02             	sar    $0x2,%edx
 bed:	01 d1                	add    %edx,%ecx
 bef:	8b 55 fc             	mov    -0x4(%rbp),%edx
 bf2:	48 63 d2             	movslq %edx,%rdx
 bf5:	48 03 55 e8          	add    -0x18(%rbp),%rdx
 bf9:	0f b6 12             	movzbl (%rdx),%edx
 bfc:	0f be d2             	movsbl %dl,%edx
 bff:	c1 e2 06             	shl    $0x6,%edx
 c02:	8d 14 11             	lea    (%rcx,%rdx,1),%edx
 c05:	88 10                	mov    %dl,(%rax)
 c07:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
 c0b:	8b 45 fc             	mov    -0x4(%rbp),%eax
 c0e:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
 c11:	7c 88                	jl     b9b <__isoc99_scanf@plt+0x303>
 c13:	c9                   	leaveq 
 c14:	c3                   	retq   
 c15:	55                   	push   %rbp
 c16:	48 89 e5             	mov    %rsp,%rbp
 c19:	48 83 ec 30          	sub    $0x30,%rsp
 c1d:	48 8d 3d 45 04 00 00 	lea    0x445(%rip),%rdi        # 1069 <__libc_csu_init@@Base+0x1c9>
 c24:	e8 ff fb ff ff       	callq  828 <puts@plt>
 c29:	48 8d 3d 55 04 00 00 	lea    0x455(%rip),%rdi        # 1085 <__libc_csu_init@@Base+0x1e5>
 c30:	e8 f3 fb ff ff       	callq  828 <puts@plt>
 c35:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
 c39:	ba 20 00 00 00       	mov    $0x20,%edx
 c3e:	48 89 c6             	mov    %rax,%rsi
 c41:	bf 00 00 00 00       	mov    $0x0,%edi
 c46:	e8 fd fb ff ff       	callq  848 <read@plt>
 c4b:	89 45 f8             	mov    %eax,-0x8(%rbp)
 c4e:	48 8d 05 36 04 00 00 	lea    0x436(%rip),%rax        # 108b <__libc_csu_init@@Base+0x1eb>
 c55:	48 8d 55 d0          	lea    -0x30(%rbp),%rdx
 c59:	48 89 d6             	mov    %rdx,%rsi
 c5c:	48 89 c7             	mov    %rax,%rdi
 c5f:	b8 00 00 00 00       	mov    $0x0,%eax
 c64:	e8 af fb ff ff       	callq  818 <printf@plt>
 c69:	48 8d 3d 27 04 00 00 	lea    0x427(%rip),%rdi        # 1097 <__libc_csu_init@@Base+0x1f7>
 c70:	e8 b3 fb ff ff       	callq  828 <puts@plt>
 c75:	ba 50 01 00 00       	mov    $0x150,%edx
 c7a:	48 8d 35 3f 09 20 00 	lea    0x20093f(%rip),%rsi        # 2015c0 <__libc_csu_init@@Base+0x200720>
 c81:	bf 00 00 00 00       	mov    $0x0,%edi
 c86:	e8 bd fb ff ff       	callq  848 <read@plt>
 c8b:	89 45 fc             	mov    %eax,-0x4(%rbp)
 c8e:	8b 4d fc             	mov    -0x4(%rbp),%ecx
 c91:	8b 55 f8             	mov    -0x8(%rbp),%edx
 c94:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
 c98:	48 8d 35 21 09 20 00 	lea    0x200921(%rip),%rsi        # 2015c0 <__libc_csu_init@@Base+0x200720>
 c9f:	48 89 c7             	mov    %rax,%rdi
 ca2:	e8 ec fd ff ff       	callq  a93 <__isoc99_scanf@plt+0x1fb>
 ca7:	48 8d 3d 01 04 00 00 	lea    0x401(%rip),%rdi        # 10af <__libc_csu_init@@Base+0x20f>
 cae:	e8 75 fb ff ff       	callq  828 <puts@plt>
 cb3:	48 8d 3d 06 09 20 00 	lea    0x200906(%rip),%rdi        # 2015c0 <__libc_csu_init@@Base+0x200720>
 cba:	e8 69 fb ff ff       	callq  828 <puts@plt>
 cbf:	48 8d 3d fb 03 00 00 	lea    0x3fb(%rip),%rdi        # 10c1 <__libc_csu_init@@Base+0x221>
 cc6:	e8 5d fb ff ff       	callq  828 <puts@plt>
 ccb:	c9                   	leaveq 
 ccc:	c3                   	retq   
 ccd:	55                   	push   %rbp
 cce:	48 89 e5             	mov    %rsp,%rbp
 cd1:	48 81 ec 60 01 00 00 	sub    $0x160,%rsp
 cd8:	48 8d 3d f3 03 00 00 	lea    0x3f3(%rip),%rdi        # 10d2 <__libc_csu_init@@Base+0x232>
 cdf:	e8 44 fb ff ff       	callq  828 <puts@plt>
 ce4:	48 8d 3d ac 03 00 00 	lea    0x3ac(%rip),%rdi        # 1097 <__libc_csu_init@@Base+0x1f7>
 ceb:	e8 38 fb ff ff       	callq  828 <puts@plt>
 cf0:	ba 18 00 00 00       	mov    $0x18,%edx
 cf5:	48 8b 05 14 08 20 00 	mov    0x200814(%rip),%rax        # 201510 <__libc_csu_init@@Base+0x200670>
 cfc:	48 89 c6             	mov    %rax,%rsi
 cff:	bf 00 00 00 00       	mov    $0x0,%edi
 d04:	e8 3f fb ff ff       	callq  848 <read@plt>
 d09:	89 45 fc             	mov    %eax,-0x4(%rbp)
 d0c:	48 8d 3d 9c 03 00 00 	lea    0x39c(%rip),%rdi        # 10af <__libc_csu_init@@Base+0x20f>
 d13:	e8 10 fb ff ff       	callq  828 <puts@plt>
 d18:	8b 45 fc             	mov    -0x4(%rbp),%eax
 d1b:	89 c6                	mov    %eax,%esi
 d1d:	48 8b 05 ec 07 20 00 	mov    0x2007ec(%rip),%rax        # 201510 <__libc_csu_init@@Base+0x200670>
 d24:	48 89 c7             	mov    %rax,%rdi
 d27:	e8 d3 fd ff ff       	callq  aff <__isoc99_scanf@plt+0x267>
 d2c:	48 8b 05 dd 07 20 00 	mov    0x2007dd(%rip),%rax        # 201510 <__libc_csu_init@@Base+0x200670>
 d33:	48 89 c7             	mov    %rax,%rdi
 d36:	b8 00 00 00 00       	mov    $0x0,%eax
 d3b:	e8 d8 fa ff ff       	callq  818 <printf@plt>
 d40:	48 8d 3d 7a 03 00 00 	lea    0x37a(%rip),%rdi        # 10c1 <__libc_csu_init@@Base+0x221>
 d47:	e8 dc fa ff ff       	callq  828 <puts@plt>
 d4c:	c9                   	leaveq 
 d4d:	c3                   	retq   
 d4e:	55                   	push   %rbp
 d4f:	48 89 e5             	mov    %rsp,%rbp
 d52:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
 d59:	48 8d 3d 8e 03 00 00 	lea    0x38e(%rip),%rdi        # 10ee <__libc_csu_init@@Base+0x24e>
 d60:	e8 c3 fa ff ff       	callq  828 <puts@plt>
 d65:	48 8d 3d 2b 03 00 00 	lea    0x32b(%rip),%rdi        # 1097 <__libc_csu_init@@Base+0x1f7>
 d6c:	e8 b7 fa ff ff       	callq  828 <puts@plt>
 d71:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
 d78:	ba 00 01 00 00       	mov    $0x100,%edx
 d7d:	48 89 c6             	mov    %rax,%rsi
 d80:	bf 00 00 00 00       	mov    $0x0,%edi
 d85:	e8 be fa ff ff       	callq  848 <read@plt>
 d8a:	89 45 fc             	mov    %eax,-0x4(%rbp)
 d8d:	48 8d 3d 1b 03 00 00 	lea    0x31b(%rip),%rdi        # 10af <__libc_csu_init@@Base+0x20f>
 d94:	e8 8f fa ff ff       	callq  828 <puts@plt>
 d99:	8b 55 fc             	mov    -0x4(%rbp),%edx
 d9c:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
 da3:	89 d6                	mov    %edx,%esi
 da5:	48 89 c7             	mov    %rax,%rdi
 da8:	e8 da fd ff ff       	callq  b87 <__isoc99_scanf@plt+0x2ef>
 dad:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
 db4:	48 89 c7             	mov    %rax,%rdi
 db7:	e8 6c fa ff ff       	callq  828 <puts@plt>
 dbc:	48 8d 3d fe 02 00 00 	lea    0x2fe(%rip),%rdi        # 10c1 <__libc_csu_init@@Base+0x221>
 dc3:	e8 60 fa ff ff       	callq  828 <puts@plt>
 dc8:	48 8d 15 f1 07 20 00 	lea    0x2007f1(%rip),%rdx        # 2015c0 <__libc_csu_init@@Base+0x200720>
 dcf:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
 dd6:	48 89 d6             	mov    %rdx,%rsi
 dd9:	48 89 c7             	mov    %rax,%rdi
 ddc:	e8 a7 fa ff ff       	callq  888 <strcpy@plt>
 de1:	b8 00 00 00 00       	mov    $0x0,%eax
 de6:	c9                   	leaveq 
 de7:	c3                   	retq   

0000000000000de8 <main@@Base>:
 de8:	55                   	push   %rbp
 de9:	48 89 e5             	mov    %rsp,%rbp
 dec:	48 83 ec 10          	sub    $0x10,%rsp
 df0:	b8 00 00 00 00       	mov    $0x0,%eax
 df5:	e8 f4 fb ff ff       	callq  9ee <__isoc99_scanf@plt+0x156>
 dfa:	b8 00 00 00 00       	mov    $0x0,%eax
 dff:	e8 a8 fb ff ff       	callq  9ac <__isoc99_scanf@plt+0x114>
 e04:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
 e0b:	eb 01                	jmp    e0e <main@@Base+0x26>
 e0d:	90                   	nop
 e0e:	b8 00 00 00 00       	mov    $0x0,%eax
 e13:	e8 21 fc ff ff       	callq  a39 <__isoc99_scanf@plt+0x1a1>
 e18:	48 8d 05 eb 02 00 00 	lea    0x2eb(%rip),%rax        # 110a <__libc_csu_init@@Base+0x26a>
 e1f:	48 8d 55 fc          	lea    -0x4(%rbp),%rdx
 e23:	48 89 d6             	mov    %rdx,%rsi
 e26:	48 89 c7             	mov    %rax,%rdi
 e29:	b8 00 00 00 00       	mov    $0x0,%eax
 e2e:	e8 65 fa ff ff       	callq  898 <__isoc99_scanf@plt>
 e33:	8b 45 fc             	mov    -0x4(%rbp),%eax
 e36:	83 f8 02             	cmp    $0x2,%eax
 e39:	74 16                	je     e51 <main@@Base+0x69>
 e3b:	83 f8 03             	cmp    $0x3,%eax
 e3e:	74 1d                	je     e5d <main@@Base+0x75>
 e40:	83 f8 01             	cmp    $0x1,%eax
 e43:	75 22                	jne    e67 <main@@Base+0x7f>
 e45:	b8 00 00 00 00       	mov    $0x0,%eax
 e4a:	e8 c6 fd ff ff       	callq  c15 <__isoc99_scanf@plt+0x37d>
 e4f:	eb 16                	jmp    e67 <main@@Base+0x7f>
 e51:	b8 00 00 00 00       	mov    $0x0,%eax
 e56:	e8 72 fe ff ff       	callq  ccd <__isoc99_scanf@plt+0x435>
 e5b:	eb 0a                	jmp    e67 <main@@Base+0x7f>
 e5d:	b8 00 00 00 00       	mov    $0x0,%eax
 e62:	e8 e7 fe ff ff       	callq  d4e <__isoc99_scanf@plt+0x4b6>
 e67:	48 8b 05 92 08 20 00 	mov    0x200892(%rip),%rax        # 201700 <__libc_csu_init@@Base+0x200860>
 e6e:	48 83 e8 01          	sub    $0x1,%rax
 e72:	48 89 05 87 08 20 00 	mov    %rax,0x200887(%rip)        # 201700 <__libc_csu_init@@Base+0x200860>
 e79:	48 8b 05 80 08 20 00 	mov    0x200880(%rip),%rax        # 201700 <__libc_csu_init@@Base+0x200860>
 e80:	48 85 c0             	test   %rax,%rax
 e83:	7f 88                	jg     e0d <main@@Base+0x25>
 e85:	bf 00 00 00 00       	mov    $0x0,%edi
 e8a:	e8 a9 f9 ff ff       	callq  838 <exit@plt>
 e8f:	90                   	nop

0000000000000e90 <__libc_csu_fini@@Base>:
 e90:	f3 c3                	repz retq 
 e92:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
 e99:	1f 84 00 00 00 00 00 

0000000000000ea0 <__libc_csu_init@@Base>:
 ea0:	48 89 6c 24 d8       	mov    %rbp,-0x28(%rsp)
 ea5:	4c 89 64 24 e0       	mov    %r12,-0x20(%rsp)
 eaa:	48 8d 2d 6b 04 20 00 	lea    0x20046b(%rip),%rbp        # 20131c <__libc_csu_init@@Base+0x20047c>
 eb1:	4c 8d 25 64 04 20 00 	lea    0x200464(%rip),%r12        # 20131c <__libc_csu_init@@Base+0x20047c>
 eb8:	4c 89 6c 24 e8       	mov    %r13,-0x18(%rsp)
 ebd:	4c 89 74 24 f0       	mov    %r14,-0x10(%rsp)
 ec2:	4c 89 7c 24 f8       	mov    %r15,-0x8(%rsp)
 ec7:	48 89 5c 24 d0       	mov    %rbx,-0x30(%rsp)
 ecc:	48 83 ec 38          	sub    $0x38,%rsp
 ed0:	4c 29 e5             	sub    %r12,%rbp
 ed3:	41 89 fd             	mov    %edi,%r13d
 ed6:	49 89 f6             	mov    %rsi,%r14
 ed9:	48 c1 fd 03          	sar    $0x3,%rbp
 edd:	49 89 d7             	mov    %rdx,%r15
 ee0:	e8 0b f9 ff ff       	callq  7f0 <printf@plt-0x28>
 ee5:	48 85 ed             	test   %rbp,%rbp
 ee8:	74 1c                	je     f06 <__libc_csu_init@@Base+0x66>
 eea:	31 db                	xor    %ebx,%ebx
 eec:	0f 1f 40 00          	nopl   0x0(%rax)
 ef0:	4c 89 fa             	mov    %r15,%rdx
 ef3:	4c 89 f6             	mov    %r14,%rsi
 ef6:	44 89 ef             	mov    %r13d,%edi
 ef9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
 efd:	48 83 c3 01          	add    $0x1,%rbx
 f01:	48 39 eb             	cmp    %rbp,%rbx
 f04:	72 ea                	jb     ef0 <__libc_csu_init@@Base+0x50>
 f06:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
 f0b:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
 f10:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
 f15:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
 f1a:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
 f1f:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
 f24:	48 83 c4 38          	add    $0x38,%rsp
 f28:	c3                   	retq   
 f29:	90                   	nop
 f2a:	90                   	nop
 f2b:	90                   	nop
 f2c:	90                   	nop
 f2d:	90                   	nop
 f2e:	90                   	nop
 f2f:	90                   	nop
 f30:	55                   	push   %rbp
 f31:	48 89 e5             	mov    %rsp,%rbp
 f34:	53                   	push   %rbx
 f35:	48 83 ec 08          	sub    $0x8,%rsp
 f39:	48 8b 05 e0 03 20 00 	mov    0x2003e0(%rip),%rax        # 201320 <__libc_csu_init@@Base+0x200480>
 f40:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
 f44:	74 19                	je     f5f <__libc_csu_init@@Base+0xbf>
 f46:	48 8d 1d d3 03 20 00 	lea    0x2003d3(%rip),%rbx        # 201320 <__libc_csu_init@@Base+0x200480>
 f4d:	0f 1f 00             	nopl   (%rax)
 f50:	48 83 eb 08          	sub    $0x8,%rbx
 f54:	ff d0                	callq  *%rax
 f56:	48 8b 03             	mov    (%rbx),%rax
 f59:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
 f5d:	75 f1                	jne    f50 <__libc_csu_init@@Base+0xb0>
 f5f:	48 83 c4 08          	add    $0x8,%rsp
 f63:	5b                   	pop    %rbx
 f64:	c9                   	leaveq 
 f65:	c3                   	retq   
 f66:	90                   	nop
 f67:	90                   	nop

Disassembly of section .fini:

0000000000000f68 <.fini>:
 f68:	48 83 ec 08          	sub    $0x8,%rsp
 f6c:	e8 8f f9 ff ff       	callq  900 <__isoc99_scanf@plt+0x68>
 f71:	48 83 c4 08          	add    $0x8,%rsp
 f75:	c3                   	retq   
