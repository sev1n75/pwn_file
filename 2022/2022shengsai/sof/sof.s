
sof：     文件格式 elf64-x86-64


Disassembly of section .init:

00000000004004f8 <_init>:
  4004f8:	48 83 ec 08          	sub    $0x8,%rsp
  4004fc:	48 8b 05 f5 0a 20 00 	mov    0x200af5(%rip),%rax        # 600ff8 <__gmon_start__>
  400503:	48 85 c0             	test   %rax,%rax
  400506:	74 02                	je     40050a <_init+0x12>
  400508:	ff d0                	callq  *%rax
  40050a:	48 83 c4 08          	add    $0x8,%rsp
  40050e:	c3                   	retq   

Disassembly of section .plt:

0000000000400510 <.plt>:
  400510:	ff 35 f2 0a 20 00    	pushq  0x200af2(%rip)        # 601008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400516:	ff 25 f4 0a 20 00    	jmpq   *0x200af4(%rip)        # 601010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40051c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400520 <puts@plt>:
  400520:	ff 25 f2 0a 20 00    	jmpq   *0x200af2(%rip)        # 601018 <puts@GLIBC_2.2.5>
  400526:	68 00 00 00 00       	pushq  $0x0
  40052b:	e9 e0 ff ff ff       	jmpq   400510 <.plt>

0000000000400530 <setbuf@plt>:
  400530:	ff 25 ea 0a 20 00    	jmpq   *0x200aea(%rip)        # 601020 <setbuf@GLIBC_2.2.5>
  400536:	68 01 00 00 00       	pushq  $0x1
  40053b:	e9 d0 ff ff ff       	jmpq   400510 <.plt>

0000000000400540 <system@plt>:
  400540:	ff 25 e2 0a 20 00    	jmpq   *0x200ae2(%rip)        # 601028 <system@GLIBC_2.2.5>
  400546:	68 02 00 00 00       	pushq  $0x2
  40054b:	e9 c0 ff ff ff       	jmpq   400510 <.plt>

Disassembly of section .text:

0000000000400550 <_start>:
  400550:	31 ed                	xor    %ebp,%ebp
  400552:	49 89 d1             	mov    %rdx,%r9
  400555:	5e                   	pop    %rsi
  400556:	48 89 e2             	mov    %rsp,%rdx
  400559:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40055d:	50                   	push   %rax
  40055e:	54                   	push   %rsp
  40055f:	49 c7 c0 60 07 40 00 	mov    $0x400760,%r8
  400566:	48 c7 c1 f0 06 40 00 	mov    $0x4006f0,%rcx
  40056d:	48 c7 c7 87 06 40 00 	mov    $0x400687,%rdi
  400574:	ff 15 76 0a 20 00    	callq  *0x200a76(%rip)        # 600ff0 <__libc_start_main@GLIBC_2.2.5>
  40057a:	f4                   	hlt    
  40057b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400580 <_dl_relocate_static_pie>:
  400580:	f3 c3                	repz retq 
  400582:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400589:	00 00 00 
  40058c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400590 <deregister_tm_clones>:
  400590:	55                   	push   %rbp
  400591:	b8 40 10 60 00       	mov    $0x601040,%eax
  400596:	48 3d 40 10 60 00    	cmp    $0x601040,%rax
  40059c:	48 89 e5             	mov    %rsp,%rbp
  40059f:	74 17                	je     4005b8 <deregister_tm_clones+0x28>
  4005a1:	b8 00 00 00 00       	mov    $0x0,%eax
  4005a6:	48 85 c0             	test   %rax,%rax
  4005a9:	74 0d                	je     4005b8 <deregister_tm_clones+0x28>
  4005ab:	5d                   	pop    %rbp
  4005ac:	bf 40 10 60 00       	mov    $0x601040,%edi
  4005b1:	ff e0                	jmpq   *%rax
  4005b3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4005b8:	5d                   	pop    %rbp
  4005b9:	c3                   	retq   
  4005ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004005c0 <register_tm_clones>:
  4005c0:	be 40 10 60 00       	mov    $0x601040,%esi
  4005c5:	55                   	push   %rbp
  4005c6:	48 81 ee 40 10 60 00 	sub    $0x601040,%rsi
  4005cd:	48 89 e5             	mov    %rsp,%rbp
  4005d0:	48 c1 fe 03          	sar    $0x3,%rsi
  4005d4:	48 89 f0             	mov    %rsi,%rax
  4005d7:	48 c1 e8 3f          	shr    $0x3f,%rax
  4005db:	48 01 c6             	add    %rax,%rsi
  4005de:	48 d1 fe             	sar    %rsi
  4005e1:	74 15                	je     4005f8 <register_tm_clones+0x38>
  4005e3:	b8 00 00 00 00       	mov    $0x0,%eax
  4005e8:	48 85 c0             	test   %rax,%rax
  4005eb:	74 0b                	je     4005f8 <register_tm_clones+0x38>
  4005ed:	5d                   	pop    %rbp
  4005ee:	bf 40 10 60 00       	mov    $0x601040,%edi
  4005f3:	ff e0                	jmpq   *%rax
  4005f5:	0f 1f 00             	nopl   (%rax)
  4005f8:	5d                   	pop    %rbp
  4005f9:	c3                   	retq   
  4005fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400600 <__do_global_dtors_aux>:
  400600:	80 3d 61 0a 20 00 00 	cmpb   $0x0,0x200a61(%rip)        # 601068 <completed.7698>
  400607:	75 17                	jne    400620 <__do_global_dtors_aux+0x20>
  400609:	55                   	push   %rbp
  40060a:	48 89 e5             	mov    %rsp,%rbp
  40060d:	e8 7e ff ff ff       	callq  400590 <deregister_tm_clones>
  400612:	c6 05 4f 0a 20 00 01 	movb   $0x1,0x200a4f(%rip)        # 601068 <completed.7698>
  400619:	5d                   	pop    %rbp
  40061a:	c3                   	retq   
  40061b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400620:	f3 c3                	repz retq 
  400622:	0f 1f 40 00          	nopl   0x0(%rax)
  400626:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40062d:	00 00 00 

0000000000400630 <frame_dummy>:
  400630:	55                   	push   %rbp
  400631:	48 89 e5             	mov    %rsp,%rbp
  400634:	5d                   	pop    %rbp
  400635:	eb 89                	jmp    4005c0 <register_tm_clones>

0000000000400637 <hello>:
  400637:	55                   	push   %rbp
  400638:	48 89 e5             	mov    %rsp,%rbp
  40063b:	48 8d 3d 36 01 00 00 	lea    0x136(%rip),%rdi        # 400778 <_IO_stdin_used+0x8>
  400642:	e8 d9 fe ff ff       	callq  400520 <puts@plt>
  400647:	90                   	nop
  400648:	5d                   	pop    %rbp
  400649:	c3                   	retq   

000000000040064a <backdoor>:
  40064a:	55                   	push   %rbp
  40064b:	48 89 e5             	mov    %rsp,%rbp
  40064e:	48 8d 3d 5d 01 00 00 	lea    0x15d(%rip),%rdi        # 4007b2 <_IO_stdin_used+0x42>
  400655:	e8 e6 fe ff ff       	callq  400540 <system@plt>
  40065a:	90                   	nop
  40065b:	5d                   	pop    %rbp
  40065c:	c3                   	retq   

000000000040065d <hack>:
  40065d:	55                   	push   %rbp
  40065e:	48 89 e5             	mov    %rsp,%rbp
  400661:	48 83 ec 30          	sub    $0x30,%rsp
  400665:	49 89 ed             	mov    %rbp,%r13
  400668:	4c 89 ee             	mov    %r13,%rsi
  40066b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
  400672:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
  400679:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax
  400680:	0f 05                	syscall 
  400682:	c9                   	leaveq 
  400683:	c3                   	retq   
  400684:	90                   	nop
  400685:	5d                   	pop    %rbp
  400686:	c3                   	retq   

0000000000400687 <main>:
  400687:	55                   	push   %rbp
  400688:	48 89 e5             	mov    %rsp,%rbp
  40068b:	48 83 ec 10          	sub    $0x10,%rsp
  40068f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  400692:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  400696:	48 8b 05 b3 09 20 00 	mov    0x2009b3(%rip),%rax        # 601050 <stdin@@GLIBC_2.2.5>
  40069d:	be 00 00 00 00       	mov    $0x0,%esi
  4006a2:	48 89 c7             	mov    %rax,%rdi
  4006a5:	e8 86 fe ff ff       	callq  400530 <setbuf@plt>
  4006aa:	48 8b 05 8f 09 20 00 	mov    0x20098f(%rip),%rax        # 601040 <stdout@@GLIBC_2.2.5>
  4006b1:	be 00 00 00 00       	mov    $0x0,%esi
  4006b6:	48 89 c7             	mov    %rax,%rdi
  4006b9:	e8 72 fe ff ff       	callq  400530 <setbuf@plt>
  4006be:	48 8b 05 9b 09 20 00 	mov    0x20099b(%rip),%rax        # 601060 <stderr@@GLIBC_2.2.5>
  4006c5:	be 00 00 00 00       	mov    $0x0,%esi
  4006ca:	48 89 c7             	mov    %rax,%rdi
  4006cd:	e8 5e fe ff ff       	callq  400530 <setbuf@plt>
  4006d2:	b8 00 00 00 00       	mov    $0x0,%eax
  4006d7:	e8 5b ff ff ff       	callq  400637 <hello>
  4006dc:	b8 00 00 00 00       	mov    $0x0,%eax
  4006e1:	e8 77 ff ff ff       	callq  40065d <hack>
  4006e6:	b8 00 00 00 00       	mov    $0x0,%eax
  4006eb:	c9                   	leaveq 
  4006ec:	c3                   	retq   
  4006ed:	0f 1f 00             	nopl   (%rax)

00000000004006f0 <__libc_csu_init>:
  4006f0:	41 57                	push   %r15
  4006f2:	41 56                	push   %r14
  4006f4:	49 89 d7             	mov    %rdx,%r15
  4006f7:	41 55                	push   %r13
  4006f9:	41 54                	push   %r12
  4006fb:	4c 8d 25 0e 07 20 00 	lea    0x20070e(%rip),%r12        # 600e10 <__frame_dummy_init_array_entry>
  400702:	55                   	push   %rbp
  400703:	48 8d 2d 0e 07 20 00 	lea    0x20070e(%rip),%rbp        # 600e18 <__do_global_dtors_aux_fini_array_entry>
  40070a:	53                   	push   %rbx
  40070b:	41 89 fd             	mov    %edi,%r13d
  40070e:	49 89 f6             	mov    %rsi,%r14
  400711:	4c 29 e5             	sub    %r12,%rbp
  400714:	48 83 ec 08          	sub    $0x8,%rsp
  400718:	48 c1 fd 03          	sar    $0x3,%rbp
  40071c:	e8 d7 fd ff ff       	callq  4004f8 <_init>
  400721:	48 85 ed             	test   %rbp,%rbp
  400724:	74 20                	je     400746 <__libc_csu_init+0x56>
  400726:	31 db                	xor    %ebx,%ebx
  400728:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40072f:	00 
  400730:	4c 89 fa             	mov    %r15,%rdx
  400733:	4c 89 f6             	mov    %r14,%rsi
  400736:	44 89 ef             	mov    %r13d,%edi
  400739:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40073d:	48 83 c3 01          	add    $0x1,%rbx
  400741:	48 39 dd             	cmp    %rbx,%rbp
  400744:	75 ea                	jne    400730 <__libc_csu_init+0x40>
  400746:	48 83 c4 08          	add    $0x8,%rsp
  40074a:	5b                   	pop    %rbx
  40074b:	5d                   	pop    %rbp
  40074c:	41 5c                	pop    %r12
  40074e:	41 5d                	pop    %r13
  400750:	41 5e                	pop    %r14
  400752:	41 5f                	pop    %r15
  400754:	c3                   	retq   
  400755:	90                   	nop
  400756:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40075d:	00 00 00 

0000000000400760 <__libc_csu_fini>:
  400760:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000400764 <_fini>:
  400764:	48 83 ec 08          	sub    $0x8,%rsp
  400768:	48 83 c4 08          	add    $0x8,%rsp
  40076c:	c3                   	retq   
