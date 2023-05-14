
ciscn_2019_en_2：     文件格式 elf64-x86-64


Disassembly of section .init:

00000000004006a0 <_init>:
  4006a0:	48 83 ec 08          	sub    $0x8,%rsp
  4006a4:	48 8b 05 4d 19 20 00 	mov    0x20194d(%rip),%rax        # 601ff8 <__gmon_start__>
  4006ab:	48 85 c0             	test   %rax,%rax
  4006ae:	74 05                	je     4006b5 <_init+0x15>
  4006b0:	e8 cb 00 00 00       	callq  400780 <__gmon_start__@plt>
  4006b5:	48 83 c4 08          	add    $0x8,%rsp
  4006b9:	c3                   	retq   

Disassembly of section .plt:

00000000004006c0 <.plt>:
  4006c0:	ff 35 42 19 20 00    	pushq  0x201942(%rip)        # 602008 <_GLOBAL_OFFSET_TABLE_+0x8>
  4006c6:	ff 25 44 19 20 00    	jmpq   *0x201944(%rip)        # 602010 <_GLOBAL_OFFSET_TABLE_+0x10>
  4006cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004006d0 <_exit@plt>:
  4006d0:	ff 25 42 19 20 00    	jmpq   *0x201942(%rip)        # 602018 <_exit@GLIBC_2.2.5>
  4006d6:	68 00 00 00 00       	pushq  $0x0
  4006db:	e9 e0 ff ff ff       	jmpq   4006c0 <.plt>

00000000004006e0 <puts@plt>:
  4006e0:	ff 25 3a 19 20 00    	jmpq   *0x20193a(%rip)        # 602020 <puts@GLIBC_2.2.5>
  4006e6:	68 01 00 00 00       	pushq  $0x1
  4006eb:	e9 d0 ff ff ff       	jmpq   4006c0 <.plt>

00000000004006f0 <strlen@plt>:
  4006f0:	ff 25 32 19 20 00    	jmpq   *0x201932(%rip)        # 602028 <strlen@GLIBC_2.2.5>
  4006f6:	68 02 00 00 00       	pushq  $0x2
  4006fb:	e9 c0 ff ff ff       	jmpq   4006c0 <.plt>

0000000000400700 <alarm@plt>:
  400700:	ff 25 2a 19 20 00    	jmpq   *0x20192a(%rip)        # 602030 <alarm@GLIBC_2.2.5>
  400706:	68 03 00 00 00       	pushq  $0x3
  40070b:	e9 b0 ff ff ff       	jmpq   4006c0 <.plt>

0000000000400710 <__libc_start_main@plt>:
  400710:	ff 25 22 19 20 00    	jmpq   *0x201922(%rip)        # 602038 <__libc_start_main@GLIBC_2.2.5>
  400716:	68 04 00 00 00       	pushq  $0x4
  40071b:	e9 a0 ff ff ff       	jmpq   4006c0 <.plt>

0000000000400720 <getchar@plt>:
  400720:	ff 25 1a 19 20 00    	jmpq   *0x20191a(%rip)        # 602040 <getchar@GLIBC_2.2.5>
  400726:	68 05 00 00 00       	pushq  $0x5
  40072b:	e9 90 ff ff ff       	jmpq   4006c0 <.plt>

0000000000400730 <signal@plt>:
  400730:	ff 25 12 19 20 00    	jmpq   *0x201912(%rip)        # 602048 <signal@GLIBC_2.2.5>
  400736:	68 06 00 00 00       	pushq  $0x6
  40073b:	e9 80 ff ff ff       	jmpq   4006c0 <.plt>

0000000000400740 <gets@plt>:
  400740:	ff 25 0a 19 20 00    	jmpq   *0x20190a(%rip)        # 602050 <gets@GLIBC_2.2.5>
  400746:	68 07 00 00 00       	pushq  $0x7
  40074b:	e9 70 ff ff ff       	jmpq   4006c0 <.plt>

0000000000400750 <fflush@plt>:
  400750:	ff 25 02 19 20 00    	jmpq   *0x201902(%rip)        # 602058 <fflush@GLIBC_2.2.5>
  400756:	68 08 00 00 00       	pushq  $0x8
  40075b:	e9 60 ff ff ff       	jmpq   4006c0 <.plt>

0000000000400760 <setvbuf@plt>:
  400760:	ff 25 fa 18 20 00    	jmpq   *0x2018fa(%rip)        # 602060 <setvbuf@GLIBC_2.2.5>
  400766:	68 09 00 00 00       	pushq  $0x9
  40076b:	e9 50 ff ff ff       	jmpq   4006c0 <.plt>

0000000000400770 <__isoc99_scanf@plt>:
  400770:	ff 25 f2 18 20 00    	jmpq   *0x2018f2(%rip)        # 602068 <__isoc99_scanf@GLIBC_2.7>
  400776:	68 0a 00 00 00       	pushq  $0xa
  40077b:	e9 40 ff ff ff       	jmpq   4006c0 <.plt>

Disassembly of section .plt.got:

0000000000400780 <__gmon_start__@plt>:
  400780:	ff 25 72 18 20 00    	jmpq   *0x201872(%rip)        # 601ff8 <__gmon_start__>
  400786:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000400790 <_start>:
  400790:	31 ed                	xor    %ebp,%ebp
  400792:	49 89 d1             	mov    %rdx,%r9
  400795:	5e                   	pop    %rsi
  400796:	48 89 e2             	mov    %rsp,%rdx
  400799:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40079d:	50                   	push   %rax
  40079e:	54                   	push   %rsp
  40079f:	49 c7 c0 90 0c 40 00 	mov    $0x400c90,%r8
  4007a6:	48 c7 c1 20 0c 40 00 	mov    $0x400c20,%rcx
  4007ad:	48 c7 c7 28 0b 40 00 	mov    $0x400b28,%rdi
  4007b4:	e8 57 ff ff ff       	callq  400710 <__libc_start_main@plt>
  4007b9:	f4                   	hlt    
  4007ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004007c0 <deregister_tm_clones>:
  4007c0:	b8 87 20 60 00       	mov    $0x602087,%eax
  4007c5:	55                   	push   %rbp
  4007c6:	48 2d 80 20 60 00    	sub    $0x602080,%rax
  4007cc:	48 83 f8 0e          	cmp    $0xe,%rax
  4007d0:	48 89 e5             	mov    %rsp,%rbp
  4007d3:	76 1b                	jbe    4007f0 <deregister_tm_clones+0x30>
  4007d5:	b8 00 00 00 00       	mov    $0x0,%eax
  4007da:	48 85 c0             	test   %rax,%rax
  4007dd:	74 11                	je     4007f0 <deregister_tm_clones+0x30>
  4007df:	5d                   	pop    %rbp
  4007e0:	bf 80 20 60 00       	mov    $0x602080,%edi
  4007e5:	ff e0                	jmpq   *%rax
  4007e7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  4007ee:	00 00 
  4007f0:	5d                   	pop    %rbp
  4007f1:	c3                   	retq   
  4007f2:	0f 1f 40 00          	nopl   0x0(%rax)
  4007f6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4007fd:	00 00 00 

0000000000400800 <register_tm_clones>:
  400800:	be 80 20 60 00       	mov    $0x602080,%esi
  400805:	55                   	push   %rbp
  400806:	48 81 ee 80 20 60 00 	sub    $0x602080,%rsi
  40080d:	48 c1 fe 03          	sar    $0x3,%rsi
  400811:	48 89 e5             	mov    %rsp,%rbp
  400814:	48 89 f0             	mov    %rsi,%rax
  400817:	48 c1 e8 3f          	shr    $0x3f,%rax
  40081b:	48 01 c6             	add    %rax,%rsi
  40081e:	48 d1 fe             	sar    %rsi
  400821:	74 15                	je     400838 <register_tm_clones+0x38>
  400823:	b8 00 00 00 00       	mov    $0x0,%eax
  400828:	48 85 c0             	test   %rax,%rax
  40082b:	74 0b                	je     400838 <register_tm_clones+0x38>
  40082d:	5d                   	pop    %rbp
  40082e:	bf 80 20 60 00       	mov    $0x602080,%edi
  400833:	ff e0                	jmpq   *%rax
  400835:	0f 1f 00             	nopl   (%rax)
  400838:	5d                   	pop    %rbp
  400839:	c3                   	retq   
  40083a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400840 <__do_global_dtors_aux>:
  400840:	80 3d 61 18 20 00 00 	cmpb   $0x0,0x201861(%rip)        # 6020a8 <completed.7594>
  400847:	75 11                	jne    40085a <__do_global_dtors_aux+0x1a>
  400849:	55                   	push   %rbp
  40084a:	48 89 e5             	mov    %rsp,%rbp
  40084d:	e8 6e ff ff ff       	callq  4007c0 <deregister_tm_clones>
  400852:	5d                   	pop    %rbp
  400853:	c6 05 4e 18 20 00 01 	movb   $0x1,0x20184e(%rip)        # 6020a8 <completed.7594>
  40085a:	f3 c3                	repz retq 
  40085c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400860 <frame_dummy>:
  400860:	bf 20 1e 60 00       	mov    $0x601e20,%edi
  400865:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  400869:	75 05                	jne    400870 <frame_dummy+0x10>
  40086b:	eb 93                	jmp    400800 <register_tm_clones>
  40086d:	0f 1f 00             	nopl   (%rax)
  400870:	b8 00 00 00 00       	mov    $0x0,%eax
  400875:	48 85 c0             	test   %rax,%rax
  400878:	74 f1                	je     40086b <frame_dummy+0xb>
  40087a:	55                   	push   %rbp
  40087b:	48 89 e5             	mov    %rsp,%rbp
  40087e:	ff d0                	callq  *%rax
  400880:	5d                   	pop    %rbp
  400881:	e9 7a ff ff ff       	jmpq   400800 <register_tm_clones>

0000000000400886 <handler>:
  400886:	55                   	push   %rbp
  400887:	48 89 e5             	mov    %rsp,%rbp
  40088a:	48 83 ec 10          	sub    $0x10,%rsp
  40088e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  400891:	bf a8 0c 40 00       	mov    $0x400ca8,%edi
  400896:	e8 45 fe ff ff       	callq  4006e0 <puts@plt>
  40089b:	bf 01 00 00 00       	mov    $0x1,%edi
  4008a0:	e8 2b fe ff ff       	callq  4006d0 <_exit@plt>

00000000004008a5 <init>:
  4008a5:	55                   	push   %rbp
  4008a6:	48 89 e5             	mov    %rsp,%rbp
  4008a9:	48 8b 05 d0 17 20 00 	mov    0x2017d0(%rip),%rax        # 602080 <stdout@@GLIBC_2.2.5>
  4008b0:	b9 00 00 00 00       	mov    $0x0,%ecx
  4008b5:	ba 02 00 00 00       	mov    $0x2,%edx
  4008ba:	be 00 00 00 00       	mov    $0x0,%esi
  4008bf:	48 89 c7             	mov    %rax,%rdi
  4008c2:	e8 99 fe ff ff       	callq  400760 <setvbuf@plt>
  4008c7:	48 8b 05 c2 17 20 00 	mov    0x2017c2(%rip),%rax        # 602090 <stdin@@GLIBC_2.2.5>
  4008ce:	b9 00 00 00 00       	mov    $0x0,%ecx
  4008d3:	ba 02 00 00 00       	mov    $0x2,%edx
  4008d8:	be 00 00 00 00       	mov    $0x0,%esi
  4008dd:	48 89 c7             	mov    %rax,%rdi
  4008e0:	e8 7b fe ff ff       	callq  400760 <setvbuf@plt>
  4008e5:	48 8b 05 b4 17 20 00 	mov    0x2017b4(%rip),%rax        # 6020a0 <stderr@@GLIBC_2.2.5>
  4008ec:	b9 00 00 00 00       	mov    $0x0,%ecx
  4008f1:	ba 02 00 00 00       	mov    $0x2,%edx
  4008f6:	be 00 00 00 00       	mov    $0x0,%esi
  4008fb:	48 89 c7             	mov    %rax,%rdi
  4008fe:	e8 5d fe ff ff       	callq  400760 <setvbuf@plt>
  400903:	be 86 08 40 00       	mov    $0x400886,%esi
  400908:	bf 0e 00 00 00       	mov    $0xe,%edi
  40090d:	e8 1e fe ff ff       	callq  400730 <signal@plt>
  400912:	bf 3c 00 00 00       	mov    $0x3c,%edi
  400917:	e8 e4 fd ff ff       	callq  400700 <alarm@plt>
  40091c:	90                   	nop
  40091d:	5d                   	pop    %rbp
  40091e:	c3                   	retq   

000000000040091f <delete_char>:
  40091f:	55                   	push   %rbp
  400920:	48 89 e5             	mov    %rsp,%rbp
  400923:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  400927:	89 f0                	mov    %esi,%eax
  400929:	88 45 e4             	mov    %al,-0x1c(%rbp)
  40092c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  400933:	8b 45 f8             	mov    -0x8(%rbp),%eax
  400936:	89 45 fc             	mov    %eax,-0x4(%rbp)
  400939:	eb 3e                	jmp    400979 <delete_char+0x5a>
  40093b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  40093e:	48 63 d0             	movslq %eax,%rdx
  400941:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  400945:	48 01 d0             	add    %rdx,%rax
  400948:	0f b6 00             	movzbl (%rax),%eax
  40094b:	3a 45 e4             	cmp    -0x1c(%rbp),%al
  40094e:	74 25                	je     400975 <delete_char+0x56>
  400950:	8b 45 f8             	mov    -0x8(%rbp),%eax
  400953:	8d 50 01             	lea    0x1(%rax),%edx
  400956:	89 55 f8             	mov    %edx,-0x8(%rbp)
  400959:	48 63 d0             	movslq %eax,%rdx
  40095c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  400960:	48 01 c2             	add    %rax,%rdx
  400963:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400966:	48 63 c8             	movslq %eax,%rcx
  400969:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  40096d:	48 01 c8             	add    %rcx,%rax
  400970:	0f b6 00             	movzbl (%rax),%eax
  400973:	88 02                	mov    %al,(%rdx)
  400975:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  400979:	8b 45 fc             	mov    -0x4(%rbp),%eax
  40097c:	48 63 d0             	movslq %eax,%rdx
  40097f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  400983:	48 01 d0             	add    %rdx,%rax
  400986:	0f b6 00             	movzbl (%rax),%eax
  400989:	84 c0                	test   %al,%al
  40098b:	75 ae                	jne    40093b <delete_char+0x1c>
  40098d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  400990:	48 63 d0             	movslq %eax,%rdx
  400993:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  400997:	48 01 d0             	add    %rdx,%rax
  40099a:	c6 00 00             	movb   $0x0,(%rax)
  40099d:	90                   	nop
  40099e:	5d                   	pop    %rbp
  40099f:	c3                   	retq   

00000000004009a0 <encrypt>:
  4009a0:	55                   	push   %rbp
  4009a1:	48 89 e5             	mov    %rsp,%rbp
  4009a4:	53                   	push   %rbx
  4009a5:	48 83 ec 48          	sub    $0x48,%rsp
  4009a9:	48 8d 55 b0          	lea    -0x50(%rbp),%rdx
  4009ad:	b8 00 00 00 00       	mov    $0x0,%eax
  4009b2:	b9 06 00 00 00       	mov    $0x6,%ecx
  4009b7:	48 89 d7             	mov    %rdx,%rdi
  4009ba:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  4009bd:	48 89 fa             	mov    %rdi,%rdx
  4009c0:	66 89 02             	mov    %ax,(%rdx)
  4009c3:	48 83 c2 02          	add    $0x2,%rdx
  4009c7:	bf b0 0c 40 00       	mov    $0x400cb0,%edi
  4009cc:	e8 0f fd ff ff       	callq  4006e0 <puts@plt>
  4009d1:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
  4009d5:	48 89 c7             	mov    %rax,%rdi
  4009d8:	b8 00 00 00 00       	mov    $0x0,%eax
  4009dd:	e8 5e fd ff ff       	callq  400740 <gets@plt>
  4009e2:	e9 cd 00 00 00       	jmpq   400ab4 <encrypt+0x114>
  4009e7:	8b 05 bf 16 20 00    	mov    0x2016bf(%rip),%eax        # 6020ac <x>
  4009ed:	89 c0                	mov    %eax,%eax
  4009ef:	0f b6 44 05 b0       	movzbl -0x50(%rbp,%rax,1),%eax
  4009f4:	3c 60                	cmp    $0x60,%al
  4009f6:	7e 2f                	jle    400a27 <encrypt+0x87>
  4009f8:	8b 05 ae 16 20 00    	mov    0x2016ae(%rip),%eax        # 6020ac <x>
  4009fe:	89 c0                	mov    %eax,%eax
  400a00:	0f b6 44 05 b0       	movzbl -0x50(%rbp,%rax,1),%eax
  400a05:	3c 7a                	cmp    $0x7a,%al
  400a07:	7f 1e                	jg     400a27 <encrypt+0x87>
  400a09:	8b 05 9d 16 20 00    	mov    0x20169d(%rip),%eax        # 6020ac <x>
  400a0f:	8b 15 97 16 20 00    	mov    0x201697(%rip),%edx        # 6020ac <x>
  400a15:	89 d2                	mov    %edx,%edx
  400a17:	0f b6 54 15 b0       	movzbl -0x50(%rbp,%rdx,1),%edx
  400a1c:	83 f2 0e             	xor    $0xe,%edx
  400a1f:	89 c0                	mov    %eax,%eax
  400a21:	88 54 05 b0          	mov    %dl,-0x50(%rbp,%rax,1)
  400a25:	eb 7e                	jmp    400aa5 <encrypt+0x105>
  400a27:	8b 05 7f 16 20 00    	mov    0x20167f(%rip),%eax        # 6020ac <x>
  400a2d:	89 c0                	mov    %eax,%eax
  400a2f:	0f b6 44 05 b0       	movzbl -0x50(%rbp,%rax,1),%eax
  400a34:	3c 40                	cmp    $0x40,%al
  400a36:	7e 2f                	jle    400a67 <encrypt+0xc7>
  400a38:	8b 05 6e 16 20 00    	mov    0x20166e(%rip),%eax        # 6020ac <x>
  400a3e:	89 c0                	mov    %eax,%eax
  400a40:	0f b6 44 05 b0       	movzbl -0x50(%rbp,%rax,1),%eax
  400a45:	3c 5a                	cmp    $0x5a,%al
  400a47:	7f 1e                	jg     400a67 <encrypt+0xc7>
  400a49:	8b 05 5d 16 20 00    	mov    0x20165d(%rip),%eax        # 6020ac <x>
  400a4f:	8b 15 57 16 20 00    	mov    0x201657(%rip),%edx        # 6020ac <x>
  400a55:	89 d2                	mov    %edx,%edx
  400a57:	0f b6 54 15 b0       	movzbl -0x50(%rbp,%rdx,1),%edx
  400a5c:	83 f2 0d             	xor    $0xd,%edx
  400a5f:	89 c0                	mov    %eax,%eax
  400a61:	88 54 05 b0          	mov    %dl,-0x50(%rbp,%rax,1)
  400a65:	eb 3e                	jmp    400aa5 <encrypt+0x105>
  400a67:	8b 05 3f 16 20 00    	mov    0x20163f(%rip),%eax        # 6020ac <x>
  400a6d:	89 c0                	mov    %eax,%eax
  400a6f:	0f b6 44 05 b0       	movzbl -0x50(%rbp,%rax,1),%eax
  400a74:	3c 2f                	cmp    $0x2f,%al
  400a76:	7e 2d                	jle    400aa5 <encrypt+0x105>
  400a78:	8b 05 2e 16 20 00    	mov    0x20162e(%rip),%eax        # 6020ac <x>
  400a7e:	89 c0                	mov    %eax,%eax
  400a80:	0f b6 44 05 b0       	movzbl -0x50(%rbp,%rax,1),%eax
  400a85:	3c 39                	cmp    $0x39,%al
  400a87:	7f 1c                	jg     400aa5 <encrypt+0x105>
  400a89:	8b 05 1d 16 20 00    	mov    0x20161d(%rip),%eax        # 6020ac <x>
  400a8f:	8b 15 17 16 20 00    	mov    0x201617(%rip),%edx        # 6020ac <x>
  400a95:	89 d2                	mov    %edx,%edx
  400a97:	0f b6 54 15 b0       	movzbl -0x50(%rbp,%rdx,1),%edx
  400a9c:	83 f2 0c             	xor    $0xc,%edx
  400a9f:	89 c0                	mov    %eax,%eax
  400aa1:	88 54 05 b0          	mov    %dl,-0x50(%rbp,%rax,1)
  400aa5:	8b 05 01 16 20 00    	mov    0x201601(%rip),%eax        # 6020ac <x>
  400aab:	83 c0 01             	add    $0x1,%eax
  400aae:	89 05 f8 15 20 00    	mov    %eax,0x2015f8(%rip)        # 6020ac <x>
  400ab4:	8b 05 f2 15 20 00    	mov    0x2015f2(%rip),%eax        # 6020ac <x>
  400aba:	89 c3                	mov    %eax,%ebx
  400abc:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
  400ac0:	48 89 c7             	mov    %rax,%rdi
  400ac3:	e8 28 fc ff ff       	callq  4006f0 <strlen@plt>
  400ac8:	48 39 c3             	cmp    %rax,%rbx
  400acb:	0f 82 16 ff ff ff    	jb     4009e7 <encrypt+0x47>
  400ad1:	bf d5 0c 40 00       	mov    $0x400cd5,%edi
  400ad6:	e8 05 fc ff ff       	callq  4006e0 <puts@plt>
  400adb:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
  400adf:	48 89 c7             	mov    %rax,%rdi
  400ae2:	e8 f9 fb ff ff       	callq  4006e0 <puts@plt>
  400ae7:	90                   	nop
  400ae8:	48 83 c4 48          	add    $0x48,%rsp
  400aec:	5b                   	pop    %rbx
  400aed:	5d                   	pop    %rbp
  400aee:	c3                   	retq   

0000000000400aef <begin>:
  400aef:	55                   	push   %rbp
  400af0:	48 89 e5             	mov    %rsp,%rbp
  400af3:	bf e0 0c 40 00       	mov    $0x400ce0,%edi
  400af8:	e8 e3 fb ff ff       	callq  4006e0 <puts@plt>
  400afd:	bf 25 0d 40 00       	mov    $0x400d25,%edi
  400b02:	e8 d9 fb ff ff       	callq  4006e0 <puts@plt>
  400b07:	bf 2f 0d 40 00       	mov    $0x400d2f,%edi
  400b0c:	e8 cf fb ff ff       	callq  4006e0 <puts@plt>
  400b11:	bf 39 0d 40 00       	mov    $0x400d39,%edi
  400b16:	e8 c5 fb ff ff       	callq  4006e0 <puts@plt>
  400b1b:	bf 40 0d 40 00       	mov    $0x400d40,%edi
  400b20:	e8 bb fb ff ff       	callq  4006e0 <puts@plt>
  400b25:	90                   	nop
  400b26:	5d                   	pop    %rbp
  400b27:	c3                   	retq   

0000000000400b28 <main>:
  400b28:	55                   	push   %rbp
  400b29:	48 89 e5             	mov    %rsp,%rbp
  400b2c:	48 83 ec 10          	sub    $0x10,%rsp
  400b30:	b8 00 00 00 00       	mov    $0x0,%eax
  400b35:	e8 6b fd ff ff       	callq  4008a5 <init>
  400b3a:	bf 58 0d 40 00       	mov    $0x400d58,%edi
  400b3f:	e8 9c fb ff ff       	callq  4006e0 <puts@plt>
  400b44:	bf 98 0d 40 00       	mov    $0x400d98,%edi
  400b49:	e8 92 fb ff ff       	callq  4006e0 <puts@plt>
  400b4e:	bf d8 0d 40 00       	mov    $0x400dd8,%edi
  400b53:	e8 88 fb ff ff       	callq  4006e0 <puts@plt>
  400b58:	bf 18 0e 40 00       	mov    $0x400e18,%edi
  400b5d:	e8 7e fb ff ff       	callq  4006e0 <puts@plt>
  400b62:	bf 58 0e 40 00       	mov    $0x400e58,%edi
  400b67:	e8 74 fb ff ff       	callq  4006e0 <puts@plt>
  400b6c:	bf e0 0c 40 00       	mov    $0x400ce0,%edi
  400b71:	e8 6a fb ff ff       	callq  4006e0 <puts@plt>
  400b76:	bf 98 0e 40 00       	mov    $0x400e98,%edi
  400b7b:	e8 60 fb ff ff       	callq  4006e0 <puts@plt>
  400b80:	b8 00 00 00 00       	mov    $0x0,%eax
  400b85:	e8 65 ff ff ff       	callq  400aef <begin>
  400b8a:	bf 00 00 00 00       	mov    $0x0,%edi
  400b8f:	e8 bc fb ff ff       	callq  400750 <fflush@plt>
  400b94:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  400b9b:	48 8d 45 fc          	lea    -0x4(%rbp),%rax
  400b9f:	48 89 c6             	mov    %rax,%rsi
  400ba2:	bf bc 0e 40 00       	mov    $0x400ebc,%edi
  400ba7:	b8 00 00 00 00       	mov    $0x0,%eax
  400bac:	e8 bf fb ff ff       	callq  400770 <__isoc99_scanf@plt>
  400bb1:	e8 6a fb ff ff       	callq  400720 <getchar@plt>
  400bb6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400bb9:	83 f8 02             	cmp    $0x2,%eax
  400bbc:	74 20                	je     400bde <main+0xb6>
  400bbe:	83 f8 03             	cmp    $0x3,%eax
  400bc1:	74 31                	je     400bf4 <main+0xcc>
  400bc3:	83 f8 01             	cmp    $0x1,%eax
  400bc6:	75 3d                	jne    400c05 <main+0xdd>
  400bc8:	b8 00 00 00 00       	mov    $0x0,%eax
  400bcd:	e8 ce fd ff ff       	callq  4009a0 <encrypt>
  400bd2:	b8 00 00 00 00       	mov    $0x0,%eax
  400bd7:	e8 13 ff ff ff       	callq  400aef <begin>
  400bdc:	eb 38                	jmp    400c16 <main+0xee>
  400bde:	bf c0 0e 40 00       	mov    $0x400ec0,%edi
  400be3:	e8 f8 fa ff ff       	callq  4006e0 <puts@plt>
  400be8:	b8 00 00 00 00       	mov    $0x0,%eax
  400bed:	e8 fd fe ff ff       	callq  400aef <begin>
  400bf2:	eb 22                	jmp    400c16 <main+0xee>
  400bf4:	bf e2 0e 40 00       	mov    $0x400ee2,%edi
  400bf9:	e8 e2 fa ff ff       	callq  4006e0 <puts@plt>
  400bfe:	b8 00 00 00 00       	mov    $0x0,%eax
  400c03:	eb 16                	jmp    400c1b <main+0xf3>
  400c05:	bf e7 0e 40 00       	mov    $0x400ee7,%edi
  400c0a:	e8 d1 fa ff ff       	callq  4006e0 <puts@plt>
  400c0f:	b8 00 00 00 00       	mov    $0x0,%eax
  400c14:	eb 05                	jmp    400c1b <main+0xf3>
  400c16:	e9 6f ff ff ff       	jmpq   400b8a <main+0x62>
  400c1b:	c9                   	leaveq 
  400c1c:	c3                   	retq   
  400c1d:	0f 1f 00             	nopl   (%rax)

0000000000400c20 <__libc_csu_init>:
  400c20:	41 57                	push   %r15
  400c22:	41 56                	push   %r14
  400c24:	41 89 ff             	mov    %edi,%r15d
  400c27:	41 55                	push   %r13
  400c29:	41 54                	push   %r12
  400c2b:	4c 8d 25 de 11 20 00 	lea    0x2011de(%rip),%r12        # 601e10 <__frame_dummy_init_array_entry>
  400c32:	55                   	push   %rbp
  400c33:	48 8d 2d de 11 20 00 	lea    0x2011de(%rip),%rbp        # 601e18 <__do_global_dtors_aux_fini_array_entry>
  400c3a:	53                   	push   %rbx
  400c3b:	49 89 f6             	mov    %rsi,%r14
  400c3e:	49 89 d5             	mov    %rdx,%r13
  400c41:	4c 29 e5             	sub    %r12,%rbp
  400c44:	48 83 ec 08          	sub    $0x8,%rsp
  400c48:	48 c1 fd 03          	sar    $0x3,%rbp
  400c4c:	e8 4f fa ff ff       	callq  4006a0 <_init>
  400c51:	48 85 ed             	test   %rbp,%rbp
  400c54:	74 20                	je     400c76 <__libc_csu_init+0x56>
  400c56:	31 db                	xor    %ebx,%ebx
  400c58:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  400c5f:	00 
  400c60:	4c 89 ea             	mov    %r13,%rdx
  400c63:	4c 89 f6             	mov    %r14,%rsi
  400c66:	44 89 ff             	mov    %r15d,%edi
  400c69:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  400c6d:	48 83 c3 01          	add    $0x1,%rbx
  400c71:	48 39 eb             	cmp    %rbp,%rbx
  400c74:	75 ea                	jne    400c60 <__libc_csu_init+0x40>
  400c76:	48 83 c4 08          	add    $0x8,%rsp
  400c7a:	5b                   	pop    %rbx
  400c7b:	5d                   	pop    %rbp
  400c7c:	41 5c                	pop    %r12
  400c7e:	41 5d                	pop    %r13
  400c80:	41 5e                	pop    %r14
  400c82:	41 5f                	pop    %r15
  400c84:	c3                   	retq   
  400c85:	90                   	nop
  400c86:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400c8d:	00 00 00 

0000000000400c90 <__libc_csu_fini>:
  400c90:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000400c94 <_fini>:
  400c94:	48 83 ec 08          	sub    $0x8,%rsp
  400c98:	48 83 c4 08          	add    $0x8,%rsp
  400c9c:	c3                   	retq   
