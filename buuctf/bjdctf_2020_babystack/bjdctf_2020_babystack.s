
bjdctf_2020_babystack：     文件格式 elf64-x86-64


Disassembly of section .init:

0000000000400548 <_init>:
  400548:	48 83 ec 08          	sub    $0x8,%rsp
  40054c:	48 8b 05 a5 0a 20 00 	mov    0x200aa5(%rip),%rax        # 600ff8 <__gmon_start__>
  400553:	48 85 c0             	test   %rax,%rax
  400556:	74 05                	je     40055d <_init+0x15>
  400558:	e8 83 00 00 00       	callq  4005e0 <__gmon_start__@plt>
  40055d:	48 83 c4 08          	add    $0x8,%rsp
  400561:	c3                   	retq   

Disassembly of section .plt:

0000000000400570 <.plt>:
  400570:	ff 35 92 0a 20 00    	pushq  0x200a92(%rip)        # 601008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400576:	ff 25 94 0a 20 00    	jmpq   *0x200a94(%rip)        # 601010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40057c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400580 <puts@plt>:
  400580:	ff 25 92 0a 20 00    	jmpq   *0x200a92(%rip)        # 601018 <puts@GLIBC_2.2.5>
  400586:	68 00 00 00 00       	pushq  $0x0
  40058b:	e9 e0 ff ff ff       	jmpq   400570 <.plt>

0000000000400590 <system@plt>:
  400590:	ff 25 8a 0a 20 00    	jmpq   *0x200a8a(%rip)        # 601020 <system@GLIBC_2.2.5>
  400596:	68 01 00 00 00       	pushq  $0x1
  40059b:	e9 d0 ff ff ff       	jmpq   400570 <.plt>

00000000004005a0 <read@plt>:
  4005a0:	ff 25 82 0a 20 00    	jmpq   *0x200a82(%rip)        # 601028 <read@GLIBC_2.2.5>
  4005a6:	68 02 00 00 00       	pushq  $0x2
  4005ab:	e9 c0 ff ff ff       	jmpq   400570 <.plt>

00000000004005b0 <__libc_start_main@plt>:
  4005b0:	ff 25 7a 0a 20 00    	jmpq   *0x200a7a(%rip)        # 601030 <__libc_start_main@GLIBC_2.2.5>
  4005b6:	68 03 00 00 00       	pushq  $0x3
  4005bb:	e9 b0 ff ff ff       	jmpq   400570 <.plt>

00000000004005c0 <setvbuf@plt>:
  4005c0:	ff 25 72 0a 20 00    	jmpq   *0x200a72(%rip)        # 601038 <setvbuf@GLIBC_2.2.5>
  4005c6:	68 04 00 00 00       	pushq  $0x4
  4005cb:	e9 a0 ff ff ff       	jmpq   400570 <.plt>

00000000004005d0 <__isoc99_scanf@plt>:
  4005d0:	ff 25 6a 0a 20 00    	jmpq   *0x200a6a(%rip)        # 601040 <__isoc99_scanf@GLIBC_2.7>
  4005d6:	68 05 00 00 00       	pushq  $0x5
  4005db:	e9 90 ff ff ff       	jmpq   400570 <.plt>

Disassembly of section .plt.got:

00000000004005e0 <__gmon_start__@plt>:
  4005e0:	ff 25 12 0a 20 00    	jmpq   *0x200a12(%rip)        # 600ff8 <__gmon_start__>
  4005e6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

00000000004005f0 <_start>:
  4005f0:	31 ed                	xor    %ebp,%ebp
  4005f2:	49 89 d1             	mov    %rdx,%r9
  4005f5:	5e                   	pop    %rsi
  4005f6:	48 89 e2             	mov    %rsp,%rdx
  4005f9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4005fd:	50                   	push   %rax
  4005fe:	54                   	push   %rsp
  4005ff:	49 c7 c0 40 08 40 00 	mov    $0x400840,%r8
  400606:	48 c7 c1 d0 07 40 00 	mov    $0x4007d0,%rcx
  40060d:	48 c7 c7 fb 06 40 00 	mov    $0x4006fb,%rdi
  400614:	e8 97 ff ff ff       	callq  4005b0 <__libc_start_main@plt>
  400619:	f4                   	hlt    
  40061a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400620 <deregister_tm_clones>:
  400620:	b8 5f 10 60 00       	mov    $0x60105f,%eax
  400625:	55                   	push   %rbp
  400626:	48 2d 58 10 60 00    	sub    $0x601058,%rax
  40062c:	48 83 f8 0e          	cmp    $0xe,%rax
  400630:	48 89 e5             	mov    %rsp,%rbp
  400633:	76 1b                	jbe    400650 <deregister_tm_clones+0x30>
  400635:	b8 00 00 00 00       	mov    $0x0,%eax
  40063a:	48 85 c0             	test   %rax,%rax
  40063d:	74 11                	je     400650 <deregister_tm_clones+0x30>
  40063f:	5d                   	pop    %rbp
  400640:	bf 58 10 60 00       	mov    $0x601058,%edi
  400645:	ff e0                	jmpq   *%rax
  400647:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40064e:	00 00 
  400650:	5d                   	pop    %rbp
  400651:	c3                   	retq   
  400652:	0f 1f 40 00          	nopl   0x0(%rax)
  400656:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40065d:	00 00 00 

0000000000400660 <register_tm_clones>:
  400660:	be 58 10 60 00       	mov    $0x601058,%esi
  400665:	55                   	push   %rbp
  400666:	48 81 ee 58 10 60 00 	sub    $0x601058,%rsi
  40066d:	48 c1 fe 03          	sar    $0x3,%rsi
  400671:	48 89 e5             	mov    %rsp,%rbp
  400674:	48 89 f0             	mov    %rsi,%rax
  400677:	48 c1 e8 3f          	shr    $0x3f,%rax
  40067b:	48 01 c6             	add    %rax,%rsi
  40067e:	48 d1 fe             	sar    %rsi
  400681:	74 15                	je     400698 <register_tm_clones+0x38>
  400683:	b8 00 00 00 00       	mov    $0x0,%eax
  400688:	48 85 c0             	test   %rax,%rax
  40068b:	74 0b                	je     400698 <register_tm_clones+0x38>
  40068d:	5d                   	pop    %rbp
  40068e:	bf 58 10 60 00       	mov    $0x601058,%edi
  400693:	ff e0                	jmpq   *%rax
  400695:	0f 1f 00             	nopl   (%rax)
  400698:	5d                   	pop    %rbp
  400699:	c3                   	retq   
  40069a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004006a0 <__do_global_dtors_aux>:
  4006a0:	80 3d d1 09 20 00 00 	cmpb   $0x0,0x2009d1(%rip)        # 601078 <completed.7594>
  4006a7:	75 11                	jne    4006ba <__do_global_dtors_aux+0x1a>
  4006a9:	55                   	push   %rbp
  4006aa:	48 89 e5             	mov    %rsp,%rbp
  4006ad:	e8 6e ff ff ff       	callq  400620 <deregister_tm_clones>
  4006b2:	5d                   	pop    %rbp
  4006b3:	c6 05 be 09 20 00 01 	movb   $0x1,0x2009be(%rip)        # 601078 <completed.7594>
  4006ba:	f3 c3                	repz retq 
  4006bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004006c0 <frame_dummy>:
  4006c0:	bf 20 0e 60 00       	mov    $0x600e20,%edi
  4006c5:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  4006c9:	75 05                	jne    4006d0 <frame_dummy+0x10>
  4006cb:	eb 93                	jmp    400660 <register_tm_clones>
  4006cd:	0f 1f 00             	nopl   (%rax)
  4006d0:	b8 00 00 00 00       	mov    $0x0,%eax
  4006d5:	48 85 c0             	test   %rax,%rax
  4006d8:	74 f1                	je     4006cb <frame_dummy+0xb>
  4006da:	55                   	push   %rbp
  4006db:	48 89 e5             	mov    %rsp,%rbp
  4006de:	ff d0                	callq  *%rax
  4006e0:	5d                   	pop    %rbp
  4006e1:	e9 7a ff ff ff       	jmpq   400660 <register_tm_clones>

00000000004006e6 <backdoor>:
  4006e6:	55                   	push   %rbp
  4006e7:	48 89 e5             	mov    %rsp,%rbp
  4006ea:	bf 58 08 40 00       	mov    $0x400858,%edi
  4006ef:	e8 9c fe ff ff       	callq  400590 <system@plt>
  4006f4:	b8 01 00 00 00       	mov    $0x1,%eax
  4006f9:	5d                   	pop    %rbp
  4006fa:	c3                   	retq   

00000000004006fb <main>:
  4006fb:	55                   	push   %rbp
  4006fc:	48 89 e5             	mov    %rsp,%rbp
  4006ff:	48 83 ec 10          	sub    $0x10,%rsp
  400703:	48 8b 05 56 09 20 00 	mov    0x200956(%rip),%rax        # 601060 <stdout@@GLIBC_2.2.5>
  40070a:	b9 00 00 00 00       	mov    $0x0,%ecx
  40070f:	ba 02 00 00 00       	mov    $0x2,%edx
  400714:	be 00 00 00 00       	mov    $0x0,%esi
  400719:	48 89 c7             	mov    %rax,%rdi
  40071c:	e8 9f fe ff ff       	callq  4005c0 <setvbuf@plt>
  400721:	48 8b 05 48 09 20 00 	mov    0x200948(%rip),%rax        # 601070 <stdin@@GLIBC_2.2.5>
  400728:	b9 00 00 00 00       	mov    $0x0,%ecx
  40072d:	ba 01 00 00 00       	mov    $0x1,%edx
  400732:	be 00 00 00 00       	mov    $0x0,%esi
  400737:	48 89 c7             	mov    %rax,%rdi
  40073a:	e8 81 fe ff ff       	callq  4005c0 <setvbuf@plt>
  40073f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  400746:	bf 60 08 40 00       	mov    $0x400860,%edi
  40074b:	e8 30 fe ff ff       	callq  400580 <puts@plt>
  400750:	bf 88 08 40 00       	mov    $0x400888,%edi
  400755:	e8 26 fe ff ff       	callq  400580 <puts@plt>
  40075a:	bf b0 08 40 00       	mov    $0x4008b0,%edi
  40075f:	e8 1c fe ff ff       	callq  400580 <puts@plt>
  400764:	bf d8 08 40 00       	mov    $0x4008d8,%edi
  400769:	e8 12 fe ff ff       	callq  400580 <puts@plt>
  40076e:	bf 00 09 40 00       	mov    $0x400900,%edi
  400773:	e8 08 fe ff ff       	callq  400580 <puts@plt>
  400778:	bf 23 09 40 00       	mov    $0x400923,%edi
  40077d:	e8 fe fd ff ff       	callq  400580 <puts@plt>
  400782:	bf 38 09 40 00       	mov    $0x400938,%edi
  400787:	e8 f4 fd ff ff       	callq  400580 <puts@plt>
  40078c:	48 8d 45 fc          	lea    -0x4(%rbp),%rax
  400790:	48 89 c6             	mov    %rax,%rsi
  400793:	bf 61 09 40 00       	mov    $0x400961,%edi
  400798:	b8 00 00 00 00       	mov    $0x0,%eax
  40079d:	e8 2e fe ff ff       	callq  4005d0 <__isoc99_scanf@plt>
  4007a2:	bf 64 09 40 00       	mov    $0x400964,%edi
  4007a7:	e8 d4 fd ff ff       	callq  400580 <puts@plt>
  4007ac:	8b 55 fc             	mov    -0x4(%rbp),%edx
  4007af:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  4007b3:	48 89 c6             	mov    %rax,%rsi
  4007b6:	bf 00 00 00 00       	mov    $0x0,%edi
  4007bb:	b8 00 00 00 00       	mov    $0x0,%eax
  4007c0:	e8 db fd ff ff       	callq  4005a0 <read@plt>
  4007c5:	b8 00 00 00 00       	mov    $0x0,%eax
  4007ca:	c9                   	leaveq 
  4007cb:	c3                   	retq   
  4007cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004007d0 <__libc_csu_init>:
  4007d0:	41 57                	push   %r15
  4007d2:	41 56                	push   %r14
  4007d4:	41 89 ff             	mov    %edi,%r15d
  4007d7:	41 55                	push   %r13
  4007d9:	41 54                	push   %r12
  4007db:	4c 8d 25 2e 06 20 00 	lea    0x20062e(%rip),%r12        # 600e10 <__frame_dummy_init_array_entry>
  4007e2:	55                   	push   %rbp
  4007e3:	48 8d 2d 2e 06 20 00 	lea    0x20062e(%rip),%rbp        # 600e18 <__do_global_dtors_aux_fini_array_entry>
  4007ea:	53                   	push   %rbx
  4007eb:	49 89 f6             	mov    %rsi,%r14
  4007ee:	49 89 d5             	mov    %rdx,%r13
  4007f1:	4c 29 e5             	sub    %r12,%rbp
  4007f4:	48 83 ec 08          	sub    $0x8,%rsp
  4007f8:	48 c1 fd 03          	sar    $0x3,%rbp
  4007fc:	e8 47 fd ff ff       	callq  400548 <_init>
  400801:	48 85 ed             	test   %rbp,%rbp
  400804:	74 20                	je     400826 <__libc_csu_init+0x56>
  400806:	31 db                	xor    %ebx,%ebx
  400808:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40080f:	00 
  400810:	4c 89 ea             	mov    %r13,%rdx
  400813:	4c 89 f6             	mov    %r14,%rsi
  400816:	44 89 ff             	mov    %r15d,%edi
  400819:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40081d:	48 83 c3 01          	add    $0x1,%rbx
  400821:	48 39 eb             	cmp    %rbp,%rbx
  400824:	75 ea                	jne    400810 <__libc_csu_init+0x40>
  400826:	48 83 c4 08          	add    $0x8,%rsp
  40082a:	5b                   	pop    %rbx
  40082b:	5d                   	pop    %rbp
  40082c:	41 5c                	pop    %r12
  40082e:	41 5d                	pop    %r13
  400830:	41 5e                	pop    %r14
  400832:	41 5f                	pop    %r15
  400834:	c3                   	retq   
  400835:	90                   	nop
  400836:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40083d:	00 00 00 

0000000000400840 <__libc_csu_fini>:
  400840:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000400844 <_fini>:
  400844:	48 83 ec 08          	sub    $0x8,%rsp
  400848:	48 83 c4 08          	add    $0x8,%rsp
  40084c:	c3                   	retq   
