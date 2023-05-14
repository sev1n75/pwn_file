
H3ll0Rop：     文件格式 elf64-x86-64


Disassembly of section .init:

00000000004004f0 <_init>:
  4004f0:	48 83 ec 08          	sub    $0x8,%rsp
  4004f4:	48 8b 05 1d 06 20 00 	mov    0x20061d(%rip),%rax        # 600b18 <__gmon_start__>
  4004fb:	48 85 c0             	test   %rax,%rax
  4004fe:	74 02                	je     400502 <_init+0x12>
  400500:	ff d0                	callq  *%rax
  400502:	48 83 c4 08          	add    $0x8,%rsp
  400506:	c3                   	retq   

Disassembly of section .plt:

0000000000400510 <.plt>:
  400510:	ff 35 12 06 20 00    	pushq  0x200612(%rip)        # 600b28 <_GLOBAL_OFFSET_TABLE_+0x8>
  400516:	ff 25 14 06 20 00    	jmpq   *0x200614(%rip)        # 600b30 <_GLOBAL_OFFSET_TABLE_+0x10>
  40051c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400520 <puts@plt>:
  400520:	ff 25 12 06 20 00    	jmpq   *0x200612(%rip)        # 600b38 <puts@GLIBC_2.2.5>
  400526:	68 00 00 00 00       	pushq  $0x0
  40052b:	e9 e0 ff ff ff       	jmpq   400510 <.plt>

0000000000400530 <setbuf@plt>:
  400530:	ff 25 0a 06 20 00    	jmpq   *0x20060a(%rip)        # 600b40 <setbuf@GLIBC_2.2.5>
  400536:	68 01 00 00 00       	pushq  $0x1
  40053b:	e9 d0 ff ff ff       	jmpq   400510 <.plt>

0000000000400540 <printf@plt>:
  400540:	ff 25 02 06 20 00    	jmpq   *0x200602(%rip)        # 600b48 <printf@GLIBC_2.2.5>
  400546:	68 02 00 00 00       	pushq  $0x2
  40054b:	e9 c0 ff ff ff       	jmpq   400510 <.plt>

0000000000400550 <read@plt>:
  400550:	ff 25 fa 05 20 00    	jmpq   *0x2005fa(%rip)        # 600b50 <read@GLIBC_2.2.5>
  400556:	68 03 00 00 00       	pushq  $0x3
  40055b:	e9 b0 ff ff ff       	jmpq   400510 <.plt>

Disassembly of section .text:

0000000000400560 <_start>:
  400560:	31 ed                	xor    %ebp,%ebp
  400562:	49 89 d1             	mov    %rdx,%r9
  400565:	5e                   	pop    %rsi
  400566:	48 89 e2             	mov    %rsp,%rdx
  400569:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40056d:	50                   	push   %rax
  40056e:	54                   	push   %rsp
  40056f:	49 c7 c0 60 07 40 00 	mov    $0x400760,%r8
  400576:	48 c7 c1 f0 06 40 00 	mov    $0x4006f0,%rcx
  40057d:	48 c7 c7 cc 06 40 00 	mov    $0x4006cc,%rdi
  400584:	ff 15 86 05 20 00    	callq  *0x200586(%rip)        # 600b10 <__libc_start_main@GLIBC_2.2.5>
  40058a:	f4                   	hlt    
  40058b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400590 <_dl_relocate_static_pie>:
  400590:	f3 c3                	repz retq 
  400592:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400599:	00 00 00 
  40059c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004005a0 <deregister_tm_clones>:
  4005a0:	55                   	push   %rbp
  4005a1:	b8 68 0b 60 00       	mov    $0x600b68,%eax
  4005a6:	48 3d 68 0b 60 00    	cmp    $0x600b68,%rax
  4005ac:	48 89 e5             	mov    %rsp,%rbp
  4005af:	74 17                	je     4005c8 <deregister_tm_clones+0x28>
  4005b1:	b8 00 00 00 00       	mov    $0x0,%eax
  4005b6:	48 85 c0             	test   %rax,%rax
  4005b9:	74 0d                	je     4005c8 <deregister_tm_clones+0x28>
  4005bb:	5d                   	pop    %rbp
  4005bc:	bf 68 0b 60 00       	mov    $0x600b68,%edi
  4005c1:	ff e0                	jmpq   *%rax
  4005c3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4005c8:	5d                   	pop    %rbp
  4005c9:	c3                   	retq   
  4005ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004005d0 <register_tm_clones>:
  4005d0:	be 68 0b 60 00       	mov    $0x600b68,%esi
  4005d5:	55                   	push   %rbp
  4005d6:	48 81 ee 68 0b 60 00 	sub    $0x600b68,%rsi
  4005dd:	48 89 e5             	mov    %rsp,%rbp
  4005e0:	48 c1 fe 03          	sar    $0x3,%rsi
  4005e4:	48 89 f0             	mov    %rsi,%rax
  4005e7:	48 c1 e8 3f          	shr    $0x3f,%rax
  4005eb:	48 01 c6             	add    %rax,%rsi
  4005ee:	48 d1 fe             	sar    %rsi
  4005f1:	74 15                	je     400608 <register_tm_clones+0x38>
  4005f3:	b8 00 00 00 00       	mov    $0x0,%eax
  4005f8:	48 85 c0             	test   %rax,%rax
  4005fb:	74 0b                	je     400608 <register_tm_clones+0x38>
  4005fd:	5d                   	pop    %rbp
  4005fe:	bf 68 0b 60 00       	mov    $0x600b68,%edi
  400603:	ff e0                	jmpq   *%rax
  400605:	0f 1f 00             	nopl   (%rax)
  400608:	5d                   	pop    %rbp
  400609:	c3                   	retq   
  40060a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400610 <__do_global_dtors_aux>:
  400610:	80 3d 91 05 20 00 00 	cmpb   $0x0,0x200591(%rip)        # 600ba8 <completed.7698>
  400617:	75 17                	jne    400630 <__do_global_dtors_aux+0x20>
  400619:	55                   	push   %rbp
  40061a:	48 89 e5             	mov    %rsp,%rbp
  40061d:	e8 7e ff ff ff       	callq  4005a0 <deregister_tm_clones>
  400622:	c6 05 7f 05 20 00 01 	movb   $0x1,0x20057f(%rip)        # 600ba8 <completed.7698>
  400629:	5d                   	pop    %rbp
  40062a:	c3                   	retq   
  40062b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400630:	f3 c3                	repz retq 
  400632:	0f 1f 40 00          	nopl   0x0(%rax)
  400636:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40063d:	00 00 00 

0000000000400640 <frame_dummy>:
  400640:	55                   	push   %rbp
  400641:	48 89 e5             	mov    %rsp,%rbp
  400644:	5d                   	pop    %rbp
  400645:	eb 89                	jmp    4005d0 <register_tm_clones>

0000000000400647 <vuln>:
  400647:	55                   	push   %rbp
  400648:	48 89 e5             	mov    %rsp,%rbp
  40064b:	48 83 ec 60          	sub    $0x60,%rsp
  40064f:	48 8b 05 3a 05 20 00 	mov    0x20053a(%rip),%rax        # 600b90 <stdin@@GLIBC_2.2.5>
  400656:	be 00 00 00 00       	mov    $0x0,%esi
  40065b:	48 89 c7             	mov    %rax,%rdi
  40065e:	e8 cd fe ff ff       	callq  400530 <setbuf@plt>
  400663:	48 8b 05 16 05 20 00 	mov    0x200516(%rip),%rax        # 600b80 <stdout@@GLIBC_2.2.5>
  40066a:	be 00 00 00 00       	mov    $0x0,%esi
  40066f:	48 89 c7             	mov    %rax,%rdi
  400672:	e8 b9 fe ff ff       	callq  400530 <setbuf@plt>
  400677:	48 8b 05 22 05 20 00 	mov    0x200522(%rip),%rax        # 600ba0 <stderr@@GLIBC_2.2.5>
  40067e:	be 00 00 00 00       	mov    $0x0,%esi
  400683:	48 89 c7             	mov    %rax,%rdi
  400686:	e8 a5 fe ff ff       	callq  400530 <setbuf@plt>
  40068b:	c6 45 ff 0c          	movb   $0xc,-0x1(%rbp)
  40068f:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
  400693:	ba 00 05 00 00       	mov    $0x500,%edx
  400698:	48 89 c6             	mov    %rax,%rsi
  40069b:	bf 00 00 00 00       	mov    $0x0,%edi
  4006a0:	e8 ab fe ff ff       	callq  400550 <read@plt>
  4006a5:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
  4006a9:	48 89 c6             	mov    %rax,%rsi
  4006ac:	48 8d 3d c5 00 00 00 	lea    0xc5(%rip),%rdi        # 400778 <_IO_stdin_used+0x8>
  4006b3:	b8 00 00 00 00       	mov    $0x0,%eax
  4006b8:	e8 83 fe ff ff       	callq  400540 <printf@plt>
  4006bd:	48 8d 3d b7 00 00 00 	lea    0xb7(%rip),%rdi        # 40077b <_IO_stdin_used+0xb>
  4006c4:	e8 57 fe ff ff       	callq  400520 <puts@plt>
  4006c9:	90                   	nop
  4006ca:	c9                   	leaveq 
  4006cb:	c3                   	retq   

00000000004006cc <main>:
  4006cc:	55                   	push   %rbp
  4006cd:	48 89 e5             	mov    %rsp,%rbp
  4006d0:	48 8d 3d c1 00 00 00 	lea    0xc1(%rip),%rdi        # 400798 <_IO_stdin_used+0x28>
  4006d7:	e8 44 fe ff ff       	callq  400520 <puts@plt>
  4006dc:	b8 00 00 00 00       	mov    $0x0,%eax
  4006e1:	e8 61 ff ff ff       	callq  400647 <vuln>
  4006e6:	90                   	nop
  4006e7:	5d                   	pop    %rbp
  4006e8:	c3                   	retq   
  4006e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004006f0 <__libc_csu_init>:
  4006f0:	41 57                	push   %r15
  4006f2:	41 56                	push   %r14
  4006f4:	49 89 d7             	mov    %rdx,%r15
  4006f7:	41 55                	push   %r13
  4006f9:	41 54                	push   %r12
  4006fb:	4c 8d 25 2e 02 20 00 	lea    0x20022e(%rip),%r12        # 600930 <__frame_dummy_init_array_entry>
  400702:	55                   	push   %rbp
  400703:	48 8d 2d 2e 02 20 00 	lea    0x20022e(%rip),%rbp        # 600938 <__do_global_dtors_aux_fini_array_entry>
  40070a:	53                   	push   %rbx
  40070b:	41 89 fd             	mov    %edi,%r13d
  40070e:	49 89 f6             	mov    %rsi,%r14
  400711:	4c 29 e5             	sub    %r12,%rbp
  400714:	48 83 ec 08          	sub    $0x8,%rsp
  400718:	48 c1 fd 03          	sar    $0x3,%rbp
  40071c:	e8 cf fd ff ff       	callq  4004f0 <_init>
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
