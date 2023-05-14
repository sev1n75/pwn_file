
note:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <.init>:
    1000:	48 83 ec 08          	sub    $0x8,%rsp
    1004:	48 8b 05 dd 2f 00 00 	mov    0x2fdd(%rip),%rax        # 3fe8 <__cxa_finalize@plt+0x2f18>
    100b:	48 85 c0             	test   %rax,%rax
    100e:	74 02                	je     1012 <free@plt-0x1e>
    1010:	ff d0                	call   *%rax
    1012:	48 83 c4 08          	add    $0x8,%rsp
    1016:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <free@plt-0x10>:
    1020:	ff 35 e2 2f 00 00    	push   0x2fe2(%rip)        # 4008 <__cxa_finalize@plt+0x2f38>
    1026:	ff 25 e4 2f 00 00    	jmp    *0x2fe4(%rip)        # 4010 <__cxa_finalize@plt+0x2f40>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <free@plt>:
    1030:	ff 25 e2 2f 00 00    	jmp    *0x2fe2(%rip)        # 4018 <__cxa_finalize@plt+0x2f48>
    1036:	68 00 00 00 00       	push   $0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <free@plt-0x10>

0000000000001040 <puts@plt>:
    1040:	ff 25 da 2f 00 00    	jmp    *0x2fda(%rip)        # 4020 <__cxa_finalize@plt+0x2f50>
    1046:	68 01 00 00 00       	push   $0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <free@plt-0x10>

0000000000001050 <memset@plt>:
    1050:	ff 25 d2 2f 00 00    	jmp    *0x2fd2(%rip)        # 4028 <__cxa_finalize@plt+0x2f58>
    1056:	68 02 00 00 00       	push   $0x2
    105b:	e9 c0 ff ff ff       	jmp    1020 <free@plt-0x10>

0000000000001060 <alarm@plt>:
    1060:	ff 25 ca 2f 00 00    	jmp    *0x2fca(%rip)        # 4030 <__cxa_finalize@plt+0x2f60>
    1066:	68 03 00 00 00       	push   $0x3
    106b:	e9 b0 ff ff ff       	jmp    1020 <free@plt-0x10>

0000000000001070 <close@plt>:
    1070:	ff 25 c2 2f 00 00    	jmp    *0x2fc2(%rip)        # 4038 <__cxa_finalize@plt+0x2f68>
    1076:	68 04 00 00 00       	push   $0x4
    107b:	e9 a0 ff ff ff       	jmp    1020 <free@plt-0x10>

0000000000001080 <read@plt>:
    1080:	ff 25 ba 2f 00 00    	jmp    *0x2fba(%rip)        # 4040 <__cxa_finalize@plt+0x2f70>
    1086:	68 05 00 00 00       	push   $0x5
    108b:	e9 90 ff ff ff       	jmp    1020 <free@plt-0x10>

0000000000001090 <malloc@plt>:
    1090:	ff 25 b2 2f 00 00    	jmp    *0x2fb2(%rip)        # 4048 <__cxa_finalize@plt+0x2f78>
    1096:	68 06 00 00 00       	push   $0x6
    109b:	e9 80 ff ff ff       	jmp    1020 <free@plt-0x10>

00000000000010a0 <setvbuf@plt>:
    10a0:	ff 25 aa 2f 00 00    	jmp    *0x2faa(%rip)        # 4050 <__cxa_finalize@plt+0x2f80>
    10a6:	68 07 00 00 00       	push   $0x7
    10ab:	e9 70 ff ff ff       	jmp    1020 <free@plt-0x10>

00000000000010b0 <atoi@plt>:
    10b0:	ff 25 a2 2f 00 00    	jmp    *0x2fa2(%rip)        # 4058 <__cxa_finalize@plt+0x2f88>
    10b6:	68 08 00 00 00       	push   $0x8
    10bb:	e9 60 ff ff ff       	jmp    1020 <free@plt-0x10>

00000000000010c0 <exit@plt>:
    10c0:	ff 25 9a 2f 00 00    	jmp    *0x2f9a(%rip)        # 4060 <__cxa_finalize@plt+0x2f90>
    10c6:	68 09 00 00 00       	push   $0x9
    10cb:	e9 50 ff ff ff       	jmp    1020 <free@plt-0x10>

Disassembly of section .plt.got:

00000000000010d0 <__cxa_finalize@plt>:
    10d0:	ff 25 22 2f 00 00    	jmp    *0x2f22(%rip)        # 3ff8 <__cxa_finalize@plt+0x2f28>
    10d6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

00000000000010e0 <.text>:
    10e0:	31 ed                	xor    %ebp,%ebp
    10e2:	49 89 d1             	mov    %rdx,%r9
    10e5:	5e                   	pop    %rsi
    10e6:	48 89 e2             	mov    %rsp,%rdx
    10e9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    10ed:	50                   	push   %rax
    10ee:	54                   	push   %rsp
    10ef:	4c 8d 05 3a 07 00 00 	lea    0x73a(%rip),%r8        # 1830 <__cxa_finalize@plt+0x760>
    10f6:	48 8d 0d c3 06 00 00 	lea    0x6c3(%rip),%rcx        # 17c0 <__cxa_finalize@plt+0x6f0>
    10fd:	48 8d 3d 35 06 00 00 	lea    0x635(%rip),%rdi        # 1739 <__cxa_finalize@plt+0x669>
    1104:	ff 15 d6 2e 00 00    	call   *0x2ed6(%rip)        # 3fe0 <__cxa_finalize@plt+0x2f10>
    110a:	f4                   	hlt    
    110b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1110:	48 8d 3d 69 2f 00 00 	lea    0x2f69(%rip),%rdi        # 4080 <stdout@GLIBC_2.2.5>
    1117:	48 8d 05 62 2f 00 00 	lea    0x2f62(%rip),%rax        # 4080 <stdout@GLIBC_2.2.5>
    111e:	48 39 f8             	cmp    %rdi,%rax
    1121:	74 15                	je     1138 <__cxa_finalize@plt+0x68>
    1123:	48 8b 05 ae 2e 00 00 	mov    0x2eae(%rip),%rax        # 3fd8 <__cxa_finalize@plt+0x2f08>
    112a:	48 85 c0             	test   %rax,%rax
    112d:	74 09                	je     1138 <__cxa_finalize@plt+0x68>
    112f:	ff e0                	jmp    *%rax
    1131:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1138:	c3                   	ret    
    1139:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1140:	48 8d 3d 39 2f 00 00 	lea    0x2f39(%rip),%rdi        # 4080 <stdout@GLIBC_2.2.5>
    1147:	48 8d 35 32 2f 00 00 	lea    0x2f32(%rip),%rsi        # 4080 <stdout@GLIBC_2.2.5>
    114e:	48 29 fe             	sub    %rdi,%rsi
    1151:	48 c1 fe 03          	sar    $0x3,%rsi
    1155:	48 89 f0             	mov    %rsi,%rax
    1158:	48 c1 e8 3f          	shr    $0x3f,%rax
    115c:	48 01 c6             	add    %rax,%rsi
    115f:	48 d1 fe             	sar    %rsi
    1162:	74 14                	je     1178 <__cxa_finalize@plt+0xa8>
    1164:	48 8b 05 85 2e 00 00 	mov    0x2e85(%rip),%rax        # 3ff0 <__cxa_finalize@plt+0x2f20>
    116b:	48 85 c0             	test   %rax,%rax
    116e:	74 08                	je     1178 <__cxa_finalize@plt+0xa8>
    1170:	ff e0                	jmp    *%rax
    1172:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1178:	c3                   	ret    
    1179:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1180:	80 3d 11 2f 00 00 00 	cmpb   $0x0,0x2f11(%rip)        # 4098 <stdin@GLIBC_2.2.5+0x8>
    1187:	75 2f                	jne    11b8 <__cxa_finalize@plt+0xe8>
    1189:	55                   	push   %rbp
    118a:	48 83 3d 66 2e 00 00 	cmpq   $0x0,0x2e66(%rip)        # 3ff8 <__cxa_finalize@plt+0x2f28>
    1191:	00 
    1192:	48 89 e5             	mov    %rsp,%rbp
    1195:	74 0c                	je     11a3 <__cxa_finalize@plt+0xd3>
    1197:	48 8b 3d d2 2e 00 00 	mov    0x2ed2(%rip),%rdi        # 4070 <__cxa_finalize@plt+0x2fa0>
    119e:	e8 2d ff ff ff       	call   10d0 <__cxa_finalize@plt>
    11a3:	e8 68 ff ff ff       	call   1110 <__cxa_finalize@plt+0x40>
    11a8:	c6 05 e9 2e 00 00 01 	movb   $0x1,0x2ee9(%rip)        # 4098 <stdin@GLIBC_2.2.5+0x8>
    11af:	5d                   	pop    %rbp
    11b0:	c3                   	ret    
    11b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    11b8:	c3                   	ret    
    11b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    11c0:	e9 7b ff ff ff       	jmp    1140 <__cxa_finalize@plt+0x70>
    11c5:	55                   	push   %rbp
    11c6:	48 89 e5             	mov    %rsp,%rbp
    11c9:	48 8d 3d 38 0e 00 00 	lea    0xe38(%rip),%rdi        # 2008 <__cxa_finalize@plt+0xf38>
    11d0:	e8 6b fe ff ff       	call   1040 <puts@plt>
    11d5:	48 8d 3d 5c 0e 00 00 	lea    0xe5c(%rip),%rdi        # 2038 <__cxa_finalize@plt+0xf68>
    11dc:	e8 5f fe ff ff       	call   1040 <puts@plt>
    11e1:	48 8d 3d c0 0e 00 00 	lea    0xec0(%rip),%rdi        # 20a8 <__cxa_finalize@plt+0xfd8>
    11e8:	e8 53 fe ff ff       	call   1040 <puts@plt>
    11ed:	48 8d 3d 24 0f 00 00 	lea    0xf24(%rip),%rdi        # 2118 <__cxa_finalize@plt+0x1048>
    11f4:	e8 47 fe ff ff       	call   1040 <puts@plt>
    11f9:	48 8d 3d 08 0e 00 00 	lea    0xe08(%rip),%rdi        # 2008 <__cxa_finalize@plt+0xf38>
    1200:	e8 3b fe ff ff       	call   1040 <puts@plt>
    1205:	48 8d 3d 7c 0f 00 00 	lea    0xf7c(%rip),%rdi        # 2188 <__cxa_finalize@plt+0x10b8>
    120c:	e8 2f fe ff ff       	call   1040 <puts@plt>
    1211:	48 8d 3d f0 0d 00 00 	lea    0xdf0(%rip),%rdi        # 2008 <__cxa_finalize@plt+0xf38>
    1218:	e8 23 fe ff ff       	call   1040 <puts@plt>
    121d:	48 8d 3d 8c 0f 00 00 	lea    0xf8c(%rip),%rdi        # 21b0 <__cxa_finalize@plt+0x10e0>
    1224:	e8 17 fe ff ff       	call   1040 <puts@plt>
    1229:	b8 00 00 00 00       	mov    $0x0,%eax
    122e:	5d                   	pop    %rbp
    122f:	c3                   	ret    
    1230:	55                   	push   %rbp
    1231:	48 89 e5             	mov    %rsp,%rbp
    1234:	48 83 ec 20          	sub    $0x20,%rsp
    1238:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    123c:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    123f:	c6 45 fb 00          	movb   $0x0,-0x5(%rbp)
    1243:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    124a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    1251:	eb 47                	jmp    129a <__cxa_finalize@plt+0x1ca>
    1253:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
    1257:	ba 01 00 00 00       	mov    $0x1,%edx
    125c:	48 89 c6             	mov    %rax,%rsi
    125f:	bf 00 00 00 00       	mov    $0x0,%edi
    1264:	e8 17 fe ff ff       	call   1080 <read@plt>
    1269:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
    126d:	3c 0a                	cmp    $0xa,%al
    126f:	75 12                	jne    1283 <__cxa_finalize@plt+0x1b3>
    1271:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1274:	48 63 d0             	movslq %eax,%rdx
    1277:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    127b:	48 01 d0             	add    %rdx,%rax
    127e:	c6 00 00             	movb   $0x0,(%rax)
    1281:	eb 1f                	jmp    12a2 <__cxa_finalize@plt+0x1d2>
    1283:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1286:	48 63 d0             	movslq %eax,%rdx
    1289:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    128d:	48 01 c2             	add    %rax,%rdx
    1290:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
    1294:	88 02                	mov    %al,(%rdx)
    1296:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    129a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    129d:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
    12a0:	7c b1                	jl     1253 <__cxa_finalize@plt+0x183>
    12a2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    12a5:	83 e8 01             	sub    $0x1,%eax
    12a8:	39 45 fc             	cmp    %eax,-0x4(%rbp)
    12ab:	75 13                	jne    12c0 <__cxa_finalize@plt+0x1f0>
    12ad:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    12b0:	48 98                	cltq   
    12b2:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
    12b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    12ba:	48 01 d0             	add    %rdx,%rax
    12bd:	c6 00 00             	movb   $0x0,(%rax)
    12c0:	b8 00 00 00 00       	mov    $0x0,%eax
    12c5:	c9                   	leave  
    12c6:	c3                   	ret    
    12c7:	55                   	push   %rbp
    12c8:	48 89 e5             	mov    %rsp,%rbp
    12cb:	48 83 ec 20          	sub    $0x20,%rsp
    12cf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    12d6:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    12dd:	8b 05 95 2d 00 00    	mov    0x2d95(%rip),%eax        # 4078 <__cxa_finalize@plt+0x2fa8>
    12e3:	85 c0                	test   %eax,%eax
    12e5:	0f 8e ff 00 00 00    	jle    13ea <__cxa_finalize@plt+0x31a>
    12eb:	8b 05 87 2d 00 00    	mov    0x2d87(%rip),%eax        # 4078 <__cxa_finalize@plt+0x2fa8>
    12f1:	83 f8 19             	cmp    $0x19,%eax
    12f4:	0f 8f f0 00 00 00    	jg     13ea <__cxa_finalize@plt+0x31a>
    12fa:	48 8d 45 ee          	lea    -0x12(%rbp),%rax
    12fe:	be 0f 00 00 00       	mov    $0xf,%esi
    1303:	48 89 c7             	mov    %rax,%rdi
    1306:	e8 25 ff ff ff       	call   1230 <__cxa_finalize@plt+0x160>
    130b:	48 8d 45 ee          	lea    -0x12(%rbp),%rax
    130f:	48 89 c7             	mov    %rax,%rdi
    1312:	e8 99 fd ff ff       	call   10b0 <atoi@plt>
    1317:	89 45 f8             	mov    %eax,-0x8(%rbp)
    131a:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    131e:	78 06                	js     1326 <__cxa_finalize@plt+0x256>
    1320:	83 7d f8 19          	cmpl   $0x19,-0x8(%rbp)
    1324:	7e 0a                	jle    1330 <__cxa_finalize@plt+0x260>
    1326:	b8 00 00 00 00       	mov    $0x0,%eax
    132b:	e9 bf 00 00 00       	jmp    13ef <__cxa_finalize@plt+0x31f>
    1330:	48 8d 45 ee          	lea    -0x12(%rbp),%rax
    1334:	be 0f 00 00 00       	mov    $0xf,%esi
    1339:	48 89 c7             	mov    %rax,%rdi
    133c:	e8 ef fe ff ff       	call   1230 <__cxa_finalize@plt+0x160>
    1341:	48 8d 45 ee          	lea    -0x12(%rbp),%rax
    1345:	48 89 c7             	mov    %rax,%rdi
    1348:	e8 63 fd ff ff       	call   10b0 <atoi@plt>
    134d:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1350:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    1354:	0f 88 90 00 00 00    	js     13ea <__cxa_finalize@plt+0x31a>
    135a:	83 7d fc 0d          	cmpl   $0xd,-0x4(%rbp)
    135e:	0f 8f 86 00 00 00    	jg     13ea <__cxa_finalize@plt+0x31a>
    1364:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1367:	48 98                	cltq   
    1369:	48 89 c7             	mov    %rax,%rdi
    136c:	e8 1f fd ff ff       	call   1090 <malloc@plt>
    1371:	48 89 c1             	mov    %rax,%rcx
    1374:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1377:	48 98                	cltq   
    1379:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    1380:	00 
    1381:	48 8d 05 18 2d 00 00 	lea    0x2d18(%rip),%rax        # 40a0 <stdin@GLIBC_2.2.5+0x10>
    1388:	48 89 0c 02          	mov    %rcx,(%rdx,%rax,1)
    138c:	8b 45 f8             	mov    -0x8(%rbp),%eax
    138f:	48 98                	cltq   
    1391:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    1398:	00 
    1399:	48 8d 05 00 2d 00 00 	lea    0x2d00(%rip),%rax        # 40a0 <stdin@GLIBC_2.2.5+0x10>
    13a0:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
    13a4:	48 85 c0             	test   %rax,%rax
    13a7:	75 0a                	jne    13b3 <__cxa_finalize@plt+0x2e3>
    13a9:	bf 00 00 00 00       	mov    $0x0,%edi
    13ae:	e8 0d fd ff ff       	call   10c0 <exit@plt>
    13b3:	8b 45 f8             	mov    -0x8(%rbp),%eax
    13b6:	48 98                	cltq   
    13b8:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    13bf:	00 
    13c0:	48 8d 05 d9 2c 00 00 	lea    0x2cd9(%rip),%rax        # 40a0 <stdin@GLIBC_2.2.5+0x10>
    13c7:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
    13cb:	48 89 c2             	mov    %rax,%rdx
    13ce:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13d1:	89 c6                	mov    %eax,%esi
    13d3:	48 89 d7             	mov    %rdx,%rdi
    13d6:	e8 55 fe ff ff       	call   1230 <__cxa_finalize@plt+0x160>
    13db:	8b 05 97 2c 00 00    	mov    0x2c97(%rip),%eax        # 4078 <__cxa_finalize@plt+0x2fa8>
    13e1:	83 c0 01             	add    $0x1,%eax
    13e4:	89 05 8e 2c 00 00    	mov    %eax,0x2c8e(%rip)        # 4078 <__cxa_finalize@plt+0x2fa8>
    13ea:	b8 00 00 00 00       	mov    $0x0,%eax
    13ef:	c9                   	leave  
    13f0:	c3                   	ret    
    13f1:	55                   	push   %rbp
    13f2:	48 89 e5             	mov    %rsp,%rbp
    13f5:	bf 00 00 00 00       	mov    $0x0,%edi
    13fa:	e8 71 fc ff ff       	call   1070 <close@plt>
    13ff:	bf 01 00 00 00       	mov    $0x1,%edi
    1404:	e8 67 fc ff ff       	call   1070 <close@plt>
    1409:	bf 02 00 00 00       	mov    $0x2,%edi
    140e:	e8 5d fc ff ff       	call   1070 <close@plt>
    1413:	48 8d 3d c0 0d 00 00 	lea    0xdc0(%rip),%rdi        # 21da <__cxa_finalize@plt+0x110a>
    141a:	e8 21 fc ff ff       	call   1040 <puts@plt>
    141f:	b8 00 00 00 00       	mov    $0x0,%eax
    1424:	5d                   	pop    %rbp
    1425:	c3                   	ret    
    1426:	55                   	push   %rbp
    1427:	48 89 e5             	mov    %rsp,%rbp
    142a:	48 83 ec 20          	sub    $0x20,%rsp
    142e:	48 8d 45 ea          	lea    -0x16(%rbp),%rax
    1432:	ba 0a 00 00 00       	mov    $0xa,%edx
    1437:	be 00 00 00 00       	mov    $0x0,%esi
    143c:	48 89 c7             	mov    %rax,%rdi
    143f:	e8 0c fc ff ff       	call   1050 <memset@plt>
    1444:	48 8d 45 ea          	lea    -0x16(%rbp),%rax
    1448:	be 0a 00 00 00       	mov    $0xa,%esi
    144d:	48 89 c7             	mov    %rax,%rdi
    1450:	e8 db fd ff ff       	call   1230 <__cxa_finalize@plt+0x160>
    1455:	48 8d 45 ea          	lea    -0x16(%rbp),%rax
    1459:	48 89 c7             	mov    %rax,%rdi
    145c:	e8 4f fc ff ff       	call   10b0 <atoi@plt>
    1461:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1464:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1467:	48 98                	cltq   
    1469:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    1470:	00 
    1471:	48 8d 05 28 2c 00 00 	lea    0x2c28(%rip),%rax        # 40a0 <stdin@GLIBC_2.2.5+0x10>
    1478:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
    147c:	48 85 c0             	test   %rax,%rax
    147f:	0f 84 10 01 00 00    	je     1595 <__cxa_finalize@plt+0x4c5>
    1485:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    1489:	0f 88 06 01 00 00    	js     1595 <__cxa_finalize@plt+0x4c5>
    148f:	83 7d f8 19          	cmpl   $0x19,-0x8(%rbp)
    1493:	0f 8f fc 00 00 00    	jg     1595 <__cxa_finalize@plt+0x4c5>
    1499:	48 8d 45 ea          	lea    -0x16(%rbp),%rax
    149d:	be 0a 00 00 00       	mov    $0xa,%esi
    14a2:	48 89 c7             	mov    %rax,%rdi
    14a5:	e8 86 fd ff ff       	call   1230 <__cxa_finalize@plt+0x160>
    14aa:	48 8d 45 ea          	lea    -0x16(%rbp),%rax
    14ae:	48 89 c7             	mov    %rax,%rdi
    14b1:	e8 fa fb ff ff       	call   10b0 <atoi@plt>
    14b6:	89 45 f4             	mov    %eax,-0xc(%rbp)
    14b9:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
    14bd:	0f 88 d2 00 00 00    	js     1595 <__cxa_finalize@plt+0x4c5>
    14c3:	83 7d f4 0a          	cmpl   $0xa,-0xc(%rbp)
    14c7:	0f 8f c8 00 00 00    	jg     1595 <__cxa_finalize@plt+0x4c5>
    14cd:	8b 55 f4             	mov    -0xc(%rbp),%edx
    14d0:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
    14d4:	89 d6                	mov    %edx,%esi
    14d6:	48 89 c7             	mov    %rax,%rdi
    14d9:	e8 52 fd ff ff       	call   1230 <__cxa_finalize@plt+0x160>
    14de:	bf 00 00 00 00       	mov    $0x0,%edi
    14e3:	e8 88 fb ff ff       	call   1070 <close@plt>
    14e8:	bf 01 00 00 00       	mov    $0x1,%edi
    14ed:	e8 7e fb ff ff       	call   1070 <close@plt>
    14f2:	bf 02 00 00 00       	mov    $0x2,%edi
    14f7:	e8 74 fb ff ff       	call   1070 <close@plt>
    14fc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    1503:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1506:	3b 45 f4             	cmp    -0xc(%rbp),%eax
    1509:	7d 0e                	jge    1519 <__cxa_finalize@plt+0x449>
    150b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    150e:	48 98                	cltq   
    1510:	0f b6 44 05 e0       	movzbl -0x20(%rbp,%rax,1),%eax
    1515:	84 c0                	test   %al,%al
    1517:	75 43                	jne    155c <__cxa_finalize@plt+0x48c>
    1519:	8b 45 fc             	mov    -0x4(%rbp),%eax
    151c:	48 98                	cltq   
    151e:	8b 55 f8             	mov    -0x8(%rbp),%edx
    1521:	48 63 d2             	movslq %edx,%rdx
    1524:	48 8d 0c d5 00 00 00 	lea    0x0(,%rdx,8),%rcx
    152b:	00 
    152c:	48 8d 15 6d 2b 00 00 	lea    0x2b6d(%rip),%rdx        # 40a0 <stdin@GLIBC_2.2.5+0x10>
    1533:	48 8b 14 11          	mov    (%rcx,%rdx,1),%rdx
    1537:	48 01 d0             	add    %rdx,%rax
    153a:	c6 00 00             	movb   $0x0,(%rax)
    153d:	90                   	nop
    153e:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1541:	48 98                	cltq   
    1543:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    154a:	00 
    154b:	48 8d 05 4e 2b 00 00 	lea    0x2b4e(%rip),%rax        # 40a0 <stdin@GLIBC_2.2.5+0x10>
    1552:	48 c7 04 02 00 00 00 	movq   $0x0,(%rdx,%rax,1)
    1559:	00 
    155a:	eb 39                	jmp    1595 <__cxa_finalize@plt+0x4c5>
    155c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    155f:	48 98                	cltq   
    1561:	8b 55 f8             	mov    -0x8(%rbp),%edx
    1564:	48 63 d2             	movslq %edx,%rdx
    1567:	48 8d 0c d5 00 00 00 	lea    0x0(,%rdx,8),%rcx
    156e:	00 
    156f:	48 8d 15 2a 2b 00 00 	lea    0x2b2a(%rip),%rdx        # 40a0 <stdin@GLIBC_2.2.5+0x10>
    1576:	48 8b 14 11          	mov    (%rcx,%rdx,1),%rdx
    157a:	48 01 d0             	add    %rdx,%rax
    157d:	48 89 c2             	mov    %rax,%rdx
    1580:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1583:	48 98                	cltq   
    1585:	0f b6 44 05 e0       	movzbl -0x20(%rbp,%rax,1),%eax
    158a:	88 02                	mov    %al,(%rdx)
    158c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    1590:	e9 6e ff ff ff       	jmp    1503 <__cxa_finalize@plt+0x433>
    1595:	b8 00 00 00 00       	mov    $0x0,%eax
    159a:	c9                   	leave  
    159b:	c3                   	ret    
    159c:	55                   	push   %rbp
    159d:	48 89 e5             	mov    %rsp,%rbp
    15a0:	48 83 ec 10          	sub    $0x10,%rsp
    15a4:	48 8d 45 f2          	lea    -0xe(%rbp),%rax
    15a8:	ba 0a 00 00 00       	mov    $0xa,%edx
    15ad:	be 00 00 00 00       	mov    $0x0,%esi
    15b2:	48 89 c7             	mov    %rax,%rdi
    15b5:	e8 96 fa ff ff       	call   1050 <memset@plt>
    15ba:	48 8d 45 f2          	lea    -0xe(%rbp),%rax
    15be:	be 0a 00 00 00       	mov    $0xa,%esi
    15c3:	48 89 c7             	mov    %rax,%rdi
    15c6:	e8 65 fc ff ff       	call   1230 <__cxa_finalize@plt+0x160>
    15cb:	48 8d 45 f2          	lea    -0xe(%rbp),%rax
    15cf:	48 89 c7             	mov    %rax,%rdi
    15d2:	e8 d9 fa ff ff       	call   10b0 <atoi@plt>
    15d7:	89 45 fc             	mov    %eax,-0x4(%rbp)
    15da:	8b 45 fc             	mov    -0x4(%rbp),%eax
    15dd:	48 98                	cltq   
    15df:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    15e6:	00 
    15e7:	48 8d 05 b2 2a 00 00 	lea    0x2ab2(%rip),%rax        # 40a0 <stdin@GLIBC_2.2.5+0x10>
    15ee:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
    15f2:	48 85 c0             	test   %rax,%rax
    15f5:	74 66                	je     165d <__cxa_finalize@plt+0x58d>
    15f7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    15fb:	78 60                	js     165d <__cxa_finalize@plt+0x58d>
    15fd:	83 7d fc 19          	cmpl   $0x19,-0x4(%rbp)
    1601:	7f 5a                	jg     165d <__cxa_finalize@plt+0x58d>
    1603:	bf 00 00 00 00       	mov    $0x0,%edi
    1608:	e8 63 fa ff ff       	call   1070 <close@plt>
    160d:	bf 01 00 00 00       	mov    $0x1,%edi
    1612:	e8 59 fa ff ff       	call   1070 <close@plt>
    1617:	bf 02 00 00 00       	mov    $0x2,%edi
    161c:	e8 4f fa ff ff       	call   1070 <close@plt>
    1621:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1624:	48 98                	cltq   
    1626:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    162d:	00 
    162e:	48 8d 05 6b 2a 00 00 	lea    0x2a6b(%rip),%rax        # 40a0 <stdin@GLIBC_2.2.5+0x10>
    1635:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
    1639:	48 89 c7             	mov    %rax,%rdi
    163c:	e8 ef f9 ff ff       	call   1030 <free@plt>
    1641:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1644:	48 98                	cltq   
    1646:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    164d:	00 
    164e:	48 8d 05 4b 2a 00 00 	lea    0x2a4b(%rip),%rax        # 40a0 <stdin@GLIBC_2.2.5+0x10>
    1655:	48 c7 04 02 00 00 00 	movq   $0x0,(%rdx,%rax,1)
    165c:	00 
    165d:	b8 00 00 00 00       	mov    $0x0,%eax
    1662:	c9                   	leave  
    1663:	c3                   	ret    
    1664:	55                   	push   %rbp
    1665:	48 89 e5             	mov    %rsp,%rbp
    1668:	48 83 ec 20          	sub    $0x20,%rsp
    166c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    1673:	48 8d 45 ee          	lea    -0x12(%rbp),%rax
    1677:	ba 0a 00 00 00       	mov    $0xa,%edx
    167c:	be 00 00 00 00       	mov    $0x0,%esi
    1681:	48 89 c7             	mov    %rax,%rdi
    1684:	e8 c7 f9 ff ff       	call   1050 <memset@plt>
    1689:	48 8d 45 ee          	lea    -0x12(%rbp),%rax
    168d:	ba 0a 00 00 00       	mov    $0xa,%edx
    1692:	48 89 c6             	mov    %rax,%rsi
    1695:	bf 00 00 00 00       	mov    $0x0,%edi
    169a:	e8 e1 f9 ff ff       	call   1080 <read@plt>
    169f:	48 8d 45 ee          	lea    -0x12(%rbp),%rax
    16a3:	48 89 c7             	mov    %rax,%rdi
    16a6:	e8 05 fa ff ff       	call   10b0 <atoi@plt>
    16ab:	89 45 f8             	mov    %eax,-0x8(%rbp)
    16ae:	83 7d f8 05          	cmpl   $0x5,-0x8(%rbp)
    16b2:	77 5d                	ja     1711 <__cxa_finalize@plt+0x641>
    16b4:	8b 45 f8             	mov    -0x8(%rbp),%eax
    16b7:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    16be:	00 
    16bf:	48 8d 05 1a 0b 00 00 	lea    0xb1a(%rip),%rax        # 21e0 <__cxa_finalize@plt+0x1110>
    16c6:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    16c9:	48 98                	cltq   
    16cb:	48 8d 15 0e 0b 00 00 	lea    0xb0e(%rip),%rdx        # 21e0 <__cxa_finalize@plt+0x1110>
    16d2:	48 01 d0             	add    %rdx,%rax
    16d5:	ff e0                	jmp    *%rax
    16d7:	b8 00 00 00 00       	mov    $0x0,%eax
    16dc:	e8 e6 fb ff ff       	call   12c7 <__cxa_finalize@plt+0x1f7>
    16e1:	eb 4d                	jmp    1730 <__cxa_finalize@plt+0x660>
    16e3:	b8 00 00 00 00       	mov    $0x0,%eax
    16e8:	e8 04 fd ff ff       	call   13f1 <__cxa_finalize@plt+0x321>
    16ed:	eb 41                	jmp    1730 <__cxa_finalize@plt+0x660>
    16ef:	b8 00 00 00 00       	mov    $0x0,%eax
    16f4:	e8 2d fd ff ff       	call   1426 <__cxa_finalize@plt+0x356>
    16f9:	eb 35                	jmp    1730 <__cxa_finalize@plt+0x660>
    16fb:	b8 00 00 00 00       	mov    $0x0,%eax
    1700:	e8 97 fe ff ff       	call   159c <__cxa_finalize@plt+0x4cc>
    1705:	eb 29                	jmp    1730 <__cxa_finalize@plt+0x660>
    1707:	bf 00 00 00 00       	mov    $0x0,%edi
    170c:	e8 af f9 ff ff       	call   10c0 <exit@plt>
    1711:	bf 00 00 00 00       	mov    $0x0,%edi
    1716:	e8 55 f9 ff ff       	call   1070 <close@plt>
    171b:	bf 01 00 00 00       	mov    $0x1,%edi
    1720:	e8 4b f9 ff ff       	call   1070 <close@plt>
    1725:	bf 02 00 00 00       	mov    $0x2,%edi
    172a:	e8 41 f9 ff ff       	call   1070 <close@plt>
    172f:	90                   	nop
    1730:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    1734:	e9 3a ff ff ff       	jmp    1673 <__cxa_finalize@plt+0x5a3>
    1739:	55                   	push   %rbp
    173a:	48 89 e5             	mov    %rsp,%rbp
    173d:	48 8b 05 4c 29 00 00 	mov    0x294c(%rip),%rax        # 4090 <stdin@GLIBC_2.2.5>
    1744:	b9 00 00 00 00       	mov    $0x0,%ecx
    1749:	ba 02 00 00 00       	mov    $0x2,%edx
    174e:	be 00 00 00 00       	mov    $0x0,%esi
    1753:	48 89 c7             	mov    %rax,%rdi
    1756:	e8 45 f9 ff ff       	call   10a0 <setvbuf@plt>
    175b:	48 8b 05 1e 29 00 00 	mov    0x291e(%rip),%rax        # 4080 <stdout@GLIBC_2.2.5>
    1762:	b9 00 00 00 00       	mov    $0x0,%ecx
    1767:	ba 02 00 00 00       	mov    $0x2,%edx
    176c:	be 00 00 00 00       	mov    $0x0,%esi
    1771:	48 89 c7             	mov    %rax,%rdi
    1774:	e8 27 f9 ff ff       	call   10a0 <setvbuf@plt>
    1779:	bf 1e 00 00 00       	mov    $0x1e,%edi
    177e:	e8 dd f8 ff ff       	call   1060 <alarm@plt>
    1783:	ba 64 00 00 00       	mov    $0x64,%edx
    1788:	be 00 00 00 00       	mov    $0x0,%esi
    178d:	48 8d 3d 0c 29 00 00 	lea    0x290c(%rip),%rdi        # 40a0 <stdin@GLIBC_2.2.5+0x10>
    1794:	e8 b7 f8 ff ff       	call   1050 <memset@plt>
    1799:	b8 00 00 00 00       	mov    $0x0,%eax
    179e:	e8 22 fa ff ff       	call   11c5 <__cxa_finalize@plt+0xf5>
    17a3:	b8 00 00 00 00       	mov    $0x0,%eax
    17a8:	e8 b7 fe ff ff       	call   1664 <__cxa_finalize@plt+0x594>
    17ad:	b8 00 00 00 00       	mov    $0x0,%eax
    17b2:	5d                   	pop    %rbp
    17b3:	c3                   	ret    
    17b4:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    17bb:	00 00 00 
    17be:	66 90                	xchg   %ax,%ax
    17c0:	41 57                	push   %r15
    17c2:	41 56                	push   %r14
    17c4:	49 89 d7             	mov    %rdx,%r15
    17c7:	41 55                	push   %r13
    17c9:	41 54                	push   %r12
    17cb:	4c 8d 25 16 26 00 00 	lea    0x2616(%rip),%r12        # 3de8 <__cxa_finalize@plt+0x2d18>
    17d2:	55                   	push   %rbp
    17d3:	48 8d 2d 16 26 00 00 	lea    0x2616(%rip),%rbp        # 3df0 <__cxa_finalize@plt+0x2d20>
    17da:	53                   	push   %rbx
    17db:	41 89 fd             	mov    %edi,%r13d
    17de:	49 89 f6             	mov    %rsi,%r14
    17e1:	4c 29 e5             	sub    %r12,%rbp
    17e4:	48 83 ec 08          	sub    $0x8,%rsp
    17e8:	48 c1 fd 03          	sar    $0x3,%rbp
    17ec:	e8 0f f8 ff ff       	call   1000 <free@plt-0x30>
    17f1:	48 85 ed             	test   %rbp,%rbp
    17f4:	74 20                	je     1816 <__cxa_finalize@plt+0x746>
    17f6:	31 db                	xor    %ebx,%ebx
    17f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    17ff:	00 
    1800:	4c 89 fa             	mov    %r15,%rdx
    1803:	4c 89 f6             	mov    %r14,%rsi
    1806:	44 89 ef             	mov    %r13d,%edi
    1809:	41 ff 14 dc          	call   *(%r12,%rbx,8)
    180d:	48 83 c3 01          	add    $0x1,%rbx
    1811:	48 39 dd             	cmp    %rbx,%rbp
    1814:	75 ea                	jne    1800 <__cxa_finalize@plt+0x730>
    1816:	48 83 c4 08          	add    $0x8,%rsp
    181a:	5b                   	pop    %rbx
    181b:	5d                   	pop    %rbp
    181c:	41 5c                	pop    %r12
    181e:	41 5d                	pop    %r13
    1820:	41 5e                	pop    %r14
    1822:	41 5f                	pop    %r15
    1824:	c3                   	ret    
    1825:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    182c:	00 00 00 00 
    1830:	f3 c3                	repz ret 

Disassembly of section .fini:

0000000000001834 <.fini>:
    1834:	48 83 ec 08          	sub    $0x8,%rsp
    1838:	48 83 c4 08          	add    $0x8,%rsp
    183c:	c3                   	ret    
