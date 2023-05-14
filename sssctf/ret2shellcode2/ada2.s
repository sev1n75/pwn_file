
ada2：     文件格式 elf64-x86-64


Disassembly of section .init:

0000000000400528 <.init>:
  400528:	48 83 ec 08          	sub    $0x8,%rsp
  40052c:	48 8b 05 c5 0a 20 00 	mov    0x200ac5(%rip),%rax        # 600ff8 <__gmon_start__@plt+0x200a48>
  400533:	48 85 c0             	test   %rax,%rax
  400536:	74 05                	je     40053d <puts@plt-0x23>
  400538:	e8 73 00 00 00       	callq  4005b0 <__gmon_start__@plt>
  40053d:	48 83 c4 08          	add    $0x8,%rsp
  400541:	c3                   	retq   

Disassembly of section .plt:

0000000000400550 <puts@plt-0x10>:
  400550:	ff 35 b2 0a 20 00    	pushq  0x200ab2(%rip)        # 601008 <__gmon_start__@plt+0x200a58>
  400556:	ff 25 b4 0a 20 00    	jmpq   *0x200ab4(%rip)        # 601010 <__gmon_start__@plt+0x200a60>
  40055c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400560 <puts@plt>:
  400560:	ff 25 b2 0a 20 00    	jmpq   *0x200ab2(%rip)        # 601018 <__gmon_start__@plt+0x200a68>
  400566:	68 00 00 00 00       	pushq  $0x0
  40056b:	e9 e0 ff ff ff       	jmpq   400550 <puts@plt-0x10>

0000000000400570 <setbuf@plt>:
  400570:	ff 25 aa 0a 20 00    	jmpq   *0x200aaa(%rip)        # 601020 <__gmon_start__@plt+0x200a70>
  400576:	68 01 00 00 00       	pushq  $0x1
  40057b:	e9 d0 ff ff ff       	jmpq   400550 <puts@plt-0x10>

0000000000400580 <alarm@plt>:
  400580:	ff 25 a2 0a 20 00    	jmpq   *0x200aa2(%rip)        # 601028 <__gmon_start__@plt+0x200a78>
  400586:	68 02 00 00 00       	pushq  $0x2
  40058b:	e9 c0 ff ff ff       	jmpq   400550 <puts@plt-0x10>

0000000000400590 <read@plt>:
  400590:	ff 25 9a 0a 20 00    	jmpq   *0x200a9a(%rip)        # 601030 <__gmon_start__@plt+0x200a80>
  400596:	68 03 00 00 00       	pushq  $0x3
  40059b:	e9 b0 ff ff ff       	jmpq   400550 <puts@plt-0x10>

00000000004005a0 <__libc_start_main@plt>:
  4005a0:	ff 25 92 0a 20 00    	jmpq   *0x200a92(%rip)        # 601038 <__gmon_start__@plt+0x200a88>
  4005a6:	68 04 00 00 00       	pushq  $0x4
  4005ab:	e9 a0 ff ff ff       	jmpq   400550 <puts@plt-0x10>

Disassembly of section .plt.got:

00000000004005b0 <__gmon_start__@plt>:
  4005b0:	ff 25 42 0a 20 00    	jmpq   *0x200a42(%rip)        # 600ff8 <__gmon_start__@plt+0x200a48>
  4005b6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

00000000004005c0 <.text>:
  4005c0:	31 ed                	xor    %ebp,%ebp
  4005c2:	49 89 d1             	mov    %rdx,%r9
  4005c5:	5e                   	pop    %rsi
  4005c6:	48 89 e2             	mov    %rsp,%rdx
  4005c9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4005cd:	50                   	push   %rax
  4005ce:	54                   	push   %rsp
  4005cf:	49 c7 c0 20 08 40 00 	mov    $0x400820,%r8
  4005d6:	48 c7 c1 b0 07 40 00 	mov    $0x4007b0,%rcx
  4005dd:	48 c7 c7 7e 07 40 00 	mov    $0x40077e,%rdi
  4005e4:	e8 b7 ff ff ff       	callq  4005a0 <__libc_start_main@plt>
  4005e9:	f4                   	hlt    
  4005ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4005f0:	b8 57 10 60 00       	mov    $0x601057,%eax
  4005f5:	55                   	push   %rbp
  4005f6:	48 2d 50 10 60 00    	sub    $0x601050,%rax
  4005fc:	48 83 f8 0e          	cmp    $0xe,%rax
  400600:	48 89 e5             	mov    %rsp,%rbp
  400603:	76 1b                	jbe    400620 <__gmon_start__@plt+0x70>
  400605:	b8 00 00 00 00       	mov    $0x0,%eax
  40060a:	48 85 c0             	test   %rax,%rax
  40060d:	74 11                	je     400620 <__gmon_start__@plt+0x70>
  40060f:	5d                   	pop    %rbp
  400610:	bf 50 10 60 00       	mov    $0x601050,%edi
  400615:	ff e0                	jmpq   *%rax
  400617:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40061e:	00 00 
  400620:	5d                   	pop    %rbp
  400621:	c3                   	retq   
  400622:	0f 1f 40 00          	nopl   0x0(%rax)
  400626:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40062d:	00 00 00 
  400630:	be 50 10 60 00       	mov    $0x601050,%esi
  400635:	55                   	push   %rbp
  400636:	48 81 ee 50 10 60 00 	sub    $0x601050,%rsi
  40063d:	48 c1 fe 03          	sar    $0x3,%rsi
  400641:	48 89 e5             	mov    %rsp,%rbp
  400644:	48 89 f0             	mov    %rsi,%rax
  400647:	48 c1 e8 3f          	shr    $0x3f,%rax
  40064b:	48 01 c6             	add    %rax,%rsi
  40064e:	48 d1 fe             	sar    %rsi
  400651:	74 15                	je     400668 <__gmon_start__@plt+0xb8>
  400653:	b8 00 00 00 00       	mov    $0x0,%eax
  400658:	48 85 c0             	test   %rax,%rax
  40065b:	74 0b                	je     400668 <__gmon_start__@plt+0xb8>
  40065d:	5d                   	pop    %rbp
  40065e:	bf 50 10 60 00       	mov    $0x601050,%edi
  400663:	ff e0                	jmpq   *%rax
  400665:	0f 1f 00             	nopl   (%rax)
  400668:	5d                   	pop    %rbp
  400669:	c3                   	retq   
  40066a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  400670:	80 3d 11 0a 20 00 00 	cmpb   $0x0,0x200a11(%rip)        # 601088 <stderr@@GLIBC_2.2.5+0x8>
  400677:	75 11                	jne    40068a <__gmon_start__@plt+0xda>
  400679:	55                   	push   %rbp
  40067a:	48 89 e5             	mov    %rsp,%rbp
  40067d:	e8 6e ff ff ff       	callq  4005f0 <__gmon_start__@plt+0x40>
  400682:	5d                   	pop    %rbp
  400683:	c6 05 fe 09 20 00 01 	movb   $0x1,0x2009fe(%rip)        # 601088 <stderr@@GLIBC_2.2.5+0x8>
  40068a:	f3 c3                	repz retq 
  40068c:	0f 1f 40 00          	nopl   0x0(%rax)
  400690:	bf 20 0e 60 00       	mov    $0x600e20,%edi
  400695:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  400699:	75 05                	jne    4006a0 <__gmon_start__@plt+0xf0>
  40069b:	eb 93                	jmp    400630 <__gmon_start__@plt+0x80>
  40069d:	0f 1f 00             	nopl   (%rax)
  4006a0:	b8 00 00 00 00       	mov    $0x0,%eax
  4006a5:	48 85 c0             	test   %rax,%rax
  4006a8:	74 f1                	je     40069b <__gmon_start__@plt+0xeb>
  4006aa:	55                   	push   %rbp
  4006ab:	48 89 e5             	mov    %rsp,%rbp
  4006ae:	ff d0                	callq  *%rax
  4006b0:	5d                   	pop    %rbp
  4006b1:	e9 7a ff ff ff       	jmpq   400630 <__gmon_start__@plt+0x80>
  4006b6:	55                   	push   %rbp
  4006b7:	48 89 e5             	mov    %rsp,%rbp
  4006ba:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  4006be:	89 75 f4             	mov    %esi,-0xc(%rbp)
  4006c1:	ff e4                	jmpq   *%rsp
  4006c3:	90                   	nop
  4006c4:	5d                   	pop    %rbp
  4006c5:	c3                   	retq   
# -----------------------------------------------------------------------
  4006c6:	55                   	push   %rbp
  4006c7:	48 89 e5             	mov    %rsp,%rbp
  4006ca:	48 83 ec 20          	sub    $0x20,%rsp
  4006ce:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  4006d5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  4006dc:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  4006e0:	ba 20 00 00 00       	mov    $0x20,%edx
  4006e5:	48 89 c6             	mov    %rax,%rsi
  4006e8:	bf 00 00 00 00       	mov    $0x0,%edi
  4006ed:	e8 9e fe ff ff       	callq  400590 <read@plt>
  4006f2:	81 7d fc 65 6e 69 66 	cmpl   $0x66696e65,-0x4(%rbp)
  4006f9:	75 1f                	jne    40071a <__gmon_start__@plt+0x16a>
  4006fb:	81 7d f8 64 6f 6f 67 	cmpl   $0x676f6f64,-0x8(%rbp)
  400702:	75 16                	jne    40071a <__gmon_start__@plt+0x16a>
  400704:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  400708:	ba 36 00 00 00       	mov    $0x36,%edx
  40070d:	48 89 c6             	mov    %rax,%rsi
  400710:	bf 00 00 00 00       	mov    $0x0,%edi
  400715:	e8 76 fe ff ff       	callq  400590 <read@plt>
  40071a:	90                   	nop
  40071b:	c9                   	leaveq 
  40071c:	c3                   	retq   
# ---------------------------------------------------------------------------
  40071d:	55                   	push   %rbp
  40071e:	48 89 e5             	mov    %rsp,%rbp
  400721:	48 8b 05 48 09 20 00 	mov    0x200948(%rip),%rax        # 601070 <stdin@@GLIBC_2.2.5>
  400728:	be 00 00 00 00       	mov    $0x0,%esi
  40072d:	48 89 c7             	mov    %rax,%rdi
  400730:	e8 3b fe ff ff       	callq  400570 <setbuf@plt>
  400735:	48 8b 05 24 09 20 00 	mov    0x200924(%rip),%rax        # 601060 <stdout@@GLIBC_2.2.5>
  40073c:	be 00 00 00 00       	mov    $0x0,%esi
  400741:	48 89 c7             	mov    %rax,%rdi
  400744:	e8 27 fe ff ff       	callq  400570 <setbuf@plt>
  400749:	48 8b 05 30 09 20 00 	mov    0x200930(%rip),%rax        # 601080 <stderr@@GLIBC_2.2.5>
  400750:	be 00 00 00 00       	mov    $0x0,%esi
  400755:	48 89 c7             	mov    %rax,%rdi
  400758:	e8 13 fe ff ff       	callq  400570 <setbuf@plt>
  40075d:	bf f0 00 00 00       	mov    $0xf0,%edi
  400762:	e8 19 fe ff ff       	callq  400580 <alarm@plt>
  400767:	bf 34 08 40 00       	mov    $0x400834,%edi
  40076c:	e8 ef fd ff ff       	callq  400560 <puts@plt>
  400771:	bf 3e 08 40 00       	mov    $0x40083e,%edi
  400776:	e8 e5 fd ff ff       	callq  400560 <puts@plt>
  40077b:	90                   	nop
  40077c:	5d                   	pop    %rbp
  40077d:	c3                   	retq   
  40077e:	55                   	push   %rbp
  40077f:	48 89 e5             	mov    %rsp,%rbp
  400782:	48 83 ec 10          	sub    $0x10,%rsp
  400786:	89 7d fc             	mov    %edi,-0x4(%rbp)
  400789:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  40078d:	b8 00 00 00 00       	mov    $0x0,%eax
  400792:	e8 86 ff ff ff       	callq  40071d <__gmon_start__@plt+0x16d>
  400797:	b8 00 00 00 00       	mov    $0x0,%eax
  40079c:	e8 25 ff ff ff       	callq  4006c6 <__gmon_start__@plt+0x116>
  4007a1:	b8 00 00 00 00       	mov    $0x0,%eax
  4007a6:	c9                   	leaveq 
  4007a7:	c3                   	retq   
  4007a8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4007af:	00 
  4007b0:	41 57                	push   %r15
  4007b2:	41 56                	push   %r14
  4007b4:	41 89 ff             	mov    %edi,%r15d
  4007b7:	41 55                	push   %r13
  4007b9:	41 54                	push   %r12
  4007bb:	4c 8d 25 4e 06 20 00 	lea    0x20064e(%rip),%r12        # 600e10 <__gmon_start__@plt+0x200860>
  4007c2:	55                   	push   %rbp
  4007c3:	48 8d 2d 4e 06 20 00 	lea    0x20064e(%rip),%rbp        # 600e18 <__gmon_start__@plt+0x200868>
  4007ca:	53                   	push   %rbx
  4007cb:	49 89 f6             	mov    %rsi,%r14
  4007ce:	49 89 d5             	mov    %rdx,%r13
  4007d1:	4c 29 e5             	sub    %r12,%rbp
  4007d4:	48 83 ec 08          	sub    $0x8,%rsp
  4007d8:	48 c1 fd 03          	sar    $0x3,%rbp
  4007dc:	e8 47 fd ff ff       	callq  400528 <puts@plt-0x38>
  4007e1:	48 85 ed             	test   %rbp,%rbp
  4007e4:	74 20                	je     400806 <__gmon_start__@plt+0x256>
  4007e6:	31 db                	xor    %ebx,%ebx
  4007e8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4007ef:	00 
  4007f0:	4c 89 ea             	mov    %r13,%rdx
  4007f3:	4c 89 f6             	mov    %r14,%rsi
  4007f6:	44 89 ff             	mov    %r15d,%edi
  4007f9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  4007fd:	48 83 c3 01          	add    $0x1,%rbx
  400801:	48 39 eb             	cmp    %rbp,%rbx
  400804:	75 ea                	jne    4007f0 <__gmon_start__@plt+0x240>
  400806:	48 83 c4 08          	add    $0x8,%rsp
  40080a:	5b                   	pop    %rbx
  40080b:	5d                   	pop    %rbp
  40080c:	41 5c                	pop    %r12
  40080e:	41 5d                	pop    %r13
  400810:	41 5e                	pop    %r14
  400812:	41 5f                	pop    %r15
  400814:	c3                   	retq   
  400815:	90                   	nop
  400816:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40081d:	00 00 00 
  400820:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000400824 <.fini>:
  400824:	48 83 ec 08          	sub    $0x8,%rsp
  400828:	48 83 c4 08          	add    $0x8,%rsp
  40082c:	c3                   	retq   
