
ciscn_2019_n_5：     文件格式 elf64-x86-64


Disassembly of section .init:

00000000004004b0 <_init>:
  4004b0:	48 83 ec 08          	sub    $0x8,%rsp
  4004b4:	48 8b 05 3d 0b 20 00 	mov    0x200b3d(%rip),%rax        # 600ff8 <__gmon_start__>
  4004bb:	48 85 c0             	test   %rax,%rax
  4004be:	74 05                	je     4004c5 <_init+0x15>
  4004c0:	e8 6b 00 00 00       	callq  400530 <__gmon_start__@plt>
  4004c5:	48 83 c4 08          	add    $0x8,%rsp
  4004c9:	c3                   	retq   

Disassembly of section .plt:

00000000004004d0 <.plt>:
  4004d0:	ff 35 32 0b 20 00    	pushq  0x200b32(%rip)        # 601008 <_GLOBAL_OFFSET_TABLE_+0x8>
  4004d6:	ff 25 34 0b 20 00    	jmpq   *0x200b34(%rip)        # 601010 <_GLOBAL_OFFSET_TABLE_+0x10>
  4004dc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004004e0 <puts@plt>:
  4004e0:	ff 25 32 0b 20 00    	jmpq   *0x200b32(%rip)        # 601018 <puts@GLIBC_2.2.5>
  4004e6:	68 00 00 00 00       	pushq  $0x0
  4004eb:	e9 e0 ff ff ff       	jmpq   4004d0 <.plt>

00000000004004f0 <read@plt>:
  4004f0:	ff 25 2a 0b 20 00    	jmpq   *0x200b2a(%rip)        # 601020 <read@GLIBC_2.2.5>
  4004f6:	68 01 00 00 00       	pushq  $0x1
  4004fb:	e9 d0 ff ff ff       	jmpq   4004d0 <.plt>

0000000000400500 <__libc_start_main@plt>:
  400500:	ff 25 22 0b 20 00    	jmpq   *0x200b22(%rip)        # 601028 <__libc_start_main@GLIBC_2.2.5>
  400506:	68 02 00 00 00       	pushq  $0x2
  40050b:	e9 c0 ff ff ff       	jmpq   4004d0 <.plt>

0000000000400510 <gets@plt>:
  400510:	ff 25 1a 0b 20 00    	jmpq   *0x200b1a(%rip)        # 601030 <gets@GLIBC_2.2.5>
  400516:	68 03 00 00 00       	pushq  $0x3
  40051b:	e9 b0 ff ff ff       	jmpq   4004d0 <.plt>

0000000000400520 <setvbuf@plt>:
  400520:	ff 25 12 0b 20 00    	jmpq   *0x200b12(%rip)        # 601038 <setvbuf@GLIBC_2.2.5>
  400526:	68 04 00 00 00       	pushq  $0x4
  40052b:	e9 a0 ff ff ff       	jmpq   4004d0 <.plt>

Disassembly of section .plt.got:

0000000000400530 <__gmon_start__@plt>:
  400530:	ff 25 c2 0a 20 00    	jmpq   *0x200ac2(%rip)        # 600ff8 <__gmon_start__>
  400536:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000400540 <_start>:
  400540:	31 ed                	xor    %ebp,%ebp
  400542:	49 89 d1             	mov    %rdx,%r9
  400545:	5e                   	pop    %rsi
  400546:	48 89 e2             	mov    %rsp,%rdx
  400549:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40054d:	50                   	push   %rax
  40054e:	54                   	push   %rsp
  40054f:	49 c7 c0 20 07 40 00 	mov    $0x400720,%r8
  400556:	48 c7 c1 b0 06 40 00 	mov    $0x4006b0,%rcx
  40055d:	48 c7 c7 36 06 40 00 	mov    $0x400636,%rdi
  400564:	e8 97 ff ff ff       	callq  400500 <__libc_start_main@plt>
  400569:	f4                   	hlt    
  40056a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400570 <deregister_tm_clones>:
  400570:	b8 57 10 60 00       	mov    $0x601057,%eax
  400575:	55                   	push   %rbp
  400576:	48 2d 50 10 60 00    	sub    $0x601050,%rax
  40057c:	48 83 f8 0e          	cmp    $0xe,%rax
  400580:	48 89 e5             	mov    %rsp,%rbp
  400583:	76 1b                	jbe    4005a0 <deregister_tm_clones+0x30>
  400585:	b8 00 00 00 00       	mov    $0x0,%eax
  40058a:	48 85 c0             	test   %rax,%rax
  40058d:	74 11                	je     4005a0 <deregister_tm_clones+0x30>
  40058f:	5d                   	pop    %rbp
  400590:	bf 50 10 60 00       	mov    $0x601050,%edi
  400595:	ff e0                	jmpq   *%rax
  400597:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40059e:	00 00 
  4005a0:	5d                   	pop    %rbp
  4005a1:	c3                   	retq   
  4005a2:	0f 1f 40 00          	nopl   0x0(%rax)
  4005a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4005ad:	00 00 00 

00000000004005b0 <register_tm_clones>:
  4005b0:	be 50 10 60 00       	mov    $0x601050,%esi
  4005b5:	55                   	push   %rbp
  4005b6:	48 81 ee 50 10 60 00 	sub    $0x601050,%rsi
  4005bd:	48 c1 fe 03          	sar    $0x3,%rsi
  4005c1:	48 89 e5             	mov    %rsp,%rbp
  4005c4:	48 89 f0             	mov    %rsi,%rax
  4005c7:	48 c1 e8 3f          	shr    $0x3f,%rax
  4005cb:	48 01 c6             	add    %rax,%rsi
  4005ce:	48 d1 fe             	sar    %rsi
  4005d1:	74 15                	je     4005e8 <register_tm_clones+0x38>
  4005d3:	b8 00 00 00 00       	mov    $0x0,%eax
  4005d8:	48 85 c0             	test   %rax,%rax
  4005db:	74 0b                	je     4005e8 <register_tm_clones+0x38>
  4005dd:	5d                   	pop    %rbp
  4005de:	bf 50 10 60 00       	mov    $0x601050,%edi
  4005e3:	ff e0                	jmpq   *%rax
  4005e5:	0f 1f 00             	nopl   (%rax)
  4005e8:	5d                   	pop    %rbp
  4005e9:	c3                   	retq   
  4005ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004005f0 <__do_global_dtors_aux>:
  4005f0:	80 3d 71 0a 20 00 00 	cmpb   $0x0,0x200a71(%rip)        # 601068 <completed.7594>
  4005f7:	75 11                	jne    40060a <__do_global_dtors_aux+0x1a>
  4005f9:	55                   	push   %rbp
  4005fa:	48 89 e5             	mov    %rsp,%rbp
  4005fd:	e8 6e ff ff ff       	callq  400570 <deregister_tm_clones>
  400602:	5d                   	pop    %rbp
  400603:	c6 05 5e 0a 20 00 01 	movb   $0x1,0x200a5e(%rip)        # 601068 <completed.7594>
  40060a:	f3 c3                	repz retq 
  40060c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400610 <frame_dummy>:
  400610:	bf 20 0e 60 00       	mov    $0x600e20,%edi
  400615:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  400619:	75 05                	jne    400620 <frame_dummy+0x10>
  40061b:	eb 93                	jmp    4005b0 <register_tm_clones>
  40061d:	0f 1f 00             	nopl   (%rax)
  400620:	b8 00 00 00 00       	mov    $0x0,%eax
  400625:	48 85 c0             	test   %rax,%rax
  400628:	74 f1                	je     40061b <frame_dummy+0xb>
  40062a:	55                   	push   %rbp
  40062b:	48 89 e5             	mov    %rsp,%rbp
  40062e:	ff d0                	callq  *%rax
  400630:	5d                   	pop    %rbp
  400631:	e9 7a ff ff ff       	jmpq   4005b0 <register_tm_clones>

0000000000400636 <main>:
  400636:	55                   	push   %rbp
  400637:	48 89 e5             	mov    %rsp,%rbp
  40063a:	48 83 ec 20          	sub    $0x20,%rsp
  40063e:	48 8b 05 1b 0a 20 00 	mov    0x200a1b(%rip),%rax        # 601060 <stdout@@GLIBC_2.2.5>
  400645:	b9 00 00 00 00       	mov    $0x0,%ecx
  40064a:	ba 02 00 00 00       	mov    $0x2,%edx
  40064f:	be 00 00 00 00       	mov    $0x0,%esi
  400654:	48 89 c7             	mov    %rax,%rdi
  400657:	e8 c4 fe ff ff       	callq  400520 <setvbuf@plt>
  40065c:	bf 38 07 40 00       	mov    $0x400738,%edi
  400661:	e8 7a fe ff ff       	callq  4004e0 <puts@plt>
  400666:	ba 64 00 00 00       	mov    $0x64,%edx
  40066b:	be 80 10 60 00       	mov    $0x601080,%esi
  400670:	bf 00 00 00 00       	mov    $0x0,%edi
  400675:	b8 00 00 00 00       	mov    $0x0,%eax
  40067a:	e8 71 fe ff ff       	callq  4004f0 <read@plt>
  40067f:	bf 4a 07 40 00       	mov    $0x40074a,%edi
  400684:	e8 57 fe ff ff       	callq  4004e0 <puts@plt>
  400689:	bf 60 07 40 00       	mov    $0x400760,%edi
  40068e:	e8 4d fe ff ff       	callq  4004e0 <puts@plt>
  400693:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  400697:	48 89 c7             	mov    %rax,%rdi
  40069a:	b8 00 00 00 00       	mov    $0x0,%eax
  40069f:	e8 6c fe ff ff       	callq  400510 <gets@plt>
  4006a4:	b8 00 00 00 00       	mov    $0x0,%eax
  4006a9:	c9                   	leaveq 
  4006aa:	c3                   	retq   
  4006ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004006b0 <__libc_csu_init>:
  4006b0:	41 57                	push   %r15
  4006b2:	41 56                	push   %r14
  4006b4:	41 89 ff             	mov    %edi,%r15d
  4006b7:	41 55                	push   %r13
  4006b9:	41 54                	push   %r12
  4006bb:	4c 8d 25 4e 07 20 00 	lea    0x20074e(%rip),%r12        # 600e10 <__frame_dummy_init_array_entry>
  4006c2:	55                   	push   %rbp
  4006c3:	48 8d 2d 4e 07 20 00 	lea    0x20074e(%rip),%rbp        # 600e18 <__do_global_dtors_aux_fini_array_entry>
  4006ca:	53                   	push   %rbx
  4006cb:	49 89 f6             	mov    %rsi,%r14
  4006ce:	49 89 d5             	mov    %rdx,%r13
  4006d1:	4c 29 e5             	sub    %r12,%rbp
  4006d4:	48 83 ec 08          	sub    $0x8,%rsp
  4006d8:	48 c1 fd 03          	sar    $0x3,%rbp
  4006dc:	e8 cf fd ff ff       	callq  4004b0 <_init>
  4006e1:	48 85 ed             	test   %rbp,%rbp
  4006e4:	74 20                	je     400706 <__libc_csu_init+0x56>
  4006e6:	31 db                	xor    %ebx,%ebx
  4006e8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4006ef:	00 
  4006f0:	4c 89 ea             	mov    %r13,%rdx
  4006f3:	4c 89 f6             	mov    %r14,%rsi
  4006f6:	44 89 ff             	mov    %r15d,%edi
  4006f9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  4006fd:	48 83 c3 01          	add    $0x1,%rbx
  400701:	48 39 eb             	cmp    %rbp,%rbx
  400704:	75 ea                	jne    4006f0 <__libc_csu_init+0x40>
  400706:	48 83 c4 08          	add    $0x8,%rsp
  40070a:	5b                   	pop    %rbx
  40070b:	5d                   	pop    %rbp
  40070c:	41 5c                	pop    %r12
  40070e:	41 5d                	pop    %r13
  400710:	41 5e                	pop    %r14
  400712:	41 5f                	pop    %r15
  400714:	c3                   	retq   
  400715:	90                   	nop
  400716:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40071d:	00 00 00 

0000000000400720 <__libc_csu_fini>:
  400720:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000400724 <_fini>:
  400724:	48 83 ec 08          	sub    $0x8,%rsp
  400728:	48 83 c4 08          	add    $0x8,%rsp
  40072c:	c3                   	retq   
