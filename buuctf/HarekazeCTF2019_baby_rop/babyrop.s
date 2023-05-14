
babyrop：     文件格式 elf64-x86-64


Disassembly of section .init:

0000000000400460 <_init>:
  400460:	48 83 ec 08          	sub    $0x8,%rsp
  400464:	48 8b 05 8d 0b 20 00 	mov    0x200b8d(%rip),%rax        # 600ff8 <__gmon_start__>
  40046b:	48 85 c0             	test   %rax,%rax
  40046e:	74 05                	je     400475 <_init+0x15>
  400470:	e8 5b 00 00 00       	callq  4004d0 <__gmon_start__@plt>
  400475:	48 83 c4 08          	add    $0x8,%rsp
  400479:	c3                   	retq   

Disassembly of section .plt:

0000000000400480 <.plt>:
  400480:	ff 35 82 0b 20 00    	pushq  0x200b82(%rip)        # 601008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400486:	ff 25 84 0b 20 00    	jmpq   *0x200b84(%rip)        # 601010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40048c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400490 <system@plt>:
  400490:	ff 25 82 0b 20 00    	jmpq   *0x200b82(%rip)        # 601018 <system@GLIBC_2.2.5>
  400496:	68 00 00 00 00       	pushq  $0x0
  40049b:	e9 e0 ff ff ff       	jmpq   400480 <.plt>

00000000004004a0 <printf@plt>:
  4004a0:	ff 25 7a 0b 20 00    	jmpq   *0x200b7a(%rip)        # 601020 <printf@GLIBC_2.2.5>
  4004a6:	68 01 00 00 00       	pushq  $0x1
  4004ab:	e9 d0 ff ff ff       	jmpq   400480 <.plt>

00000000004004b0 <__libc_start_main@plt>:
  4004b0:	ff 25 72 0b 20 00    	jmpq   *0x200b72(%rip)        # 601028 <__libc_start_main@GLIBC_2.2.5>
  4004b6:	68 02 00 00 00       	pushq  $0x2
  4004bb:	e9 c0 ff ff ff       	jmpq   400480 <.plt>

00000000004004c0 <__isoc99_scanf@plt>:
  4004c0:	ff 25 6a 0b 20 00    	jmpq   *0x200b6a(%rip)        # 601030 <__isoc99_scanf@GLIBC_2.7>
  4004c6:	68 03 00 00 00       	pushq  $0x3
  4004cb:	e9 b0 ff ff ff       	jmpq   400480 <.plt>

Disassembly of section .plt.got:

00000000004004d0 <__gmon_start__@plt>:
  4004d0:	ff 25 22 0b 20 00    	jmpq   *0x200b22(%rip)        # 600ff8 <__gmon_start__>
  4004d6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

00000000004004e0 <_start>:
  4004e0:	31 ed                	xor    %ebp,%ebp
  4004e2:	49 89 d1             	mov    %rdx,%r9
  4004e5:	5e                   	pop    %rsi
  4004e6:	48 89 e2             	mov    %rsp,%rdx
  4004e9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4004ed:	50                   	push   %rax
  4004ee:	54                   	push   %rsp
  4004ef:	49 c7 c0 90 06 40 00 	mov    $0x400690,%r8
  4004f6:	48 c7 c1 20 06 40 00 	mov    $0x400620,%rcx
  4004fd:	48 c7 c7 d6 05 40 00 	mov    $0x4005d6,%rdi
  400504:	e8 a7 ff ff ff       	callq  4004b0 <__libc_start_main@plt>
  400509:	f4                   	hlt    
  40050a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400510 <deregister_tm_clones>:
  400510:	b8 57 10 60 00       	mov    $0x601057,%eax
  400515:	55                   	push   %rbp
  400516:	48 2d 50 10 60 00    	sub    $0x601050,%rax
  40051c:	48 83 f8 0e          	cmp    $0xe,%rax
  400520:	48 89 e5             	mov    %rsp,%rbp
  400523:	76 1b                	jbe    400540 <deregister_tm_clones+0x30>
  400525:	b8 00 00 00 00       	mov    $0x0,%eax
  40052a:	48 85 c0             	test   %rax,%rax
  40052d:	74 11                	je     400540 <deregister_tm_clones+0x30>
  40052f:	5d                   	pop    %rbp
  400530:	bf 50 10 60 00       	mov    $0x601050,%edi
  400535:	ff e0                	jmpq   *%rax
  400537:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40053e:	00 00 
  400540:	5d                   	pop    %rbp
  400541:	c3                   	retq   
  400542:	0f 1f 40 00          	nopl   0x0(%rax)
  400546:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40054d:	00 00 00 

0000000000400550 <register_tm_clones>:
  400550:	be 50 10 60 00       	mov    $0x601050,%esi
  400555:	55                   	push   %rbp
  400556:	48 81 ee 50 10 60 00 	sub    $0x601050,%rsi
  40055d:	48 c1 fe 03          	sar    $0x3,%rsi
  400561:	48 89 e5             	mov    %rsp,%rbp
  400564:	48 89 f0             	mov    %rsi,%rax
  400567:	48 c1 e8 3f          	shr    $0x3f,%rax
  40056b:	48 01 c6             	add    %rax,%rsi
  40056e:	48 d1 fe             	sar    %rsi
  400571:	74 15                	je     400588 <register_tm_clones+0x38>
  400573:	b8 00 00 00 00       	mov    $0x0,%eax
  400578:	48 85 c0             	test   %rax,%rax
  40057b:	74 0b                	je     400588 <register_tm_clones+0x38>
  40057d:	5d                   	pop    %rbp
  40057e:	bf 50 10 60 00       	mov    $0x601050,%edi
  400583:	ff e0                	jmpq   *%rax
  400585:	0f 1f 00             	nopl   (%rax)
  400588:	5d                   	pop    %rbp
  400589:	c3                   	retq   
  40058a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400590 <__do_global_dtors_aux>:
  400590:	80 3d b9 0a 20 00 00 	cmpb   $0x0,0x200ab9(%rip)        # 601050 <__TMC_END__>
  400597:	75 11                	jne    4005aa <__do_global_dtors_aux+0x1a>
  400599:	55                   	push   %rbp
  40059a:	48 89 e5             	mov    %rsp,%rbp
  40059d:	e8 6e ff ff ff       	callq  400510 <deregister_tm_clones>
  4005a2:	5d                   	pop    %rbp
  4005a3:	c6 05 a6 0a 20 00 01 	movb   $0x1,0x200aa6(%rip)        # 601050 <__TMC_END__>
  4005aa:	f3 c3                	repz retq 
  4005ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004005b0 <frame_dummy>:
  4005b0:	bf 20 0e 60 00       	mov    $0x600e20,%edi
  4005b5:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  4005b9:	75 05                	jne    4005c0 <frame_dummy+0x10>
  4005bb:	eb 93                	jmp    400550 <register_tm_clones>
  4005bd:	0f 1f 00             	nopl   (%rax)
  4005c0:	b8 00 00 00 00       	mov    $0x0,%eax
  4005c5:	48 85 c0             	test   %rax,%rax
  4005c8:	74 f1                	je     4005bb <frame_dummy+0xb>
  4005ca:	55                   	push   %rbp
  4005cb:	48 89 e5             	mov    %rsp,%rbp
  4005ce:	ff d0                	callq  *%rax
  4005d0:	5d                   	pop    %rbp
  4005d1:	e9 7a ff ff ff       	jmpq   400550 <register_tm_clones>

00000000004005d6 <main>:
  4005d6:	55                   	push   %rbp
  4005d7:	48 89 e5             	mov    %rsp,%rbp
  4005da:	48 83 ec 10          	sub    $0x10,%rsp
  4005de:	bf a8 06 40 00       	mov    $0x4006a8,%edi
  4005e3:	e8 a8 fe ff ff       	callq  400490 <system@plt>
  4005e8:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  4005ec:	48 89 c6             	mov    %rax,%rsi
  4005ef:	bf c5 06 40 00       	mov    $0x4006c5,%edi
  4005f4:	b8 00 00 00 00       	mov    $0x0,%eax
  4005f9:	e8 c2 fe ff ff       	callq  4004c0 <__isoc99_scanf@plt>
  4005fe:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  400602:	48 89 c6             	mov    %rax,%rsi
  400605:	bf c8 06 40 00       	mov    $0x4006c8,%edi
  40060a:	b8 00 00 00 00       	mov    $0x0,%eax
  40060f:	e8 8c fe ff ff       	callq  4004a0 <printf@plt>
  400614:	b8 00 00 00 00       	mov    $0x0,%eax
  400619:	c9                   	leaveq 
  40061a:	c3                   	retq   
  40061b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400620 <__libc_csu_init>:
  400620:	41 57                	push   %r15
  400622:	41 56                	push   %r14
  400624:	41 89 ff             	mov    %edi,%r15d
  400627:	41 55                	push   %r13
  400629:	41 54                	push   %r12
  40062b:	4c 8d 25 de 07 20 00 	lea    0x2007de(%rip),%r12        # 600e10 <__frame_dummy_init_array_entry>
  400632:	55                   	push   %rbp
  400633:	48 8d 2d de 07 20 00 	lea    0x2007de(%rip),%rbp        # 600e18 <__do_global_dtors_aux_fini_array_entry>
  40063a:	53                   	push   %rbx
  40063b:	49 89 f6             	mov    %rsi,%r14
  40063e:	49 89 d5             	mov    %rdx,%r13
  400641:	4c 29 e5             	sub    %r12,%rbp
  400644:	48 83 ec 08          	sub    $0x8,%rsp
  400648:	48 c1 fd 03          	sar    $0x3,%rbp
  40064c:	e8 0f fe ff ff       	callq  400460 <_init>
  400651:	48 85 ed             	test   %rbp,%rbp
  400654:	74 20                	je     400676 <__libc_csu_init+0x56>
  400656:	31 db                	xor    %ebx,%ebx
  400658:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40065f:	00 
  400660:	4c 89 ea             	mov    %r13,%rdx
  400663:	4c 89 f6             	mov    %r14,%rsi
  400666:	44 89 ff             	mov    %r15d,%edi
  400669:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40066d:	48 83 c3 01          	add    $0x1,%rbx
  400671:	48 39 eb             	cmp    %rbp,%rbx
  400674:	75 ea                	jne    400660 <__libc_csu_init+0x40>
  400676:	48 83 c4 08          	add    $0x8,%rsp
  40067a:	5b                   	pop    %rbx
  40067b:	5d                   	pop    %rbp
  40067c:	41 5c                	pop    %r12
  40067e:	41 5d                	pop    %r13
  400680:	41 5e                	pop    %r14
  400682:	41 5f                	pop    %r15
  400684:	c3                   	retq   
  400685:	90                   	nop
  400686:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40068d:	00 00 00 

0000000000400690 <__libc_csu_fini>:
  400690:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000400694 <_fini>:
  400694:	48 83 ec 08          	sub    $0x8,%rsp
  400698:	48 83 c4 08          	add    $0x8,%rsp
  40069c:	c3                   	retq   
