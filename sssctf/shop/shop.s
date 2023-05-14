
shop：     文件格式 elf64-x86-64


Disassembly of section .init:

0000000000400768 <_init>:
  400768:	48 83 ec 08          	sub    $0x8,%rsp
  40076c:	48 8b 05 85 18 20 00 	mov    0x201885(%rip),%rax        # 601ff8 <__gmon_start__>
  400773:	48 85 c0             	test   %rax,%rax
  400776:	74 05                	je     40077d <_init+0x15>
  400778:	e8 e3 00 00 00       	callq  400860 <__gmon_start__@plt>
  40077d:	48 83 c4 08          	add    $0x8,%rsp
  400781:	c3                   	retq   

Disassembly of section .plt:

0000000000400790 <.plt>:
  400790:	ff 35 72 18 20 00    	pushq  0x201872(%rip)        # 602008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400796:	ff 25 74 18 20 00    	jmpq   *0x201874(%rip)        # 602010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40079c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004007a0 <pthread_create@plt>:
  4007a0:	ff 25 72 18 20 00    	jmpq   *0x201872(%rip)        # 602018 <pthread_create@GLIBC_2.2.5>
  4007a6:	68 00 00 00 00       	pushq  $0x0
  4007ab:	e9 e0 ff ff ff       	jmpq   400790 <.plt>

00000000004007b0 <puts@plt>:
  4007b0:	ff 25 6a 18 20 00    	jmpq   *0x20186a(%rip)        # 602020 <puts@GLIBC_2.2.5>
  4007b6:	68 01 00 00 00       	pushq  $0x1
  4007bb:	e9 d0 ff ff ff       	jmpq   400790 <.plt>

00000000004007c0 <__stack_chk_fail@plt>:
  4007c0:	ff 25 62 18 20 00    	jmpq   *0x201862(%rip)        # 602028 <__stack_chk_fail@GLIBC_2.4>
  4007c6:	68 02 00 00 00       	pushq  $0x2
  4007cb:	e9 c0 ff ff ff       	jmpq   400790 <.plt>

00000000004007d0 <setbuf@plt>:
  4007d0:	ff 25 5a 18 20 00    	jmpq   *0x20185a(%rip)        # 602030 <setbuf@GLIBC_2.2.5>
  4007d6:	68 03 00 00 00       	pushq  $0x3
  4007db:	e9 b0 ff ff ff       	jmpq   400790 <.plt>

00000000004007e0 <printf@plt>:
  4007e0:	ff 25 52 18 20 00    	jmpq   *0x201852(%rip)        # 602038 <printf@GLIBC_2.2.5>
  4007e6:	68 04 00 00 00       	pushq  $0x4
  4007eb:	e9 a0 ff ff ff       	jmpq   400790 <.plt>

00000000004007f0 <close@plt>:
  4007f0:	ff 25 4a 18 20 00    	jmpq   *0x20184a(%rip)        # 602040 <close@GLIBC_2.2.5>
  4007f6:	68 05 00 00 00       	pushq  $0x5
  4007fb:	e9 90 ff ff ff       	jmpq   400790 <.plt>

0000000000400800 <read@plt>:
  400800:	ff 25 42 18 20 00    	jmpq   *0x201842(%rip)        # 602048 <read@GLIBC_2.2.5>
  400806:	68 06 00 00 00       	pushq  $0x6
  40080b:	e9 80 ff ff ff       	jmpq   400790 <.plt>

0000000000400810 <__libc_start_main@plt>:
  400810:	ff 25 3a 18 20 00    	jmpq   *0x20183a(%rip)        # 602050 <__libc_start_main@GLIBC_2.2.5>
  400816:	68 07 00 00 00       	pushq  $0x7
  40081b:	e9 70 ff ff ff       	jmpq   400790 <.plt>

0000000000400820 <open@plt>:
  400820:	ff 25 32 18 20 00    	jmpq   *0x201832(%rip)        # 602058 <open@GLIBC_2.2.5>
  400826:	68 08 00 00 00       	pushq  $0x8
  40082b:	e9 60 ff ff ff       	jmpq   400790 <.plt>

0000000000400830 <atoi@plt>:
  400830:	ff 25 2a 18 20 00    	jmpq   *0x20182a(%rip)        # 602060 <atoi@GLIBC_2.2.5>
  400836:	68 09 00 00 00       	pushq  $0x9
  40083b:	e9 50 ff ff ff       	jmpq   400790 <.plt>

0000000000400840 <exit@plt>:
  400840:	ff 25 22 18 20 00    	jmpq   *0x201822(%rip)        # 602068 <exit@GLIBC_2.2.5>
  400846:	68 0a 00 00 00       	pushq  $0xa
  40084b:	e9 40 ff ff ff       	jmpq   400790 <.plt>

0000000000400850 <usleep@plt>:
  400850:	ff 25 1a 18 20 00    	jmpq   *0x20181a(%rip)        # 602070 <usleep@GLIBC_2.2.5>
  400856:	68 0b 00 00 00       	pushq  $0xb
  40085b:	e9 30 ff ff ff       	jmpq   400790 <.plt>

Disassembly of section .plt.got:

0000000000400860 <__gmon_start__@plt>:
  400860:	ff 25 92 17 20 00    	jmpq   *0x201792(%rip)        # 601ff8 <__gmon_start__>
  400866:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000400870 <_start>:
  400870:	31 ed                	xor    %ebp,%ebp
  400872:	49 89 d1             	mov    %rdx,%r9
  400875:	5e                   	pop    %rsi
  400876:	48 89 e2             	mov    %rsp,%rdx
  400879:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40087d:	50                   	push   %rax
  40087e:	54                   	push   %rsp
  40087f:	49 c7 c0 60 10 40 00 	mov    $0x401060,%r8
  400886:	48 c7 c1 f0 0f 40 00 	mov    $0x400ff0,%rcx
  40088d:	48 c7 c7 cf 0f 40 00 	mov    $0x400fcf,%rdi
  400894:	e8 77 ff ff ff       	callq  400810 <__libc_start_main@plt>
  400899:	f4                   	hlt    
  40089a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004008a0 <deregister_tm_clones>:
  4008a0:	b8 07 21 60 00       	mov    $0x602107,%eax
  4008a5:	55                   	push   %rbp
  4008a6:	48 2d 00 21 60 00    	sub    $0x602100,%rax
  4008ac:	48 83 f8 0e          	cmp    $0xe,%rax
  4008b0:	48 89 e5             	mov    %rsp,%rbp
  4008b3:	76 1b                	jbe    4008d0 <deregister_tm_clones+0x30>
  4008b5:	b8 00 00 00 00       	mov    $0x0,%eax
  4008ba:	48 85 c0             	test   %rax,%rax
  4008bd:	74 11                	je     4008d0 <deregister_tm_clones+0x30>
  4008bf:	5d                   	pop    %rbp
  4008c0:	bf 00 21 60 00       	mov    $0x602100,%edi
  4008c5:	ff e0                	jmpq   *%rax
  4008c7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  4008ce:	00 00 
  4008d0:	5d                   	pop    %rbp
  4008d1:	c3                   	retq   
  4008d2:	0f 1f 40 00          	nopl   0x0(%rax)
  4008d6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4008dd:	00 00 00 

00000000004008e0 <register_tm_clones>:
  4008e0:	be 00 21 60 00       	mov    $0x602100,%esi
  4008e5:	55                   	push   %rbp
  4008e6:	48 81 ee 00 21 60 00 	sub    $0x602100,%rsi
  4008ed:	48 c1 fe 03          	sar    $0x3,%rsi
  4008f1:	48 89 e5             	mov    %rsp,%rbp
  4008f4:	48 89 f0             	mov    %rsi,%rax
  4008f7:	48 c1 e8 3f          	shr    $0x3f,%rax
  4008fb:	48 01 c6             	add    %rax,%rsi
  4008fe:	48 d1 fe             	sar    %rsi
  400901:	74 15                	je     400918 <register_tm_clones+0x38>
  400903:	b8 00 00 00 00       	mov    $0x0,%eax
  400908:	48 85 c0             	test   %rax,%rax
  40090b:	74 0b                	je     400918 <register_tm_clones+0x38>
  40090d:	5d                   	pop    %rbp
  40090e:	bf 00 21 60 00       	mov    $0x602100,%edi
  400913:	ff e0                	jmpq   *%rax
  400915:	0f 1f 00             	nopl   (%rax)
  400918:	5d                   	pop    %rbp
  400919:	c3                   	retq   
  40091a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400920 <__do_global_dtors_aux>:
  400920:	80 3d f1 17 20 00 00 	cmpb   $0x0,0x2017f1(%rip)        # 602118 <completed.7594>
  400927:	75 11                	jne    40093a <__do_global_dtors_aux+0x1a>
  400929:	55                   	push   %rbp
  40092a:	48 89 e5             	mov    %rsp,%rbp
  40092d:	e8 6e ff ff ff       	callq  4008a0 <deregister_tm_clones>
  400932:	5d                   	pop    %rbp
  400933:	c6 05 de 17 20 00 01 	movb   $0x1,0x2017de(%rip)        # 602118 <completed.7594>
  40093a:	f3 c3                	repz retq 
  40093c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400940 <frame_dummy>:
  400940:	bf 10 1e 60 00       	mov    $0x601e10,%edi
  400945:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  400949:	75 05                	jne    400950 <frame_dummy+0x10>
  40094b:	eb 93                	jmp    4008e0 <register_tm_clones>
  40094d:	0f 1f 00             	nopl   (%rax)
  400950:	b8 00 00 00 00       	mov    $0x0,%eax
  400955:	48 85 c0             	test   %rax,%rax
  400958:	74 f1                	je     40094b <frame_dummy+0xb>
  40095a:	55                   	push   %rbp
  40095b:	48 89 e5             	mov    %rsp,%rbp
  40095e:	ff d0                	callq  *%rax
  400960:	5d                   	pop    %rbp
  400961:	e9 7a ff ff ff       	jmpq   4008e0 <register_tm_clones>

0000000000400966 <read_n>:
  400966:	55                   	push   %rbp
  400967:	48 89 e5             	mov    %rsp,%rbp
  40096a:	48 83 ec 20          	sub    $0x20,%rsp
  40096e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  400972:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  400975:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  40097c:	eb 66                	jmp    4009e4 <read_n+0x7e>
  40097e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  400981:	48 63 d0             	movslq %eax,%rdx
  400984:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  400988:	48 01 d0             	add    %rdx,%rax
  40098b:	ba 01 00 00 00       	mov    $0x1,%edx
  400990:	48 89 c6             	mov    %rax,%rsi
  400993:	bf 00 00 00 00       	mov    $0x0,%edi
  400998:	e8 63 fe ff ff       	callq  400800 <read@plt>
  40099d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  4009a0:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
  4009a4:	74 14                	je     4009ba <read_n+0x54>
  4009a6:	bf 78 10 40 00       	mov    $0x401078,%edi
  4009ab:	e8 00 fe ff ff       	callq  4007b0 <puts@plt>
  4009b0:	bf 00 00 00 00       	mov    $0x0,%edi
  4009b5:	e8 86 fe ff ff       	callq  400840 <exit@plt>
  4009ba:	8b 45 f8             	mov    -0x8(%rbp),%eax
  4009bd:	48 63 d0             	movslq %eax,%rdx
  4009c0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4009c4:	48 01 d0             	add    %rdx,%rax
  4009c7:	0f b6 00             	movzbl (%rax),%eax
  4009ca:	3c 0a                	cmp    $0xa,%al
  4009cc:	75 12                	jne    4009e0 <read_n+0x7a>
  4009ce:	8b 45 f8             	mov    -0x8(%rbp),%eax
  4009d1:	48 63 d0             	movslq %eax,%rdx
  4009d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4009d8:	48 01 d0             	add    %rdx,%rax
  4009db:	c6 00 00             	movb   $0x0,(%rax)
  4009de:	eb 0f                	jmp    4009ef <read_n+0x89>
  4009e0:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
  4009e4:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  4009e7:	83 e8 01             	sub    $0x1,%eax
  4009ea:	3b 45 f8             	cmp    -0x8(%rbp),%eax
  4009ed:	7f 8f                	jg     40097e <read_n+0x18>
  4009ef:	8b 45 f8             	mov    -0x8(%rbp),%eax
  4009f2:	48 98                	cltq   
  4009f4:	48 8d 50 01          	lea    0x1(%rax),%rdx
  4009f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4009fc:	48 01 d0             	add    %rdx,%rax
  4009ff:	c6 00 00             	movb   $0x0,(%rax)
  400a02:	8b 45 f8             	mov    -0x8(%rbp),%eax
  400a05:	c9                   	leaveq 
  400a06:	c3                   	retq   

0000000000400a07 <read_int>:
  400a07:	55                   	push   %rbp
  400a08:	48 89 e5             	mov    %rsp,%rbp
  400a0b:	48 83 ec 20          	sub    $0x20,%rsp
  400a0f:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  400a16:	00 00 
  400a18:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  400a1c:	31 c0                	xor    %eax,%eax
  400a1e:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  400a22:	be 10 00 00 00       	mov    $0x10,%esi
  400a27:	48 89 c7             	mov    %rax,%rdi
  400a2a:	e8 37 ff ff ff       	callq  400966 <read_n>
  400a2f:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  400a33:	48 89 c7             	mov    %rax,%rdi
  400a36:	e8 f5 fd ff ff       	callq  400830 <atoi@plt>
  400a3b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  400a3f:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
  400a46:	00 00 
  400a48:	74 05                	je     400a4f <read_int+0x48>
  400a4a:	e8 71 fd ff ff       	callq  4007c0 <__stack_chk_fail@plt>
  400a4f:	c9                   	leaveq 
  400a50:	c3                   	retq   

0000000000400a51 <init>:
  400a51:	55                   	push   %rbp
  400a52:	48 89 e5             	mov    %rsp,%rbp
  400a55:	48 83 ec 10          	sub    $0x10,%rsp
  400a59:	be 00 00 00 00       	mov    $0x0,%esi
  400a5e:	bf 84 10 40 00       	mov    $0x401084,%edi
  400a63:	b8 00 00 00 00       	mov    $0x0,%eax
  400a68:	e8 b3 fd ff ff       	callq  400820 <open@plt>
  400a6d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  400a70:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400a73:	ba 30 00 00 00       	mov    $0x30,%edx
  400a78:	be a0 22 60 00       	mov    $0x6022a0,%esi
  400a7d:	89 c7                	mov    %eax,%edi
  400a7f:	e8 7c fd ff ff       	callq  400800 <read@plt>
  400a84:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400a87:	89 c7                	mov    %eax,%edi
  400a89:	e8 62 fd ff ff       	callq  4007f0 <close@plt>
  400a8e:	48 8b 05 6b 16 20 00 	mov    0x20166b(%rip),%rax        # 602100 <stdout@@GLIBC_2.2.5>
  400a95:	be 00 00 00 00       	mov    $0x0,%esi
  400a9a:	48 89 c7             	mov    %rax,%rdi
  400a9d:	e8 2e fd ff ff       	callq  4007d0 <setbuf@plt>
  400aa2:	48 8b 05 67 16 20 00 	mov    0x201667(%rip),%rax        # 602110 <stdin@@GLIBC_2.2.5>
  400aa9:	be 00 00 00 00       	mov    $0x0,%esi
  400aae:	48 89 c7             	mov    %rax,%rdi
  400ab1:	e8 1a fd ff ff       	callq  4007d0 <setbuf@plt>
  400ab6:	c7 05 78 16 20 00 66 	movl   $0x67616c66,0x201678(%rip)        # 602138 <gd+0x18>
  400abd:	6c 61 67 
  400ac0:	c6 05 75 16 20 00 00 	movb   $0x0,0x201675(%rip)        # 60213c <gd+0x1c>
  400ac7:	c7 05 7f 16 20 00 70 	movl   $0x6e6570,0x20167f(%rip)        # 602150 <gd+0x30>
  400ace:	65 6e 00 
  400ad1:	c7 05 8d 16 20 00 77 	movl   $0x68736977,0x20168d(%rip)        # 602168 <gd+0x48>
  400ad8:	69 73 68 
  400adb:	c6 05 8a 16 20 00 00 	movb   $0x0,0x20168a(%rip)        # 60216c <gd+0x4c>
  400ae2:	c7 05 5c 16 20 00 c8 	movl   $0xc8,0x20165c(%rip)        # 602148 <gd+0x28>
  400ae9:	00 00 00 
  400aec:	c7 05 6a 16 20 00 64 	movl   $0x64,0x20166a(%rip)        # 602160 <gd+0x40>
  400af3:	00 00 00 
  400af6:	c7 05 78 16 20 00 32 	movl   $0x32,0x201678(%rip)        # 602178 <gd+0x58>
  400afd:	00 00 00 
  400b00:	c7 05 42 16 20 00 64 	movl   $0x64,0x201642(%rip)        # 60214c <gd+0x2c>
  400b07:	00 00 00 
  400b0a:	c7 05 50 16 20 00 63 	movl   $0x63,0x201650(%rip)        # 602164 <gd+0x44>
  400b11:	00 00 00 
  400b14:	c7 05 5e 16 20 00 00 	movl   $0x0,0x20165e(%rip)        # 60217c <gd+0x5c>
  400b1b:	00 00 00 
  400b1e:	90                   	nop
  400b1f:	c9                   	leaveq 
  400b20:	c3                   	retq   

0000000000400b21 <look>:
  400b21:	55                   	push   %rbp
  400b22:	48 89 e5             	mov    %rsp,%rbp
  400b25:	48 83 ec 10          	sub    $0x10,%rsp
  400b29:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  400b30:	e9 a2 00 00 00       	jmpq   400bd7 <look+0xb6>
  400b35:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400b38:	48 98                	cltq   
  400b3a:	8b 04 85 c0 20 60 00 	mov    0x6020c0(,%rax,4),%eax
  400b41:	83 f8 01             	cmp    $0x1,%eax
  400b44:	74 17                	je     400b5d <look+0x3c>
  400b46:	83 f8 01             	cmp    $0x1,%eax
  400b49:	7f 06                	jg     400b51 <look+0x30>
  400b4b:	85 c0                	test   %eax,%eax
  400b4d:	74 55                	je     400ba4 <look+0x83>
  400b4f:	eb 69                	jmp    400bba <look+0x99>
  400b51:	83 f8 02             	cmp    $0x2,%eax
  400b54:	74 22                	je     400b78 <look+0x57>
  400b56:	83 f8 03             	cmp    $0x3,%eax
  400b59:	74 33                	je     400b8e <look+0x6d>
  400b5b:	eb 5d                	jmp    400bba <look+0x99>
  400b5d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400b60:	ba a0 22 60 00       	mov    $0x6022a0,%edx
  400b65:	89 c6                	mov    %eax,%esi
  400b67:	bf 8a 10 40 00       	mov    $0x40108a,%edi
  400b6c:	b8 00 00 00 00       	mov    $0x0,%eax
  400b71:	e8 6a fc ff ff       	callq  4007e0 <printf@plt>
  400b76:	eb 5b                	jmp    400bd3 <look+0xb2>
  400b78:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400b7b:	89 c6                	mov    %eax,%esi
  400b7d:	bf 9e 10 40 00       	mov    $0x40109e,%edi
  400b82:	b8 00 00 00 00       	mov    $0x0,%eax
  400b87:	e8 54 fc ff ff       	callq  4007e0 <printf@plt>
  400b8c:	eb 45                	jmp    400bd3 <look+0xb2>
  400b8e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400b91:	89 c6                	mov    %eax,%esi
  400b93:	bf ab 10 40 00       	mov    $0x4010ab,%edi
  400b98:	b8 00 00 00 00       	mov    $0x0,%eax
  400b9d:	e8 3e fc ff ff       	callq  4007e0 <printf@plt>
  400ba2:	eb 2f                	jmp    400bd3 <look+0xb2>
  400ba4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400ba7:	89 c6                	mov    %eax,%esi
  400ba9:	bf b9 10 40 00       	mov    $0x4010b9,%edi
  400bae:	b8 00 00 00 00       	mov    $0x0,%eax
  400bb3:	e8 28 fc ff ff       	callq  4007e0 <printf@plt>
  400bb8:	eb 19                	jmp    400bd3 <look+0xb2>
  400bba:	bf c7 10 40 00       	mov    $0x4010c7,%edi
  400bbf:	b8 00 00 00 00       	mov    $0x0,%eax
  400bc4:	e8 17 fc ff ff       	callq  4007e0 <printf@plt>
  400bc9:	bf 00 00 00 00       	mov    $0x0,%edi
  400bce:	e8 6d fc ff ff       	callq  400840 <exit@plt>
  400bd3:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  400bd7:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
  400bdb:	0f 8e 54 ff ff ff    	jle    400b35 <look+0x14>
  400be1:	8b 05 b9 14 20 00    	mov    0x2014b9(%rip),%eax        # 6020a0 <money>
  400be7:	89 c6                	mov    %eax,%esi
  400be9:	bf cf 10 40 00       	mov    $0x4010cf,%edi
  400bee:	b8 00 00 00 00       	mov    $0x0,%eax
  400bf3:	e8 e8 fb ff ff       	callq  4007e0 <printf@plt>
  400bf8:	90                   	nop
  400bf9:	c9                   	leaveq 
  400bfa:	c3                   	retq   

0000000000400bfb <to_buy>:
  400bfb:	55                   	push   %rbp
  400bfc:	48 89 e5             	mov    %rsp,%rbp
  400bff:	89 7d ec             	mov    %edi,-0x14(%rbp)
  400c02:	8b 0d 98 14 20 00    	mov    0x201498(%rip),%ecx        # 6020a0 <money>
  400c08:	8b 45 ec             	mov    -0x14(%rbp),%eax
  400c0b:	48 63 d0             	movslq %eax,%rdx
  400c0e:	48 89 d0             	mov    %rdx,%rax
  400c11:	48 01 c0             	add    %rax,%rax
  400c14:	48 01 d0             	add    %rdx,%rax
  400c17:	48 c1 e0 03          	shl    $0x3,%rax
  400c1b:	48 05 30 21 60 00    	add    $0x602130,%rax
  400c21:	8b 00                	mov    (%rax),%eax
  400c23:	29 c1                	sub    %eax,%ecx
  400c25:	89 c8                	mov    %ecx,%eax
  400c27:	89 05 73 14 20 00    	mov    %eax,0x201473(%rip)        # 6020a0 <money>
  400c2d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  400c34:	eb 25                	jmp    400c5b <to_buy+0x60>
  400c36:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400c39:	48 98                	cltq   
  400c3b:	8b 04 85 c0 20 60 00 	mov    0x6020c0(,%rax,4),%eax
  400c42:	85 c0                	test   %eax,%eax
  400c44:	75 11                	jne    400c57 <to_buy+0x5c>
  400c46:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400c49:	48 98                	cltq   
  400c4b:	8b 55 ec             	mov    -0x14(%rbp),%edx
  400c4e:	89 14 85 c0 20 60 00 	mov    %edx,0x6020c0(,%rax,4)
  400c55:	eb 0a                	jmp    400c61 <to_buy+0x66>
  400c57:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  400c5b:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
  400c5f:	7e d5                	jle    400c36 <to_buy+0x3b>
  400c61:	90                   	nop
  400c62:	5d                   	pop    %rbp
  400c63:	c3                   	retq   

0000000000400c64 <buy>:
  400c64:	55                   	push   %rbp
  400c65:	48 89 e5             	mov    %rsp,%rbp
  400c68:	48 83 ec 20          	sub    $0x20,%rsp
  400c6c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  400c73:	00 00 
  400c75:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  400c79:	31 c0                	xor    %eax,%eax
  400c7b:	bf df 10 40 00       	mov    $0x4010df,%edi
  400c80:	b8 00 00 00 00       	mov    $0x0,%eax
  400c85:	e8 56 fb ff ff       	callq  4007e0 <printf@plt>
  400c8a:	b8 00 00 00 00       	mov    $0x0,%eax
  400c8f:	e8 73 fd ff ff       	callq  400a07 <read_int>
  400c94:	89 45 ec             	mov    %eax,-0x14(%rbp)
  400c97:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
  400c9b:	74 10                	je     400cad <buy+0x49>
  400c9d:	83 7d ec 02          	cmpl   $0x2,-0x14(%rbp)
  400ca1:	74 0a                	je     400cad <buy+0x49>
  400ca3:	83 7d ec 03          	cmpl   $0x3,-0x14(%rbp)
  400ca7:	0f 85 9b 00 00 00    	jne    400d48 <buy+0xe4>
  400cad:	8b 45 ec             	mov    -0x14(%rbp),%eax
  400cb0:	48 63 d0             	movslq %eax,%rdx
  400cb3:	48 89 d0             	mov    %rdx,%rax
  400cb6:	48 01 c0             	add    %rax,%rax
  400cb9:	48 01 d0             	add    %rdx,%rax
  400cbc:	48 c1 e0 03          	shl    $0x3,%rax
  400cc0:	48 05 30 21 60 00    	add    $0x602130,%rax
  400cc6:	8b 10                	mov    (%rax),%edx
  400cc8:	8b 05 d2 13 20 00    	mov    0x2013d2(%rip),%eax        # 6020a0 <money>
  400cce:	39 c2                	cmp    %eax,%edx
  400cd0:	7e 0c                	jle    400cde <buy+0x7a>
  400cd2:	bf ed 10 40 00       	mov    $0x4010ed,%edi
  400cd7:	e8 d4 fa ff ff       	callq  4007b0 <puts@plt>
  400cdc:	eb 6b                	jmp    400d49 <buy+0xe5>
  400cde:	83 7d ec 03          	cmpl   $0x3,-0x14(%rbp)
  400ce2:	75 37                	jne    400d1b <buy+0xb7>
  400ce4:	8b 0d b6 13 20 00    	mov    0x2013b6(%rip),%ecx        # 6020a0 <money>
  400cea:	8b 45 ec             	mov    -0x14(%rbp),%eax
  400ced:	48 63 d0             	movslq %eax,%rdx
  400cf0:	48 89 d0             	mov    %rdx,%rax
  400cf3:	48 01 c0             	add    %rax,%rax
  400cf6:	48 01 d0             	add    %rdx,%rax
  400cf9:	48 c1 e0 03          	shl    $0x3,%rax
  400cfd:	48 05 30 21 60 00    	add    $0x602130,%rax
  400d03:	8b 00                	mov    (%rax),%eax
  400d05:	29 c1                	sub    %eax,%ecx
  400d07:	89 c8                	mov    %ecx,%eax
  400d09:	89 05 91 13 20 00    	mov    %eax,0x201391(%rip)        # 6020a0 <money>
  400d0f:	bf fb 10 40 00       	mov    $0x4010fb,%edi
  400d14:	e8 97 fa ff ff       	callq  4007b0 <puts@plt>
  400d19:	eb 2e                	jmp    400d49 <buy+0xe5>
  400d1b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  400d1e:	48 98                	cltq   
  400d20:	48 89 c2             	mov    %rax,%rdx
  400d23:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  400d27:	48 89 d1             	mov    %rdx,%rcx
  400d2a:	ba fb 0b 40 00       	mov    $0x400bfb,%edx
  400d2f:	be 00 00 00 00       	mov    $0x0,%esi
  400d34:	48 89 c7             	mov    %rax,%rdi
  400d37:	e8 64 fa ff ff       	callq  4007a0 <pthread_create@plt>
  400d3c:	bf 09 11 40 00       	mov    $0x401109,%edi
  400d41:	e8 6a fa ff ff       	callq  4007b0 <puts@plt>
  400d46:	eb 01                	jmp    400d49 <buy+0xe5>
  400d48:	90                   	nop
  400d49:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400d4d:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  400d54:	00 00 
  400d56:	74 05                	je     400d5d <buy+0xf9>
  400d58:	e8 63 fa ff ff       	callq  4007c0 <__stack_chk_fail@plt>
  400d5d:	c9                   	leaveq 
  400d5e:	c3                   	retq   

0000000000400d5f <to_sale>:
  400d5f:	55                   	push   %rbp
  400d60:	48 89 e5             	mov    %rsp,%rbp
  400d63:	48 83 ec 10          	sub    $0x10,%rsp
  400d67:	89 7d fc             	mov    %edi,-0x4(%rbp)
  400d6a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400d6d:	48 98                	cltq   
  400d6f:	8b 04 85 c0 20 60 00 	mov    0x6020c0(,%rax,4),%eax
  400d76:	83 f8 01             	cmp    $0x1,%eax
  400d79:	74 07                	je     400d82 <to_sale+0x23>
  400d7b:	83 f8 02             	cmp    $0x2,%eax
  400d7e:	74 18                	je     400d98 <to_sale+0x39>
  400d80:	eb 2c                	jmp    400dae <to_sale+0x4f>
  400d82:	8b 15 c4 13 20 00    	mov    0x2013c4(%rip),%edx        # 60214c <gd+0x2c>
  400d88:	8b 05 12 13 20 00    	mov    0x201312(%rip),%eax        # 6020a0 <money>
  400d8e:	01 d0                	add    %edx,%eax
  400d90:	89 05 0a 13 20 00    	mov    %eax,0x20130a(%rip)        # 6020a0 <money>
  400d96:	eb 2f                	jmp    400dc7 <to_sale+0x68>
  400d98:	8b 15 c6 13 20 00    	mov    0x2013c6(%rip),%edx        # 602164 <gd+0x44>
  400d9e:	8b 05 fc 12 20 00    	mov    0x2012fc(%rip),%eax        # 6020a0 <money>
  400da4:	01 d0                	add    %edx,%eax
  400da6:	89 05 f4 12 20 00    	mov    %eax,0x2012f4(%rip)        # 6020a0 <money>
  400dac:	eb 19                	jmp    400dc7 <to_sale+0x68>
  400dae:	bf c7 10 40 00       	mov    $0x4010c7,%edi
  400db3:	b8 00 00 00 00       	mov    $0x0,%eax
  400db8:	e8 23 fa ff ff       	callq  4007e0 <printf@plt>
  400dbd:	bf 00 00 00 00       	mov    $0x0,%edi
  400dc2:	e8 79 fa ff ff       	callq  400840 <exit@plt>
  400dc7:	bf 50 c3 00 00       	mov    $0xc350,%edi
  400dcc:	e8 7f fa ff ff       	callq  400850 <usleep@plt>
  400dd1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400dd4:	48 98                	cltq   
  400dd6:	c7 04 85 c0 20 60 00 	movl   $0x0,0x6020c0(,%rax,4)
  400ddd:	00 00 00 00 
  400de1:	90                   	nop
  400de2:	c9                   	leaveq 
  400de3:	c3                   	retq   

0000000000400de4 <sale>:
  400de4:	55                   	push   %rbp
  400de5:	48 89 e5             	mov    %rsp,%rbp
  400de8:	48 83 ec 20          	sub    $0x20,%rsp
  400dec:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  400df3:	00 00 
  400df5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  400df9:	31 c0                	xor    %eax,%eax
  400dfb:	bf df 10 40 00       	mov    $0x4010df,%edi
  400e00:	b8 00 00 00 00       	mov    $0x0,%eax
  400e05:	e8 d6 f9 ff ff       	callq  4007e0 <printf@plt>
  400e0a:	b8 00 00 00 00       	mov    $0x0,%eax
  400e0f:	e8 f3 fb ff ff       	callq  400a07 <read_int>
  400e14:	89 45 ec             	mov    %eax,-0x14(%rbp)
  400e17:	8b 45 ec             	mov    -0x14(%rbp),%eax
  400e1a:	48 98                	cltq   
  400e1c:	8b 04 85 c0 20 60 00 	mov    0x6020c0(,%rax,4),%eax
  400e23:	85 c0                	test   %eax,%eax
  400e25:	75 0c                	jne    400e33 <sale+0x4f>
  400e27:	bf 27 11 40 00       	mov    $0x401127,%edi
  400e2c:	e8 7f f9 ff ff       	callq  4007b0 <puts@plt>
  400e31:	eb 2b                	jmp    400e5e <sale+0x7a>
  400e33:	8b 45 ec             	mov    -0x14(%rbp),%eax
  400e36:	48 98                	cltq   
  400e38:	48 89 c2             	mov    %rax,%rdx
  400e3b:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  400e3f:	48 89 d1             	mov    %rdx,%rcx
  400e42:	ba 5f 0d 40 00       	mov    $0x400d5f,%edx
  400e47:	be 00 00 00 00       	mov    $0x0,%esi
  400e4c:	48 89 c7             	mov    %rax,%rdi
  400e4f:	e8 4c f9 ff ff       	callq  4007a0 <pthread_create@plt>
  400e54:	bf 37 11 40 00       	mov    $0x401137,%edi
  400e59:	e8 52 f9 ff ff       	callq  4007b0 <puts@plt>
  400e5e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400e62:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  400e69:	00 00 
  400e6b:	74 05                	je     400e72 <sale+0x8e>
  400e6d:	e8 4e f9 ff ff       	callq  4007c0 <__stack_chk_fail@plt>
  400e72:	c9                   	leaveq 
  400e73:	c3                   	retq   

0000000000400e74 <game>:
  400e74:	55                   	push   %rbp
  400e75:	48 89 e5             	mov    %rsp,%rbp
  400e78:	48 83 ec 10          	sub    $0x10,%rsp
  400e7c:	bf 44 11 40 00       	mov    $0x401144,%edi
  400e81:	e8 2a f9 ff ff       	callq  4007b0 <puts@plt>
  400e86:	bf 61 11 40 00       	mov    $0x401161,%edi
  400e8b:	e8 20 f9 ff ff       	callq  4007b0 <puts@plt>
  400e90:	bf 7f 11 40 00       	mov    $0x40117f,%edi
  400e95:	e8 16 f9 ff ff       	callq  4007b0 <puts@plt>
  400e9a:	bf 9d 11 40 00       	mov    $0x40119d,%edi
  400e9f:	e8 0c f9 ff ff       	callq  4007b0 <puts@plt>
  400ea4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  400eab:	e9 8d 00 00 00       	jmpq   400f3d <game+0xc9>
  400eb0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400eb3:	48 63 d0             	movslq %eax,%rdx
  400eb6:	48 89 d0             	mov    %rdx,%rax
  400eb9:	48 01 c0             	add    %rax,%rax
  400ebc:	48 01 d0             	add    %rdx,%rax
  400ebf:	48 c1 e0 03          	shl    $0x3,%rax
  400ec3:	48 05 30 21 60 00    	add    $0x602130,%rax
  400ec9:	8b 00                	mov    (%rax),%eax
  400ecb:	85 c0                	test   %eax,%eax
  400ecd:	74 69                	je     400f38 <game+0xc4>
  400ecf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400ed2:	48 63 d0             	movslq %eax,%rdx
  400ed5:	48 89 d0             	mov    %rdx,%rax
  400ed8:	48 01 c0             	add    %rax,%rax
  400edb:	48 01 d0             	add    %rdx,%rax
  400ede:	48 c1 e0 03          	shl    $0x3,%rax
  400ee2:	48 05 34 21 60 00    	add    $0x602134,%rax
  400ee8:	8b 30                	mov    (%rax),%esi
  400eea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400eed:	48 63 d0             	movslq %eax,%rdx
  400ef0:	48 89 d0             	mov    %rdx,%rax
  400ef3:	48 01 c0             	add    %rax,%rax
  400ef6:	48 01 d0             	add    %rdx,%rax
  400ef9:	48 c1 e0 03          	shl    $0x3,%rax
  400efd:	48 05 30 21 60 00    	add    $0x602130,%rax
  400f03:	8b 08                	mov    (%rax),%ecx
  400f05:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400f08:	48 63 d0             	movslq %eax,%rdx
  400f0b:	48 89 d0             	mov    %rdx,%rax
  400f0e:	48 01 c0             	add    %rax,%rax
  400f11:	48 01 d0             	add    %rdx,%rax
  400f14:	48 c1 e0 03          	shl    $0x3,%rax
  400f18:	48 8d 90 20 21 60 00 	lea    0x602120(%rax),%rdx
  400f1f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400f22:	41 89 f0             	mov    %esi,%r8d
  400f25:	89 c6                	mov    %eax,%esi
  400f27:	bf c0 11 40 00       	mov    $0x4011c0,%edi
  400f2c:	b8 00 00 00 00       	mov    $0x0,%eax
  400f31:	e8 aa f8 ff ff       	callq  4007e0 <printf@plt>
  400f36:	eb 01                	jmp    400f39 <game+0xc5>
  400f38:	90                   	nop
  400f39:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  400f3d:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
  400f41:	0f 8e 69 ff ff ff    	jle    400eb0 <game+0x3c>
  400f47:	bf 61 11 40 00       	mov    $0x401161,%edi
  400f4c:	e8 5f f8 ff ff       	callq  4007b0 <puts@plt>
  400f51:	bf e0 11 40 00       	mov    $0x4011e0,%edi
  400f56:	e8 55 f8 ff ff       	callq  4007b0 <puts@plt>
  400f5b:	bf 08 12 40 00       	mov    $0x401208,%edi
  400f60:	b8 00 00 00 00       	mov    $0x0,%eax
  400f65:	e8 76 f8 ff ff       	callq  4007e0 <printf@plt>
  400f6a:	b8 00 00 00 00       	mov    $0x0,%eax
  400f6f:	e8 93 fa ff ff       	callq  400a07 <read_int>
  400f74:	83 f8 02             	cmp    $0x2,%eax
  400f77:	74 24                	je     400f9d <game+0x129>
  400f79:	83 f8 02             	cmp    $0x2,%eax
  400f7c:	7f 07                	jg     400f85 <game+0x111>
  400f7e:	83 f8 01             	cmp    $0x1,%eax
  400f81:	74 0e                	je     400f91 <game+0x11d>
  400f83:	eb 3a                	jmp    400fbf <game+0x14b>
  400f85:	83 f8 03             	cmp    $0x3,%eax
  400f88:	74 1f                	je     400fa9 <game+0x135>
  400f8a:	83 f8 04             	cmp    $0x4,%eax
  400f8d:	74 26                	je     400fb5 <game+0x141>
  400f8f:	eb 2e                	jmp    400fbf <game+0x14b>
  400f91:	b8 00 00 00 00       	mov    $0x0,%eax
  400f96:	e8 86 fb ff ff       	callq  400b21 <look>
  400f9b:	eb 2d                	jmp    400fca <game+0x156>
  400f9d:	b8 00 00 00 00       	mov    $0x0,%eax
  400fa2:	e8 bd fc ff ff       	callq  400c64 <buy>
  400fa7:	eb 21                	jmp    400fca <game+0x156>
  400fa9:	b8 00 00 00 00       	mov    $0x0,%eax
  400fae:	e8 31 fe ff ff       	callq  400de4 <sale>
  400fb3:	eb 15                	jmp    400fca <game+0x156>
  400fb5:	bf 00 00 00 00       	mov    $0x0,%edi
  400fba:	e8 81 f8 ff ff       	callq  400840 <exit@plt>
  400fbf:	bf 0b 12 40 00       	mov    $0x40120b,%edi
  400fc4:	e8 e7 f7 ff ff       	callq  4007b0 <puts@plt>
  400fc9:	90                   	nop
  400fca:	e9 ad fe ff ff       	jmpq   400e7c <game+0x8>

0000000000400fcf <main>:
  400fcf:	55                   	push   %rbp
  400fd0:	48 89 e5             	mov    %rsp,%rbp
  400fd3:	b8 00 00 00 00       	mov    $0x0,%eax
  400fd8:	e8 74 fa ff ff       	callq  400a51 <init>
  400fdd:	b8 00 00 00 00       	mov    $0x0,%eax
  400fe2:	e8 8d fe ff ff       	callq  400e74 <game>
  400fe7:	b8 00 00 00 00       	mov    $0x0,%eax
  400fec:	5d                   	pop    %rbp
  400fed:	c3                   	retq   
  400fee:	66 90                	xchg   %ax,%ax

0000000000400ff0 <__libc_csu_init>:
  400ff0:	41 57                	push   %r15
  400ff2:	41 56                	push   %r14
  400ff4:	41 89 ff             	mov    %edi,%r15d
  400ff7:	41 55                	push   %r13
  400ff9:	41 54                	push   %r12
  400ffb:	4c 8d 25 fe 0d 20 00 	lea    0x200dfe(%rip),%r12        # 601e00 <__frame_dummy_init_array_entry>
  401002:	55                   	push   %rbp
  401003:	48 8d 2d fe 0d 20 00 	lea    0x200dfe(%rip),%rbp        # 601e08 <__do_global_dtors_aux_fini_array_entry>
  40100a:	53                   	push   %rbx
  40100b:	49 89 f6             	mov    %rsi,%r14
  40100e:	49 89 d5             	mov    %rdx,%r13
  401011:	4c 29 e5             	sub    %r12,%rbp
  401014:	48 83 ec 08          	sub    $0x8,%rsp
  401018:	48 c1 fd 03          	sar    $0x3,%rbp
  40101c:	e8 47 f7 ff ff       	callq  400768 <_init>
  401021:	48 85 ed             	test   %rbp,%rbp
  401024:	74 20                	je     401046 <__libc_csu_init+0x56>
  401026:	31 db                	xor    %ebx,%ebx
  401028:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40102f:	00 
  401030:	4c 89 ea             	mov    %r13,%rdx
  401033:	4c 89 f6             	mov    %r14,%rsi
  401036:	44 89 ff             	mov    %r15d,%edi
  401039:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40103d:	48 83 c3 01          	add    $0x1,%rbx
  401041:	48 39 eb             	cmp    %rbp,%rbx
  401044:	75 ea                	jne    401030 <__libc_csu_init+0x40>
  401046:	48 83 c4 08          	add    $0x8,%rsp
  40104a:	5b                   	pop    %rbx
  40104b:	5d                   	pop    %rbp
  40104c:	41 5c                	pop    %r12
  40104e:	41 5d                	pop    %r13
  401050:	41 5e                	pop    %r14
  401052:	41 5f                	pop    %r15
  401054:	c3                   	retq   
  401055:	90                   	nop
  401056:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40105d:	00 00 00 

0000000000401060 <__libc_csu_fini>:
  401060:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000401064 <_fini>:
  401064:	48 83 ec 08          	sub    $0x8,%rsp
  401068:	48 83 c4 08          	add    $0x8,%rsp
  40106c:	c3                   	retq   
