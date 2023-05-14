
ret2dlresolve-pwn200：     文件格式 elf32-i386


Disassembly of section .init:

08048340 <.init>:
 8048340:	53                   	push   %ebx
 8048341:	83 ec 08             	sub    $0x8,%esp
 8048344:	e8 00 00 00 00       	call   8048349 <setbuf@plt-0x37>
 8048349:	5b                   	pop    %ebx
 804834a:	81 c3 ab 1c 00 00    	add    $0x1cab,%ebx
 8048350:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 8048356:	85 c0                	test   %eax,%eax
 8048358:	74 05                	je     804835f <setbuf@plt-0x21>
 804835a:	e8 41 00 00 00       	call   80483a0 <__gmon_start__@plt>
 804835f:	e8 fc 00 00 00       	call   8048460 <write@plt+0xa0>
 8048364:	e8 87 02 00 00       	call   80485f0 <write@plt+0x230>
 8048369:	83 c4 08             	add    $0x8,%esp
 804836c:	5b                   	pop    %ebx
 804836d:	c3                   	ret    

Disassembly of section .plt:

08048370 <setbuf@plt-0x10>:
 8048370:	ff 35 f8 9f 04 08    	pushl  0x8049ff8
 8048376:	ff 25 fc 9f 04 08    	jmp    *0x8049ffc
 804837c:	00 00                	add    %al,(%eax)
	...

08048380 <setbuf@plt>:
 8048380:	ff 25 00 a0 04 08    	jmp    *0x804a000
 8048386:	68 00 00 00 00       	push   $0x0
 804838b:	e9 e0 ff ff ff       	jmp    8048370 <setbuf@plt-0x10>

08048390 <read@plt>:
 8048390:	ff 25 04 a0 04 08    	jmp    *0x804a004
 8048396:	68 08 00 00 00       	push   $0x8
 804839b:	e9 d0 ff ff ff       	jmp    8048370 <setbuf@plt-0x10>

080483a0 <__gmon_start__@plt>:
 80483a0:	ff 25 08 a0 04 08    	jmp    *0x804a008
 80483a6:	68 10 00 00 00       	push   $0x10
 80483ab:	e9 c0 ff ff ff       	jmp    8048370 <setbuf@plt-0x10>

080483b0 <__libc_start_main@plt>:
 80483b0:	ff 25 0c a0 04 08    	jmp    *0x804a00c
 80483b6:	68 18 00 00 00       	push   $0x18
 80483bb:	e9 b0 ff ff ff       	jmp    8048370 <setbuf@plt-0x10>

080483c0 <write@plt>:
 80483c0:	ff 25 10 a0 04 08    	jmp    *0x804a010
 80483c6:	68 20 00 00 00       	push   $0x20
 80483cb:	e9 a0 ff ff ff       	jmp    8048370 <setbuf@plt-0x10>

Disassembly of section .text:

080483d0 <.text>:
 80483d0:	31 ed                	xor    %ebp,%ebp
 80483d2:	5e                   	pop    %esi
 80483d3:	89 e1                	mov    %esp,%ecx
 80483d5:	83 e4 f0             	and    $0xfffffff0,%esp
 80483d8:	50                   	push   %eax
 80483d9:	54                   	push   %esp
 80483da:	52                   	push   %edx
 80483db:	68 e0 85 04 08       	push   $0x80485e0
 80483e0:	68 70 85 04 08       	push   $0x8048570
 80483e5:	51                   	push   %ecx
 80483e6:	56                   	push   %esi
 80483e7:	68 be 84 04 08       	push   $0x80484be
 80483ec:	e8 bf ff ff ff       	call   80483b0 <__libc_start_main@plt>
 80483f1:	f4                   	hlt    
 80483f2:	90                   	nop
 80483f3:	90                   	nop
 80483f4:	90                   	nop
 80483f5:	90                   	nop
 80483f6:	90                   	nop
 80483f7:	90                   	nop
 80483f8:	90                   	nop
 80483f9:	90                   	nop
 80483fa:	90                   	nop
 80483fb:	90                   	nop
 80483fc:	90                   	nop
 80483fd:	90                   	nop
 80483fe:	90                   	nop
 80483ff:	90                   	nop
 8048400:	55                   	push   %ebp
 8048401:	89 e5                	mov    %esp,%ebp
 8048403:	53                   	push   %ebx
 8048404:	83 ec 04             	sub    $0x4,%esp
 8048407:	80 3d 44 a0 04 08 00 	cmpb   $0x0,0x804a044
 804840e:	75 3f                	jne    804844f <write@plt+0x8f>
 8048410:	a1 48 a0 04 08       	mov    0x804a048,%eax
 8048415:	bb 20 9f 04 08       	mov    $0x8049f20,%ebx
 804841a:	81 eb 1c 9f 04 08    	sub    $0x8049f1c,%ebx
 8048420:	c1 fb 02             	sar    $0x2,%ebx
 8048423:	83 eb 01             	sub    $0x1,%ebx
 8048426:	39 d8                	cmp    %ebx,%eax
 8048428:	73 1e                	jae    8048448 <write@plt+0x88>
 804842a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048430:	83 c0 01             	add    $0x1,%eax
 8048433:	a3 48 a0 04 08       	mov    %eax,0x804a048
 8048438:	ff 14 85 1c 9f 04 08 	call   *0x8049f1c(,%eax,4)
 804843f:	a1 48 a0 04 08       	mov    0x804a048,%eax
 8048444:	39 d8                	cmp    %ebx,%eax
 8048446:	72 e8                	jb     8048430 <write@plt+0x70>
 8048448:	c6 05 44 a0 04 08 01 	movb   $0x1,0x804a044
 804844f:	83 c4 04             	add    $0x4,%esp
 8048452:	5b                   	pop    %ebx
 8048453:	5d                   	pop    %ebp
 8048454:	c3                   	ret    
 8048455:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8048460:	55                   	push   %ebp
 8048461:	89 e5                	mov    %esp,%ebp
 8048463:	83 ec 18             	sub    $0x18,%esp
 8048466:	a1 24 9f 04 08       	mov    0x8049f24,%eax
 804846b:	85 c0                	test   %eax,%eax
 804846d:	74 12                	je     8048481 <write@plt+0xc1>
 804846f:	b8 00 00 00 00       	mov    $0x0,%eax
 8048474:	85 c0                	test   %eax,%eax
 8048476:	74 09                	je     8048481 <write@plt+0xc1>
 8048478:	c7 04 24 24 9f 04 08 	movl   $0x8049f24,(%esp)
 804847f:	ff d0                	call   *%eax
 8048481:	c9                   	leave  
 8048482:	c3                   	ret    
 8048483:	90                   	nop
 8048484:	55                   	push   %ebp
 8048485:	89 e5                	mov    %esp,%ebp
 8048487:	81 ec 88 00 00 00    	sub    $0x88,%esp
 804848d:	a1 20 a0 04 08       	mov    0x804a020,%eax
 8048492:	8d 55 94             	lea    -0x6c(%ebp),%edx
 8048495:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048499:	89 04 24             	mov    %eax,(%esp)
 804849c:	e8 df fe ff ff       	call   8048380 <setbuf@plt>
 80484a1:	c7 44 24 08 00 01 00 	movl   $0x100,0x8(%esp)
 80484a8:	00 
 80484a9:	8d 45 94             	lea    -0x6c(%ebp),%eax
 80484ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 80484b0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 80484b7:	e8 d4 fe ff ff       	call   8048390 <read@plt>
 80484bc:	c9                   	leave  
 80484bd:	c3                   	ret    

# ------------------------main-----------------------------
 80484be:	55                   	push   %ebp
 80484bf:	89 e5                	mov    %esp,%ebp
 80484c1:	57                   	push   %edi
 80484c2:	53                   	push   %ebx
 80484c3:	83 e4 f0             	and    $0xfffffff0,%esp
 80484c6:	81 ec 90 00 00 00    	sub    $0x90,%esp
 80484cc:	c7 44 24 2c 57 65 6c 	movl   $0x636c6557,0x2c(%esp)
 80484d3:	63 
 80484d4:	c7 44 24 30 6f 6d 65 	movl   $0x20656d6f,0x30(%esp)
 80484db:	20 
 80484dc:	c7 44 24 34 74 6f 20 	movl   $0x58206f74,0x34(%esp)
 80484e3:	58 
 80484e4:	c7 44 24 38 44 43 54 	movl   $0x46544344,0x38(%esp)
 80484eb:	46 
 80484ec:	c7 44 24 3c 32 30 31 	movl   $0x35313032,0x3c(%esp)
 80484f3:	35 
 80484f4:	c7 44 24 40 7e 21 0a 	movl   $0xa217e,0x40(%esp)
 80484fb:	00 
 80484fc:	8d 5c 24 44          	lea    0x44(%esp),%ebx
 8048500:	b8 00 00 00 00       	mov    $0x0,%eax
 8048505:	ba 13 00 00 00       	mov    $0x13,%edx
 804850a:	89 df                	mov    %ebx,%edi
 804850c:	89 d1                	mov    %edx,%ecx
 804850e:	f3 ab                	rep stos %eax,%es:(%edi)
 8048510:	a1 40 a0 04 08       	mov    0x804a040,%eax
 8048515:	8d 54 24 2c          	lea    0x2c(%esp),%edx
 8048519:	89 54 24 04          	mov    %edx,0x4(%esp)
 804851d:	89 04 24             	mov    %eax,(%esp)
 8048520:	e8 5b fe ff ff       	call   8048380 <setbuf@plt>
 8048525:	8d 44 24 2c          	lea    0x2c(%esp),%eax
 8048529:	c7 44 24 1c ff ff ff 	movl   $0xffffffff,0x1c(%esp)
 8048530:	ff 
 8048531:	89 c2                	mov    %eax,%edx
 8048533:	b8 00 00 00 00       	mov    $0x0,%eax
 8048538:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
 804853c:	89 d7                	mov    %edx,%edi
 804853e:	f2 ae                	repnz scas %es:(%edi),%al
 8048540:	89 c8                	mov    %ecx,%eax
 8048542:	f7 d0                	not    %eax
 8048544:	83 e8 01             	sub    $0x1,%eax
 8048547:	89 44 24 08          	mov    %eax,0x8(%esp)
 804854b:	8d 44 24 2c          	lea    0x2c(%esp),%eax
 804854f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048553:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804855a:	e8 61 fe ff ff       	call   80483c0 <write@plt>
 804855f:	e8 20 ff ff ff       	call   8048484 <write@plt+0xc4> #  backdoor
 i048564:	b8 00 00 00 00       	mov    $0x0,%eax
 8048569:	8d 65 f8             	lea    -0x8(%ebp),%esp
 804856c:	5b                   	pop    %ebx
 804856d:	5f                   	pop    %edi
 804856e:	5d                   	pop    %ebp
 804856f:	c3                   	ret    
# --------------------------------------------------------------------------------------

 8048570:	55                   	push   %ebp
 8048571:	57                   	push   %edi
 8048572:	56                   	push   %esi
 8048573:	53                   	push   %ebx
 8048574:	e8 69 00 00 00       	call   80485e2 <write@plt+0x222>
 8048579:	81 c3 7b 1a 00 00    	add    $0x1a7b,%ebx
 804857f:	83 ec 1c             	sub    $0x1c,%esp
 8048582:	8b 6c 24 30          	mov    0x30(%esp),%ebp
 8048586:	8d bb 20 ff ff ff    	lea    -0xe0(%ebx),%edi
 804858c:	e8 af fd ff ff       	call   8048340 <setbuf@plt-0x40>
 8048591:	8d 83 20 ff ff ff    	lea    -0xe0(%ebx),%eax
 8048597:	29 c7                	sub    %eax,%edi
 8048599:	c1 ff 02             	sar    $0x2,%edi
 804859c:	85 ff                	test   %edi,%edi
 804859e:	74 29                	je     80485c9 <write@plt+0x209>
 80485a0:	31 f6                	xor    %esi,%esi
 80485a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80485a8:	8b 44 24 38          	mov    0x38(%esp),%eax
 80485ac:	89 2c 24             	mov    %ebp,(%esp)
 80485af:	89 44 24 08          	mov    %eax,0x8(%esp)
 80485b3:	8b 44 24 34          	mov    0x34(%esp),%eax
 80485b7:	89 44 24 04          	mov    %eax,0x4(%esp)
 80485bb:	ff 94 b3 20 ff ff ff 	call   *-0xe0(%ebx,%esi,4)
 80485c2:	83 c6 01             	add    $0x1,%esi
 80485c5:	39 fe                	cmp    %edi,%esi
 80485c7:	75 df                	jne    80485a8 <write@plt+0x1e8>
 80485c9:	83 c4 1c             	add    $0x1c,%esp
 80485cc:	5b                   	pop    %ebx
 80485cd:	5e                   	pop    %esi
 80485ce:	5f                   	pop    %edi
 80485cf:	5d                   	pop    %ebp
 80485d0:	c3                   	ret    
 80485d1:	eb 0d                	jmp    80485e0 <write@plt+0x220>
 80485d3:	90                   	nop
 80485d4:	90                   	nop
 80485d5:	90                   	nop
 80485d6:	90                   	nop
 80485d7:	90                   	nop
 80485d8:	90                   	nop
 80485d9:	90                   	nop
 80485da:	90                   	nop
 80485db:	90                   	nop
 80485dc:	90                   	nop
 80485dd:	90                   	nop
 80485de:	90                   	nop
 80485df:	90                   	nop
 80485e0:	f3 c3                	repz ret 
 80485e2:	8b 1c 24             	mov    (%esp),%ebx
 80485e5:	c3                   	ret    
 80485e6:	90                   	nop
 80485e7:	90                   	nop
 80485e8:	90                   	nop
 80485e9:	90                   	nop
 80485ea:	90                   	nop
 80485eb:	90                   	nop
 80485ec:	90                   	nop
 80485ed:	90                   	nop
 80485ee:	90                   	nop
 80485ef:	90                   	nop
 80485f0:	55                   	push   %ebp
 80485f1:	89 e5                	mov    %esp,%ebp
 80485f3:	53                   	push   %ebx
 80485f4:	83 ec 04             	sub    $0x4,%esp
 80485f7:	a1 14 9f 04 08       	mov    0x8049f14,%eax
 80485fc:	83 f8 ff             	cmp    $0xffffffff,%eax
 80485ff:	74 13                	je     8048614 <write@plt+0x254>
 8048601:	bb 14 9f 04 08       	mov    $0x8049f14,%ebx
 8048606:	66 90                	xchg   %ax,%ax
 8048608:	83 eb 04             	sub    $0x4,%ebx
 804860b:	ff d0                	call   *%eax
 804860d:	8b 03                	mov    (%ebx),%eax
 804860f:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048612:	75 f4                	jne    8048608 <write@plt+0x248>
 8048614:	83 c4 04             	add    $0x4,%esp
 8048617:	5b                   	pop    %ebx
 8048618:	5d                   	pop    %ebp
 8048619:	c3                   	ret    
 804861a:	90                   	nop
 804861b:	90                   	nop

Disassembly of section .fini:

0804861c <.fini>:
 804861c:	53                   	push   %ebx
 804861d:	83 ec 08             	sub    $0x8,%esp
 8048620:	e8 00 00 00 00       	call   8048625 <write@plt+0x265>
 8048625:	5b                   	pop    %ebx
 8048626:	81 c3 cf 19 00 00    	add    $0x19cf,%ebx
 804862c:	e8 cf fd ff ff       	call   8048400 <write@plt+0x40>
 8048631:	83 c4 08             	add    $0x8,%esp
 8048634:	5b                   	pop    %ebx
 8048635:	c3                   	ret    
