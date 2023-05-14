
pwn：     文件格式 elf32-i386


Disassembly of section .init:

080484f8 <.init>:
 80484f8:	53                   	push   %ebx
 80484f9:	83 ec 08             	sub    $0x8,%esp
 80484fc:	e8 cf 00 00 00       	call   80485d0 <strncmp@plt+0x38>
 8048501:	81 c3 bb 1a 00 00    	add    $0x1abb,%ebx
 8048507:	8b 83 1c 00 00 00    	mov    0x1c(%ebx),%eax
 804850d:	85 c0                	test   %eax,%eax
 804850f:	74 05                	je     8048516 <read@plt-0x1a>
 8048511:	e8 3a 00 00 00       	call   8048550 <__gmon_start__@plt>
 8048516:	83 c4 08             	add    $0x8,%esp
 8048519:	5b                   	pop    %ebx
 804851a:	c3                   	ret    

Disassembly of section .plt:

08048520 <.plt>:
 8048520:	ff 35 c0 9f 04 08    	pushl  0x8049fc0
 8048526:	ff 25 c4 9f 04 08    	jmp    *0x8049fc4
 804852c:	00 00                	add    %al,(%eax)
	...

Disassembly of section .plt.got:

08048530 <read@plt>:
 8048530:	ff 25 c8 9f 04 08    	jmp    *0x8049fc8
 8048536:	66 90                	xchg   %ax,%ax

08048538 <signal@plt>:
 8048538:	ff 25 cc 9f 04 08    	jmp    *0x8049fcc
 804853e:	66 90                	xchg   %ax,%ax

08048540 <alarm@plt>:
 8048540:	ff 25 d0 9f 04 08    	jmp    *0x8049fd0
 8048546:	66 90                	xchg   %ax,%ax

08048548 <puts@plt>:
 8048548:	ff 25 d4 9f 04 08    	jmp    *0x8049fd4
 804854e:	66 90                	xchg   %ax,%ax

08048550 <__gmon_start__@plt>:
 8048550:	ff 25 d8 9f 04 08    	jmp    *0x8049fd8
 8048556:	66 90                	xchg   %ax,%ax

08048558 <exit@plt>:
 8048558:	ff 25 dc 9f 04 08    	jmp    *0x8049fdc
 804855e:	66 90                	xchg   %ax,%ax

08048560 <open@plt>:
 8048560:	ff 25 e0 9f 04 08    	jmp    *0x8049fe0
 8048566:	66 90                	xchg   %ax,%ax

08048568 <strlen@plt>:
 8048568:	ff 25 e4 9f 04 08    	jmp    *0x8049fe4
 804856e:	66 90                	xchg   %ax,%ax

08048570 <__libc_start_main@plt>:
 8048570:	ff 25 e8 9f 04 08    	jmp    *0x8049fe8
 8048576:	66 90                	xchg   %ax,%ax

08048578 <write@plt>:
 8048578:	ff 25 ec 9f 04 08    	jmp    *0x8049fec
 804857e:	66 90                	xchg   %ax,%ax

08048580 <setvbuf@plt>:
 8048580:	ff 25 f0 9f 04 08    	jmp    *0x8049ff0
 8048586:	66 90                	xchg   %ax,%ax

08048588 <memset@plt>:
 8048588:	ff 25 f4 9f 04 08    	jmp    *0x8049ff4
 804858e:	66 90                	xchg   %ax,%ax

08048590 <sprintf@plt>:
 8048590:	ff 25 f8 9f 04 08    	jmp    *0x8049ff8
 8048596:	66 90                	xchg   %ax,%ax

08048598 <strncmp@plt>:
 8048598:	ff 25 fc 9f 04 08    	jmp    *0x8049ffc
 804859e:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

080485a0 <.text>:
 80485a0:	31 ed                	xor    %ebp,%ebp
 80485a2:	5e                   	pop    %esi
 80485a3:	89 e1                	mov    %esp,%ecx
 80485a5:	83 e4 f0             	and    $0xfffffff0,%esp
 80485a8:	50                   	push   %eax
 80485a9:	54                   	push   %esp
 80485aa:	52                   	push   %edx
 80485ab:	68 00 89 04 08       	push   $0x8048900
 80485b0:	68 a0 88 04 08       	push   $0x80488a0
 80485b5:	51                   	push   %ecx
 80485b6:	56                   	push   %esi
 80485b7:	68 25 88 04 08       	push   $0x8048825
 80485bc:	e8 af ff ff ff       	call   8048570 <__libc_start_main@plt>
 80485c1:	f4                   	hlt    
 80485c2:	66 90                	xchg   %ax,%ax
 80485c4:	66 90                	xchg   %ax,%ax
 80485c6:	66 90                	xchg   %ax,%ax
 80485c8:	66 90                	xchg   %ax,%ax
 80485ca:	66 90                	xchg   %ax,%ax
 80485cc:	66 90                	xchg   %ax,%ax
 80485ce:	66 90                	xchg   %ax,%ax
 80485d0:	8b 1c 24             	mov    (%esp),%ebx
 80485d3:	c3                   	ret    
 80485d4:	66 90                	xchg   %ax,%ax
 80485d6:	66 90                	xchg   %ax,%ax
 80485d8:	66 90                	xchg   %ax,%ax
 80485da:	66 90                	xchg   %ax,%ax
 80485dc:	66 90                	xchg   %ax,%ax
 80485de:	66 90                	xchg   %ax,%ax
 80485e0:	b8 0b a0 04 08       	mov    $0x804a00b,%eax
 80485e5:	2d 08 a0 04 08       	sub    $0x804a008,%eax
 80485ea:	83 f8 06             	cmp    $0x6,%eax
 80485ed:	76 1a                	jbe    8048609 <strncmp@plt+0x71>
 80485ef:	b8 00 00 00 00       	mov    $0x0,%eax
 80485f4:	85 c0                	test   %eax,%eax
 80485f6:	74 11                	je     8048609 <strncmp@plt+0x71>
 80485f8:	55                   	push   %ebp
 80485f9:	89 e5                	mov    %esp,%ebp
 80485fb:	83 ec 14             	sub    $0x14,%esp
 80485fe:	68 08 a0 04 08       	push   $0x804a008
 8048603:	ff d0                	call   *%eax
 8048605:	83 c4 10             	add    $0x10,%esp
 8048608:	c9                   	leave  
 8048609:	f3 c3                	repz ret 
 804860b:	90                   	nop
 804860c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048610:	b8 08 a0 04 08       	mov    $0x804a008,%eax
 8048615:	2d 08 a0 04 08       	sub    $0x804a008,%eax
 804861a:	c1 f8 02             	sar    $0x2,%eax
 804861d:	89 c2                	mov    %eax,%edx
 804861f:	c1 ea 1f             	shr    $0x1f,%edx
 8048622:	01 d0                	add    %edx,%eax
 8048624:	d1 f8                	sar    %eax
 8048626:	74 1b                	je     8048643 <strncmp@plt+0xab>
 8048628:	ba 00 00 00 00       	mov    $0x0,%edx
 804862d:	85 d2                	test   %edx,%edx
 804862f:	74 12                	je     8048643 <strncmp@plt+0xab>
 8048631:	55                   	push   %ebp
 8048632:	89 e5                	mov    %esp,%ebp
 8048634:	83 ec 10             	sub    $0x10,%esp
 8048637:	50                   	push   %eax
 8048638:	68 08 a0 04 08       	push   $0x804a008
 804863d:	ff d2                	call   *%edx
 804863f:	83 c4 10             	add    $0x10,%esp
 8048642:	c9                   	leave  
 8048643:	f3 c3                	repz ret 
 8048645:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8048650:	80 3d 48 a0 04 08 00 	cmpb   $0x0,0x804a048
 8048657:	75 13                	jne    804866c <strncmp@plt+0xd4>
 8048659:	55                   	push   %ebp
 804865a:	89 e5                	mov    %esp,%ebp
 804865c:	83 ec 08             	sub    $0x8,%esp
 804865f:	e8 7c ff ff ff       	call   80485e0 <strncmp@plt+0x48>
 8048664:	c6 05 48 a0 04 08 01 	movb   $0x1,0x804a048
 804866b:	c9                   	leave  
 804866c:	f3 c3                	repz ret 
 804866e:	66 90                	xchg   %ax,%ax
 8048670:	b8 d8 9e 04 08       	mov    $0x8049ed8,%eax
 8048675:	8b 10                	mov    (%eax),%edx
 8048677:	85 d2                	test   %edx,%edx
 8048679:	75 05                	jne    8048680 <strncmp@plt+0xe8>
 804867b:	eb 93                	jmp    8048610 <strncmp@plt+0x78>
 804867d:	8d 76 00             	lea    0x0(%esi),%esi
 8048680:	ba 00 00 00 00       	mov    $0x0,%edx
 8048685:	85 d2                	test   %edx,%edx
 8048687:	74 f2                	je     804867b <strncmp@plt+0xe3>
 8048689:	55                   	push   %ebp
 804868a:	89 e5                	mov    %esp,%ebp
 804868c:	83 ec 14             	sub    $0x14,%esp
 804868f:	50                   	push   %eax
 8048690:	ff d2                	call   *%edx
 8048692:	83 c4 10             	add    $0x10,%esp
 8048695:	c9                   	leave  
 8048696:	e9 75 ff ff ff       	jmp    8048610 <strncmp@plt+0x78>
 804869b:	55                   	push   %ebp
 804869c:	89 e5                	mov    %esp,%ebp
 804869e:	83 ec 08             	sub    $0x8,%esp
 80486a1:	83 ec 0c             	sub    $0xc,%esp
 80486a4:	68 20 89 04 08       	push   $0x8048920
 80486a9:	e8 9a fe ff ff       	call   8048548 <puts@plt>
 80486ae:	83 c4 10             	add    $0x10,%esp
 80486b1:	83 ec 0c             	sub    $0xc,%esp
 80486b4:	6a 01                	push   $0x1
 80486b6:	e8 9d fe ff ff       	call   8048558 <exit@plt>
 80486bb:	55                   	push   %ebp
 80486bc:	89 e5                	mov    %esp,%ebp
 80486be:	83 ec 08             	sub    $0x8,%esp
 80486c1:	83 ec 0c             	sub    $0xc,%esp
 80486c4:	6a 3c                	push   $0x3c
 80486c6:	e8 75 fe ff ff       	call   8048540 <alarm@plt>
 80486cb:	83 c4 10             	add    $0x10,%esp
 80486ce:	83 ec 08             	sub    $0x8,%esp
 80486d1:	68 9b 86 04 08       	push   $0x804869b
 80486d6:	6a 0e                	push   $0xe
 80486d8:	e8 5b fe ff ff       	call   8048538 <signal@plt>
 80486dd:	83 c4 10             	add    $0x10,%esp
 80486e0:	a1 40 a0 04 08       	mov    0x804a040,%eax
 80486e5:	6a 00                	push   $0x0
 80486e7:	6a 02                	push   $0x2
 80486e9:	6a 00                	push   $0x0
 80486eb:	50                   	push   %eax
 80486ec:	e8 8f fe ff ff       	call   8048580 <setvbuf@plt>
 80486f1:	83 c4 10             	add    $0x10,%esp
 80486f4:	a1 44 a0 04 08       	mov    0x804a044,%eax
 80486f9:	6a 00                	push   $0x0
 80486fb:	6a 02                	push   $0x2
 80486fd:	6a 00                	push   $0x0
 80486ff:	50                   	push   %eax
 8048700:	e8 7b fe ff ff       	call   8048580 <setvbuf@plt>
 8048705:	83 c4 10             	add    $0x10,%esp
 8048708:	a1 20 a0 04 08       	mov    0x804a020,%eax
 804870d:	6a 00                	push   $0x0
 804870f:	6a 02                	push   $0x2
 8048711:	6a 00                	push   $0x0
 8048713:	50                   	push   %eax
 8048714:	e8 67 fe ff ff       	call   8048580 <setvbuf@plt>
 8048719:	83 c4 10             	add    $0x10,%esp
 804871c:	90                   	nop
 804871d:	c9                   	leave  
 804871e:	c3                   	ret    
 804871f:	55                   	push   %ebp
 8048720:	89 e5                	mov    %esp,%ebp
 8048722:	83 ec 58             	sub    $0x58,%esp
 8048725:	83 ec 04             	sub    $0x4,%esp
 8048728:	6a 20                	push   $0x20
 804872a:	6a 00                	push   $0x0
 804872c:	8d 45 b4             	lea    -0x4c(%ebp),%eax
 804872f:	50                   	push   %eax
 8048730:	e8 53 fe ff ff       	call   8048588 <memset@plt>
 8048735:	83 c4 10             	add    $0x10,%esp
 8048738:	83 ec 04             	sub    $0x4,%esp
 804873b:	6a 20                	push   $0x20
 804873d:	6a 00                	push   $0x0
 804873f:	8d 45 d4             	lea    -0x2c(%ebp),%eax
 8048742:	50                   	push   %eax
 8048743:	e8 40 fe ff ff       	call   8048588 <memset@plt>
 8048748:	83 c4 10             	add    $0x10,%esp
 804874b:	83 ec 04             	sub    $0x4,%esp
 804874e:	ff 75 08             	pushl  0x8(%ebp)
 8048751:	68 2a 89 04 08       	push   $0x804892a
 8048756:	8d 45 b4             	lea    -0x4c(%ebp),%eax
 8048759:	50                   	push   %eax
 804875a:	e8 31 fe ff ff       	call   8048590 <sprintf@plt>
 804875f:	83 c4 10             	add    $0x10,%esp
 8048762:	83 ec 04             	sub    $0x4,%esp
 8048765:	6a 20                	push   $0x20
 8048767:	8d 45 d4             	lea    -0x2c(%ebp),%eax
 804876a:	50                   	push   %eax
 804876b:	6a 00                	push   $0x0
 804876d:	e8 be fd ff ff       	call   8048530 <read@plt>
 8048772:	83 c4 10             	add    $0x10,%esp
 8048775:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048778:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804877b:	83 e8 01             	sub    $0x1,%eax
 804877e:	c6 44 05 d4 00       	movb   $0x0,-0x2c(%ebp,%eax,1)
 8048783:	83 ec 0c             	sub    $0xc,%esp
 8048786:	8d 45 d4             	lea    -0x2c(%ebp),%eax
 8048789:	50                   	push   %eax
 804878a:	e8 d9 fd ff ff       	call   8048568 <strlen@plt>
 804878f:	83 c4 10             	add    $0x10,%esp
 8048792:	83 ec 04             	sub    $0x4,%esp
 8048795:	50                   	push   %eax
 8048796:	8d 45 b4             	lea    -0x4c(%ebp),%eax
 8048799:	50                   	push   %eax
 804879a:	8d 45 d4             	lea    -0x2c(%ebp),%eax
 804879d:	50                   	push   %eax
 804879e:	e8 f5 fd ff ff       	call   8048598 <strncmp@plt>
 80487a3:	83 c4 10             	add    $0x10,%esp
 80487a6:	85 c0                	test   %eax,%eax
 80487a8:	75 1a                	jne    80487c4 <strncmp@plt+0x22c>
 80487aa:	83 ec 04             	sub    $0x4,%esp
 80487ad:	6a 08                	push   $0x8
 80487af:	68 2e 89 04 08       	push   $0x804892e
 80487b4:	6a 01                	push   $0x1
 80487b6:	e8 bd fd ff ff       	call   8048578 <write@plt>
 80487bb:	83 c4 10             	add    $0x10,%esp
 80487be:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
 80487c2:	eb 0a                	jmp    80487ce <strncmp@plt+0x236>
 80487c4:	83 ec 0c             	sub    $0xc,%esp
 80487c7:	6a 00                	push   $0x0
 80487c9:	e8 8a fd ff ff       	call   8048558 <exit@plt>
 80487ce:	c9                   	leave  
 80487cf:	c3                   	ret    
 80487d0:	55                   	push   %ebp
 80487d1:	89 e5                	mov    %esp,%ebp
 80487d3:	81 ec f8 00 00 00    	sub    $0xf8,%esp
 80487d9:	8b 45 08             	mov    0x8(%ebp),%eax
 80487dc:	88 85 14 ff ff ff    	mov    %al,-0xec(%ebp)
 80487e2:	80 bd 14 ff ff ff 7f 	cmpb   $0x7f,-0xec(%ebp)
 80487e9:	74 1e                	je     8048809 <strncmp@plt+0x271>
 80487eb:	0f be 85 14 ff ff ff 	movsbl -0xec(%ebp),%eax
 80487f2:	83 ec 04             	sub    $0x4,%esp
 80487f5:	50                   	push   %eax
 80487f6:	8d 85 19 ff ff ff    	lea    -0xe7(%ebp),%eax
 80487fc:	50                   	push   %eax
 80487fd:	6a 00                	push   $0x0
 80487ff:	e8 2c fd ff ff       	call   8048530 <read@plt>
 8048804:	83 c4 10             	add    $0x10,%esp
 8048807:	eb 19                	jmp    8048822 <strncmp@plt+0x28a>
 8048809:	83 ec 04             	sub    $0x4,%esp
 804880c:	68 c8 00 00 00       	push   $0xc8
 8048811:	8d 85 19 ff ff ff    	lea    -0xe7(%ebp),%eax
 8048817:	50                   	push   %eax
 8048818:	6a 00                	push   $0x0
 804881a:	e8 11 fd ff ff       	call   8048530 <read@plt>
 804881f:	83 c4 10             	add    $0x10,%esp
 8048822:	90                   	nop
 8048823:	c9                   	leave  
 8048824:	c3                   	ret    
 8048825:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 8048829:	83 e4 f0             	and    $0xfffffff0,%esp
 804882c:	ff 71 fc             	pushl  -0x4(%ecx)
 804882f:	55                   	push   %ebp
 8048830:	89 e5                	mov    %esp,%ebp
 8048832:	51                   	push   %ecx
 8048833:	83 ec 14             	sub    $0x14,%esp
 8048836:	e8 80 fe ff ff       	call   80486bb <strncmp@plt+0x123>
 804883b:	83 ec 08             	sub    $0x8,%esp
 804883e:	6a 00                	push   $0x0
 8048840:	68 37 89 04 08       	push   $0x8048937
 8048845:	e8 16 fd ff ff       	call   8048560 <open@plt>
 804884a:	83 c4 10             	add    $0x10,%esp
 804884d:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048850:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048854:	7e 14                	jle    804886a <strncmp@plt+0x2d2>
 8048856:	83 ec 04             	sub    $0x4,%esp
 8048859:	6a 04                	push   $0x4
 804885b:	8d 45 ec             	lea    -0x14(%ebp),%eax
 804885e:	50                   	push   %eax
 804885f:	ff 75 f4             	pushl  -0xc(%ebp)
 8048862:	e8 c9 fc ff ff       	call   8048530 <read@plt>
 8048867:	83 c4 10             	add    $0x10,%esp
 804886a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804886d:	83 ec 0c             	sub    $0xc,%esp
 8048870:	50                   	push   %eax
 8048871:	e8 a9 fe ff ff       	call   804871f <strncmp@plt+0x187>
 8048876:	83 c4 10             	add    $0x10,%esp
 8048879:	88 45 f3             	mov    %al,-0xd(%ebp)
 804887c:	0f be 45 f3          	movsbl -0xd(%ebp),%eax
 8048880:	83 ec 0c             	sub    $0xc,%esp
 8048883:	50                   	push   %eax
 8048884:	e8 47 ff ff ff       	call   80487d0 <strncmp@plt+0x238>
 8048889:	83 c4 10             	add    $0x10,%esp
 804888c:	b8 00 00 00 00       	mov    $0x0,%eax
 8048891:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 8048894:	c9                   	leave  
 8048895:	8d 61 fc             	lea    -0x4(%ecx),%esp
 8048898:	c3                   	ret    
 8048899:	66 90                	xchg   %ax,%ax
 804889b:	66 90                	xchg   %ax,%ax
 804889d:	66 90                	xchg   %ax,%ax
 804889f:	90                   	nop
 80488a0:	55                   	push   %ebp
 80488a1:	57                   	push   %edi
 80488a2:	56                   	push   %esi
 80488a3:	53                   	push   %ebx
 80488a4:	e8 27 fd ff ff       	call   80485d0 <strncmp@plt+0x38>
 80488a9:	81 c3 13 17 00 00    	add    $0x1713,%ebx
 80488af:	83 ec 0c             	sub    $0xc,%esp
 80488b2:	8b 6c 24 20          	mov    0x20(%esp),%ebp
 80488b6:	8d b3 18 ff ff ff    	lea    -0xe8(%ebx),%esi
 80488bc:	e8 37 fc ff ff       	call   80484f8 <read@plt-0x38>
 80488c1:	8d 83 14 ff ff ff    	lea    -0xec(%ebx),%eax
 80488c7:	29 c6                	sub    %eax,%esi
 80488c9:	c1 fe 02             	sar    $0x2,%esi
 80488cc:	85 f6                	test   %esi,%esi
 80488ce:	74 25                	je     80488f5 <strncmp@plt+0x35d>
 80488d0:	31 ff                	xor    %edi,%edi
 80488d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80488d8:	83 ec 04             	sub    $0x4,%esp
 80488db:	ff 74 24 2c          	pushl  0x2c(%esp)
 80488df:	ff 74 24 2c          	pushl  0x2c(%esp)
 80488e3:	55                   	push   %ebp
 80488e4:	ff 94 bb 14 ff ff ff 	call   *-0xec(%ebx,%edi,4)
 80488eb:	83 c7 01             	add    $0x1,%edi
 80488ee:	83 c4 10             	add    $0x10,%esp
 80488f1:	39 f7                	cmp    %esi,%edi
 80488f3:	75 e3                	jne    80488d8 <strncmp@plt+0x340>
 80488f5:	83 c4 0c             	add    $0xc,%esp
 80488f8:	5b                   	pop    %ebx
 80488f9:	5e                   	pop    %esi
 80488fa:	5f                   	pop    %edi
 80488fb:	5d                   	pop    %ebp
 80488fc:	c3                   	ret    
 80488fd:	8d 76 00             	lea    0x0(%esi),%esi
 8048900:	f3 c3                	repz ret 

Disassembly of section .fini:

08048904 <.fini>:
 8048904:	53                   	push   %ebx
 8048905:	83 ec 08             	sub    $0x8,%esp
 8048908:	e8 c3 fc ff ff       	call   80485d0 <strncmp@plt+0x38>
 804890d:	81 c3 af 16 00 00    	add    $0x16af,%ebx
 8048913:	83 c4 08             	add    $0x8,%esp
 8048916:	5b                   	pop    %ebx
 8048917:	c3                   	ret    
