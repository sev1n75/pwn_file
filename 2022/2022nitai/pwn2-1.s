
pwn2-1:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <__gmon_start__>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	callq  *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	retq   

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 e2 2f 00 00    	pushq  0x2fe2(%rip)        # 4008 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 e4 2f 00 00    	jmpq   *0x2fe4(%rip)        # 4010 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <free@plt>:
    1030:	ff 25 e2 2f 00 00    	jmpq   *0x2fe2(%rip)        # 4018 <free@GLIBC_2.2.5>
    1036:	68 00 00 00 00       	pushq  $0x0
    103b:	e9 e0 ff ff ff       	jmpq   1020 <.plt>

0000000000001040 <_exit@plt>:
    1040:	ff 25 da 2f 00 00    	jmpq   *0x2fda(%rip)        # 4020 <_exit@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	pushq  $0x1
    104b:	e9 d0 ff ff ff       	jmpq   1020 <.plt>

0000000000001050 <puts@plt>:
    1050:	ff 25 d2 2f 00 00    	jmpq   *0x2fd2(%rip)        # 4028 <puts@GLIBC_2.2.5>
    1056:	68 02 00 00 00       	pushq  $0x2
    105b:	e9 c0 ff ff ff       	jmpq   1020 <.plt>

0000000000001060 <system@plt>:
    1060:	ff 25 ca 2f 00 00    	jmpq   *0x2fca(%rip)        # 4030 <system@GLIBC_2.2.5>
    1066:	68 03 00 00 00       	pushq  $0x3
    106b:	e9 b0 ff ff ff       	jmpq   1020 <.plt>

0000000000001070 <printf@plt>:
    1070:	ff 25 c2 2f 00 00    	jmpq   *0x2fc2(%rip)        # 4038 <printf@GLIBC_2.2.5>
    1076:	68 04 00 00 00       	pushq  $0x4
    107b:	e9 a0 ff ff ff       	jmpq   1020 <.plt>

0000000000001080 <read@plt>:
    1080:	ff 25 ba 2f 00 00    	jmpq   *0x2fba(%rip)        # 4040 <read@GLIBC_2.2.5>
    1086:	68 05 00 00 00       	pushq  $0x5
    108b:	e9 90 ff ff ff       	jmpq   1020 <.plt>

0000000000001090 <malloc@plt>:
    1090:	ff 25 b2 2f 00 00    	jmpq   *0x2fb2(%rip)        # 4048 <malloc@GLIBC_2.2.5>
    1096:	68 06 00 00 00       	pushq  $0x6
    109b:	e9 80 ff ff ff       	jmpq   1020 <.plt>

00000000000010a0 <setvbuf@plt>:
    10a0:	ff 25 aa 2f 00 00    	jmpq   *0x2faa(%rip)        # 4050 <setvbuf@GLIBC_2.2.5>
    10a6:	68 07 00 00 00       	pushq  $0x7
    10ab:	e9 70 ff ff ff       	jmpq   1020 <.plt>

00000000000010b0 <atoi@plt>:
    10b0:	ff 25 a2 2f 00 00    	jmpq   *0x2fa2(%rip)        # 4058 <atoi@GLIBC_2.2.5>
    10b6:	68 08 00 00 00       	pushq  $0x8
    10bb:	e9 60 ff ff ff       	jmpq   1020 <.plt>

00000000000010c0 <exit@plt>:
    10c0:	ff 25 9a 2f 00 00    	jmpq   *0x2f9a(%rip)        # 4060 <exit@GLIBC_2.2.5>
    10c6:	68 09 00 00 00       	pushq  $0x9
    10cb:	e9 50 ff ff ff       	jmpq   1020 <.plt>

Disassembly of section .plt.got:

00000000000010d0 <__cxa_finalize@plt>:
    10d0:	ff 25 22 2f 00 00    	jmpq   *0x2f22(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    10d6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

00000000000010e0 <_start>:
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	31 ed                	xor    %ebp,%ebp
    10e6:	49 89 d1             	mov    %rdx,%r9
    10e9:	5e                   	pop    %rsi
    10ea:	48 89 e2             	mov    %rsp,%rdx
    10ed:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    10f1:	50                   	push   %rax
    10f2:	54                   	push   %rsp
    10f3:	4c 8d 05 06 0d 00 00 	lea    0xd06(%rip),%r8        # 1e00 <__libc_csu_fini>
    10fa:	48 8d 0d 8f 0c 00 00 	lea    0xc8f(%rip),%rcx        # 1d90 <__libc_csu_init>
    1101:	48 8d 3d 88 0b 00 00 	lea    0xb88(%rip),%rdi        # 1c90 <main>
    1108:	ff 15 d2 2e 00 00    	callq  *0x2ed2(%rip)        # 3fe0 <__libc_start_main@GLIBC_2.2.5>
    110e:	f4                   	hlt    
    110f:	90                   	nop

0000000000001110 <deregister_tm_clones>:
    1110:	48 8d 3d 61 2f 00 00 	lea    0x2f61(%rip),%rdi        # 4078 <__TMC_END__>
    1117:	48 8d 05 5a 2f 00 00 	lea    0x2f5a(%rip),%rax        # 4078 <__TMC_END__>
    111e:	48 39 f8             	cmp    %rdi,%rax
    1121:	74 15                	je     1138 <deregister_tm_clones+0x28>
    1123:	48 8b 05 9e 2e 00 00 	mov    0x2e9e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable>
    112a:	48 85 c0             	test   %rax,%rax
    112d:	74 09                	je     1138 <deregister_tm_clones+0x28>
    112f:	ff e0                	jmpq   *%rax
    1131:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1138:	c3                   	retq   
    1139:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001140 <register_tm_clones>:
    1140:	48 8d 3d 31 2f 00 00 	lea    0x2f31(%rip),%rdi        # 4078 <__TMC_END__>
    1147:	48 8d 35 2a 2f 00 00 	lea    0x2f2a(%rip),%rsi        # 4078 <__TMC_END__>
    114e:	48 29 fe             	sub    %rdi,%rsi
    1151:	48 89 f0             	mov    %rsi,%rax
    1154:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1158:	48 c1 f8 03          	sar    $0x3,%rax
    115c:	48 01 c6             	add    %rax,%rsi
    115f:	48 d1 fe             	sar    %rsi
    1162:	74 14                	je     1178 <register_tm_clones+0x38>
    1164:	48 8b 05 85 2e 00 00 	mov    0x2e85(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable>
    116b:	48 85 c0             	test   %rax,%rax
    116e:	74 08                	je     1178 <register_tm_clones+0x38>
    1170:	ff e0                	jmpq   *%rax
    1172:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1178:	c3                   	retq   
    1179:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001180 <__do_global_dtors_aux>:
    1180:	f3 0f 1e fa          	endbr64 
    1184:	80 3d f5 2e 00 00 00 	cmpb   $0x0,0x2ef5(%rip)        # 4080 <completed.8061>
    118b:	75 2b                	jne    11b8 <__do_global_dtors_aux+0x38>
    118d:	55                   	push   %rbp
    118e:	48 83 3d 62 2e 00 00 	cmpq   $0x0,0x2e62(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1195:	00 
    1196:	48 89 e5             	mov    %rsp,%rbp
    1199:	74 0c                	je     11a7 <__do_global_dtors_aux+0x27>
    119b:	48 8b 3d ce 2e 00 00 	mov    0x2ece(%rip),%rdi        # 4070 <__dso_handle>
    11a2:	e8 29 ff ff ff       	callq  10d0 <__cxa_finalize@plt>
    11a7:	e8 64 ff ff ff       	callq  1110 <deregister_tm_clones>
    11ac:	c6 05 cd 2e 00 00 01 	movb   $0x1,0x2ecd(%rip)        # 4080 <completed.8061>
    11b3:	5d                   	pop    %rbp
    11b4:	c3                   	retq   
    11b5:	0f 1f 00             	nopl   (%rax)
    11b8:	c3                   	retq   
    11b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000011c0 <frame_dummy>:
    11c0:	f3 0f 1e fa          	endbr64 
    11c4:	e9 77 ff ff ff       	jmpq   1140 <register_tm_clones>
    11c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000011d0 <print_note_content>:
    11d0:	55                   	push   %rbp
    11d1:	48 89 e5             	mov    %rsp,%rbp
    11d4:	48 83 ec 10          	sub    $0x10,%rsp
    11d8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    11dc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    11e0:	48 8b 78 08          	mov    0x8(%rax),%rdi
    11e4:	e8 67 fe ff ff       	callq  1050 <puts@plt>
    11e9:	48 83 c4 10          	add    $0x10,%rsp
    11ed:	5d                   	pop    %rbp
    11ee:	c3                   	retq   
    11ef:	90                   	nop

00000000000011f0 <add_note>:
    11f0:	55                   	push   %rbp
    11f1:	48 89 e5             	mov    %rsp,%rbp
    11f4:	48 83 ec 30          	sub    $0x30,%rsp
    11f8:	48 8d 05 e5 2e 00 00 	lea    0x2ee5(%rip),%rax        # 40e4 <x.20>
    11ff:	8b 00                	mov    (%rax),%eax
    1201:	48 8d 0d f4 2e 00 00 	lea    0x2ef4(%rip),%rcx        # 40fc <y.21>
    1208:	8b 09                	mov    (%rcx),%ecx
    120a:	89 c2                	mov    %eax,%edx
    120c:	83 ea 01             	sub    $0x1,%edx
    120f:	0f af c2             	imul   %edx,%eax
    1212:	83 e0 01             	and    $0x1,%eax
    1215:	83 f8 00             	cmp    $0x0,%eax
    1218:	0f 94 c0             	sete   %al
    121b:	83 f9 0a             	cmp    $0xa,%ecx
    121e:	0f 9c c1             	setl   %cl
    1221:	08 c8                	or     %cl,%al
    1223:	a8 01                	test   $0x1,%al
    1225:	0f 85 05 00 00 00    	jne    1230 <add_note+0x40>
    122b:	e9 5f 04 00 00       	jmpq   168f <add_note+0x49f>
    1230:	48 89 e0             	mov    %rsp,%rax
    1233:	48 83 c0 f0          	add    $0xfffffffffffffff0,%rax
    1237:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    123b:	48 89 c4             	mov    %rax,%rsp
    123e:	48 89 e0             	mov    %rsp,%rax
    1241:	48 83 c0 f0          	add    $0xfffffffffffffff0,%rax
    1245:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1249:	48 89 c4             	mov    %rax,%rsp
    124c:	48 89 e0             	mov    %rsp,%rax
    124f:	48 83 c0 f0          	add    $0xfffffffffffffff0,%rax
    1253:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    1257:	48 89 c4             	mov    %rax,%rsp
    125a:	48 8d 05 2f 2e 00 00 	lea    0x2e2f(%rip),%rax        # 4090 <count>
    1261:	83 38 05             	cmpl   $0x5,(%rax)
    1264:	0f 9f c0             	setg   %al
    1267:	88 45 ff             	mov    %al,-0x1(%rbp)
    126a:	48 8d 05 73 2e 00 00 	lea    0x2e73(%rip),%rax        # 40e4 <x.20>
    1271:	8b 00                	mov    (%rax),%eax
    1273:	48 8d 0d 82 2e 00 00 	lea    0x2e82(%rip),%rcx        # 40fc <y.21>
    127a:	8b 09                	mov    (%rcx),%ecx
    127c:	89 c2                	mov    %eax,%edx
    127e:	83 ea 01             	sub    $0x1,%edx
    1281:	0f af c2             	imul   %edx,%eax
    1284:	83 e0 01             	and    $0x1,%eax
    1287:	83 f8 00             	cmp    $0x0,%eax
    128a:	0f 94 c0             	sete   %al
    128d:	83 f9 0a             	cmp    $0xa,%ecx
    1290:	0f 9c c1             	setl   %cl
    1293:	08 c8                	or     %cl,%al
    1295:	a8 01                	test   $0x1,%al
    1297:	0f 85 05 00 00 00    	jne    12a2 <add_note+0xb2>
    129d:	e9 ed 03 00 00       	jmpq   168f <add_note+0x49f>
    12a2:	8a 45 ff             	mov    -0x1(%rbp),%al
    12a5:	a8 01                	test   $0x1,%al
    12a7:	0f 85 05 00 00 00    	jne    12b2 <add_note+0xc2>
    12ad:	e9 81 00 00 00       	jmpq   1333 <add_note+0x143>
    12b2:	48 8d 05 2b 2e 00 00 	lea    0x2e2b(%rip),%rax        # 40e4 <x.20>
    12b9:	8b 00                	mov    (%rax),%eax
    12bb:	48 8d 0d 3a 2e 00 00 	lea    0x2e3a(%rip),%rcx        # 40fc <y.21>
    12c2:	8b 09                	mov    (%rcx),%ecx
    12c4:	89 c2                	mov    %eax,%edx
    12c6:	83 ea 01             	sub    $0x1,%edx
    12c9:	0f af c2             	imul   %edx,%eax
    12cc:	83 e0 01             	and    $0x1,%eax
    12cf:	83 f8 00             	cmp    $0x0,%eax
    12d2:	0f 94 c0             	sete   %al
    12d5:	83 f9 0a             	cmp    $0xa,%ecx
    12d8:	0f 9c c1             	setl   %cl
    12db:	08 c8                	or     %cl,%al
    12dd:	a8 01                	test   $0x1,%al
    12df:	0f 85 05 00 00 00    	jne    12ea <add_note+0xfa>
    12e5:	e9 aa 03 00 00       	jmpq   1694 <add_note+0x4a4>
    12ea:	48 8d 3d 13 0d 00 00 	lea    0xd13(%rip),%rdi        # 2004 <_IO_stdin_used+0x4>
    12f1:	e8 5a fd ff ff       	callq  1050 <puts@plt>
    12f6:	48 8d 05 e7 2d 00 00 	lea    0x2de7(%rip),%rax        # 40e4 <x.20>
    12fd:	8b 00                	mov    (%rax),%eax
    12ff:	48 8d 0d f6 2d 00 00 	lea    0x2df6(%rip),%rcx        # 40fc <y.21>
    1306:	8b 09                	mov    (%rcx),%ecx
    1308:	89 c2                	mov    %eax,%edx
    130a:	83 ea 01             	sub    $0x1,%edx
    130d:	0f af c2             	imul   %edx,%eax
    1310:	83 e0 01             	and    $0x1,%eax
    1313:	83 f8 00             	cmp    $0x0,%eax
    1316:	0f 94 c0             	sete   %al
    1319:	83 f9 0a             	cmp    $0xa,%ecx
    131c:	0f 9c c1             	setl   %cl
    131f:	08 c8                	or     %cl,%al
    1321:	a8 01                	test   $0x1,%al
    1323:	0f 85 05 00 00 00    	jne    132e <add_note+0x13e>
    1329:	e9 66 03 00 00       	jmpq   1694 <add_note+0x4a4>
    132e:	e9 57 03 00 00       	jmpq   168a <add_note+0x49a>
    1333:	48 8d 05 aa 2d 00 00 	lea    0x2daa(%rip),%rax        # 40e4 <x.20>
    133a:	8b 00                	mov    (%rax),%eax
    133c:	48 8d 0d b9 2d 00 00 	lea    0x2db9(%rip),%rcx        # 40fc <y.21>
    1343:	8b 09                	mov    (%rcx),%ecx
    1345:	89 c2                	mov    %eax,%edx
    1347:	83 ea 01             	sub    $0x1,%edx
    134a:	0f af c2             	imul   %edx,%eax
    134d:	83 e0 01             	and    $0x1,%eax
    1350:	83 f8 00             	cmp    $0x0,%eax
    1353:	0f 94 c0             	sete   %al
    1356:	83 f9 0a             	cmp    $0xa,%ecx
    1359:	0f 9c c1             	setl   %cl
    135c:	08 c8                	or     %cl,%al
    135e:	a8 01                	test   $0x1,%al
    1360:	0f 85 05 00 00 00    	jne    136b <add_note+0x17b>
    1366:	e9 3a 03 00 00       	jmpq   16a5 <add_note+0x4b5>
    136b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    136f:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
    1375:	48 8d 05 68 2d 00 00 	lea    0x2d68(%rip),%rax        # 40e4 <x.20>
    137c:	8b 00                	mov    (%rax),%eax
    137e:	48 8d 0d 77 2d 00 00 	lea    0x2d77(%rip),%rcx        # 40fc <y.21>
    1385:	8b 09                	mov    (%rcx),%ecx
    1387:	89 c2                	mov    %eax,%edx
    1389:	83 ea 01             	sub    $0x1,%edx
    138c:	0f af c2             	imul   %edx,%eax
    138f:	83 e0 01             	and    $0x1,%eax
    1392:	83 f8 00             	cmp    $0x0,%eax
    1395:	0f 94 c0             	sete   %al
    1398:	83 f9 0a             	cmp    $0xa,%ecx
    139b:	0f 9c c1             	setl   %cl
    139e:	08 c8                	or     %cl,%al
    13a0:	a8 01                	test   $0x1,%al
    13a2:	0f 85 05 00 00 00    	jne    13ad <add_note+0x1bd>
    13a8:	e9 f8 02 00 00       	jmpq   16a5 <add_note+0x4b5>
    13ad:	e9 00 00 00 00       	jmpq   13b2 <add_note+0x1c2>
    13b2:	48 8d 05 2b 2d 00 00 	lea    0x2d2b(%rip),%rax        # 40e4 <x.20>
    13b9:	8b 00                	mov    (%rax),%eax
    13bb:	48 8d 0d 3a 2d 00 00 	lea    0x2d3a(%rip),%rcx        # 40fc <y.21>
    13c2:	8b 09                	mov    (%rcx),%ecx
    13c4:	89 c2                	mov    %eax,%edx
    13c6:	83 ea 01             	sub    $0x1,%edx
    13c9:	0f af c2             	imul   %edx,%eax
    13cc:	83 e0 01             	and    $0x1,%eax
    13cf:	83 f8 00             	cmp    $0x0,%eax
    13d2:	0f 94 c0             	sete   %al
    13d5:	83 f9 0a             	cmp    $0xa,%ecx
    13d8:	0f 9c c1             	setl   %cl
    13db:	08 c8                	or     %cl,%al
    13dd:	a8 01                	test   $0x1,%al
    13df:	0f 85 05 00 00 00    	jne    13ea <add_note+0x1fa>
    13e5:	e9 ca 02 00 00       	jmpq   16b4 <add_note+0x4c4>
    13ea:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    13ee:	83 38 05             	cmpl   $0x5,(%rax)
    13f1:	0f 9c c0             	setl   %al
    13f4:	88 45 df             	mov    %al,-0x21(%rbp)
    13f7:	48 8d 05 e6 2c 00 00 	lea    0x2ce6(%rip),%rax        # 40e4 <x.20>
    13fe:	8b 00                	mov    (%rax),%eax
    1400:	48 8d 0d f5 2c 00 00 	lea    0x2cf5(%rip),%rcx        # 40fc <y.21>
    1407:	8b 09                	mov    (%rcx),%ecx
    1409:	89 c2                	mov    %eax,%edx
    140b:	83 ea 01             	sub    $0x1,%edx
    140e:	0f af c2             	imul   %edx,%eax
    1411:	83 e0 01             	and    $0x1,%eax
    1414:	83 f8 00             	cmp    $0x0,%eax
    1417:	0f 94 c0             	sete   %al
    141a:	83 f9 0a             	cmp    $0xa,%ecx
    141d:	0f 9c c1             	setl   %cl
    1420:	08 c8                	or     %cl,%al
    1422:	a8 01                	test   $0x1,%al
    1424:	0f 85 05 00 00 00    	jne    142f <add_note+0x23f>
    142a:	e9 85 02 00 00       	jmpq   16b4 <add_note+0x4c4>
    142f:	8a 45 df             	mov    -0x21(%rbp),%al
    1432:	a8 01                	test   $0x1,%al
    1434:	0f 85 05 00 00 00    	jne    143f <add_note+0x24f>
    143a:	e9 4b 02 00 00       	jmpq   168a <add_note+0x49a>
    143f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1443:	48 63 08             	movslq (%rax),%rcx
    1446:	48 8d 05 53 2c 00 00 	lea    0x2c53(%rip),%rax        # 40a0 <notelist>
    144d:	48 83 3c c8 00       	cmpq   $0x0,(%rax,%rcx,8)
    1452:	0f 85 1d 02 00 00    	jne    1675 <add_note+0x485>
    1458:	bf 10 00 00 00       	mov    $0x10,%edi
    145d:	e8 2e fc ff ff       	callq  1090 <malloc@plt>
    1462:	48 89 c6             	mov    %rax,%rsi
    1465:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1469:	48 63 10             	movslq (%rax),%rdx
    146c:	48 8d 0d 2d 2c 00 00 	lea    0x2c2d(%rip),%rcx        # 40a0 <notelist>
    1473:	48 89 34 d1          	mov    %rsi,(%rcx,%rdx,8)
    1477:	48 63 08             	movslq (%rax),%rcx
    147a:	48 8d 05 1f 2c 00 00 	lea    0x2c1f(%rip),%rax        # 40a0 <notelist>
    1481:	48 83 3c c8 00       	cmpq   $0x0,(%rax,%rcx,8)
    1486:	0f 85 16 00 00 00    	jne    14a2 <add_note+0x2b2>
    148c:	48 8d 3d 76 0b 00 00 	lea    0xb76(%rip),%rdi        # 2009 <_IO_stdin_used+0x9>
    1493:	e8 b8 fb ff ff       	callq  1050 <puts@plt>
    1498:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    149d:	e8 1e fc ff ff       	callq  10c0 <exit@plt>
    14a2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    14a6:	48 63 08             	movslq (%rax),%rcx
    14a9:	48 8d 05 f0 2b 00 00 	lea    0x2bf0(%rip),%rax        # 40a0 <notelist>
    14b0:	48 8b 04 c8          	mov    (%rax,%rcx,8),%rax
    14b4:	48 8d 0d 15 fd ff ff 	lea    -0x2eb(%rip),%rcx        # 11d0 <print_note_content>
    14bb:	48 89 08             	mov    %rcx,(%rax)
    14be:	48 8d 3d 51 0b 00 00 	lea    0xb51(%rip),%rdi        # 2016 <_IO_stdin_used+0x16>
    14c5:	b0 00                	mov    $0x0,%al
    14c7:	e8 a4 fb ff ff       	callq  1070 <printf@plt>
    14cc:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
    14d0:	31 ff                	xor    %edi,%edi
    14d2:	ba 08 00 00 00       	mov    $0x8,%edx
    14d7:	e8 a4 fb ff ff       	callq  1080 <read@plt>
    14dc:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
    14e0:	e8 cb fb ff ff       	callq  10b0 <atoi@plt>
    14e5:	89 c1                	mov    %eax,%ecx
    14e7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    14eb:	89 08                	mov    %ecx,(%rax)
    14ed:	48 63 38             	movslq (%rax),%rdi
    14f0:	e8 9b fb ff ff       	callq  1090 <malloc@plt>
    14f5:	48 89 c2             	mov    %rax,%rdx
    14f8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    14fc:	48 63 30             	movslq (%rax),%rsi
    14ff:	48 8d 0d 9a 2b 00 00 	lea    0x2b9a(%rip),%rcx        # 40a0 <notelist>
    1506:	48 8b 0c f1          	mov    (%rcx,%rsi,8),%rcx
    150a:	48 89 51 08          	mov    %rdx,0x8(%rcx)
    150e:	48 63 08             	movslq (%rax),%rcx
    1511:	48 8d 05 88 2b 00 00 	lea    0x2b88(%rip),%rax        # 40a0 <notelist>
    1518:	48 8b 04 c8          	mov    (%rax,%rcx,8),%rax
    151c:	48 83 78 08 00       	cmpq   $0x0,0x8(%rax)
    1521:	0f 85 86 00 00 00    	jne    15ad <add_note+0x3bd>
    1527:	48 8d 05 b6 2b 00 00 	lea    0x2bb6(%rip),%rax        # 40e4 <x.20>
    152e:	8b 00                	mov    (%rax),%eax
    1530:	48 8d 0d c5 2b 00 00 	lea    0x2bc5(%rip),%rcx        # 40fc <y.21>
    1537:	8b 09                	mov    (%rcx),%ecx
    1539:	89 c2                	mov    %eax,%edx
    153b:	83 ea 01             	sub    $0x1,%edx
    153e:	0f af c2             	imul   %edx,%eax
    1541:	83 e0 01             	and    $0x1,%eax
    1544:	83 f8 00             	cmp    $0x0,%eax
    1547:	0f 94 c0             	sete   %al
    154a:	83 f9 0a             	cmp    $0xa,%ecx
    154d:	0f 9c c1             	setl   %cl
    1550:	08 c8                	or     %cl,%al
    1552:	a8 01                	test   $0x1,%al
    1554:	0f 85 05 00 00 00    	jne    155f <add_note+0x36f>
    155a:	e9 5a 01 00 00       	jmpq   16b9 <add_note+0x4c9>
    155f:	48 8d 3d a3 0a 00 00 	lea    0xaa3(%rip),%rdi        # 2009 <_IO_stdin_used+0x9>
    1566:	e8 e5 fa ff ff       	callq  1050 <puts@plt>
    156b:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    1570:	e8 4b fb ff ff       	callq  10c0 <exit@plt>
    1575:	48 8d 05 68 2b 00 00 	lea    0x2b68(%rip),%rax        # 40e4 <x.20>
    157c:	8b 00                	mov    (%rax),%eax
    157e:	48 8d 0d 77 2b 00 00 	lea    0x2b77(%rip),%rcx        # 40fc <y.21>
    1585:	8b 09                	mov    (%rcx),%ecx
    1587:	89 c2                	mov    %eax,%edx
    1589:	83 ea 01             	sub    $0x1,%edx
    158c:	0f af c2             	imul   %edx,%eax
    158f:	83 e0 01             	and    $0x1,%eax
    1592:	83 f8 00             	cmp    $0x0,%eax
    1595:	0f 94 c0             	sete   %al
    1598:	83 f9 0a             	cmp    $0xa,%ecx
    159b:	0f 9c c1             	setl   %cl
    159e:	08 c8                	or     %cl,%al
    15a0:	a8 01                	test   $0x1,%al
    15a2:	0f 85 05 00 00 00    	jne    15ad <add_note+0x3bd>
    15a8:	e9 0c 01 00 00       	jmpq   16b9 <add_note+0x4c9>
    15ad:	48 8d 05 30 2b 00 00 	lea    0x2b30(%rip),%rax        # 40e4 <x.20>
    15b4:	8b 00                	mov    (%rax),%eax
    15b6:	48 8d 0d 3f 2b 00 00 	lea    0x2b3f(%rip),%rcx        # 40fc <y.21>
    15bd:	8b 09                	mov    (%rcx),%ecx
    15bf:	89 c2                	mov    %eax,%edx
    15c1:	83 ea 01             	sub    $0x1,%edx
    15c4:	0f af c2             	imul   %edx,%eax
    15c7:	83 e0 01             	and    $0x1,%eax
    15ca:	83 f8 00             	cmp    $0x0,%eax
    15cd:	0f 94 c0             	sete   %al
    15d0:	83 f9 0a             	cmp    $0xa,%ecx
    15d3:	0f 9c c1             	setl   %cl
    15d6:	08 c8                	or     %cl,%al
    15d8:	a8 01                	test   $0x1,%al
    15da:	0f 85 05 00 00 00    	jne    15e5 <add_note+0x3f5>
    15e0:	e9 ef 00 00 00       	jmpq   16d4 <add_note+0x4e4>
    15e5:	48 8d 3d 36 0a 00 00 	lea    0xa36(%rip),%rdi        # 2022 <_IO_stdin_used+0x22>
    15ec:	b0 00                	mov    $0x0,%al
    15ee:	e8 7d fa ff ff       	callq  1070 <printf@plt>
    15f3:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    15f7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    15fb:	48 63 11             	movslq (%rcx),%rdx
    15fe:	48 8d 0d 9b 2a 00 00 	lea    0x2a9b(%rip),%rcx        # 40a0 <notelist>
    1605:	48 8b 0c d1          	mov    (%rcx,%rdx,8),%rcx
    1609:	48 8b 71 08          	mov    0x8(%rcx),%rsi
    160d:	48 63 10             	movslq (%rax),%rdx
    1610:	31 ff                	xor    %edi,%edi
    1612:	e8 69 fa ff ff       	callq  1080 <read@plt>
    1617:	48 8d 3d 0e 0a 00 00 	lea    0xa0e(%rip),%rdi        # 202c <_IO_stdin_used+0x2c>
    161e:	e8 2d fa ff ff       	callq  1050 <puts@plt>
    1623:	48 8d 05 66 2a 00 00 	lea    0x2a66(%rip),%rax        # 4090 <count>
    162a:	8b 08                	mov    (%rax),%ecx
    162c:	83 c1 01             	add    $0x1,%ecx
    162f:	48 8d 05 5a 2a 00 00 	lea    0x2a5a(%rip),%rax        # 4090 <count>
    1636:	89 08                	mov    %ecx,(%rax)
    1638:	48 8d 05 a5 2a 00 00 	lea    0x2aa5(%rip),%rax        # 40e4 <x.20>
    163f:	8b 00                	mov    (%rax),%eax
    1641:	48 8d 0d b4 2a 00 00 	lea    0x2ab4(%rip),%rcx        # 40fc <y.21>
    1648:	8b 09                	mov    (%rcx),%ecx
    164a:	89 c2                	mov    %eax,%edx
    164c:	83 ea 01             	sub    $0x1,%edx
    164f:	0f af c2             	imul   %edx,%eax
    1652:	83 e0 01             	and    $0x1,%eax
    1655:	83 f8 00             	cmp    $0x0,%eax
    1658:	0f 94 c0             	sete   %al
    165b:	83 f9 0a             	cmp    $0xa,%ecx
    165e:	0f 9c c1             	setl   %cl
    1661:	08 c8                	or     %cl,%al
    1663:	a8 01                	test   $0x1,%al
    1665:	0f 85 05 00 00 00    	jne    1670 <add_note+0x480>
    166b:	e9 64 00 00 00       	jmpq   16d4 <add_note+0x4e4>
    1670:	e9 15 00 00 00       	jmpq   168a <add_note+0x49a>
    1675:	e9 00 00 00 00       	jmpq   167a <add_note+0x48a>
    167a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    167e:	8b 08                	mov    (%rax),%ecx
    1680:	83 c1 01             	add    $0x1,%ecx
    1683:	89 08                	mov    %ecx,(%rax)
    1685:	e9 28 fd ff ff       	jmpq   13b2 <add_note+0x1c2>
    168a:	48 89 ec             	mov    %rbp,%rsp
    168d:	5d                   	pop    %rbp
    168e:	c3                   	retq   
    168f:	e9 9c fb ff ff       	jmpq   1230 <add_note+0x40>
    1694:	48 8d 3d 69 09 00 00 	lea    0x969(%rip),%rdi        # 2004 <_IO_stdin_used+0x4>
    169b:	e8 b0 f9 ff ff       	callq  1050 <puts@plt>
    16a0:	e9 45 fc ff ff       	jmpq   12ea <add_note+0xfa>
    16a5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    16a9:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
    16af:	e9 b7 fc ff ff       	jmpq   136b <add_note+0x17b>
    16b4:	e9 31 fd ff ff       	jmpq   13ea <add_note+0x1fa>
    16b9:	48 8d 3d 49 09 00 00 	lea    0x949(%rip),%rdi        # 2009 <_IO_stdin_used+0x9>
    16c0:	e8 8b f9 ff ff       	callq  1050 <puts@plt>
    16c5:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    16ca:	e8 f1 f9 ff ff       	callq  10c0 <exit@plt>
    16cf:	e9 8b fe ff ff       	jmpq   155f <add_note+0x36f>
    16d4:	48 8d 3d 47 09 00 00 	lea    0x947(%rip),%rdi        # 2022 <_IO_stdin_used+0x22>
    16db:	b0 00                	mov    $0x0,%al
    16dd:	e8 8e f9 ff ff       	callq  1070 <printf@plt>
    16e2:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    16e6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    16ea:	48 63 11             	movslq (%rcx),%rdx
    16ed:	48 8d 0d ac 29 00 00 	lea    0x29ac(%rip),%rcx        # 40a0 <notelist>
    16f4:	48 8b 0c d1          	mov    (%rcx,%rdx,8),%rcx
    16f8:	48 8b 71 08          	mov    0x8(%rcx),%rsi
    16fc:	48 63 10             	movslq (%rax),%rdx
    16ff:	31 ff                	xor    %edi,%edi
    1701:	e8 7a f9 ff ff       	callq  1080 <read@plt>
    1706:	48 8d 3d 1f 09 00 00 	lea    0x91f(%rip),%rdi        # 202c <_IO_stdin_used+0x2c>
    170d:	e8 3e f9 ff ff       	callq  1050 <puts@plt>
    1712:	48 8d 05 77 29 00 00 	lea    0x2977(%rip),%rax        # 4090 <count>
    1719:	8b 08                	mov    (%rax),%ecx
    171b:	83 c1 01             	add    $0x1,%ecx
    171e:	48 8d 05 6b 29 00 00 	lea    0x296b(%rip),%rax        # 4090 <count>
    1725:	89 08                	mov    %ecx,(%rax)
    1727:	e9 b9 fe ff ff       	jmpq   15e5 <add_note+0x3f5>
    172c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001730 <del_note>:
    1730:	55                   	push   %rbp
    1731:	48 89 e5             	mov    %rsp,%rbp
    1734:	48 83 ec 10          	sub    $0x10,%rsp
    1738:	48 8d 3d f7 08 00 00 	lea    0x8f7(%rip),%rdi        # 2036 <_IO_stdin_used+0x36>
    173f:	b0 00                	mov    $0x0,%al
    1741:	e8 2a f9 ff ff       	callq  1070 <printf@plt>
    1746:	48 8d 75 fc          	lea    -0x4(%rbp),%rsi
    174a:	31 ff                	xor    %edi,%edi
    174c:	ba 04 00 00 00       	mov    $0x4,%edx
    1751:	e8 2a f9 ff ff       	callq  1080 <read@plt>
    1756:	48 8d 7d fc          	lea    -0x4(%rbp),%rdi
    175a:	e8 51 f9 ff ff       	callq  10b0 <atoi@plt>
    175f:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1762:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    1766:	0f 8c 92 00 00 00    	jl     17fe <del_note+0xce>
    176c:	48 8d 05 65 29 00 00 	lea    0x2965(%rip),%rax        # 40d8 <x.22>
    1773:	8b 00                	mov    (%rax),%eax
    1775:	48 8d 0d 74 29 00 00 	lea    0x2974(%rip),%rcx        # 40f0 <y.23>
    177c:	8b 09                	mov    (%rcx),%ecx
    177e:	89 c2                	mov    %eax,%edx
    1780:	83 ea 01             	sub    $0x1,%edx
    1783:	0f af c2             	imul   %edx,%eax
    1786:	83 e0 01             	and    $0x1,%eax
    1789:	83 f8 00             	cmp    $0x0,%eax
    178c:	0f 94 c0             	sete   %al
    178f:	83 f9 0a             	cmp    $0xa,%ecx
    1792:	0f 9c c1             	setl   %cl
    1795:	08 c8                	or     %cl,%al
    1797:	a8 01                	test   $0x1,%al
    1799:	0f 85 05 00 00 00    	jne    17a4 <del_note+0x74>
    179f:	e9 b1 01 00 00       	jmpq   1955 <del_note+0x225>
    17a4:	8b 45 f8             	mov    -0x8(%rbp),%eax
    17a7:	48 8d 0d e2 28 00 00 	lea    0x28e2(%rip),%rcx        # 4090 <count>
    17ae:	3b 01                	cmp    (%rcx),%eax
    17b0:	0f 9d c0             	setge  %al
    17b3:	88 45 f7             	mov    %al,-0x9(%rbp)
    17b6:	48 8d 05 1b 29 00 00 	lea    0x291b(%rip),%rax        # 40d8 <x.22>
    17bd:	8b 00                	mov    (%rax),%eax
    17bf:	48 8d 0d 2a 29 00 00 	lea    0x292a(%rip),%rcx        # 40f0 <y.23>
    17c6:	8b 09                	mov    (%rcx),%ecx
    17c8:	89 c2                	mov    %eax,%edx
    17ca:	83 ea 01             	sub    $0x1,%edx
    17cd:	0f af c2             	imul   %edx,%eax
    17d0:	83 e0 01             	and    $0x1,%eax
    17d3:	83 f8 00             	cmp    $0x0,%eax
    17d6:	0f 94 c0             	sete   %al
    17d9:	83 f9 0a             	cmp    $0xa,%ecx
    17dc:	0f 9c c1             	setl   %cl
    17df:	08 c8                	or     %cl,%al
    17e1:	a8 01                	test   $0x1,%al
    17e3:	0f 85 05 00 00 00    	jne    17ee <del_note+0xbe>
    17e9:	e9 67 01 00 00       	jmpq   1955 <del_note+0x225>
    17ee:	8a 45 f7             	mov    -0x9(%rbp),%al
    17f1:	a8 01                	test   $0x1,%al
    17f3:	0f 85 05 00 00 00    	jne    17fe <del_note+0xce>
    17f9:	e9 83 00 00 00       	jmpq   1881 <del_note+0x151>
    17fe:	48 8d 05 d3 28 00 00 	lea    0x28d3(%rip),%rax        # 40d8 <x.22>
    1805:	8b 00                	mov    (%rax),%eax
    1807:	48 8d 0d e2 28 00 00 	lea    0x28e2(%rip),%rcx        # 40f0 <y.23>
    180e:	8b 09                	mov    (%rcx),%ecx
    1810:	89 c2                	mov    %eax,%edx
    1812:	83 ea 01             	sub    $0x1,%edx
    1815:	0f af c2             	imul   %edx,%eax
    1818:	83 e0 01             	and    $0x1,%eax
    181b:	83 f8 00             	cmp    $0x0,%eax
    181e:	0f 94 c0             	sete   %al
    1821:	83 f9 0a             	cmp    $0xa,%ecx
    1824:	0f 9c c1             	setl   %cl
    1827:	08 c8                	or     %cl,%al
    1829:	a8 01                	test   $0x1,%al
    182b:	0f 85 05 00 00 00    	jne    1836 <del_note+0x106>
    1831:	e9 24 01 00 00       	jmpq   195a <del_note+0x22a>
    1836:	48 8d 3d 01 08 00 00 	lea    0x801(%rip),%rdi        # 203e <_IO_stdin_used+0x3e>
    183d:	e8 0e f8 ff ff       	callq  1050 <puts@plt>
    1842:	31 ff                	xor    %edi,%edi
    1844:	e8 f7 f7 ff ff       	callq  1040 <_exit@plt>
    1849:	48 8d 05 88 28 00 00 	lea    0x2888(%rip),%rax        # 40d8 <x.22>
    1850:	8b 00                	mov    (%rax),%eax
    1852:	48 8d 0d 97 28 00 00 	lea    0x2897(%rip),%rcx        # 40f0 <y.23>
    1859:	8b 09                	mov    (%rcx),%ecx
    185b:	89 c2                	mov    %eax,%edx
    185d:	83 ea 01             	sub    $0x1,%edx
    1860:	0f af c2             	imul   %edx,%eax
    1863:	83 e0 01             	and    $0x1,%eax
    1866:	83 f8 00             	cmp    $0x0,%eax
    1869:	0f 94 c0             	sete   %al
    186c:	83 f9 0a             	cmp    $0xa,%ecx
    186f:	0f 9c c1             	setl   %cl
    1872:	08 c8                	or     %cl,%al
    1874:	a8 01                	test   $0x1,%al
    1876:	0f 85 05 00 00 00    	jne    1881 <del_note+0x151>
    187c:	e9 d9 00 00 00       	jmpq   195a <del_note+0x22a>
    1881:	48 8d 05 50 28 00 00 	lea    0x2850(%rip),%rax        # 40d8 <x.22>
    1888:	8b 00                	mov    (%rax),%eax
    188a:	48 8d 0d 5f 28 00 00 	lea    0x285f(%rip),%rcx        # 40f0 <y.23>
    1891:	8b 09                	mov    (%rcx),%ecx
    1893:	89 c2                	mov    %eax,%edx
    1895:	83 ea 01             	sub    $0x1,%edx
    1898:	0f af c2             	imul   %edx,%eax
    189b:	83 e0 01             	and    $0x1,%eax
    189e:	83 f8 00             	cmp    $0x0,%eax
    18a1:	0f 94 c0             	sete   %al
    18a4:	83 f9 0a             	cmp    $0xa,%ecx
    18a7:	0f 9c c1             	setl   %cl
    18aa:	08 c8                	or     %cl,%al
    18ac:	a8 01                	test   $0x1,%al
    18ae:	0f 85 05 00 00 00    	jne    18b9 <del_note+0x189>
    18b4:	e9 b9 00 00 00       	jmpq   1972 <del_note+0x242>
    18b9:	48 63 4d f8          	movslq -0x8(%rbp),%rcx
    18bd:	48 8d 05 dc 27 00 00 	lea    0x27dc(%rip),%rax        # 40a0 <notelist>
    18c4:	48 83 3c c8 00       	cmpq   $0x0,(%rax,%rcx,8)
    18c9:	0f 95 c0             	setne  %al
    18cc:	88 45 f6             	mov    %al,-0xa(%rbp)
    18cf:	48 8d 05 02 28 00 00 	lea    0x2802(%rip),%rax        # 40d8 <x.22>
    18d6:	8b 00                	mov    (%rax),%eax
    18d8:	48 8d 0d 11 28 00 00 	lea    0x2811(%rip),%rcx        # 40f0 <y.23>
    18df:	8b 09                	mov    (%rcx),%ecx
    18e1:	89 c2                	mov    %eax,%edx
    18e3:	83 ea 01             	sub    $0x1,%edx
    18e6:	0f af c2             	imul   %edx,%eax
    18e9:	83 e0 01             	and    $0x1,%eax
    18ec:	83 f8 00             	cmp    $0x0,%eax
    18ef:	0f 94 c0             	sete   %al
    18f2:	83 f9 0a             	cmp    $0xa,%ecx
    18f5:	0f 9c c1             	setl   %cl
    18f8:	08 c8                	or     %cl,%al
    18fa:	a8 01                	test   $0x1,%al
    18fc:	0f 85 05 00 00 00    	jne    1907 <del_note+0x1d7>
    1902:	e9 6b 00 00 00       	jmpq   1972 <del_note+0x242>
    1907:	8a 45 f6             	mov    -0xa(%rbp),%al
    190a:	a8 01                	test   $0x1,%al
    190c:	0f 85 05 00 00 00    	jne    1917 <del_note+0x1e7>
    1912:	e9 38 00 00 00       	jmpq   194f <del_note+0x21f>
    1917:	48 63 4d f8          	movslq -0x8(%rbp),%rcx
    191b:	48 8d 05 7e 27 00 00 	lea    0x277e(%rip),%rax        # 40a0 <notelist>
    1922:	48 8b 04 c8          	mov    (%rax,%rcx,8),%rax
    1926:	48 8b 78 08          	mov    0x8(%rax),%rdi
    192a:	e8 01 f7 ff ff       	callq  1030 <free@plt>
    192f:	48 63 4d f8          	movslq -0x8(%rbp),%rcx
    1933:	48 8d 05 66 27 00 00 	lea    0x2766(%rip),%rax        # 40a0 <notelist>
    193a:	48 8b 3c c8          	mov    (%rax,%rcx,8),%rdi
    193e:	e8 ed f6 ff ff       	callq  1030 <free@plt>
    1943:	48 8d 3d 02 07 00 00 	lea    0x702(%rip),%rdi        # 204c <_IO_stdin_used+0x4c>
    194a:	e8 01 f7 ff ff       	callq  1050 <puts@plt>
    194f:	48 83 c4 10          	add    $0x10,%rsp
    1953:	5d                   	pop    %rbp
    1954:	c3                   	retq   
    1955:	e9 4a fe ff ff       	jmpq   17a4 <del_note+0x74>
    195a:	48 8d 3d dd 06 00 00 	lea    0x6dd(%rip),%rdi        # 203e <_IO_stdin_used+0x3e>
    1961:	e8 ea f6 ff ff       	callq  1050 <puts@plt>
    1966:	31 ff                	xor    %edi,%edi
    1968:	e8 d3 f6 ff ff       	callq  1040 <_exit@plt>
    196d:	e9 c4 fe ff ff       	jmpq   1836 <del_note+0x106>
    1972:	e9 42 ff ff ff       	jmpq   18b9 <del_note+0x189>
    1977:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    197e:	00 00 

0000000000001980 <print_note>:
    1980:	55                   	push   %rbp
    1981:	48 89 e5             	mov    %rsp,%rbp
    1984:	48 83 ec 10          	sub    $0x10,%rsp
    1988:	48 8d 3d a7 06 00 00 	lea    0x6a7(%rip),%rdi        # 2036 <_IO_stdin_used+0x36>
    198f:	b0 00                	mov    $0x0,%al
    1991:	e8 da f6 ff ff       	callq  1070 <printf@plt>
    1996:	48 8d 75 fc          	lea    -0x4(%rbp),%rsi
    199a:	31 ff                	xor    %edi,%edi
    199c:	ba 04 00 00 00       	mov    $0x4,%edx
    19a1:	e8 da f6 ff ff       	callq  1080 <read@plt>
    19a6:	48 8d 7d fc          	lea    -0x4(%rbp),%rdi
    19aa:	e8 01 f7 ff ff       	callq  10b0 <atoi@plt>
    19af:	89 45 f8             	mov    %eax,-0x8(%rbp)
    19b2:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    19b6:	0f 8c 92 00 00 00    	jl     1a4e <print_note+0xce>
    19bc:	48 8d 05 11 27 00 00 	lea    0x2711(%rip),%rax        # 40d4 <x.24>
    19c3:	8b 00                	mov    (%rax),%eax
    19c5:	48 8d 0d 20 27 00 00 	lea    0x2720(%rip),%rcx        # 40ec <y.25>
    19cc:	8b 09                	mov    (%rcx),%ecx
    19ce:	89 c2                	mov    %eax,%edx
    19d0:	83 ea 01             	sub    $0x1,%edx
    19d3:	0f af c2             	imul   %edx,%eax
    19d6:	83 e0 01             	and    $0x1,%eax
    19d9:	83 f8 00             	cmp    $0x0,%eax
    19dc:	0f 94 c0             	sete   %al
    19df:	83 f9 0a             	cmp    $0xa,%ecx
    19e2:	0f 9c c1             	setl   %cl
    19e5:	08 c8                	or     %cl,%al
    19e7:	a8 01                	test   $0x1,%al
    19e9:	0f 85 05 00 00 00    	jne    19f4 <print_note+0x74>
    19ef:	e9 1e 01 00 00       	jmpq   1b12 <print_note+0x192>
    19f4:	8b 45 f8             	mov    -0x8(%rbp),%eax
    19f7:	48 8d 0d 92 26 00 00 	lea    0x2692(%rip),%rcx        # 4090 <count>
    19fe:	3b 01                	cmp    (%rcx),%eax
    1a00:	0f 9d c0             	setge  %al
    1a03:	88 45 f7             	mov    %al,-0x9(%rbp)
    1a06:	48 8d 05 c7 26 00 00 	lea    0x26c7(%rip),%rax        # 40d4 <x.24>
    1a0d:	8b 00                	mov    (%rax),%eax
    1a0f:	48 8d 0d d6 26 00 00 	lea    0x26d6(%rip),%rcx        # 40ec <y.25>
    1a16:	8b 09                	mov    (%rcx),%ecx
    1a18:	89 c2                	mov    %eax,%edx
    1a1a:	83 ea 01             	sub    $0x1,%edx
    1a1d:	0f af c2             	imul   %edx,%eax
    1a20:	83 e0 01             	and    $0x1,%eax
    1a23:	83 f8 00             	cmp    $0x0,%eax
    1a26:	0f 94 c0             	sete   %al
    1a29:	83 f9 0a             	cmp    $0xa,%ecx
    1a2c:	0f 9c c1             	setl   %cl
    1a2f:	08 c8                	or     %cl,%al
    1a31:	a8 01                	test   $0x1,%al
    1a33:	0f 85 05 00 00 00    	jne    1a3e <print_note+0xbe>
    1a39:	e9 d4 00 00 00       	jmpq   1b12 <print_note+0x192>
    1a3e:	8a 45 f7             	mov    -0x9(%rbp),%al
    1a41:	a8 01                	test   $0x1,%al
    1a43:	0f 85 05 00 00 00    	jne    1a4e <print_note+0xce>
    1a49:	e9 83 00 00 00       	jmpq   1ad1 <print_note+0x151>
    1a4e:	48 8d 05 7f 26 00 00 	lea    0x267f(%rip),%rax        # 40d4 <x.24>
    1a55:	8b 00                	mov    (%rax),%eax
    1a57:	48 8d 0d 8e 26 00 00 	lea    0x268e(%rip),%rcx        # 40ec <y.25>
    1a5e:	8b 09                	mov    (%rcx),%ecx
    1a60:	89 c2                	mov    %eax,%edx
    1a62:	83 ea 01             	sub    $0x1,%edx
    1a65:	0f af c2             	imul   %edx,%eax
    1a68:	83 e0 01             	and    $0x1,%eax
    1a6b:	83 f8 00             	cmp    $0x0,%eax
    1a6e:	0f 94 c0             	sete   %al
    1a71:	83 f9 0a             	cmp    $0xa,%ecx
    1a74:	0f 9c c1             	setl   %cl
    1a77:	08 c8                	or     %cl,%al
    1a79:	a8 01                	test   $0x1,%al
    1a7b:	0f 85 05 00 00 00    	jne    1a86 <print_note+0x106>
    1a81:	e9 91 00 00 00       	jmpq   1b17 <print_note+0x197>
    1a86:	48 8d 3d b1 05 00 00 	lea    0x5b1(%rip),%rdi        # 203e <_IO_stdin_used+0x3e>
    1a8d:	e8 be f5 ff ff       	callq  1050 <puts@plt>
    1a92:	31 ff                	xor    %edi,%edi
    1a94:	e8 a7 f5 ff ff       	callq  1040 <_exit@plt>
    1a99:	48 8d 05 34 26 00 00 	lea    0x2634(%rip),%rax        # 40d4 <x.24>
    1aa0:	8b 00                	mov    (%rax),%eax
    1aa2:	48 8d 0d 43 26 00 00 	lea    0x2643(%rip),%rcx        # 40ec <y.25>
    1aa9:	8b 09                	mov    (%rcx),%ecx
    1aab:	89 c2                	mov    %eax,%edx
    1aad:	83 ea 01             	sub    $0x1,%edx
    1ab0:	0f af c2             	imul   %edx,%eax
    1ab3:	83 e0 01             	and    $0x1,%eax
    1ab6:	83 f8 00             	cmp    $0x0,%eax
    1ab9:	0f 94 c0             	sete   %al
    1abc:	83 f9 0a             	cmp    $0xa,%ecx
    1abf:	0f 9c c1             	setl   %cl
    1ac2:	08 c8                	or     %cl,%al
    1ac4:	a8 01                	test   $0x1,%al
    1ac6:	0f 85 05 00 00 00    	jne    1ad1 <print_note+0x151>
    1acc:	e9 46 00 00 00       	jmpq   1b17 <print_note+0x197>
    1ad1:	48 63 4d f8          	movslq -0x8(%rbp),%rcx
    1ad5:	48 8d 05 c4 25 00 00 	lea    0x25c4(%rip),%rax        # 40a0 <notelist>
    1adc:	48 83 3c c8 00       	cmpq   $0x0,(%rax,%rcx,8)
    1ae1:	0f 84 25 00 00 00    	je     1b0c <print_note+0x18c>
    1ae7:	48 63 4d f8          	movslq -0x8(%rbp),%rcx
    1aeb:	48 8d 05 ae 25 00 00 	lea    0x25ae(%rip),%rax        # 40a0 <notelist>
    1af2:	48 8b 04 c8          	mov    (%rax,%rcx,8),%rax
    1af6:	48 8b 08             	mov    (%rax),%rcx
    1af9:	48 63 55 f8          	movslq -0x8(%rbp),%rdx
    1afd:	48 8d 05 9c 25 00 00 	lea    0x259c(%rip),%rax        # 40a0 <notelist>
    1b04:	48 8b 3c d0          	mov    (%rax,%rdx,8),%rdi
    1b08:	b0 00                	mov    $0x0,%al
    1b0a:	ff d1                	callq  *%rcx
    1b0c:	48 83 c4 10          	add    $0x10,%rsp
    1b10:	5d                   	pop    %rbp
    1b11:	c3                   	retq   
    1b12:	e9 dd fe ff ff       	jmpq   19f4 <print_note+0x74>
    1b17:	48 8d 3d 20 05 00 00 	lea    0x520(%rip),%rdi        # 203e <_IO_stdin_used+0x3e>
    1b1e:	e8 2d f5 ff ff       	callq  1050 <puts@plt>
    1b23:	31 ff                	xor    %edi,%edi
    1b25:	e8 16 f5 ff ff       	callq  1040 <_exit@plt>
    1b2a:	e9 57 ff ff ff       	jmpq   1a86 <print_note+0x106>
    1b2f:	90                   	nop

0000000000001b30 <tips>:
    1b30:	55                   	push   %rbp
    1b31:	48 89 e5             	mov    %rsp,%rbp
    1b34:	48 83 ec 10          	sub    $0x10,%rsp
    1b38:	48 8d 3d 15 05 00 00 	lea    0x515(%rip),%rdi        # 2054 <_IO_stdin_used+0x54>
    1b3f:	b0 00                	mov    $0x0,%al
    1b41:	e8 2a f5 ff ff       	callq  1070 <printf@plt>
    1b46:	48 8d 05 a3 f6 ff ff 	lea    -0x95d(%rip),%rax        # 11f0 <add_note>
    1b4d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1b51:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
    1b55:	48 8d 3d 13 05 00 00 	lea    0x513(%rip),%rdi        # 206f <_IO_stdin_used+0x6f>
    1b5c:	b0 00                	mov    $0x0,%al
    1b5e:	e8 0d f5 ff ff       	callq  1070 <printf@plt>
    1b63:	48 83 c4 10          	add    $0x10,%rsp
    1b67:	5d                   	pop    %rbp
    1b68:	c3                   	retq   
    1b69:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001b70 <magic>:
    1b70:	55                   	push   %rbp
    1b71:	48 89 e5             	mov    %rsp,%rbp
    1b74:	48 8d 05 61 25 00 00 	lea    0x2561(%rip),%rax        # 40dc <x.28>
    1b7b:	8b 00                	mov    (%rax),%eax
    1b7d:	48 8d 0d 70 25 00 00 	lea    0x2570(%rip),%rcx        # 40f4 <y.29>
    1b84:	8b 09                	mov    (%rcx),%ecx
    1b86:	89 c2                	mov    %eax,%edx
    1b88:	83 ea 01             	sub    $0x1,%edx
    1b8b:	0f af c2             	imul   %edx,%eax
    1b8e:	83 e0 01             	and    $0x1,%eax
    1b91:	83 f8 00             	cmp    $0x0,%eax
    1b94:	0f 94 c0             	sete   %al
    1b97:	83 f9 0a             	cmp    $0xa,%ecx
    1b9a:	0f 9c c1             	setl   %cl
    1b9d:	08 c8                	or     %cl,%al
    1b9f:	a8 01                	test   $0x1,%al
    1ba1:	0f 85 05 00 00 00    	jne    1bac <magic+0x3c>
    1ba7:	e9 46 00 00 00       	jmpq   1bf2 <magic+0x82>
    1bac:	48 8d 3d c0 04 00 00 	lea    0x4c0(%rip),%rdi        # 2073 <_IO_stdin_used+0x73>
    1bb3:	e8 a8 f4 ff ff       	callq  1060 <system@plt>
    1bb8:	48 8d 05 1d 25 00 00 	lea    0x251d(%rip),%rax        # 40dc <x.28>
    1bbf:	8b 00                	mov    (%rax),%eax
    1bc1:	48 8d 0d 2c 25 00 00 	lea    0x252c(%rip),%rcx        # 40f4 <y.29>
    1bc8:	8b 09                	mov    (%rcx),%ecx
    1bca:	89 c2                	mov    %eax,%edx
    1bcc:	83 ea 01             	sub    $0x1,%edx
    1bcf:	0f af c2             	imul   %edx,%eax
    1bd2:	83 e0 01             	and    $0x1,%eax
    1bd5:	83 f8 00             	cmp    $0x0,%eax
    1bd8:	0f 94 c0             	sete   %al
    1bdb:	83 f9 0a             	cmp    $0xa,%ecx
    1bde:	0f 9c c1             	setl   %cl
    1be1:	08 c8                	or     %cl,%al
    1be3:	a8 01                	test   $0x1,%al
    1be5:	0f 85 05 00 00 00    	jne    1bf0 <magic+0x80>
    1beb:	e9 02 00 00 00       	jmpq   1bf2 <magic+0x82>
    1bf0:	5d                   	pop    %rbp
    1bf1:	c3                   	retq   
    1bf2:	48 8d 3d 7a 04 00 00 	lea    0x47a(%rip),%rdi        # 2073 <_IO_stdin_used+0x73>
    1bf9:	e8 62 f4 ff ff       	callq  1060 <system@plt>
    1bfe:	e9 a9 ff ff ff       	jmpq   1bac <magic+0x3c>
    1c03:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    1c0a:	00 00 00 
    1c0d:	0f 1f 00             	nopl   (%rax)

0000000000001c10 <menu>:
    1c10:	55                   	push   %rbp
    1c11:	48 89 e5             	mov    %rsp,%rbp
    1c14:	48 8d 3d 61 04 00 00 	lea    0x461(%rip),%rdi        # 207c <_IO_stdin_used+0x7c>
    1c1b:	e8 30 f4 ff ff       	callq  1050 <puts@plt>
    1c20:	48 8d 3d 6c 04 00 00 	lea    0x46c(%rip),%rdi        # 2093 <_IO_stdin_used+0x93>
    1c27:	e8 24 f4 ff ff       	callq  1050 <puts@plt>
    1c2c:	48 8d 3d 49 04 00 00 	lea    0x449(%rip),%rdi        # 207c <_IO_stdin_used+0x7c>
    1c33:	e8 18 f4 ff ff       	callq  1050 <puts@plt>
    1c38:	48 8d 3d 6b 04 00 00 	lea    0x46b(%rip),%rdi        # 20aa <_IO_stdin_used+0xaa>
    1c3f:	e8 0c f4 ff ff       	callq  1050 <puts@plt>
    1c44:	48 8d 3d 76 04 00 00 	lea    0x476(%rip),%rdi        # 20c1 <_IO_stdin_used+0xc1>
    1c4b:	e8 00 f4 ff ff       	callq  1050 <puts@plt>
    1c50:	48 8d 3d 81 04 00 00 	lea    0x481(%rip),%rdi        # 20d8 <_IO_stdin_used+0xd8>
    1c57:	e8 f4 f3 ff ff       	callq  1050 <puts@plt>
    1c5c:	48 8d 3d 8c 04 00 00 	lea    0x48c(%rip),%rdi        # 20ef <_IO_stdin_used+0xef>
    1c63:	e8 e8 f3 ff ff       	callq  1050 <puts@plt>
    1c68:	48 8d 3d 97 04 00 00 	lea    0x497(%rip),%rdi        # 2106 <_IO_stdin_used+0x106>
    1c6f:	e8 dc f3 ff ff       	callq  1050 <puts@plt>
    1c74:	48 8d 3d 01 04 00 00 	lea    0x401(%rip),%rdi        # 207c <_IO_stdin_used+0x7c>
    1c7b:	e8 d0 f3 ff ff       	callq  1050 <puts@plt>
    1c80:	48 8d 3d 88 04 00 00 	lea    0x488(%rip),%rdi        # 210f <_IO_stdin_used+0x10f>
    1c87:	b0 00                	mov    $0x0,%al
    1c89:	e8 e2 f3 ff ff       	callq  1070 <printf@plt>
    1c8e:	5d                   	pop    %rbp
    1c8f:	c3                   	retq   

0000000000001c90 <main>:
    1c90:	55                   	push   %rbp
    1c91:	48 89 e5             	mov    %rsp,%rbp
    1c94:	48 83 ec 10          	sub    $0x10,%rsp
    1c98:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    1c9f:	48 8b 05 2a 23 00 00 	mov    0x232a(%rip),%rax        # 3fd0 <stdout@GLIBC_2.2.5>
    1ca6:	48 8b 38             	mov    (%rax),%rdi
    1ca9:	31 c0                	xor    %eax,%eax
    1cab:	89 c1                	mov    %eax,%ecx
    1cad:	ba 02 00 00 00       	mov    $0x2,%edx
    1cb2:	48 89 ce             	mov    %rcx,%rsi
    1cb5:	e8 e6 f3 ff ff       	callq  10a0 <setvbuf@plt>
    1cba:	48 8b 05 17 23 00 00 	mov    0x2317(%rip),%rax        # 3fd8 <stdin@GLIBC_2.2.5>
    1cc1:	48 8b 38             	mov    (%rax),%rdi
    1cc4:	31 c0                	xor    %eax,%eax
    1cc6:	89 c1                	mov    %eax,%ecx
    1cc8:	ba 02 00 00 00       	mov    $0x2,%edx
    1ccd:	48 89 ce             	mov    %rcx,%rsi
    1cd0:	e8 cb f3 ff ff       	callq  10a0 <setvbuf@plt>
    1cd5:	e8 36 ff ff ff       	callq  1c10 <menu>
    1cda:	48 8d 75 f8          	lea    -0x8(%rbp),%rsi
    1cde:	31 ff                	xor    %edi,%edi
    1ce0:	ba 04 00 00 00       	mov    $0x4,%edx
    1ce5:	e8 96 f3 ff ff       	callq  1080 <read@plt>
    1cea:	48 8d 7d f8          	lea    -0x8(%rbp),%rdi
    1cee:	e8 bd f3 ff ff       	callq  10b0 <atoi@plt>
    1cf3:	89 45 f4             	mov    %eax,-0xc(%rbp)
    1cf6:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1cf9:	83 f8 03             	cmp    $0x3,%eax
    1cfc:	0f 8c 29 00 00 00    	jl     1d2b <main+0x9b>
    1d02:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1d05:	83 f8 04             	cmp    $0x4,%eax
    1d08:	0f 8c 49 00 00 00    	jl     1d57 <main+0xc7>
    1d0e:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1d11:	83 f8 05             	cmp    $0x5,%eax
    1d14:	0f 8c 47 00 00 00    	jl     1d61 <main+0xd1>
    1d1a:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1d1d:	83 f8 05             	cmp    $0x5,%eax
    1d20:	0f 84 42 00 00 00    	je     1d68 <main+0xd8>
    1d26:	e9 47 00 00 00       	jmpq   1d72 <main+0xe2>
    1d2b:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1d2e:	83 f8 02             	cmp    $0x2,%eax
    1d31:	0f 8d 16 00 00 00    	jge    1d4d <main+0xbd>
    1d37:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1d3a:	83 f8 01             	cmp    $0x1,%eax
    1d3d:	0f 85 2f 00 00 00    	jne    1d72 <main+0xe2>
    1d43:	e8 a8 f4 ff ff       	callq  11f0 <add_note>
    1d48:	e9 36 00 00 00       	jmpq   1d83 <main+0xf3>
    1d4d:	e8 de f9 ff ff       	callq  1730 <del_note>
    1d52:	e9 2c 00 00 00       	jmpq   1d83 <main+0xf3>
    1d57:	e8 24 fc ff ff       	callq  1980 <print_note>
    1d5c:	e9 22 00 00 00       	jmpq   1d83 <main+0xf3>
    1d61:	31 ff                	xor    %edi,%edi
    1d63:	e8 58 f3 ff ff       	callq  10c0 <exit@plt>
    1d68:	e8 c3 fd ff ff       	callq  1b30 <tips>
    1d6d:	e9 11 00 00 00       	jmpq   1d83 <main+0xf3>
    1d72:	e9 00 00 00 00       	jmpq   1d77 <main+0xe7>
    1d77:	48 8d 3d 9f 03 00 00 	lea    0x39f(%rip),%rdi        # 211d <_IO_stdin_used+0x11d>
    1d7e:	e8 cd f2 ff ff       	callq  1050 <puts@plt>
    1d83:	e9 4d ff ff ff       	jmpq   1cd5 <main+0x45>
    1d88:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    1d8f:	00 

0000000000001d90 <__libc_csu_init>:
    1d90:	f3 0f 1e fa          	endbr64 
    1d94:	41 57                	push   %r15
    1d96:	4c 8d 3d 3b 20 00 00 	lea    0x203b(%rip),%r15        # 3dd8 <__frame_dummy_init_array_entry>
    1d9d:	41 56                	push   %r14
    1d9f:	49 89 d6             	mov    %rdx,%r14
    1da2:	41 55                	push   %r13
    1da4:	49 89 f5             	mov    %rsi,%r13
    1da7:	41 54                	push   %r12
    1da9:	41 89 fc             	mov    %edi,%r12d
    1dac:	55                   	push   %rbp
    1dad:	48 8d 2d 2c 20 00 00 	lea    0x202c(%rip),%rbp        # 3de0 <__do_global_dtors_aux_fini_array_entry>
    1db4:	53                   	push   %rbx
    1db5:	4c 29 fd             	sub    %r15,%rbp
    1db8:	48 83 ec 08          	sub    $0x8,%rsp
    1dbc:	e8 3f f2 ff ff       	callq  1000 <_init>
    1dc1:	48 c1 fd 03          	sar    $0x3,%rbp
    1dc5:	74 1f                	je     1de6 <__libc_csu_init+0x56>
    1dc7:	31 db                	xor    %ebx,%ebx
    1dc9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1dd0:	4c 89 f2             	mov    %r14,%rdx
    1dd3:	4c 89 ee             	mov    %r13,%rsi
    1dd6:	44 89 e7             	mov    %r12d,%edi
    1dd9:	41 ff 14 df          	callq  *(%r15,%rbx,8)
    1ddd:	48 83 c3 01          	add    $0x1,%rbx
    1de1:	48 39 dd             	cmp    %rbx,%rbp
    1de4:	75 ea                	jne    1dd0 <__libc_csu_init+0x40>
    1de6:	48 83 c4 08          	add    $0x8,%rsp
    1dea:	5b                   	pop    %rbx
    1deb:	5d                   	pop    %rbp
    1dec:	41 5c                	pop    %r12
    1dee:	41 5d                	pop    %r13
    1df0:	41 5e                	pop    %r14
    1df2:	41 5f                	pop    %r15
    1df4:	c3                   	retq   
    1df5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    1dfc:	00 00 00 00 

0000000000001e00 <__libc_csu_fini>:
    1e00:	f3 0f 1e fa          	endbr64 
    1e04:	c3                   	retq   

Disassembly of section .fini:

0000000000001e08 <_fini>:
    1e08:	f3 0f 1e fa          	endbr64 
    1e0c:	48 83 ec 08          	sub    $0x8,%rsp
    1e10:	48 83 c4 08          	add    $0x8,%rsp
    1e14:	c3                   	retq   
