
note：     文件格式 elf64-x86-64


Disassembly of section .init:

0000000000401000 <.init>:
  401000:	f3 0f 1e fa          	endbr64 
  401004:	48 83 ec 08          	sub    $0x8,%rsp
  401008:	48 8b 05 e9 2f 00 00 	mov    0x2fe9(%rip),%rax        # 403ff8 <exit@plt+0x2eb8>
  40100f:	48 85 c0             	test   %rax,%rax
  401012:	74 02                	je     401016 <free@plt-0xaa>
  401014:	ff d0                	callq  *%rax
  401016:	48 83 c4 08          	add    $0x8,%rsp
  40101a:	c3                   	retq   

Disassembly of section .plt:

0000000000401020 <.plt>:
  401020:	ff 35 e2 2f 00 00    	pushq  0x2fe2(%rip)        # 404008 <exit@plt+0x2ec8>
  401026:	f2 ff 25 e3 2f 00 00 	bnd jmpq *0x2fe3(%rip)        # 404010 <exit@plt+0x2ed0>
  40102d:	0f 1f 00             	nopl   (%rax)
  401030:	f3 0f 1e fa          	endbr64 
  401034:	68 00 00 00 00       	pushq  $0x0
  401039:	f2 e9 e1 ff ff ff    	bnd jmpq 401020 <free@plt-0xa0>
  40103f:	90                   	nop
  401040:	f3 0f 1e fa          	endbr64 
  401044:	68 01 00 00 00       	pushq  $0x1
  401049:	f2 e9 d1 ff ff ff    	bnd jmpq 401020 <free@plt-0xa0>
  40104f:	90                   	nop
  401050:	f3 0f 1e fa          	endbr64 
  401054:	68 02 00 00 00       	pushq  $0x2
  401059:	f2 e9 c1 ff ff ff    	bnd jmpq 401020 <free@plt-0xa0>
  40105f:	90                   	nop
  401060:	f3 0f 1e fa          	endbr64 
  401064:	68 03 00 00 00       	pushq  $0x3
  401069:	f2 e9 b1 ff ff ff    	bnd jmpq 401020 <free@plt-0xa0>
  40106f:	90                   	nop
  401070:	f3 0f 1e fa          	endbr64 
  401074:	68 04 00 00 00       	pushq  $0x4
  401079:	f2 e9 a1 ff ff ff    	bnd jmpq 401020 <free@plt-0xa0>
  40107f:	90                   	nop
  401080:	f3 0f 1e fa          	endbr64 
  401084:	68 05 00 00 00       	pushq  $0x5
  401089:	f2 e9 91 ff ff ff    	bnd jmpq 401020 <free@plt-0xa0>
  40108f:	90                   	nop
  401090:	f3 0f 1e fa          	endbr64 
  401094:	68 06 00 00 00       	pushq  $0x6
  401099:	f2 e9 81 ff ff ff    	bnd jmpq 401020 <free@plt-0xa0>
  40109f:	90                   	nop
  4010a0:	f3 0f 1e fa          	endbr64 
  4010a4:	68 07 00 00 00       	pushq  $0x7
  4010a9:	f2 e9 71 ff ff ff    	bnd jmpq 401020 <free@plt-0xa0>
  4010af:	90                   	nop
  4010b0:	f3 0f 1e fa          	endbr64 
  4010b4:	68 08 00 00 00       	pushq  $0x8
  4010b9:	f2 e9 61 ff ff ff    	bnd jmpq 401020 <free@plt-0xa0>
  4010bf:	90                   	nop

Disassembly of section .plt.sec:

00000000004010c0 <free@plt>:
  4010c0:	f3 0f 1e fa          	endbr64 
  4010c4:	f2 ff 25 4d 2f 00 00 	bnd jmpq *0x2f4d(%rip)        # 404018 <exit@plt+0x2ed8>
  4010cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004010d0 <puts@plt>:
  4010d0:	f3 0f 1e fa          	endbr64 
  4010d4:	f2 ff 25 45 2f 00 00 	bnd jmpq *0x2f45(%rip)        # 404020 <exit@plt+0x2ee0>
  4010db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004010e0 <printf@plt>:
  4010e0:	f3 0f 1e fa          	endbr64 
  4010e4:	f2 ff 25 3d 2f 00 00 	bnd jmpq *0x2f3d(%rip)        # 404028 <exit@plt+0x2ee8>
  4010eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004010f0 <memset@plt>:
  4010f0:	f3 0f 1e fa          	endbr64 
  4010f4:	f2 ff 25 35 2f 00 00 	bnd jmpq *0x2f35(%rip)        # 404030 <exit@plt+0x2ef0>
  4010fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401100 <read@plt>:
  401100:	f3 0f 1e fa          	endbr64 
  401104:	f2 ff 25 2d 2f 00 00 	bnd jmpq *0x2f2d(%rip)        # 404038 <exit@plt+0x2ef8>
  40110b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401110 <malloc@plt>:
  401110:	f3 0f 1e fa          	endbr64 
  401114:	f2 ff 25 25 2f 00 00 	bnd jmpq *0x2f25(%rip)        # 404040 <exit@plt+0x2f00>
  40111b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401120 <setvbuf@plt>:
  401120:	f3 0f 1e fa          	endbr64 
  401124:	f2 ff 25 1d 2f 00 00 	bnd jmpq *0x2f1d(%rip)        # 404048 <exit@plt+0x2f08>
  40112b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401130 <atoi@plt>:
  401130:	f3 0f 1e fa          	endbr64 
  401134:	f2 ff 25 15 2f 00 00 	bnd jmpq *0x2f15(%rip)        # 404050 <exit@plt+0x2f10>
  40113b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401140 <exit@plt>:
  401140:	f3 0f 1e fa          	endbr64 
  401144:	f2 ff 25 0d 2f 00 00 	bnd jmpq *0x2f0d(%rip)        # 404058 <exit@plt+0x2f18>
  40114b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000401150 <.text>:
  401150:	f3 0f 1e fa          	endbr64 
  401154:	31 ed                	xor    %ebp,%ebp
  401156:	49 89 d1             	mov    %rdx,%r9
  401159:	5e                   	pop    %rsi
  40115a:	48 89 e2             	mov    %rsp,%rdx
  40115d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  401161:	50                   	push   %rax
  401162:	54                   	push   %rsp
  401163:	49 c7 c0 c0 17 40 00 	mov    $0x4017c0,%r8
  40116a:	48 c7 c1 50 17 40 00 	mov    $0x401750,%rcx
  401171:	48 c7 c7 79 16 40 00 	mov    $0x401679,%rdi
  401178:	ff 15 72 2e 00 00    	callq  *0x2e72(%rip)        # 403ff0 <exit@plt+0x2eb0>
  40117e:	f4                   	hlt    
  40117f:	90                   	nop
  401180:	f3 0f 1e fa          	endbr64 
  401184:	c3                   	retq   
  401185:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40118c:	00 00 00 
  40118f:	90                   	nop
  401190:	b8 70 40 40 00       	mov    $0x404070,%eax
  401195:	48 3d 70 40 40 00    	cmp    $0x404070,%rax
  40119b:	74 13                	je     4011b0 <exit@plt+0x70>
  40119d:	b8 00 00 00 00       	mov    $0x0,%eax
  4011a2:	48 85 c0             	test   %rax,%rax
  4011a5:	74 09                	je     4011b0 <exit@plt+0x70>
  4011a7:	bf 70 40 40 00       	mov    $0x404070,%edi
  4011ac:	ff e0                	jmpq   *%rax
  4011ae:	66 90                	xchg   %ax,%ax
  4011b0:	c3                   	retq   
  4011b1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4011b8:	00 00 00 00 
  4011bc:	0f 1f 40 00          	nopl   0x0(%rax)
  4011c0:	be 70 40 40 00       	mov    $0x404070,%esi
  4011c5:	48 81 ee 70 40 40 00 	sub    $0x404070,%rsi
  4011cc:	48 89 f0             	mov    %rsi,%rax
  4011cf:	48 c1 ee 3f          	shr    $0x3f,%rsi
  4011d3:	48 c1 f8 03          	sar    $0x3,%rax
  4011d7:	48 01 c6             	add    %rax,%rsi
  4011da:	48 d1 fe             	sar    %rsi
  4011dd:	74 11                	je     4011f0 <exit@plt+0xb0>
  4011df:	b8 00 00 00 00       	mov    $0x0,%eax
  4011e4:	48 85 c0             	test   %rax,%rax
  4011e7:	74 07                	je     4011f0 <exit@plt+0xb0>
  4011e9:	bf 70 40 40 00       	mov    $0x404070,%edi
  4011ee:	ff e0                	jmpq   *%rax
  4011f0:	c3                   	retq   
  4011f1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4011f8:	00 00 00 00 
  4011fc:	0f 1f 40 00          	nopl   0x0(%rax)
  401200:	f3 0f 1e fa          	endbr64 
  401204:	80 3d 9d 2e 00 00 00 	cmpb   $0x0,0x2e9d(%rip)        # 4040a8 <stderr@@GLIBC_2.2.5+0x8>
  40120b:	75 13                	jne    401220 <exit@plt+0xe0>
  40120d:	55                   	push   %rbp
  40120e:	48 89 e5             	mov    %rsp,%rbp
  401211:	e8 7a ff ff ff       	callq  401190 <exit@plt+0x50>
  401216:	c6 05 8b 2e 00 00 01 	movb   $0x1,0x2e8b(%rip)        # 4040a8 <stderr@@GLIBC_2.2.5+0x8>
  40121d:	5d                   	pop    %rbp
  40121e:	c3                   	retq   
  40121f:	90                   	nop
  401220:	c3                   	retq   
  401221:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  401228:	00 00 00 00 
  40122c:	0f 1f 40 00          	nopl   0x0(%rax)
  401230:	f3 0f 1e fa          	endbr64 
  401234:	eb 8a                	jmp    4011c0 <exit@plt+0x80>
  401236:	f3 0f 1e fa          	endbr64 
  40123a:	55                   	push   %rbp
  40123b:	48 89 e5             	mov    %rsp,%rbp
  40123e:	48 83 ec 10          	sub    $0x10,%rsp
  401242:	48 8d 45 f8          	lea    -0x8(%rbp),%rax
  401246:	ba 08 00 00 00       	mov    $0x8,%edx
  40124b:	48 89 c6             	mov    %rax,%rsi
  40124e:	bf 00 00 00 00       	mov    $0x0,%edi
  401253:	e8 a8 fe ff ff       	callq  401100 <read@plt>
  401258:	48 8d 45 f8          	lea    -0x8(%rbp),%rax
  40125c:	48 89 c7             	mov    %rax,%rdi
  40125f:	e8 cc fe ff ff       	callq  401130 <atoi@plt>
  401264:	c9                   	leaveq 
  401265:	c3                   	retq   
  401266:	f3 0f 1e fa          	endbr64 
  40126a:	55                   	push   %rbp
  40126b:	48 89 e5             	mov    %rsp,%rbp
  40126e:	48 8b 05 1b 2e 00 00 	mov    0x2e1b(%rip),%rax        # 404090 <stdin@@GLIBC_2.2.5>
  401275:	b9 00 00 00 00       	mov    $0x0,%ecx
  40127a:	ba 02 00 00 00       	mov    $0x2,%edx
  40127f:	be 00 00 00 00       	mov    $0x0,%esi
  401284:	48 89 c7             	mov    %rax,%rdi
  401287:	e8 94 fe ff ff       	callq  401120 <setvbuf@plt>
  40128c:	48 8b 05 ed 2d 00 00 	mov    0x2ded(%rip),%rax        # 404080 <stdout@@GLIBC_2.2.5>
  401293:	b9 00 00 00 00       	mov    $0x0,%ecx
  401298:	ba 02 00 00 00       	mov    $0x2,%edx
  40129d:	be 00 00 00 00       	mov    $0x0,%esi
  4012a2:	48 89 c7             	mov    %rax,%rdi
  4012a5:	e8 76 fe ff ff       	callq  401120 <setvbuf@plt>
  4012aa:	48 8b 05 ef 2d 00 00 	mov    0x2def(%rip),%rax        # 4040a0 <stderr@@GLIBC_2.2.5>
  4012b1:	b9 00 00 00 00       	mov    $0x0,%ecx
  4012b6:	ba 02 00 00 00       	mov    $0x2,%edx
  4012bb:	be 00 00 00 00       	mov    $0x0,%esi
  4012c0:	48 89 c7             	mov    %rax,%rdi
  4012c3:	e8 58 fe ff ff       	callq  401120 <setvbuf@plt>
  4012c8:	90                   	nop
  4012c9:	5d                   	pop    %rbp
  4012ca:	c3                   	retq   
  4012cb:	f3 0f 1e fa          	endbr64 
  4012cf:	55                   	push   %rbp
  4012d0:	48 89 e5             	mov    %rsp,%rbp
  4012d3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  4012d7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  4012de:	eb 24                	jmp    401304 <exit@plt+0x1c4>
  4012e0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  4012e3:	48 98                	cltq   
  4012e5:	48 c1 e0 04          	shl    $0x4,%rax
  4012e9:	48 89 c2             	mov    %rax,%rdx
  4012ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4012f0:	48 01 d0             	add    %rdx,%rax
  4012f3:	48 8b 00             	mov    (%rax),%rax
  4012f6:	48 85 c0             	test   %rax,%rax
  4012f9:	75 05                	jne    401300 <exit@plt+0x1c0>
  4012fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  4012fe:	eb 0f                	jmp    40130f <exit@plt+0x1cf>
  401300:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  401304:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
  401308:	7e d6                	jle    4012e0 <exit@plt+0x1a0>
  40130a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40130f:	5d                   	pop    %rbp
  401310:	c3                   	retq   
# ------------------------build----------------
  401311:	f3 0f 1e fa          	endbr64 
  401315:	55                   	push   %rbp
  401316:	48 89 e5             	mov    %rsp,%rbp
  401319:	48 83 ec 20          	sub    $0x20,%rsp
  40131d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  401321:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  401328:	00 
  401329:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  40132d:	48 89 c7             	mov    %rax,%rdi
  401330:	e8 96 ff ff ff       	callq  4012cb <exit@plt+0x18b>
  401335:	89 45 f4             	mov    %eax,-0xc(%rbp)
  401338:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%rbp)
  40133c:	75 11                	jne    40134f <exit@plt+0x20f>
  40133e:	48 8d 3d bf 0c 00 00 	lea    0xcbf(%rip),%rdi        # 402004 <exit@plt+0xec4>
  401345:	e8 86 fd ff ff       	callq  4010d0 <puts@plt>
  40134a:	e9 a2 00 00 00       	jmpq   4013f1 <exit@plt+0x2b1>
  40134f:	48 8d 3d c4 0c 00 00 	lea    0xcc4(%rip),%rdi        # 40201a <exit@plt+0xeda>
  401356:	b8 00 00 00 00       	mov    $0x0,%eax
  40135b:	e8 80 fd ff ff       	callq  4010e0 <printf@plt>
  401360:	b8 00 00 00 00       	mov    $0x0,%eax
  401365:	e8 cc fe ff ff       	callq  401236 <exit@plt+0xf6>
  40136a:	89 45 f0             	mov    %eax,-0x10(%rbp)
  40136d:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  401371:	74 09                	je     40137c <exit@plt+0x23c>
  401373:	81 7d f0 ff 01 00 00 	cmpl   $0x1ff,-0x10(%rbp)
  40137a:	76 0e                	jbe    40138a <exit@plt+0x24a>
  40137c:	48 8d 3d 9e 0c 00 00 	lea    0xc9e(%rip),%rdi        # 402021 <exit@plt+0xee1>
  401383:	e8 48 fd ff ff       	callq  4010d0 <puts@plt>
  401388:	eb 67                	jmp    4013f1 <exit@plt+0x2b1>
  40138a:	8b 45 f0             	mov    -0x10(%rbp),%eax
  40138d:	48 89 c7             	mov    %rax,%rdi
  401390:	e8 7b fd ff ff       	callq  401110 <malloc@plt>
  401395:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401399:	48 8d 3d 8d 0c 00 00 	lea    0xc8d(%rip),%rdi        # 40202d <exit@plt+0xeed>
  4013a0:	b8 00 00 00 00       	mov    $0x0,%eax
  4013a5:	e8 36 fd ff ff       	callq  4010e0 <printf@plt>
  4013aa:	8b 55 f0             	mov    -0x10(%rbp),%edx
  4013ad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4013b1:	48 89 c6             	mov    %rax,%rsi
  4013b4:	bf 00 00 00 00       	mov    $0x0,%edi
  4013b9:	e8 42 fd ff ff       	callq  401100 <read@plt>
  4013be:	8b 45 f4             	mov    -0xc(%rbp),%eax
  4013c1:	48 98                	cltq   
  4013c3:	48 c1 e0 04          	shl    $0x4,%rax
  4013c7:	48 89 c2             	mov    %rax,%rdx
  4013ca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4013ce:	48 01 c2             	add    %rax,%rdx
  4013d1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4013d5:	48 89 02             	mov    %rax,(%rdx)
  4013d8:	8b 45 f4             	mov    -0xc(%rbp),%eax
  4013db:	48 98                	cltq   
  4013dd:	48 c1 e0 04          	shl    $0x4,%rax
  4013e1:	48 89 c2             	mov    %rax,%rdx
  4013e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4013e8:	48 01 c2             	add    %rax,%rdx
  4013eb:	8b 45 f0             	mov    -0x10(%rbp),%eax
  4013ee:	89 42 08             	mov    %eax,0x8(%rdx)
  4013f1:	c9                   	leaveq 
  4013f2:	c3                   	retq   
# --------------------------------build -------------*/
  4013f3:	f3 0f 1e fa          	endbr64 
  4013f7:	55                   	push   %rbp
  4013f8:	48 89 e5             	mov    %rsp,%rbp
  4013fb:	48 83 ec 20          	sub    $0x20,%rsp
  4013ff:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  401403:	48 8d 3d 2d 0c 00 00 	lea    0xc2d(%rip),%rdi        # 402037 <exit@plt+0xef7>
  40140a:	b8 00 00 00 00       	mov    $0x0,%eax
  40140f:	e8 cc fc ff ff       	callq  4010e0 <printf@plt>
  401414:	b8 00 00 00 00       	mov    $0x0,%eax
  401419:	e8 18 fe ff ff       	callq  401236 <exit@plt+0xf6>
  40141e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  401421:	83 7d fc 10          	cmpl   $0x10,-0x4(%rbp)
  401425:	76 0e                	jbe    401435 <exit@plt+0x2f5>
  401427:	48 8d 3d f3 0b 00 00 	lea    0xbf3(%rip),%rdi        # 402021 <exit@plt+0xee1>
  40142e:	e8 9d fc ff ff       	callq  4010d0 <puts@plt>
  401433:	eb 7f                	jmp    4014b4 <exit@plt+0x374>
  401435:	8b 45 fc             	mov    -0x4(%rbp),%eax
  401438:	48 c1 e0 04          	shl    $0x4,%rax
  40143c:	48 89 c2             	mov    %rax,%rdx
  40143f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  401443:	48 01 d0             	add    %rdx,%rax
  401446:	48 8b 00             	mov    (%rax),%rax
  401449:	48 85 c0             	test   %rax,%rax
  40144c:	75 0e                	jne    40145c <exit@plt+0x31c>
  40144e:	48 8d 3d ea 0b 00 00 	lea    0xbea(%rip),%rdi        # 40203f <exit@plt+0xeff>
  401455:	e8 76 fc ff ff       	callq  4010d0 <puts@plt>
  40145a:	eb 58                	jmp    4014b4 <exit@plt+0x374>
  40145c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  40145f:	48 c1 e0 04          	shl    $0x4,%rax
  401463:	48 89 c2             	mov    %rax,%rdx
  401466:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  40146a:	48 01 d0             	add    %rdx,%rax
  40146d:	48 8b 00             	mov    (%rax),%rax
  401470:	48 89 c7             	mov    %rax,%rdi
  401473:	e8 48 fc ff ff       	callq  4010c0 <free@plt>
  401478:	8b 45 fc             	mov    -0x4(%rbp),%eax
  40147b:	48 c1 e0 04          	shl    $0x4,%rax
  40147f:	48 89 c2             	mov    %rax,%rdx
  401482:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  401486:	48 01 d0             	add    %rdx,%rax
  401489:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  401490:	8b 45 fc             	mov    -0x4(%rbp),%eax
  401493:	48 c1 e0 04          	shl    $0x4,%rax
  401497:	48 89 c2             	mov    %rax,%rdx
  40149a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  40149e:	48 01 d0             	add    %rdx,%rax
  4014a1:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  4014a8:	48 8d 3d 9d 0b 00 00 	lea    0xb9d(%rip),%rdi        # 40204c <exit@plt+0xf0c>
  4014af:	e8 1c fc ff ff       	callq  4010d0 <puts@plt>
  4014b4:	c9                   	leaveq 
  4014b5:	c3                   	retq   
  4014b6:	f3 0f 1e fa          	endbr64 
  4014ba:	55                   	push   %rbp
  4014bb:	48 89 e5             	mov    %rsp,%rbp
  4014be:	48 83 ec 20          	sub    $0x20,%rsp
  4014c2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  4014c6:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  4014cd:	00 
  4014ce:	48 8d 3d 62 0b 00 00 	lea    0xb62(%rip),%rdi        # 402037 <exit@plt+0xef7>
  4014d5:	b8 00 00 00 00       	mov    $0x0,%eax
  4014da:	e8 01 fc ff ff       	callq  4010e0 <printf@plt>
  4014df:	b8 00 00 00 00       	mov    $0x0,%eax
  4014e4:	e8 4d fd ff ff       	callq  401236 <exit@plt+0xf6>
  4014e9:	89 45 f4             	mov    %eax,-0xc(%rbp)
  4014ec:	83 7d f4 10          	cmpl   $0x10,-0xc(%rbp)
  4014f0:	7e 0e                	jle    401500 <exit@plt+0x3c0>
  4014f2:	48 8d 3d 28 0b 00 00 	lea    0xb28(%rip),%rdi        # 402021 <exit@plt+0xee1>
  4014f9:	e8 d2 fb ff ff       	callq  4010d0 <puts@plt>
  4014fe:	eb 7e                	jmp    40157e <exit@plt+0x43e>
  401500:	8b 45 f4             	mov    -0xc(%rbp),%eax
  401503:	48 98                	cltq   
  401505:	48 c1 e0 04          	shl    $0x4,%rax
  401509:	48 89 c2             	mov    %rax,%rdx
  40150c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  401510:	48 01 d0             	add    %rdx,%rax
  401513:	48 8b 00             	mov    (%rax),%rax
  401516:	48 85 c0             	test   %rax,%rax
  401519:	75 0e                	jne    401529 <exit@plt+0x3e9>
  40151b:	48 8d 3d ff 0a 00 00 	lea    0xaff(%rip),%rdi        # 402021 <exit@plt+0xee1>
  401522:	e8 a9 fb ff ff       	callq  4010d0 <puts@plt>
  401527:	eb 55                	jmp    40157e <exit@plt+0x43e>
  401529:	8b 45 f4             	mov    -0xc(%rbp),%eax
  40152c:	48 98                	cltq   
  40152e:	48 c1 e0 04          	shl    $0x4,%rax
  401532:	48 89 c2             	mov    %rax,%rdx
  401535:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  401539:	48 01 d0             	add    %rdx,%rax
  40153c:	48 8b 00             	mov    (%rax),%rax
  40153f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401543:	48 8d 3d e3 0a 00 00 	lea    0xae3(%rip),%rdi        # 40202d <exit@plt+0xeed>
  40154a:	b8 00 00 00 00       	mov    $0x0,%eax
  40154f:	e8 8c fb ff ff       	callq  4010e0 <printf@plt>
  401554:	8b 45 f4             	mov    -0xc(%rbp),%eax
  401557:	48 98                	cltq   
  401559:	48 c1 e0 04          	shl    $0x4,%rax
  40155d:	48 89 c2             	mov    %rax,%rdx
  401560:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  401564:	48 01 d0             	add    %rdx,%rax
  401567:	8b 40 08             	mov    0x8(%rax),%eax
  40156a:	48 63 d0             	movslq %eax,%rdx
  40156d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401571:	48 89 c6             	mov    %rax,%rsi
  401574:	bf 00 00 00 00       	mov    $0x0,%edi
  401579:	e8 82 fb ff ff       	callq  401100 <read@plt>
  40157e:	c9                   	leaveq 
  40157f:	c3                   	retq   
  401580:	f3 0f 1e fa          	endbr64 
  401584:	55                   	push   %rbp
  401585:	48 89 e5             	mov    %rsp,%rbp
  401588:	48 83 ec 20          	sub    $0x20,%rsp
  40158c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  401590:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  401597:	00 
  401598:	48 8d 3d 98 0a 00 00 	lea    0xa98(%rip),%rdi        # 402037 <exit@plt+0xef7>
  40159f:	b8 00 00 00 00       	mov    $0x0,%eax
  4015a4:	e8 37 fb ff ff       	callq  4010e0 <printf@plt>
  4015a9:	b8 00 00 00 00       	mov    $0x0,%eax
  4015ae:	e8 83 fc ff ff       	callq  401236 <exit@plt+0xf6>
  4015b3:	89 45 f4             	mov    %eax,-0xc(%rbp)
  4015b6:	83 7d f4 10          	cmpl   $0x10,-0xc(%rbp)
  4015ba:	76 0e                	jbe    4015ca <exit@plt+0x48a>
  4015bc:	48 8d 3d 5e 0a 00 00 	lea    0xa5e(%rip),%rdi        # 402021 <exit@plt+0xee1>
  4015c3:	e8 08 fb ff ff       	callq  4010d0 <puts@plt>
  4015c8:	eb 4f                	jmp    401619 <exit@plt+0x4d9>
  4015ca:	8b 45 f4             	mov    -0xc(%rbp),%eax
  4015cd:	48 c1 e0 04          	shl    $0x4,%rax
  4015d1:	48 89 c2             	mov    %rax,%rdx
  4015d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4015d8:	48 01 d0             	add    %rdx,%rax
  4015db:	48 8b 00             	mov    (%rax),%rax
  4015de:	48 85 c0             	test   %rax,%rax
  4015e1:	75 0e                	jne    4015f1 <exit@plt+0x4b1>
  4015e3:	48 8d 3d 37 0a 00 00 	lea    0xa37(%rip),%rdi        # 402021 <exit@plt+0xee1>
  4015ea:	e8 e1 fa ff ff       	callq  4010d0 <puts@plt>
  4015ef:	eb 28                	jmp    401619 <exit@plt+0x4d9>
  4015f1:	8b 45 f4             	mov    -0xc(%rbp),%eax
  4015f4:	48 c1 e0 04          	shl    $0x4,%rax
  4015f8:	48 89 c2             	mov    %rax,%rdx
  4015fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4015ff:	48 01 d0             	add    %rdx,%rax
  401602:	48 8b 00             	mov    (%rax),%rax
  401605:	48 89 c6             	mov    %rax,%rsi
  401608:	48 8d 3d 42 0a 00 00 	lea    0xa42(%rip),%rdi        # 402051 <exit@plt+0xf11>
  40160f:	b8 00 00 00 00       	mov    $0x0,%eax
  401614:	e8 c7 fa ff ff       	callq  4010e0 <printf@plt>
  401619:	c9                   	leaveq 
  40161a:	c3                   	retq   
  40161b:	f3 0f 1e fa          	endbr64 
  40161f:	55                   	push   %rbp
  401620:	48 89 e5             	mov    %rsp,%rbp
  401623:	48 8d 3d 34 0a 00 00 	lea    0xa34(%rip),%rdi        # 40205e <exit@plt+0xf1e>
  40162a:	e8 a1 fa ff ff       	callq  4010d0 <puts@plt>
  40162f:	90                   	nop
  401630:	5d                   	pop    %rbp
  401631:	c3                   	retq   
  401632:	f3 0f 1e fa          	endbr64 
  401636:	55                   	push   %rbp
  401637:	48 89 e5             	mov    %rsp,%rbp
  40163a:	48 8d 3d 27 0a 00 00 	lea    0xa27(%rip),%rdi        # 402068 <exit@plt+0xf28>
  401641:	e8 8a fa ff ff       	callq  4010d0 <puts@plt>
  401646:	48 8d 3d 24 0a 00 00 	lea    0xa24(%rip),%rdi        # 402071 <exit@plt+0xf31>
  40164d:	e8 7e fa ff ff       	callq  4010d0 <puts@plt>
  401652:	48 8d 3d 23 0a 00 00 	lea    0xa23(%rip),%rdi        # 40207c <exit@plt+0xf3c>
  401659:	e8 72 fa ff ff       	callq  4010d0 <puts@plt>
  40165e:	48 8d 3d 21 0a 00 00 	lea    0xa21(%rip),%rdi        # 402086 <exit@plt+0xf46>
  401665:	e8 66 fa ff ff       	callq  4010d0 <puts@plt>
  40166a:	48 8d 3d 1f 0a 00 00 	lea    0xa1f(%rip),%rdi        # 402090 <exit@plt+0xf50>
  401671:	e8 5a fa ff ff       	callq  4010d0 <puts@plt>
  401676:	90                   	nop
  401677:	5d                   	pop    %rbp
  401678:	c3                   	retq   
  401679:	f3 0f 1e fa          	endbr64 
  40167d:	55                   	push   %rbp
  40167e:	48 89 e5             	mov    %rsp,%rbp
  401681:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  401688:	b8 00 00 00 00       	mov    $0x0,%eax
  40168d:	e8 d4 fb ff ff       	callq  401266 <exit@plt+0x126>
  401692:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  401699:	ba 00 01 00 00       	mov    $0x100,%edx
  40169e:	be 00 00 00 00       	mov    $0x0,%esi
  4016a3:	48 89 c7             	mov    %rax,%rdi
  4016a6:	e8 45 fa ff ff       	callq  4010f0 <memset@plt>
  4016ab:	b8 00 00 00 00       	mov    $0x0,%eax
  4016b0:	e8 7d ff ff ff       	callq  401632 <exit@plt+0x4f2>
  4016b5:	b8 00 00 00 00       	mov    $0x0,%eax
  4016ba:	e8 77 fb ff ff       	callq  401236 <exit@plt+0xf6>
  4016bf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  4016c2:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  4016c6:	74 53                	je     40171b <exit@plt+0x5db>
  4016c8:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  4016cc:	7f 5e                	jg     40172c <exit@plt+0x5ec>
  4016ce:	83 7d fc 03          	cmpl   $0x3,-0x4(%rbp)
  4016d2:	74 36                	je     40170a <exit@plt+0x5ca>
  4016d4:	83 7d fc 03          	cmpl   $0x3,-0x4(%rbp)
  4016d8:	7f 52                	jg     40172c <exit@plt+0x5ec>
  4016da:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
  4016de:	74 08                	je     4016e8 <exit@plt+0x5a8>
  4016e0:	83 7d fc 02          	cmpl   $0x2,-0x4(%rbp)
  4016e4:	74 13                	je     4016f9 <exit@plt+0x5b9>
  4016e6:	eb 44                	jmp    40172c <exit@plt+0x5ec>
  4016e8:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  4016ef:	48 89 c7             	mov    %rax,%rdi
  4016f2:	e8 1a fc ff ff       	callq  401311 <exit@plt+0x1d1>
  4016f7:	eb 49                	jmp    401742 <exit@plt+0x602>
  4016f9:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  401700:	48 89 c7             	mov    %rax,%rdi
  401703:	e8 78 fe ff ff       	callq  401580 <exit@plt+0x440>
  401708:	eb 38                	jmp    401742 <exit@plt+0x602>
  40170a:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  401711:	48 89 c7             	mov    %rax,%rdi
  401714:	e8 9d fd ff ff       	callq  4014b6 <exit@plt+0x376>
  401719:	eb 27                	jmp    401742 <exit@plt+0x602>
  40171b:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  401722:	48 89 c7             	mov    %rax,%rdi
  401725:	e8 c9 fc ff ff       	callq  4013f3 <exit@plt+0x2b3>
  40172a:	eb 16                	jmp    401742 <exit@plt+0x602>
  40172c:	48 8d 3d 66 09 00 00 	lea    0x966(%rip),%rdi        # 402099 <exit@plt+0xf59>
  401733:	e8 98 f9 ff ff       	callq  4010d0 <puts@plt>
  401738:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  40173d:	e8 fe f9 ff ff       	callq  401140 <exit@plt>
  401742:	e9 64 ff ff ff       	jmpq   4016ab <exit@plt+0x56b>
  401747:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40174e:	00 00 
  401750:	f3 0f 1e fa          	endbr64 
  401754:	41 57                	push   %r15
  401756:	4c 8d 3d b3 26 00 00 	lea    0x26b3(%rip),%r15        # 403e10 <exit@plt+0x2cd0>
  40175d:	41 56                	push   %r14
  40175f:	49 89 d6             	mov    %rdx,%r14
  401762:	41 55                	push   %r13
  401764:	49 89 f5             	mov    %rsi,%r13
  401767:	41 54                	push   %r12
  401769:	41 89 fc             	mov    %edi,%r12d
  40176c:	55                   	push   %rbp
  40176d:	48 8d 2d a4 26 00 00 	lea    0x26a4(%rip),%rbp        # 403e18 <exit@plt+0x2cd8>
  401774:	53                   	push   %rbx
  401775:	4c 29 fd             	sub    %r15,%rbp
  401778:	48 83 ec 08          	sub    $0x8,%rsp
  40177c:	e8 7f f8 ff ff       	callq  401000 <free@plt-0xc0>
  401781:	48 c1 fd 03          	sar    $0x3,%rbp
  401785:	74 1f                	je     4017a6 <exit@plt+0x666>
  401787:	31 db                	xor    %ebx,%ebx
  401789:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  401790:	4c 89 f2             	mov    %r14,%rdx
  401793:	4c 89 ee             	mov    %r13,%rsi
  401796:	44 89 e7             	mov    %r12d,%edi
  401799:	41 ff 14 df          	callq  *(%r15,%rbx,8)
  40179d:	48 83 c3 01          	add    $0x1,%rbx
  4017a1:	48 39 dd             	cmp    %rbx,%rbp
  4017a4:	75 ea                	jne    401790 <exit@plt+0x650>
  4017a6:	48 83 c4 08          	add    $0x8,%rsp
  4017aa:	5b                   	pop    %rbx
  4017ab:	5d                   	pop    %rbp
  4017ac:	41 5c                	pop    %r12
  4017ae:	41 5d                	pop    %r13
  4017b0:	41 5e                	pop    %r14
  4017b2:	41 5f                	pop    %r15
  4017b4:	c3                   	retq   
  4017b5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4017bc:	00 00 00 00 
  4017c0:	f3 0f 1e fa          	endbr64 
  4017c4:	c3                   	retq   

Disassembly of section .fini:

00000000004017c8 <.fini>:
  4017c8:	f3 0f 1e fa          	endbr64 
  4017cc:	48 83 ec 08          	sub    $0x8,%rsp
  4017d0:	48 83 c4 08          	add    $0x8,%rsp
  4017d4:	c3                   	retq   
