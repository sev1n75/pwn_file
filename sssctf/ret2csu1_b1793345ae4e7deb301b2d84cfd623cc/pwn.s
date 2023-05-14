
pwn：     文件格式 elf64-x86-64


Disassembly of section .init:

0000000000400488 <_init>:
  400488:	48 83 ec 08          	sub    $0x8,%rsp
  40048c:	48 8b 05 65 0b 20 00 	mov    0x200b65(%rip),%rax        # 600ff8 <__gmon_start__>
  400493:	48 85 c0             	test   %rax,%rax
  400496:	74 02                	je     40049a <_init+0x12>
  400498:	ff d0                	callq  *%rax
  40049a:	48 83 c4 08          	add    $0x8,%rsp
  40049e:	c3                   	retq   

Disassembly of section .plt:

00000000004004a0 <.plt>:
  4004a0:	ff 35 62 0b 20 00    	pushq  0x200b62(%rip)        # 601008 <_GLOBAL_OFFSET_TABLE_+0x8>
  4004a6:	ff 25 64 0b 20 00    	jmpq   *0x200b64(%rip)        # 601010 <_GLOBAL_OFFSET_TABLE_+0x10>
  4004ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004004b0 <setvbuf@plt>:
  4004b0:	ff 25 62 0b 20 00    	jmpq   *0x200b62(%rip)        # 601018 <setvbuf@GLIBC_2.2.5>
  4004b6:	68 00 00 00 00       	pushq  $0x0
  4004bb:	e9 e0 ff ff ff       	jmpq   4004a0 <.plt>

Disassembly of section .text:

00000000004004c0 <_start>:
  4004c0:	31 ed                	xor    %ebp,%ebp
  4004c2:	49 89 d1             	mov    %rdx,%r9
  4004c5:	5e                   	pop    %rsi
  4004c6:	48 89 e2             	mov    %rsp,%rdx
  4004c9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4004cd:	50                   	push   %rax
  4004ce:	54                   	push   %rsp
  4004cf:	49 c7 c0 40 07 40 00 	mov    $0x400740,%r8
  4004d6:	48 c7 c1 d0 06 40 00 	mov    $0x4006d0,%rcx
  4004dd:	48 c7 c7 54 06 40 00 	mov    $0x400654,%rdi
  4004e4:	ff 15 06 0b 20 00    	callq  *0x200b06(%rip)        # 600ff0 <__libc_start_main@GLIBC_2.2.5>
  4004ea:	f4                   	hlt    
  4004eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004004f0 <_dl_relocate_static_pie>:
  4004f0:	f3 c3                	repz retq 
  4004f2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4004f9:	00 00 00 
  4004fc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400500 <deregister_tm_clones>:
  400500:	55                   	push   %rbp
  400501:	b8 70 10 60 00       	mov    $0x601070,%eax
  400506:	48 3d 70 10 60 00    	cmp    $0x601070,%rax
  40050c:	48 89 e5             	mov    %rsp,%rbp
  40050f:	74 17                	je     400528 <deregister_tm_clones+0x28>
  400511:	b8 00 00 00 00       	mov    $0x0,%eax
  400516:	48 85 c0             	test   %rax,%rax
  400519:	74 0d                	je     400528 <deregister_tm_clones+0x28>
  40051b:	5d                   	pop    %rbp
  40051c:	bf 70 10 60 00       	mov    $0x601070,%edi
  400521:	ff e0                	jmpq   *%rax
  400523:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400528:	5d                   	pop    %rbp
  400529:	c3                   	retq   
  40052a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400530 <register_tm_clones>:
  400530:	be 70 10 60 00       	mov    $0x601070,%esi
  400535:	55                   	push   %rbp
  400536:	48 81 ee 70 10 60 00 	sub    $0x601070,%rsi
  40053d:	48 89 e5             	mov    %rsp,%rbp
  400540:	48 c1 fe 03          	sar    $0x3,%rsi
  400544:	48 89 f0             	mov    %rsi,%rax
  400547:	48 c1 e8 3f          	shr    $0x3f,%rax
  40054b:	48 01 c6             	add    %rax,%rsi
  40054e:	48 d1 fe             	sar    %rsi
  400551:	74 15                	je     400568 <register_tm_clones+0x38>
  400553:	b8 00 00 00 00       	mov    $0x0,%eax
  400558:	48 85 c0             	test   %rax,%rax
  40055b:	74 0b                	je     400568 <register_tm_clones+0x38>
  40055d:	5d                   	pop    %rbp
  40055e:	bf 70 10 60 00       	mov    $0x601070,%edi
  400563:	ff e0                	jmpq   *%rax
  400565:	0f 1f 00             	nopl   (%rax)
  400568:	5d                   	pop    %rbp
  400569:	c3                   	retq   
  40056a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400570 <__do_global_dtors_aux>:
  400570:	80 3d 31 0b 20 00 00 	cmpb   $0x0,0x200b31(%rip)        # 6010a8 <completed.7698>
  400577:	75 17                	jne    400590 <__do_global_dtors_aux+0x20>
  400579:	55                   	push   %rbp
  40057a:	48 89 e5             	mov    %rsp,%rbp
  40057d:	e8 7e ff ff ff       	callq  400500 <deregister_tm_clones>
  400582:	c6 05 1f 0b 20 00 01 	movb   $0x1,0x200b1f(%rip)        # 6010a8 <completed.7698>
  400589:	5d                   	pop    %rbp
  40058a:	c3                   	retq   
  40058b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400590:	f3 c3                	repz retq 
  400592:	0f 1f 40 00          	nopl   0x0(%rax)
  400596:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40059d:	00 00 00 

00000000004005a0 <frame_dummy>:
  4005a0:	55                   	push   %rbp
  4005a1:	48 89 e5             	mov    %rsp,%rbp
  4005a4:	5d                   	pop    %rbp
  4005a5:	eb 89                	jmp    400530 <register_tm_clones>

00000000004005a7 <init>:
  4005a7:	55                   	push   %rbp
  4005a8:	48 89 e5             	mov    %rsp,%rbp
  4005ab:	48 8b 05 ee 0a 20 00 	mov    0x200aee(%rip),%rax        # 6010a0 <stderr@@GLIBC_2.2.5>
  4005b2:	b9 00 00 00 00       	mov    $0x0,%ecx
  4005b7:	ba 02 00 00 00       	mov    $0x2,%edx
  4005bc:	be 00 00 00 00       	mov    $0x0,%esi
  4005c1:	48 89 c7             	mov    %rax,%rdi
  4005c4:	e8 e7 fe ff ff       	callq  4004b0 <setvbuf@plt>
  4005c9:	48 8b 05 b0 0a 20 00 	mov    0x200ab0(%rip),%rax        # 601080 <stdout@@GLIBC_2.2.5>
  4005d0:	b9 00 00 00 00       	mov    $0x0,%ecx
  4005d5:	ba 02 00 00 00       	mov    $0x2,%edx
  4005da:	be 00 00 00 00       	mov    $0x0,%esi
  4005df:	48 89 c7             	mov    %rax,%rdi
  4005e2:	e8 c9 fe ff ff       	callq  4004b0 <setvbuf@plt>
  4005e7:	48 8b 05 a2 0a 20 00 	mov    0x200aa2(%rip),%rax        # 601090 <stdin@@GLIBC_2.2.5>
  4005ee:	b9 00 00 00 00       	mov    $0x0,%ecx
  4005f3:	ba 02 00 00 00       	mov    $0x2,%edx
  4005f8:	be 00 00 00 00       	mov    $0x0,%esi
  4005fd:	48 89 c7             	mov    %rax,%rdi
  400600:	e8 ab fe ff ff       	callq  4004b0 <setvbuf@plt>
  400605:	90                   	nop
  400606:	5d                   	pop    %rbp
  400607:	c3                   	retq   

0000000000400608 <ohMyBackdoor>:
  400608:	55                   	push   %rbp
  400609:	48 89 e5             	mov    %rsp,%rbp
  40060c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  400610:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  400614:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  400618:	48 b8 64 6e 31 77 6c 	movabs $0x46616c6c77316e64,%rax
  40061f:	6c 61 46 
  400622:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  400626:	75 29                	jne    400651 <ohMyBackdoor+0x49>
  400628:	48 b8 49 47 41 73 74 	movabs $0x57616e7473414749,%rax
  40062f:	6e 61 57 
  400632:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
  400636:	75 19                	jne    400651 <ohMyBackdoor+0x49>
  400638:	48 b8 64 6e 65 69 72 	movabs $0x726c667269656e64,%rax
  40063f:	66 6c 72 
  400642:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
  400646:	75 09                	jne    400651 <ohMyBackdoor+0x49>
  400648:	48 c7 c0 3b 00 00 00 	mov    $0x3b,%rax
  40064f:	0f 05                	syscall 
  400651:	90                   	nop
  400652:	5d                   	pop    %rbp
  400653:	c3                   	retq   

0000000000400654 <main>:
  400654:	55                   	push   %rbp
  400655:	48 89 e5             	mov    %rsp,%rbp
  400658:	48 83 ec 20          	sub    $0x20,%rsp
  40065c:	b8 00 00 00 00       	mov    $0x0,%eax
  400661:	e8 41 ff ff ff       	callq  4005a7 <init>
  400666:	48 c7 c7 01 00 00 00 	mov    $0x1,%rdi
  40066d:	48 8b 34 25 30 10 60 	mov    0x601030,%rsi
  400674:	00 
  400675:	48 c7 c2 28 00 00 00 	mov    $0x28,%rdx
  40067c:	48 c7 c0 01 00 00 00 	mov    $0x1,%rax
  400683:	0f 05                	syscall 
  400685:	48 c7 c7 01 00 00 00 	mov    $0x1,%rdi
  40068c:	48 8b 34 25 38 10 60 	mov    0x601038,%rsi
  400693:	00 
  400694:	48 c7 c2 3b 00 00 00 	mov    $0x3b,%rdx
  40069b:	48 c7 c0 01 00 00 00 	mov    $0x1,%rax
  4006a2:	0f 05                	syscall 
  4006a4:	48 31 ff             	xor    %rdi,%rdi
  4006a7:	48 8d 75 e0          	lea    -0x20(%rbp),%rsi
  4006ab:	48 c7 c2 70 00 00 00 	mov    $0x70,%rdx
  4006b2:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax
  4006b9:	0f 05                	syscall 
  4006bb:	b8 00 00 00 00       	mov    $0x0,%eax
  4006c0:	c9                   	leaveq 
  4006c1:	c3                   	retq   
  4006c2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4006c9:	00 00 00 
  4006cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004006d0 <__libc_csu_init>:
  4006d0:	41 57                	push   %r15
  4006d2:	41 56                	push   %r14
  4006d4:	49 89 d7             	mov    %rdx,%r15
  4006d7:	41 55                	push   %r13
  4006d9:	41 54                	push   %r12
  4006db:	4c 8d 25 2e 07 20 00 	lea    0x20072e(%rip),%r12        # 600e10 <__frame_dummy_init_array_entry>
  4006e2:	55                   	push   %rbp
  4006e3:	48 8d 2d 2e 07 20 00 	lea    0x20072e(%rip),%rbp        # 600e18 <__do_global_dtors_aux_fini_array_entry>
  4006ea:	53                   	push   %rbx
  4006eb:	41 89 fd             	mov    %edi,%r13d
  4006ee:	49 89 f6             	mov    %rsi,%r14
  4006f1:	4c 29 e5             	sub    %r12,%rbp
  4006f4:	48 83 ec 08          	sub    $0x8,%rsp
  4006f8:	48 c1 fd 03          	sar    $0x3,%rbp
  4006fc:	e8 87 fd ff ff       	callq  400488 <_init>
  400701:	48 85 ed             	test   %rbp,%rbp
  400704:	74 20                	je     400726 <__libc_csu_init+0x56>
  400706:	31 db                	xor    %ebx,%ebx
  400708:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40070f:	00 
  400710:	4c 89 fa             	mov    %r15,%rdx
  400713:	4c 89 f6             	mov    %r14,%rsi
  400716:	44 89 ef             	mov    %r13d,%edi
  400719:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40071d:	48 83 c3 01          	add    $0x1,%rbx
  400721:	48 39 dd             	cmp    %rbx,%rbp
  400724:	75 ea                	jne    400710 <__libc_csu_init+0x40>
  400726:	48 83 c4 08          	add    $0x8,%rsp
  40072a:	5b                   	pop    %rbx
  40072b:	5d                   	pop    %rbp
  40072c:	41 5c                	pop    %r12
  40072e:	41 5d                	pop    %r13
  400730:	41 5e                	pop    %r14
  400732:	41 5f                	pop    %r15
  400734:	c3                   	retq   
  400735:	90                   	nop
  400736:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40073d:	00 00 00 

0000000000400740 <__libc_csu_fini>:
  400740:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000400744 <_fini>:
  400744:	48 83 ec 08          	sub    $0x8,%rsp
  400748:	48 83 c4 08          	add    $0x8,%rsp
  40074c:	c3                   	retq   
