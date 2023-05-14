
level2_x64：     文件格式 elf64-x86-64


Disassembly of section .init:

0000000000400488 <_init>:
  400488:	48 83 ec 08          	sub    $0x8,%rsp
  40048c:	48 8b 05 ad 05 20 00 	mov    0x2005ad(%rip),%rax        # 600a40 <__gmon_start__>
  400493:	48 85 c0             	test   %rax,%rax
  400496:	74 05                	je     40049d <_init+0x15>
  400498:	e8 53 00 00 00       	callq  4004f0 <__gmon_start__@plt>
  40049d:	48 83 c4 08          	add    $0x8,%rsp
  4004a1:	c3                   	retq   

Disassembly of section .plt:

00000000004004b0 <.plt>:
  4004b0:	ff 35 9a 05 20 00    	pushq  0x20059a(%rip)        # 600a50 <_GLOBAL_OFFSET_TABLE_+0x8>
  4004b6:	ff 25 9c 05 20 00    	jmpq   *0x20059c(%rip)        # 600a58 <_GLOBAL_OFFSET_TABLE_+0x10>
  4004bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004004c0 <system@plt>:
  4004c0:	ff 25 9a 05 20 00    	jmpq   *0x20059a(%rip)        # 600a60 <system@GLIBC_2.2.5>
  4004c6:	68 00 00 00 00       	pushq  $0x0
  4004cb:	e9 e0 ff ff ff       	jmpq   4004b0 <.plt>

00000000004004d0 <read@plt>:
  4004d0:	ff 25 92 05 20 00    	jmpq   *0x200592(%rip)        # 600a68 <read@GLIBC_2.2.5>
  4004d6:	68 01 00 00 00       	pushq  $0x1
  4004db:	e9 d0 ff ff ff       	jmpq   4004b0 <.plt>

00000000004004e0 <__libc_start_main@plt>:
  4004e0:	ff 25 8a 05 20 00    	jmpq   *0x20058a(%rip)        # 600a70 <__libc_start_main@GLIBC_2.2.5>
  4004e6:	68 02 00 00 00       	pushq  $0x2
  4004eb:	e9 c0 ff ff ff       	jmpq   4004b0 <.plt>

00000000004004f0 <__gmon_start__@plt>:
  4004f0:	ff 25 82 05 20 00    	jmpq   *0x200582(%rip)        # 600a78 <__gmon_start__>
  4004f6:	68 03 00 00 00       	pushq  $0x3
  4004fb:	e9 b0 ff ff ff       	jmpq   4004b0 <.plt>

Disassembly of section .text:

0000000000400500 <_start>:
  400500:	31 ed                	xor    %ebp,%ebp
  400502:	49 89 d1             	mov    %rdx,%r9
  400505:	5e                   	pop    %rsi
  400506:	48 89 e2             	mov    %rsp,%rdx
  400509:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40050d:	50                   	push   %rax
  40050e:	54                   	push   %rsp
  40050f:	49 c7 c0 c0 06 40 00 	mov    $0x4006c0,%r8
  400516:	48 c7 c1 50 06 40 00 	mov    $0x400650,%rcx
  40051d:	48 c7 c7 20 06 40 00 	mov    $0x400620,%rdi
  400524:	e8 b7 ff ff ff       	callq  4004e0 <__libc_start_main@plt>
  400529:	f4                   	hlt    
  40052a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400530 <deregister_tm_clones>:
  400530:	b8 9f 0a 60 00       	mov    $0x600a9f,%eax
  400535:	55                   	push   %rbp
  400536:	48 2d 98 0a 60 00    	sub    $0x600a98,%rax
  40053c:	48 83 f8 0e          	cmp    $0xe,%rax
  400540:	48 89 e5             	mov    %rsp,%rbp
  400543:	76 1b                	jbe    400560 <deregister_tm_clones+0x30>
  400545:	b8 00 00 00 00       	mov    $0x0,%eax
  40054a:	48 85 c0             	test   %rax,%rax
  40054d:	74 11                	je     400560 <deregister_tm_clones+0x30>
  40054f:	5d                   	pop    %rbp
  400550:	bf 98 0a 60 00       	mov    $0x600a98,%edi
  400555:	ff e0                	jmpq   *%rax
  400557:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40055e:	00 00 
  400560:	5d                   	pop    %rbp
  400561:	c3                   	retq   
  400562:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
  400569:	1f 84 00 00 00 00 00 

0000000000400570 <register_tm_clones>:
  400570:	be 98 0a 60 00       	mov    $0x600a98,%esi
  400575:	55                   	push   %rbp
  400576:	48 81 ee 98 0a 60 00 	sub    $0x600a98,%rsi
  40057d:	48 c1 fe 03          	sar    $0x3,%rsi
  400581:	48 89 e5             	mov    %rsp,%rbp
  400584:	48 89 f0             	mov    %rsi,%rax
  400587:	48 c1 e8 3f          	shr    $0x3f,%rax
  40058b:	48 01 c6             	add    %rax,%rsi
  40058e:	48 d1 fe             	sar    %rsi
  400591:	74 15                	je     4005a8 <register_tm_clones+0x38>
  400593:	b8 00 00 00 00       	mov    $0x0,%eax
  400598:	48 85 c0             	test   %rax,%rax
  40059b:	74 0b                	je     4005a8 <register_tm_clones+0x38>
  40059d:	5d                   	pop    %rbp
  40059e:	bf 98 0a 60 00       	mov    $0x600a98,%edi
  4005a3:	ff e0                	jmpq   *%rax
  4005a5:	0f 1f 00             	nopl   (%rax)
  4005a8:	5d                   	pop    %rbp
  4005a9:	c3                   	retq   
  4005aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004005b0 <__do_global_dtors_aux>:
  4005b0:	80 3d e1 04 20 00 00 	cmpb   $0x0,0x2004e1(%rip)        # 600a98 <__TMC_END__>
  4005b7:	75 11                	jne    4005ca <__do_global_dtors_aux+0x1a>
  4005b9:	55                   	push   %rbp
  4005ba:	48 89 e5             	mov    %rsp,%rbp
  4005bd:	e8 6e ff ff ff       	callq  400530 <deregister_tm_clones>
  4005c2:	5d                   	pop    %rbp
  4005c3:	c6 05 ce 04 20 00 01 	movb   $0x1,0x2004ce(%rip)        # 600a98 <__TMC_END__>
  4005ca:	f3 c3                	repz retq 
  4005cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004005d0 <frame_dummy>:
  4005d0:	bf 58 08 60 00       	mov    $0x600858,%edi
  4005d5:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  4005d9:	75 05                	jne    4005e0 <frame_dummy+0x10>
  4005db:	eb 93                	jmp    400570 <register_tm_clones>
  4005dd:	0f 1f 00             	nopl   (%rax)
  4005e0:	b8 00 00 00 00       	mov    $0x0,%eax
  4005e5:	48 85 c0             	test   %rax,%rax
  4005e8:	74 f1                	je     4005db <frame_dummy+0xb>
  4005ea:	55                   	push   %rbp
  4005eb:	48 89 e5             	mov    %rsp,%rbp
  4005ee:	ff d0                	callq  *%rax
  4005f0:	5d                   	pop    %rbp
  4005f1:	e9 7a ff ff ff       	jmpq   400570 <register_tm_clones>

00000000004005f6 <vulnerable_function>:
  4005f6:	55                   	push   %rbp
  4005f7:	48 89 e5             	mov    %rsp,%rbp
  4005fa:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
  4005fe:	bf d4 06 40 00       	mov    $0x4006d4,%edi
  400603:	e8 b8 fe ff ff       	callq  4004c0 <system@plt>
  400608:	48 8d 45 80          	lea    -0x80(%rbp),%rax
  40060c:	ba 00 02 00 00       	mov    $0x200,%edx
  400611:	48 89 c6             	mov    %rax,%rsi
  400614:	bf 00 00 00 00       	mov    $0x0,%edi
  400619:	e8 b2 fe ff ff       	callq  4004d0 <read@plt>
  40061e:	c9                   	leaveq 
  40061f:	c3                   	retq   

0000000000400620 <main>:
  400620:	55                   	push   %rbp
  400621:	48 89 e5             	mov    %rsp,%rbp
  400624:	48 83 ec 10          	sub    $0x10,%rsp
  400628:	89 7d fc             	mov    %edi,-0x4(%rbp)
  40062b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  40062f:	b8 00 00 00 00       	mov    $0x0,%eax
  400634:	e8 bd ff ff ff       	callq  4005f6 <vulnerable_function>
  400639:	bf e0 06 40 00       	mov    $0x4006e0,%edi
  40063e:	e8 7d fe ff ff       	callq  4004c0 <system@plt>
  400643:	c9                   	leaveq 
  400644:	c3                   	retq   
  400645:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40064c:	00 00 00 
  40064f:	90                   	nop

0000000000400650 <__libc_csu_init>:
  400650:	41 57                	push   %r15
  400652:	41 89 ff             	mov    %edi,%r15d
  400655:	41 56                	push   %r14
  400657:	49 89 f6             	mov    %rsi,%r14
  40065a:	41 55                	push   %r13
  40065c:	49 89 d5             	mov    %rdx,%r13
  40065f:	41 54                	push   %r12
  400661:	4c 8d 25 e0 01 20 00 	lea    0x2001e0(%rip),%r12        # 600848 <__frame_dummy_init_array_entry>
  400668:	55                   	push   %rbp
  400669:	48 8d 2d e0 01 20 00 	lea    0x2001e0(%rip),%rbp        # 600850 <__do_global_dtors_aux_fini_array_entry>
  400670:	53                   	push   %rbx
  400671:	4c 29 e5             	sub    %r12,%rbp
  400674:	31 db                	xor    %ebx,%ebx
  400676:	48 c1 fd 03          	sar    $0x3,%rbp
  40067a:	48 83 ec 08          	sub    $0x8,%rsp
  40067e:	e8 05 fe ff ff       	callq  400488 <_init>
  400683:	48 85 ed             	test   %rbp,%rbp
  400686:	74 1e                	je     4006a6 <__libc_csu_init+0x56>
  400688:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40068f:	00 
  400690:	4c 89 ea             	mov    %r13,%rdx
  400693:	4c 89 f6             	mov    %r14,%rsi
  400696:	44 89 ff             	mov    %r15d,%edi
  400699:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40069d:	48 83 c3 01          	add    $0x1,%rbx
  4006a1:	48 39 eb             	cmp    %rbp,%rbx
  4006a4:	75 ea                	jne    400690 <__libc_csu_init+0x40>
  4006a6:	48 83 c4 08          	add    $0x8,%rsp
  4006aa:	5b                   	pop    %rbx
  4006ab:	5d                   	pop    %rbp
  4006ac:	41 5c                	pop    %r12
  4006ae:	41 5d                	pop    %r13
  4006b0:	41 5e                	pop    %r14
  4006b2:	41 5f                	pop    %r15
  4006b4:	c3                   	retq   
  4006b5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4006bc:	00 00 00 00 

00000000004006c0 <__libc_csu_fini>:
  4006c0:	f3 c3                	repz retq 

Disassembly of section .fini:

00000000004006c4 <_fini>:
  4006c4:	48 83 ec 08          	sub    $0x8,%rsp
  4006c8:	48 83 c4 08          	add    $0x8,%rsp
  4006cc:	c3                   	retq   
