
ciscn_2019_ne_5：     文件格式 elf32-i386


Disassembly of section .init:

08048434 <_init>:
 8048434:	53                   	push   %ebx
 8048435:	83 ec 08             	sub    $0x8,%esp
 8048438:	e8 33 01 00 00       	call   8048570 <__x86.get_pc_thunk.bx>
 804843d:	81 c3 c3 1b 00 00    	add    $0x1bc3,%ebx
 8048443:	8b 83 f4 ff ff ff    	mov    -0xc(%ebx),%eax
 8048449:	85 c0                	test   %eax,%eax
 804844b:	74 05                	je     8048452 <_init+0x1e>
 804844d:	e8 be 00 00 00       	call   8048510 <__gmon_start__@plt>
 8048452:	83 c4 08             	add    $0x8,%esp
 8048455:	5b                   	pop    %ebx
 8048456:	c3                   	ret    

Disassembly of section .plt:

08048460 <.plt>:
 8048460:	ff 35 04 a0 04 08    	pushl  0x804a004
 8048466:	ff 25 08 a0 04 08    	jmp    *0x804a008
 804846c:	00 00                	add    %al,(%eax)
	...

08048470 <setbuf@plt>:
 8048470:	ff 25 0c a0 04 08    	jmp    *0x804a00c
 8048476:	68 00 00 00 00       	push   $0x0
 804847b:	e9 e0 ff ff ff       	jmp    8048460 <.plt>

08048480 <strcmp@plt>:
 8048480:	ff 25 10 a0 04 08    	jmp    *0x804a010
 8048486:	68 08 00 00 00       	push   $0x8
 804848b:	e9 d0 ff ff ff       	jmp    8048460 <.plt>

08048490 <printf@plt>:
 8048490:	ff 25 14 a0 04 08    	jmp    *0x804a014
 8048496:	68 10 00 00 00       	push   $0x10
 804849b:	e9 c0 ff ff ff       	jmp    8048460 <.plt>

080484a0 <fflush@plt>:
 80484a0:	ff 25 18 a0 04 08    	jmp    *0x804a018
 80484a6:	68 18 00 00 00       	push   $0x18
 80484ab:	e9 b0 ff ff ff       	jmp    8048460 <.plt>

080484b0 <strcpy@plt>:
 80484b0:	ff 25 1c a0 04 08    	jmp    *0x804a01c
 80484b6:	68 20 00 00 00       	push   $0x20
 80484bb:	e9 a0 ff ff ff       	jmp    8048460 <.plt>

080484c0 <puts@plt>:
 80484c0:	ff 25 20 a0 04 08    	jmp    *0x804a020
 80484c6:	68 28 00 00 00       	push   $0x28
 80484cb:	e9 90 ff ff ff       	jmp    8048460 <.plt>

080484d0 <system@plt>:
 80484d0:	ff 25 24 a0 04 08    	jmp    *0x804a024
 80484d6:	68 30 00 00 00       	push   $0x30
 80484db:	e9 80 ff ff ff       	jmp    8048460 <.plt>

080484e0 <exit@plt>:
 80484e0:	ff 25 28 a0 04 08    	jmp    *0x804a028
 80484e6:	68 38 00 00 00       	push   $0x38
 80484eb:	e9 70 ff ff ff       	jmp    8048460 <.plt>

080484f0 <__libc_start_main@plt>:
 80484f0:	ff 25 2c a0 04 08    	jmp    *0x804a02c
 80484f6:	68 40 00 00 00       	push   $0x40
 80484fb:	e9 60 ff ff ff       	jmp    8048460 <.plt>

08048500 <__isoc99_scanf@plt>:
 8048500:	ff 25 30 a0 04 08    	jmp    *0x804a030
 8048506:	68 48 00 00 00       	push   $0x48
 804850b:	e9 50 ff ff ff       	jmp    8048460 <.plt>

Disassembly of section .plt.got:

08048510 <__gmon_start__@plt>:
 8048510:	ff 25 f4 9f 04 08    	jmp    *0x8049ff4
 8048516:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

08048520 <_start>:
 8048520:	31 ed                	xor    %ebp,%ebp
 8048522:	5e                   	pop    %esi
 8048523:	89 e1                	mov    %esp,%ecx
 8048525:	83 e4 f0             	and    $0xfffffff0,%esp
 8048528:	50                   	push   %eax
 8048529:	54                   	push   %esp
 804852a:	52                   	push   %edx
 804852b:	e8 23 00 00 00       	call   8048553 <_start+0x33>
 8048530:	81 c3 d0 1a 00 00    	add    $0x1ad0,%ebx
 8048536:	8d 83 a0 e9 ff ff    	lea    -0x1660(%ebx),%eax
 804853c:	50                   	push   %eax
 804853d:	8d 83 40 e9 ff ff    	lea    -0x16c0(%ebx),%eax
 8048543:	50                   	push   %eax
 8048544:	51                   	push   %ecx
 8048545:	56                   	push   %esi
 8048546:	c7 c0 22 87 04 08    	mov    $0x8048722,%eax
 804854c:	50                   	push   %eax
 804854d:	e8 9e ff ff ff       	call   80484f0 <__libc_start_main@plt>
 8048552:	f4                   	hlt    
 8048553:	8b 1c 24             	mov    (%esp),%ebx
 8048556:	c3                   	ret    
 8048557:	66 90                	xchg   %ax,%ax
 8048559:	66 90                	xchg   %ax,%ax
 804855b:	66 90                	xchg   %ax,%ax
 804855d:	66 90                	xchg   %ax,%ax
 804855f:	90                   	nop

08048560 <_dl_relocate_static_pie>:
 8048560:	f3 c3                	repz ret 
 8048562:	66 90                	xchg   %ax,%ax
 8048564:	66 90                	xchg   %ax,%ax
 8048566:	66 90                	xchg   %ax,%ax
 8048568:	66 90                	xchg   %ax,%ax
 804856a:	66 90                	xchg   %ax,%ax
 804856c:	66 90                	xchg   %ax,%ax
 804856e:	66 90                	xchg   %ax,%ax

08048570 <__x86.get_pc_thunk.bx>:
 8048570:	8b 1c 24             	mov    (%esp),%ebx
 8048573:	c3                   	ret    
 8048574:	66 90                	xchg   %ax,%ax
 8048576:	66 90                	xchg   %ax,%ax
 8048578:	66 90                	xchg   %ax,%ax
 804857a:	66 90                	xchg   %ax,%ax
 804857c:	66 90                	xchg   %ax,%ax
 804857e:	66 90                	xchg   %ax,%ax

08048580 <deregister_tm_clones>:
 8048580:	b8 3c a0 04 08       	mov    $0x804a03c,%eax
 8048585:	3d 3c a0 04 08       	cmp    $0x804a03c,%eax
 804858a:	74 24                	je     80485b0 <deregister_tm_clones+0x30>
 804858c:	b8 00 00 00 00       	mov    $0x0,%eax
 8048591:	85 c0                	test   %eax,%eax
 8048593:	74 1b                	je     80485b0 <deregister_tm_clones+0x30>
 8048595:	55                   	push   %ebp
 8048596:	89 e5                	mov    %esp,%ebp
 8048598:	83 ec 14             	sub    $0x14,%esp
 804859b:	68 3c a0 04 08       	push   $0x804a03c
 80485a0:	ff d0                	call   *%eax
 80485a2:	83 c4 10             	add    $0x10,%esp
 80485a5:	c9                   	leave  
 80485a6:	c3                   	ret    
 80485a7:	89 f6                	mov    %esi,%esi
 80485a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 80485b0:	f3 c3                	repz ret 
 80485b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80485b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080485c0 <register_tm_clones>:
 80485c0:	b8 3c a0 04 08       	mov    $0x804a03c,%eax
 80485c5:	2d 3c a0 04 08       	sub    $0x804a03c,%eax
 80485ca:	c1 f8 02             	sar    $0x2,%eax
 80485cd:	89 c2                	mov    %eax,%edx
 80485cf:	c1 ea 1f             	shr    $0x1f,%edx
 80485d2:	01 d0                	add    %edx,%eax
 80485d4:	d1 f8                	sar    %eax
 80485d6:	74 20                	je     80485f8 <register_tm_clones+0x38>
 80485d8:	ba 00 00 00 00       	mov    $0x0,%edx
 80485dd:	85 d2                	test   %edx,%edx
 80485df:	74 17                	je     80485f8 <register_tm_clones+0x38>
 80485e1:	55                   	push   %ebp
 80485e2:	89 e5                	mov    %esp,%ebp
 80485e4:	83 ec 10             	sub    $0x10,%esp
 80485e7:	50                   	push   %eax
 80485e8:	68 3c a0 04 08       	push   $0x804a03c
 80485ed:	ff d2                	call   *%edx
 80485ef:	83 c4 10             	add    $0x10,%esp
 80485f2:	c9                   	leave  
 80485f3:	c3                   	ret    
 80485f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80485f8:	f3 c3                	repz ret 
 80485fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

08048600 <__do_global_dtors_aux>:
 8048600:	80 3d 3c a0 04 08 00 	cmpb   $0x0,0x804a03c
 8048607:	75 17                	jne    8048620 <__do_global_dtors_aux+0x20>
 8048609:	55                   	push   %ebp
 804860a:	89 e5                	mov    %esp,%ebp
 804860c:	83 ec 08             	sub    $0x8,%esp
 804860f:	e8 6c ff ff ff       	call   8048580 <deregister_tm_clones>
 8048614:	c6 05 3c a0 04 08 01 	movb   $0x1,0x804a03c
 804861b:	c9                   	leave  
 804861c:	c3                   	ret    
 804861d:	8d 76 00             	lea    0x0(%esi),%esi
 8048620:	f3 c3                	repz ret 
 8048622:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8048629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048630 <frame_dummy>:
 8048630:	55                   	push   %ebp
 8048631:	89 e5                	mov    %esp,%ebp
 8048633:	5d                   	pop    %ebp
 8048634:	eb 8a                	jmp    80485c0 <register_tm_clones>

08048636 <AddLog>:
 8048636:	55                   	push   %ebp
 8048637:	89 e5                	mov    %esp,%ebp
 8048639:	53                   	push   %ebx
 804863a:	83 ec 04             	sub    $0x4,%esp
 804863d:	e8 2e ff ff ff       	call   8048570 <__x86.get_pc_thunk.bx>
 8048642:	81 c3 be 19 00 00    	add    $0x19be,%ebx
 8048648:	83 ec 0c             	sub    $0xc,%esp
 804864b:	8d 83 c0 e9 ff ff    	lea    -0x1640(%ebx),%eax
 8048651:	50                   	push   %eax
 8048652:	e8 39 fe ff ff       	call   8048490 <printf@plt>
 8048657:	83 c4 10             	add    $0x10,%esp
 804865a:	83 ec 08             	sub    $0x8,%esp
 804865d:	ff 75 08             	pushl  0x8(%ebp)
 8048660:	8d 83 db e9 ff ff    	lea    -0x1625(%ebx),%eax
 8048666:	50                   	push   %eax
 8048667:	e8 94 fe ff ff       	call   8048500 <__isoc99_scanf@plt>
 804866c:	83 c4 10             	add    $0x10,%esp
 804866f:	90                   	nop
 8048670:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048673:	c9                   	leave  
 8048674:	c3                   	ret    

08048675 <Display>:
 8048675:	55                   	push   %ebp
 8048676:	89 e5                	mov    %esp,%ebp
 8048678:	53                   	push   %ebx
 8048679:	83 ec 04             	sub    $0x4,%esp
 804867c:	e8 af 02 00 00       	call   8048930 <__x86.get_pc_thunk.ax>
 8048681:	05 7f 19 00 00       	add    $0x197f,%eax
 8048686:	83 ec 0c             	sub    $0xc,%esp
 8048689:	ff 75 08             	pushl  0x8(%ebp)
 804868c:	89 c3                	mov    %eax,%ebx
 804868e:	e8 2d fe ff ff       	call   80484c0 <puts@plt>
 8048693:	83 c4 10             	add    $0x10,%esp
 8048696:	90                   	nop
 8048697:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 804869a:	c9                   	leave  
 804869b:	c3                   	ret    

0804869c <Print>:
 804869c:	55                   	push   %ebp
 804869d:	89 e5                	mov    %esp,%ebp
 804869f:	53                   	push   %ebx
 80486a0:	83 ec 04             	sub    $0x4,%esp
 80486a3:	e8 88 02 00 00       	call   8048930 <__x86.get_pc_thunk.ax>
 80486a8:	05 58 19 00 00       	add    $0x1958,%eax
 80486ad:	83 ec 0c             	sub    $0xc,%esp
 80486b0:	8d 90 e1 e9 ff ff    	lea    -0x161f(%eax),%edx
 80486b6:	52                   	push   %edx
 80486b7:	89 c3                	mov    %eax,%ebx
 80486b9:	e8 12 fe ff ff       	call   80484d0 <system@plt>
 80486be:	83 c4 10             	add    $0x10,%esp
 80486c1:	90                   	nop
 80486c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 80486c5:	c9                   	leave  
 80486c6:	c3                   	ret    

080486c7 <GetFlag>:
 80486c7:	55                   	push   %ebp
 80486c8:	89 e5                	mov    %esp,%ebp
 80486ca:	57                   	push   %edi
 80486cb:	53                   	push   %ebx
 80486cc:	83 ec 40             	sub    $0x40,%esp
 80486cf:	e8 9c fe ff ff       	call   8048570 <__x86.get_pc_thunk.bx>
 80486d4:	81 c3 2c 19 00 00    	add    $0x192c,%ebx
 80486da:	c7 45 b8 30 00 00 00 	movl   $0x30,-0x48(%ebp)
 80486e1:	8d 55 bc             	lea    -0x44(%ebp),%edx
 80486e4:	b8 00 00 00 00       	mov    $0x0,%eax
 80486e9:	b9 0f 00 00 00       	mov    $0xf,%ecx
 80486ee:	89 d7                	mov    %edx,%edi
 80486f0:	f3 ab                	rep stos %eax,%es:(%edi)
 80486f2:	83 ec 08             	sub    $0x8,%esp
 80486f5:	ff 75 08             	pushl  0x8(%ebp)
 80486f8:	8d 45 b8             	lea    -0x48(%ebp),%eax
 80486fb:	50                   	push   %eax
 80486fc:	e8 af fd ff ff       	call   80484b0 <strcpy@plt>
 8048701:	83 c4 10             	add    $0x10,%esp
 8048704:	83 ec 08             	sub    $0x8,%esp
 8048707:	8d 45 b8             	lea    -0x48(%ebp),%eax
 804870a:	50                   	push   %eax
 804870b:	8d 83 f5 e9 ff ff    	lea    -0x160b(%ebx),%eax
 8048711:	50                   	push   %eax
 8048712:	e8 79 fd ff ff       	call   8048490 <printf@plt>
 8048717:	83 c4 10             	add    $0x10,%esp
 804871a:	90                   	nop
 804871b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 804871e:	5b                   	pop    %ebx
 804871f:	5f                   	pop    %edi
 8048720:	5d                   	pop    %ebp
 8048721:	c3                   	ret    

08048722 <main>:
 8048722:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 8048726:	83 e4 f0             	and    $0xfffffff0,%esp
 8048729:	ff 71 fc             	pushl  -0x4(%ecx)
 804872c:	55                   	push   %ebp
 804872d:	89 e5                	mov    %esp,%ebp
 804872f:	57                   	push   %edi
 8048730:	53                   	push   %ebx
 8048731:	51                   	push   %ecx
 8048732:	81 ec fc 00 00 00    	sub    $0xfc,%esp
 8048738:	e8 33 fe ff ff       	call   8048570 <__x86.get_pc_thunk.bx>
 804873d:	81 c3 c3 18 00 00    	add    $0x18c3,%ebx
 8048743:	8b 83 f8 ff ff ff    	mov    -0x8(%ebx),%eax
 8048749:	8b 00                	mov    (%eax),%eax
 804874b:	83 ec 08             	sub    $0x8,%esp
 804874e:	6a 00                	push   $0x0
 8048750:	50                   	push   %eax
 8048751:	e8 1a fd ff ff       	call   8048470 <setbuf@plt>
 8048756:	83 c4 10             	add    $0x10,%esp
 8048759:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 804875f:	8b 00                	mov    (%eax),%eax
 8048761:	83 ec 08             	sub    $0x8,%esp
 8048764:	6a 00                	push   $0x0
 8048766:	50                   	push   %eax
 8048767:	e8 04 fd ff ff       	call   8048470 <setbuf@plt>
 804876c:	83 c4 10             	add    $0x10,%esp
 804876f:	8b 83 f0 ff ff ff    	mov    -0x10(%ebx),%eax
 8048775:	8b 00                	mov    (%eax),%eax
 8048777:	83 ec 08             	sub    $0x8,%esp
 804877a:	6a 00                	push   $0x0
 804877c:	50                   	push   %eax
 804877d:	e8 ee fc ff ff       	call   8048470 <setbuf@plt>
 8048782:	83 c4 10             	add    $0x10,%esp
 8048785:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 804878b:	8b 00                	mov    (%eax),%eax
 804878d:	83 ec 0c             	sub    $0xc,%esp
 8048790:	50                   	push   %eax
 8048791:	e8 0a fd ff ff       	call   80484a0 <fflush@plt>
 8048796:	83 c4 10             	add    $0x10,%esp
 8048799:	c7 45 84 30 00 00 00 	movl   $0x30,-0x7c(%ebp)
 80487a0:	8d 55 88             	lea    -0x78(%ebp),%edx
 80487a3:	b8 00 00 00 00       	mov    $0x0,%eax
 80487a8:	b9 18 00 00 00       	mov    $0x18,%ecx
 80487ad:	89 d7                	mov    %edx,%edi
 80487af:	f3 ab                	rep stos %eax,%es:(%edi)
 80487b1:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%ebp)
 80487b8:	00 00 00 
 80487bb:	8d 95 08 ff ff ff    	lea    -0xf8(%ebp),%edx
 80487c1:	b8 00 00 00 00       	mov    $0x0,%eax
 80487c6:	b9 1f 00 00 00       	mov    $0x1f,%ecx
 80487cb:	89 d7                	mov    %edx,%edi
 80487cd:	f3 ab                	rep stos %eax,%es:(%edi)
 80487cf:	83 ec 0c             	sub    $0xc,%esp
 80487d2:	8d 83 0e ea ff ff    	lea    -0x15f2(%ebx),%eax
 80487d8:	50                   	push   %eax
 80487d9:	e8 e2 fc ff ff       	call   80484c0 <puts@plt>
 80487de:	83 c4 10             	add    $0x10,%esp
 80487e1:	83 ec 0c             	sub    $0xc,%esp
 80487e4:	8d 83 22 ea ff ff    	lea    -0x15de(%ebx),%eax
 80487ea:	50                   	push   %eax
 80487eb:	e8 a0 fc ff ff       	call   8048490 <printf@plt>
 80487f0:	83 c4 10             	add    $0x10,%esp
 80487f3:	83 ec 08             	sub    $0x8,%esp
 80487f6:	8d 45 84             	lea    -0x7c(%ebp),%eax
 80487f9:	50                   	push   %eax
 80487fa:	8d 83 3f ea ff ff    	lea    -0x15c1(%ebx),%eax
 8048800:	50                   	push   %eax
 8048801:	e8 fa fc ff ff       	call   8048500 <__isoc99_scanf@plt>
 8048806:	83 c4 10             	add    $0x10,%esp
 8048809:	83 ec 08             	sub    $0x8,%esp
 804880c:	8d 83 45 ea ff ff    	lea    -0x15bb(%ebx),%eax
 8048812:	50                   	push   %eax
 8048813:	8d 45 84             	lea    -0x7c(%ebp),%eax
 8048816:	50                   	push   %eax
 8048817:	e8 64 fc ff ff       	call   8048480 <strcmp@plt>
 804881c:	83 c4 10             	add    $0x10,%esp
 804881f:	85 c0                	test   %eax,%eax
 8048821:	74 1c                	je     804883f <main+0x11d>
 8048823:	83 ec 0c             	sub    $0xc,%esp
 8048826:	8d 83 53 ea ff ff    	lea    -0x15ad(%ebx),%eax
 804882c:	50                   	push   %eax
 804882d:	e8 8e fc ff ff       	call   80484c0 <puts@plt>
 8048832:	83 c4 10             	add    $0x10,%esp
 8048835:	83 ec 0c             	sub    $0xc,%esp
 8048838:	6a 00                	push   $0x0
 804883a:	e8 a1 fc ff ff       	call   80484e0 <exit@plt>
 804883f:	83 ec 0c             	sub    $0xc,%esp
 8048842:	8d 83 63 ea ff ff    	lea    -0x159d(%ebx),%eax
 8048848:	50                   	push   %eax
 8048849:	e8 72 fc ff ff       	call   80484c0 <puts@plt>
 804884e:	83 c4 10             	add    $0x10,%esp
 8048851:	83 ec 0c             	sub    $0xc,%esp
 8048854:	8d 83 6c ea ff ff    	lea    -0x1594(%ebx),%eax
 804885a:	50                   	push   %eax
 804885b:	e8 60 fc ff ff       	call   80484c0 <puts@plt>
 8048860:	83 c4 10             	add    $0x10,%esp
 8048863:	83 ec 0c             	sub    $0xc,%esp
 8048866:	8d 83 82 ea ff ff    	lea    -0x157e(%ebx),%eax
 804886c:	50                   	push   %eax
 804886d:	e8 4e fc ff ff       	call   80484c0 <puts@plt>
 8048872:	83 c4 10             	add    $0x10,%esp
 8048875:	83 ec 0c             	sub    $0xc,%esp
 8048878:	8d 83 8f ea ff ff    	lea    -0x1571(%ebx),%eax
 804887e:	50                   	push   %eax
 804887f:	e8 3c fc ff ff       	call   80484c0 <puts@plt>
 8048884:	83 c4 10             	add    $0x10,%esp
 8048887:	83 ec 0c             	sub    $0xc,%esp
 804888a:	8d 83 a3 ea ff ff    	lea    -0x155d(%ebx),%eax
 8048890:	50                   	push   %eax
 8048891:	e8 2a fc ff ff       	call   80484c0 <puts@plt>
 8048896:	83 c4 10             	add    $0x10,%esp
 8048899:	83 ec 0c             	sub    $0xc,%esp
 804889c:	8d 83 b5 ea ff ff    	lea    -0x154b(%ebx),%eax
 80488a2:	50                   	push   %eax
 80488a3:	e8 e8 fb ff ff       	call   8048490 <printf@plt>
 80488a8:	83 c4 10             	add    $0x10,%esp
 80488ab:	83 ec 08             	sub    $0x8,%esp
 80488ae:	8d 85 00 ff ff ff    	lea    -0x100(%ebp),%eax
 80488b4:	50                   	push   %eax
 80488b5:	8d 83 be ea ff ff    	lea    -0x1542(%ebx),%eax
 80488bb:	50                   	push   %eax
 80488bc:	e8 3f fc ff ff       	call   8048500 <__isoc99_scanf@plt>
 80488c1:	83 c4 10             	add    $0x10,%esp
 80488c4:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
 80488ca:	83 f8 04             	cmp    $0x4,%eax
 80488cd:	77 5b                	ja     804892a <.L8+0xa>
 80488cf:	c1 e0 02             	shl    $0x2,%eax
 80488d2:	8b 84 18 c4 ea ff ff 	mov    -0x153c(%eax,%ebx,1),%eax
 80488d9:	01 d8                	add    %ebx,%eax
 80488db:	ff e0                	jmp    *%eax

080488dd <.L10>:
 80488dd:	83 ec 0c             	sub    $0xc,%esp
 80488e0:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
 80488e6:	50                   	push   %eax
 80488e7:	e8 4a fd ff ff       	call   8048636 <AddLog>
 80488ec:	83 c4 10             	add    $0x10,%esp
 80488ef:	eb 3a                	jmp    804892b <.L8+0xb>

080488f1 <.L11>:
 80488f1:	83 ec 0c             	sub    $0xc,%esp
 80488f4:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
 80488fa:	50                   	push   %eax
 80488fb:	e8 75 fd ff ff       	call   8048675 <Display>
 8048900:	83 c4 10             	add    $0x10,%esp
 8048903:	eb 26                	jmp    804892b <.L8+0xb>

08048905 <.L12>:
 8048905:	e8 92 fd ff ff       	call   804869c <Print>
 804890a:	eb 1f                	jmp    804892b <.L8+0xb>

0804890c <.L13>:
 804890c:	83 ec 0c             	sub    $0xc,%esp
 804890f:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
 8048915:	50                   	push   %eax
 8048916:	e8 ac fd ff ff       	call   80486c7 <GetFlag>
 804891b:	83 c4 10             	add    $0x10,%esp
 804891e:	eb 0b                	jmp    804892b <.L8+0xb>

08048920 <.L8>:
 8048920:	83 ec 0c             	sub    $0xc,%esp
 8048923:	6a 00                	push   $0x0
 8048925:	e8 b6 fb ff ff       	call   80484e0 <exit@plt>
 804892a:	90                   	nop
 804892b:	e9 21 ff ff ff       	jmp    8048851 <main+0x12f>

08048930 <__x86.get_pc_thunk.ax>:
 8048930:	8b 04 24             	mov    (%esp),%eax
 8048933:	c3                   	ret    
 8048934:	66 90                	xchg   %ax,%ax
 8048936:	66 90                	xchg   %ax,%ax
 8048938:	66 90                	xchg   %ax,%ax
 804893a:	66 90                	xchg   %ax,%ax
 804893c:	66 90                	xchg   %ax,%ax
 804893e:	66 90                	xchg   %ax,%ax

08048940 <__libc_csu_init>:
 8048940:	55                   	push   %ebp
 8048941:	57                   	push   %edi
 8048942:	56                   	push   %esi
 8048943:	53                   	push   %ebx
 8048944:	e8 27 fc ff ff       	call   8048570 <__x86.get_pc_thunk.bx>
 8048949:	81 c3 b7 16 00 00    	add    $0x16b7,%ebx
 804894f:	83 ec 0c             	sub    $0xc,%esp
 8048952:	8b 6c 24 28          	mov    0x28(%esp),%ebp
 8048956:	8d b3 04 ff ff ff    	lea    -0xfc(%ebx),%esi
 804895c:	e8 d3 fa ff ff       	call   8048434 <_init>
 8048961:	8d 83 00 ff ff ff    	lea    -0x100(%ebx),%eax
 8048967:	29 c6                	sub    %eax,%esi
 8048969:	c1 fe 02             	sar    $0x2,%esi
 804896c:	85 f6                	test   %esi,%esi
 804896e:	74 25                	je     8048995 <__libc_csu_init+0x55>
 8048970:	31 ff                	xor    %edi,%edi
 8048972:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048978:	83 ec 04             	sub    $0x4,%esp
 804897b:	55                   	push   %ebp
 804897c:	ff 74 24 2c          	pushl  0x2c(%esp)
 8048980:	ff 74 24 2c          	pushl  0x2c(%esp)
 8048984:	ff 94 bb 00 ff ff ff 	call   *-0x100(%ebx,%edi,4)
 804898b:	83 c7 01             	add    $0x1,%edi
 804898e:	83 c4 10             	add    $0x10,%esp
 8048991:	39 fe                	cmp    %edi,%esi
 8048993:	75 e3                	jne    8048978 <__libc_csu_init+0x38>
 8048995:	83 c4 0c             	add    $0xc,%esp
 8048998:	5b                   	pop    %ebx
 8048999:	5e                   	pop    %esi
 804899a:	5f                   	pop    %edi
 804899b:	5d                   	pop    %ebp
 804899c:	c3                   	ret    
 804899d:	8d 76 00             	lea    0x0(%esi),%esi

080489a0 <__libc_csu_fini>:
 80489a0:	f3 c3                	repz ret 

Disassembly of section .fini:

080489a4 <_fini>:
 80489a4:	53                   	push   %ebx
 80489a5:	83 ec 08             	sub    $0x8,%esp
 80489a8:	e8 c3 fb ff ff       	call   8048570 <__x86.get_pc_thunk.bx>
 80489ad:	81 c3 53 16 00 00    	add    $0x1653,%ebx
 80489b3:	83 c4 08             	add    $0x8,%esp
 80489b6:	5b                   	pop    %ebx
 80489b7:	c3                   	ret    
