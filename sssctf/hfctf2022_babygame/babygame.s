
babygame：     文件格式 elf64-x86-64


Disassembly of section .init:

0000000000001000 <.init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <rand@plt+0x2e78>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <__cxa_finalize@plt-0xba>
    1014:	ff d0                	callq  *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	retq   

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 52 2f 00 00    	pushq  0x2f52(%rip)        # 3f78 <rand@plt+0x2e08>
    1026:	f2 ff 25 53 2f 00 00 	bnd jmpq *0x2f53(%rip)        # 3f80 <rand@plt+0x2e10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	pushq  $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmpq 1020 <__cxa_finalize@plt-0xb0>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	pushq  $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmpq 1020 <__cxa_finalize@plt-0xb0>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	pushq  $0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmpq 1020 <__cxa_finalize@plt-0xb0>
    105f:	90                   	nop
    1060:	f3 0f 1e fa          	endbr64 
    1064:	68 03 00 00 00       	pushq  $0x3
    1069:	f2 e9 b1 ff ff ff    	bnd jmpq 1020 <__cxa_finalize@plt-0xb0>
    106f:	90                   	nop
    1070:	f3 0f 1e fa          	endbr64 
    1074:	68 04 00 00 00       	pushq  $0x4
    1079:	f2 e9 a1 ff ff ff    	bnd jmpq 1020 <__cxa_finalize@plt-0xb0>
    107f:	90                   	nop
    1080:	f3 0f 1e fa          	endbr64 
    1084:	68 05 00 00 00       	pushq  $0x5
    1089:	f2 e9 91 ff ff ff    	bnd jmpq 1020 <__cxa_finalize@plt-0xb0>
    108f:	90                   	nop
    1090:	f3 0f 1e fa          	endbr64 
    1094:	68 06 00 00 00       	pushq  $0x6
    1099:	f2 e9 81 ff ff ff    	bnd jmpq 1020 <__cxa_finalize@plt-0xb0>
    109f:	90                   	nop
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	68 07 00 00 00       	pushq  $0x7
    10a9:	f2 e9 71 ff ff ff    	bnd jmpq 1020 <__cxa_finalize@plt-0xb0>
    10af:	90                   	nop
    10b0:	f3 0f 1e fa          	endbr64 
    10b4:	68 08 00 00 00       	pushq  $0x8
    10b9:	f2 e9 61 ff ff ff    	bnd jmpq 1020 <__cxa_finalize@plt-0xb0>
    10bf:	90                   	nop
    10c0:	f3 0f 1e fa          	endbr64 
    10c4:	68 09 00 00 00       	pushq  $0x9
    10c9:	f2 e9 51 ff ff ff    	bnd jmpq 1020 <__cxa_finalize@plt-0xb0>
    10cf:	90                   	nop

Disassembly of section .plt.got:

00000000000010d0 <__cxa_finalize@plt>:
    10d0:	f3 0f 1e fa          	endbr64 
    10d4:	f2 ff 25 1d 2f 00 00 	bnd jmpq *0x2f1d(%rip)        # 3ff8 <rand@plt+0x2e88>
    10db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

00000000000010e0 <puts@plt>:
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	f2 ff 25 9d 2e 00 00 	bnd jmpq *0x2e9d(%rip)        # 3f88 <rand@plt+0x2e18>
    10eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010f0 <__stack_chk_fail@plt>:
    10f0:	f3 0f 1e fa          	endbr64 
    10f4:	f2 ff 25 95 2e 00 00 	bnd jmpq *0x2e95(%rip)        # 3f90 <rand@plt+0x2e20>
    10fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001100 <setbuf@plt>:
    1100:	f3 0f 1e fa          	endbr64 
    1104:	f2 ff 25 8d 2e 00 00 	bnd jmpq *0x2e8d(%rip)        # 3f98 <rand@plt+0x2e28>
    110b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001110 <printf@plt>:
    1110:	f3 0f 1e fa          	endbr64 
    1114:	f2 ff 25 85 2e 00 00 	bnd jmpq *0x2e85(%rip)        # 3fa0 <rand@plt+0x2e30>
    111b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001120 <memset@plt>:
    1120:	f3 0f 1e fa          	endbr64 
    1124:	f2 ff 25 7d 2e 00 00 	bnd jmpq *0x2e7d(%rip)        # 3fa8 <rand@plt+0x2e38>
    112b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001130 <read@plt>:
    1130:	f3 0f 1e fa          	endbr64 
    1134:	f2 ff 25 75 2e 00 00 	bnd jmpq *0x2e75(%rip)        # 3fb0 <rand@plt+0x2e40>
    113b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001140 <srand@plt>:
    1140:	f3 0f 1e fa          	endbr64 
    1144:	f2 ff 25 6d 2e 00 00 	bnd jmpq *0x2e6d(%rip)        # 3fb8 <rand@plt+0x2e48>
    114b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001150 <time@plt>:
    1150:	f3 0f 1e fa          	endbr64 
    1154:	f2 ff 25 65 2e 00 00 	bnd jmpq *0x2e65(%rip)        # 3fc0 <rand@plt+0x2e50>
    115b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001160 <atoi@plt>:
    1160:	f3 0f 1e fa          	endbr64 
    1164:	f2 ff 25 5d 2e 00 00 	bnd jmpq *0x2e5d(%rip)        # 3fc8 <rand@plt+0x2e58>
    116b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001170 <rand@plt>:
    1170:	f3 0f 1e fa          	endbr64 
    1174:	f2 ff 25 55 2e 00 00 	bnd jmpq *0x2e55(%rip)        # 3fd0 <rand@plt+0x2e60>
    117b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000001180 <.text>:
    1180:	f3 0f 1e fa          	endbr64 
    1184:	31 ed                	xor    %ebp,%ebp
    1186:	49 89 d1             	mov    %rdx,%r9
    1189:	5e                   	pop    %rsi
    118a:	48 89 e2             	mov    %rsp,%rdx
    118d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1191:	50                   	push   %rax
    1192:	54                   	push   %rsp
    1193:	4c 8d 05 46 04 00 00 	lea    0x446(%rip),%r8        # 15e0 <rand@plt+0x470>
    119a:	48 8d 0d cf 03 00 00 	lea    0x3cf(%rip),%rcx        # 1570 <rand@plt+0x400>
    11a1:	48 8d 3d bd 02 00 00 	lea    0x2bd(%rip),%rdi        # 1465 <rand@plt+0x2f5>
    11a8:	ff 15 32 2e 00 00    	callq  *0x2e32(%rip)        # 3fe0 <rand@plt+0x2e70>
    11ae:	f4                   	hlt    
    11af:	90                   	nop
    11b0:	48 8d 3d 59 2e 00 00 	lea    0x2e59(%rip),%rdi        # 4010 <stdout@@GLIBC_2.2.5>
    11b7:	48 8d 05 52 2e 00 00 	lea    0x2e52(%rip),%rax        # 4010 <stdout@@GLIBC_2.2.5>
    11be:	48 39 f8             	cmp    %rdi,%rax
    11c1:	74 15                	je     11d8 <rand@plt+0x68>
    11c3:	48 8b 05 0e 2e 00 00 	mov    0x2e0e(%rip),%rax        # 3fd8 <rand@plt+0x2e68>
    11ca:	48 85 c0             	test   %rax,%rax
    11cd:	74 09                	je     11d8 <rand@plt+0x68>
    11cf:	ff e0                	jmpq   *%rax
    11d1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    11d8:	c3                   	retq   
    11d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    11e0:	48 8d 3d 29 2e 00 00 	lea    0x2e29(%rip),%rdi        # 4010 <stdout@@GLIBC_2.2.5>
    11e7:	48 8d 35 22 2e 00 00 	lea    0x2e22(%rip),%rsi        # 4010 <stdout@@GLIBC_2.2.5>
    11ee:	48 29 fe             	sub    %rdi,%rsi
    11f1:	48 89 f0             	mov    %rsi,%rax
    11f4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    11f8:	48 c1 f8 03          	sar    $0x3,%rax
    11fc:	48 01 c6             	add    %rax,%rsi
    11ff:	48 d1 fe             	sar    %rsi
    1202:	74 14                	je     1218 <rand@plt+0xa8>
    1204:	48 8b 05 e5 2d 00 00 	mov    0x2de5(%rip),%rax        # 3ff0 <rand@plt+0x2e80>
    120b:	48 85 c0             	test   %rax,%rax
    120e:	74 08                	je     1218 <rand@plt+0xa8>
    1210:	ff e0                	jmpq   *%rax
    1212:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1218:	c3                   	retq   
    1219:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1220:	f3 0f 1e fa          	endbr64 
    1224:	80 3d fd 2d 00 00 00 	cmpb   $0x0,0x2dfd(%rip)        # 4028 <stdin@@GLIBC_2.2.5+0x8>
    122b:	75 2b                	jne    1258 <rand@plt+0xe8>
    122d:	55                   	push   %rbp
    122e:	48 83 3d c2 2d 00 00 	cmpq   $0x0,0x2dc2(%rip)        # 3ff8 <rand@plt+0x2e88>
    1235:	00 
    1236:	48 89 e5             	mov    %rsp,%rbp
    1239:	74 0c                	je     1247 <rand@plt+0xd7>
    123b:	48 8b 3d c6 2d 00 00 	mov    0x2dc6(%rip),%rdi        # 4008 <rand@plt+0x2e98>
    1242:	e8 89 fe ff ff       	callq  10d0 <__cxa_finalize@plt>
    1247:	e8 64 ff ff ff       	callq  11b0 <rand@plt+0x40>
    124c:	c6 05 d5 2d 00 00 01 	movb   $0x1,0x2dd5(%rip)        # 4028 <stdin@@GLIBC_2.2.5+0x8>
    1253:	5d                   	pop    %rbp
    1254:	c3                   	retq   
    1255:	0f 1f 00             	nopl   (%rax)
    1258:	c3                   	retq   
    1259:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1260:	f3 0f 1e fa          	endbr64 
    1264:	e9 77 ff ff ff       	jmpq   11e0 <rand@plt+0x70>
    1269:	f3 0f 1e fa          	endbr64 
    126d:	55                   	push   %rbp
    126e:	48 89 e5             	mov    %rsp,%rbp
    1271:	48 8b 05 a8 2d 00 00 	mov    0x2da8(%rip),%rax        # 4020 <stdin@@GLIBC_2.2.5>
    1278:	be 00 00 00 00       	mov    $0x0,%esi
    127d:	48 89 c7             	mov    %rax,%rdi
    1280:	e8 7b fe ff ff       	callq  1100 <setbuf@plt>
    1285:	48 8b 05 84 2d 00 00 	mov    0x2d84(%rip),%rax        # 4010 <stdout@@GLIBC_2.2.5>
    128c:	be 00 00 00 00       	mov    $0x0,%esi
    1291:	48 89 c7             	mov    %rax,%rdi
    1294:	e8 67 fe ff ff       	callq  1100 <setbuf@plt>
    1299:	90                   	nop
    129a:	5d                   	pop    %rbp
    129b:	c3                   	retq   
    129c:	f3 0f 1e fa          	endbr64 
    12a0:	55                   	push   %rbp
    12a1:	48 89 e5             	mov    %rsp,%rbp
    12a4:	48 83 ec 30          	sub    $0x30,%rsp
    12a8:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    12af:	00 00 
    12b1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    12b5:	31 c0                	xor    %eax,%eax
    12b7:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    12bb:	ba 20 00 00 00       	mov    $0x20,%edx
    12c0:	be 00 00 00 00       	mov    $0x0,%esi
    12c5:	48 89 c7             	mov    %rax,%rdi
    12c8:	e8 53 fe ff ff       	callq  1120 <memset@plt>
    12cd:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    12d1:	ba 1e 00 00 00       	mov    $0x1e,%edx
    12d6:	48 89 c6             	mov    %rax,%rsi
    12d9:	bf 00 00 00 00       	mov    $0x0,%edi
    12de:	e8 4d fe ff ff       	callq  1130 <read@plt>
    12e3:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    12e7:	48 89 c7             	mov    %rax,%rdi
    12ea:	e8 71 fe ff ff       	callq  1160 <atoi@plt>
    12ef:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    12f3:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    12fa:	00 00 
    12fc:	74 05                	je     1303 <rand@plt+0x193>
    12fe:	e8 ed fd ff ff       	callq  10f0 <__stack_chk_fail@plt>
    1303:	c9                   	leaveq 
    1304:	c3                   	retq   
    1305:	f3 0f 1e fa          	endbr64 
    1309:	55                   	push   %rbp
    130a:	48 89 e5             	mov    %rsp,%rbp
    130d:	48 83 ec 10          	sub    $0x10,%rsp
    1311:	48 8d 3d ec 0c 00 00 	lea    0xcec(%rip),%rdi        # 2004 <rand@plt+0xe94>
    1318:	e8 c3 fd ff ff       	callq  10e0 <puts@plt>
    131d:	48 8d 3d fc 0c 00 00 	lea    0xcfc(%rip),%rdi        # 2020 <rand@plt+0xeb0>
    1324:	e8 b7 fd ff ff       	callq  10e0 <puts@plt>
    1329:	48 8d 3d f8 0c 00 00 	lea    0xcf8(%rip),%rdi        # 2028 <rand@plt+0xeb8>
    1330:	e8 ab fd ff ff       	callq  10e0 <puts@plt>
    1335:	48 8d 3d f7 0c 00 00 	lea    0xcf7(%rip),%rdi        # 2033 <rand@plt+0xec3>
    133c:	e8 9f fd ff ff       	callq  10e0 <puts@plt>
    1341:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    1348:	e9 99 00 00 00       	jmpq   13e6 <rand@plt+0x276>
    134d:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1350:	83 c0 01             	add    $0x1,%eax
    1353:	89 c6                	mov    %eax,%esi
    1355:	48 8d 3d e0 0c 00 00 	lea    0xce0(%rip),%rdi        # 203c <rand@plt+0xecc>
    135c:	b8 00 00 00 00       	mov    $0x0,%eax
    1361:	e8 aa fd ff ff       	callq  1110 <printf@plt>
    1366:	e8 05 fe ff ff       	callq  1170 <rand@plt>
    136b:	89 c2                	mov    %eax,%edx
    136d:	48 63 c2             	movslq %edx,%rax
    1370:	48 69 c0 56 55 55 55 	imul   $0x55555556,%rax,%rax
    1377:	48 c1 e8 20          	shr    $0x20,%rax
    137b:	48 89 c1             	mov    %rax,%rcx
    137e:	89 d0                	mov    %edx,%eax
    1380:	c1 f8 1f             	sar    $0x1f,%eax
    1383:	89 ce                	mov    %ecx,%esi
    1385:	29 c6                	sub    %eax,%esi
    1387:	89 f0                	mov    %esi,%eax
    1389:	89 45 f8             	mov    %eax,-0x8(%rbp)
    138c:	8b 4d f8             	mov    -0x8(%rbp),%ecx
    138f:	89 c8                	mov    %ecx,%eax
    1391:	01 c0                	add    %eax,%eax
    1393:	01 c8                	add    %ecx,%eax
    1395:	29 c2                	sub    %eax,%edx
    1397:	89 d0                	mov    %edx,%eax
    1399:	89 45 f8             	mov    %eax,-0x8(%rbp)
    139c:	b8 00 00 00 00       	mov    $0x0,%eax
    13a1:	e8 f6 fe ff ff       	callq  129c <rand@plt+0x12c>
    13a6:	89 45 fc             	mov    %eax,-0x4(%rbp)
    13a9:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    13ad:	75 0d                	jne    13bc <rand@plt+0x24c>
    13af:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
    13b3:	74 2d                	je     13e2 <rand@plt+0x272>
    13b5:	b8 00 00 00 00       	mov    $0x0,%eax
    13ba:	eb 39                	jmp    13f5 <rand@plt+0x285>
    13bc:	83 7d f8 01          	cmpl   $0x1,-0x8(%rbp)
    13c0:	75 0d                	jne    13cf <rand@plt+0x25f>
    13c2:	83 7d fc 02          	cmpl   $0x2,-0x4(%rbp)
    13c6:	74 1a                	je     13e2 <rand@plt+0x272>
    13c8:	b8 00 00 00 00       	mov    $0x0,%eax
    13cd:	eb 26                	jmp    13f5 <rand@plt+0x285>
    13cf:	83 7d f8 02          	cmpl   $0x2,-0x8(%rbp)
    13d3:	75 0d                	jne    13e2 <rand@plt+0x272>
    13d5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    13d9:	74 07                	je     13e2 <rand@plt+0x272>
    13db:	b8 00 00 00 00       	mov    $0x0,%eax
    13e0:	eb 13                	jmp    13f5 <rand@plt+0x285>
    13e2:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    13e6:	83 7d f4 63          	cmpl   $0x63,-0xc(%rbp)
    13ea:	0f 8e 5d ff ff ff    	jle    134d <rand@plt+0x1dd>
    13f0:	b8 01 00 00 00       	mov    $0x1,%eax
    13f5:	c9                   	leaveq 
    13f6:	c3                   	retq   
    13f7:	f3 0f 1e fa          	endbr64 
    13fb:	55                   	push   %rbp
    13fc:	48 89 e5             	mov    %rsp,%rbp
    13ff:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
    1406:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    140d:	00 00 
    140f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1413:	31 c0                	xor    %eax,%eax
    1415:	48 8d 3d 2c 0c 00 00 	lea    0xc2c(%rip),%rdi        # 2048 <rand@plt+0xed8>
    141c:	e8 bf fc ff ff       	callq  10e0 <puts@plt>
    1421:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
    1428:	ba 00 01 00 00       	mov    $0x100,%edx
    142d:	48 89 c6             	mov    %rax,%rsi
    1430:	bf 00 00 00 00       	mov    $0x0,%edi
    1435:	e8 f6 fc ff ff       	callq  1130 <read@plt>
    143a:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
    1441:	48 89 c7             	mov    %rax,%rdi
    1444:	b8 00 00 00 00       	mov    $0x0,%eax
    1449:	e8 c2 fc ff ff       	callq  1110 <printf@plt>
    144e:	90                   	nop
    144f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1453:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    145a:	00 00 
    145c:	74 05                	je     1463 <rand@plt+0x2f3>
    145e:	e8 8d fc ff ff       	callq  10f0 <__stack_chk_fail@plt>
    1463:	c9                   	leaveq 
    1464:	c3                   	retq   
    1465:	f3 0f 1e fa          	endbr64 
    1469:	55                   	push   %rbp
    146a:	48 89 e5             	mov    %rsp,%rbp
    146d:	53                   	push   %rbx
    146e:	48 81 ec 18 01 00 00 	sub    $0x118,%rsp
    1475:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    147c:	00 00 
    147e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1482:	31 c0                	xor    %eax,%eax
    1484:	b8 00 00 00 00       	mov    $0x0,%eax
    1489:	e8 db fd ff ff       	callq  1269 <rand@plt+0xf9>
    148e:	bf 00 00 00 00       	mov    $0x0,%edi
    1493:	e8 b8 fc ff ff       	callq  1150 <time@plt>
    1498:	48 89 c2             	mov    %rax,%rdx
    149b:	48 8d 85 e0 fe ff ff 	lea    -0x120(%rbp),%rax
    14a2:	48 05 00 01 00 00    	add    $0x100,%rax
    14a8:	89 10                	mov    %edx,(%rax)
    14aa:	48 8d 3d a9 0b 00 00 	lea    0xba9(%rip),%rdi        # 205a <rand@plt+0xeea>
    14b1:	e8 2a fc ff ff       	callq  10e0 <puts@plt>
    14b6:	48 8d 3d af 0b 00 00 	lea    0xbaf(%rip),%rdi        # 206c <rand@plt+0xefc>
    14bd:	e8 1e fc ff ff       	callq  10e0 <puts@plt>
    14c2:	48 8d 85 e0 fe ff ff 	lea    -0x120(%rbp),%rax
    14c9:	ba 56 02 00 00       	mov    $0x256,%edx
    14ce:	48 89 c6             	mov    %rax,%rsi
    14d1:	bf 00 00 00 00       	mov    $0x0,%edi
    14d6:	e8 55 fc ff ff       	callq  1130 <read@plt>
    14db:	48 8d 85 e0 fe ff ff 	lea    -0x120(%rbp),%rax
    14e2:	48 89 c6             	mov    %rax,%rsi
    14e5:	48 8d 3d 98 0b 00 00 	lea    0xb98(%rip),%rdi        # 2084 <rand@plt+0xf14>
    14ec:	b8 00 00 00 00       	mov    $0x0,%eax
    14f1:	e8 1a fc ff ff       	callq  1110 <printf@plt>
    14f6:	48 8d 85 e0 fe ff ff 	lea    -0x120(%rbp),%rax
    14fd:	48 05 00 01 00 00    	add    $0x100,%rax
    1503:	8b 00                	mov    (%rax),%eax
    1505:	89 c7                	mov    %eax,%edi
    1507:	e8 34 fc ff ff       	callq  1140 <srand@plt>
    150c:	48 8d 9d e0 fe ff ff 	lea    -0x120(%rbp),%rbx
    1513:	48 81 c3 04 01 00 00 	add    $0x104,%rbx
    151a:	b8 00 00 00 00       	mov    $0x0,%eax
    151f:	e8 e1 fd ff ff       	callq  1305 <rand@plt+0x195>
    1524:	89 03                	mov    %eax,(%rbx)
    1526:	48 8d 85 e0 fe ff ff 	lea    -0x120(%rbp),%rax
    152d:	48 05 04 01 00 00    	add    $0x104,%rax
    1533:	8b 00                	mov    (%rax),%eax
    1535:	85 c0                	test   %eax,%eax
    1537:	7e 0a                	jle    1543 <rand@plt+0x3d3>
    1539:	b8 00 00 00 00       	mov    $0x0,%eax
    153e:	e8 b4 fe ff ff       	callq  13f7 <rand@plt+0x287>
    1543:	b8 00 00 00 00       	mov    $0x0,%eax
    1548:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    154c:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    1553:	00 00 
    1555:	74 05                	je     155c <rand@plt+0x3ec>
    1557:	e8 94 fb ff ff       	callq  10f0 <__stack_chk_fail@plt>
    155c:	48 81 c4 18 01 00 00 	add    $0x118,%rsp
    1563:	5b                   	pop    %rbx
    1564:	5d                   	pop    %rbp
    1565:	c3                   	retq   
    1566:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    156d:	00 00 00 
    1570:	f3 0f 1e fa          	endbr64 
    1574:	41 57                	push   %r15
    1576:	4c 8d 3d f3 27 00 00 	lea    0x27f3(%rip),%r15        # 3d70 <rand@plt+0x2c00>
    157d:	41 56                	push   %r14
    157f:	49 89 d6             	mov    %rdx,%r14
    1582:	41 55                	push   %r13
    1584:	49 89 f5             	mov    %rsi,%r13
    1587:	41 54                	push   %r12
    1589:	41 89 fc             	mov    %edi,%r12d
    158c:	55                   	push   %rbp
    158d:	48 8d 2d e4 27 00 00 	lea    0x27e4(%rip),%rbp        # 3d78 <rand@plt+0x2c08>
    1594:	53                   	push   %rbx
    1595:	4c 29 fd             	sub    %r15,%rbp
    1598:	48 83 ec 08          	sub    $0x8,%rsp
    159c:	e8 5f fa ff ff       	callq  1000 <__cxa_finalize@plt-0xd0>
    15a1:	48 c1 fd 03          	sar    $0x3,%rbp
    15a5:	74 1f                	je     15c6 <rand@plt+0x456>
    15a7:	31 db                	xor    %ebx,%ebx
    15a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    15b0:	4c 89 f2             	mov    %r14,%rdx
    15b3:	4c 89 ee             	mov    %r13,%rsi
    15b6:	44 89 e7             	mov    %r12d,%edi
    15b9:	41 ff 14 df          	callq  *(%r15,%rbx,8)
    15bd:	48 83 c3 01          	add    $0x1,%rbx
    15c1:	48 39 dd             	cmp    %rbx,%rbp
    15c4:	75 ea                	jne    15b0 <rand@plt+0x440>
    15c6:	48 83 c4 08          	add    $0x8,%rsp
    15ca:	5b                   	pop    %rbx
    15cb:	5d                   	pop    %rbp
    15cc:	41 5c                	pop    %r12
    15ce:	41 5d                	pop    %r13
    15d0:	41 5e                	pop    %r14
    15d2:	41 5f                	pop    %r15
    15d4:	c3                   	retq   
    15d5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    15dc:	00 00 00 00 
    15e0:	f3 0f 1e fa          	endbr64 
    15e4:	c3                   	retq   

Disassembly of section .fini:

00000000000015e8 <.fini>:
    15e8:	f3 0f 1e fa          	endbr64 
    15ec:	48 83 ec 08          	sub    $0x8,%rsp
    15f0:	48 83 c4 08          	add    $0x8,%rsp
    15f4:	c3                   	retq   
