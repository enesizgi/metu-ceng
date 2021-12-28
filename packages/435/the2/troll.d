
troll:	file format elf32-i386


Disassembly of section .init:

08048a98 <_init>:
 8048a98: 55                           	pushl	%ebp
 8048a99: 89 e5                        	movl	%esp, %ebp
 8048a9b: 83 ec 08                     	subl	$8, %esp
 8048a9e: e8 21 03 00 00               	calll	0x8048dc4 <call_gmon_start>
 8048aa3: e8 78 03 00 00               	calll	0x8048e20 <frame_dummy>
 8048aa8: e8 23 32 00 00               	calll	0x804bcd0 <__do_global_ctors_aux>
 8048aad: c9                           	leave
 8048aae: c3                           	retl

Disassembly of section .plt:

08048ab0 <.plt>:
 8048ab0: ff 35 50 d2 04 08            	pushl	134533712
 8048ab6: ff 25 54 d2 04 08            	jmpl	*134533716
 8048abc: 00 00                        	addb	%al, (%eax)
 8048abe: 00 00                        	addb	%al, (%eax)
 8048ac0: ff 25 58 d2 04 08            	jmpl	*134533720
 8048ac6: 68 00 00 00 00               	pushl	$0
 8048acb: e9 e0 ff ff ff               	jmp	0x8048ab0 <.plt>
 8048ad0: ff 25 5c d2 04 08            	jmpl	*134533724
 8048ad6: 68 08 00 00 00               	pushl	$8
 8048adb: e9 d0 ff ff ff               	jmp	0x8048ab0 <.plt>
 8048ae0: ff 25 60 d2 04 08            	jmpl	*134533728
 8048ae6: 68 10 00 00 00               	pushl	$16
 8048aeb: e9 c0 ff ff ff               	jmp	0x8048ab0 <.plt>
 8048af0: ff 25 64 d2 04 08            	jmpl	*134533732
 8048af6: 68 18 00 00 00               	pushl	$24
 8048afb: e9 b0 ff ff ff               	jmp	0x8048ab0 <.plt>
 8048b00: ff 25 68 d2 04 08            	jmpl	*134533736
 8048b06: 68 20 00 00 00               	pushl	$32
 8048b0b: e9 a0 ff ff ff               	jmp	0x8048ab0 <.plt>
 8048b10: ff 25 6c d2 04 08            	jmpl	*134533740
 8048b16: 68 28 00 00 00               	pushl	$40
 8048b1b: e9 90 ff ff ff               	jmp	0x8048ab0 <.plt>
 8048b20: ff 25 70 d2 04 08            	jmpl	*134533744
 8048b26: 68 30 00 00 00               	pushl	$48
 8048b2b: e9 80 ff ff ff               	jmp	0x8048ab0 <.plt>
 8048b30: ff 25 74 d2 04 08            	jmpl	*134533748
 8048b36: 68 38 00 00 00               	pushl	$56
 8048b3b: e9 70 ff ff ff               	jmp	0x8048ab0 <.plt>
 8048b40: ff 25 78 d2 04 08            	jmpl	*134533752
 8048b46: 68 40 00 00 00               	pushl	$64
 8048b4b: e9 60 ff ff ff               	jmp	0x8048ab0 <.plt>
 8048b50: ff 25 7c d2 04 08            	jmpl	*134533756
 8048b56: 68 48 00 00 00               	pushl	$72
 8048b5b: e9 50 ff ff ff               	jmp	0x8048ab0 <.plt>
 8048b60: ff 25 80 d2 04 08            	jmpl	*134533760
 8048b66: 68 50 00 00 00               	pushl	$80
 8048b6b: e9 40 ff ff ff               	jmp	0x8048ab0 <.plt>
 8048b70: ff 25 84 d2 04 08            	jmpl	*134533764
 8048b76: 68 58 00 00 00               	pushl	$88
 8048b7b: e9 30 ff ff ff               	jmp	0x8048ab0 <.plt>
 8048b80: ff 25 88 d2 04 08            	jmpl	*134533768
 8048b86: 68 60 00 00 00               	pushl	$96
 8048b8b: e9 20 ff ff ff               	jmp	0x8048ab0 <.plt>
 8048b90: ff 25 8c d2 04 08            	jmpl	*134533772
 8048b96: 68 68 00 00 00               	pushl	$104
 8048b9b: e9 10 ff ff ff               	jmp	0x8048ab0 <.plt>
 8048ba0: ff 25 90 d2 04 08            	jmpl	*134533776
 8048ba6: 68 70 00 00 00               	pushl	$112
 8048bab: e9 00 ff ff ff               	jmp	0x8048ab0 <.plt>
 8048bb0: ff 25 94 d2 04 08            	jmpl	*134533780
 8048bb6: 68 78 00 00 00               	pushl	$120
 8048bbb: e9 f0 fe ff ff               	jmp	0x8048ab0 <.plt>
 8048bc0: ff 25 98 d2 04 08            	jmpl	*134533784
 8048bc6: 68 80 00 00 00               	pushl	$128
 8048bcb: e9 e0 fe ff ff               	jmp	0x8048ab0 <.plt>
 8048bd0: ff 25 9c d2 04 08            	jmpl	*134533788
 8048bd6: 68 88 00 00 00               	pushl	$136
 8048bdb: e9 d0 fe ff ff               	jmp	0x8048ab0 <.plt>
 8048be0: ff 25 a0 d2 04 08            	jmpl	*134533792
 8048be6: 68 90 00 00 00               	pushl	$144
 8048beb: e9 c0 fe ff ff               	jmp	0x8048ab0 <.plt>
 8048bf0: ff 25 a4 d2 04 08            	jmpl	*134533796
 8048bf6: 68 98 00 00 00               	pushl	$152
 8048bfb: e9 b0 fe ff ff               	jmp	0x8048ab0 <.plt>
 8048c00: ff 25 a8 d2 04 08            	jmpl	*134533800
 8048c06: 68 a0 00 00 00               	pushl	$160
 8048c0b: e9 a0 fe ff ff               	jmp	0x8048ab0 <.plt>
 8048c10: ff 25 ac d2 04 08            	jmpl	*134533804
 8048c16: 68 a8 00 00 00               	pushl	$168
 8048c1b: e9 90 fe ff ff               	jmp	0x8048ab0 <.plt>
 8048c20: ff 25 b0 d2 04 08            	jmpl	*134533808
 8048c26: 68 b0 00 00 00               	pushl	$176
 8048c2b: e9 80 fe ff ff               	jmp	0x8048ab0 <.plt>
 8048c30: ff 25 b4 d2 04 08            	jmpl	*134533812
 8048c36: 68 b8 00 00 00               	pushl	$184
 8048c3b: e9 70 fe ff ff               	jmp	0x8048ab0 <.plt>
 8048c40: ff 25 b8 d2 04 08            	jmpl	*134533816
 8048c46: 68 c0 00 00 00               	pushl	$192
 8048c4b: e9 60 fe ff ff               	jmp	0x8048ab0 <.plt>
 8048c50: ff 25 bc d2 04 08            	jmpl	*134533820
 8048c56: 68 c8 00 00 00               	pushl	$200
 8048c5b: e9 50 fe ff ff               	jmp	0x8048ab0 <.plt>
 8048c60: ff 25 c0 d2 04 08            	jmpl	*134533824
 8048c66: 68 d0 00 00 00               	pushl	$208
 8048c6b: e9 40 fe ff ff               	jmp	0x8048ab0 <.plt>
 8048c70: ff 25 c4 d2 04 08            	jmpl	*134533828
 8048c76: 68 d8 00 00 00               	pushl	$216
 8048c7b: e9 30 fe ff ff               	jmp	0x8048ab0 <.plt>
 8048c80: ff 25 c8 d2 04 08            	jmpl	*134533832
 8048c86: 68 e0 00 00 00               	pushl	$224
 8048c8b: e9 20 fe ff ff               	jmp	0x8048ab0 <.plt>
 8048c90: ff 25 cc d2 04 08            	jmpl	*134533836
 8048c96: 68 e8 00 00 00               	pushl	$232
 8048c9b: e9 10 fe ff ff               	jmp	0x8048ab0 <.plt>
 8048ca0: ff 25 d0 d2 04 08            	jmpl	*134533840
 8048ca6: 68 f0 00 00 00               	pushl	$240
 8048cab: e9 00 fe ff ff               	jmp	0x8048ab0 <.plt>
 8048cb0: ff 25 d4 d2 04 08            	jmpl	*134533844
 8048cb6: 68 f8 00 00 00               	pushl	$248
 8048cbb: e9 f0 fd ff ff               	jmp	0x8048ab0 <.plt>
 8048cc0: ff 25 d8 d2 04 08            	jmpl	*134533848
 8048cc6: 68 00 01 00 00               	pushl	$256
 8048ccb: e9 e0 fd ff ff               	jmp	0x8048ab0 <.plt>
 8048cd0: ff 25 dc d2 04 08            	jmpl	*134533852
 8048cd6: 68 08 01 00 00               	pushl	$264
 8048cdb: e9 d0 fd ff ff               	jmp	0x8048ab0 <.plt>
 8048ce0: ff 25 e0 d2 04 08            	jmpl	*134533856
 8048ce6: 68 10 01 00 00               	pushl	$272
 8048ceb: e9 c0 fd ff ff               	jmp	0x8048ab0 <.plt>
 8048cf0: ff 25 e4 d2 04 08            	jmpl	*134533860
 8048cf6: 68 18 01 00 00               	pushl	$280
 8048cfb: e9 b0 fd ff ff               	jmp	0x8048ab0 <.plt>
 8048d00: ff 25 e8 d2 04 08            	jmpl	*134533864
 8048d06: 68 20 01 00 00               	pushl	$288
 8048d0b: e9 a0 fd ff ff               	jmp	0x8048ab0 <.plt>
 8048d10: ff 25 ec d2 04 08            	jmpl	*134533868
 8048d16: 68 28 01 00 00               	pushl	$296
 8048d1b: e9 90 fd ff ff               	jmp	0x8048ab0 <.plt>
 8048d20: ff 25 f0 d2 04 08            	jmpl	*134533872
 8048d26: 68 30 01 00 00               	pushl	$304
 8048d2b: e9 80 fd ff ff               	jmp	0x8048ab0 <.plt>
 8048d30: ff 25 f4 d2 04 08            	jmpl	*134533876
 8048d36: 68 38 01 00 00               	pushl	$312
 8048d3b: e9 70 fd ff ff               	jmp	0x8048ab0 <.plt>
 8048d40: ff 25 f8 d2 04 08            	jmpl	*134533880
 8048d46: 68 40 01 00 00               	pushl	$320
 8048d4b: e9 60 fd ff ff               	jmp	0x8048ab0 <.plt>
 8048d50: ff 25 fc d2 04 08            	jmpl	*134533884
 8048d56: 68 48 01 00 00               	pushl	$328
 8048d5b: e9 50 fd ff ff               	jmp	0x8048ab0 <.plt>
 8048d60: ff 25 00 d3 04 08            	jmpl	*134533888
 8048d66: 68 50 01 00 00               	pushl	$336
 8048d6b: e9 40 fd ff ff               	jmp	0x8048ab0 <.plt>
 8048d70: ff 25 04 d3 04 08            	jmpl	*134533892
 8048d76: 68 58 01 00 00               	pushl	$344
 8048d7b: e9 30 fd ff ff               	jmp	0x8048ab0 <.plt>
 8048d80: ff 25 08 d3 04 08            	jmpl	*134533896
 8048d86: 68 60 01 00 00               	pushl	$352
 8048d8b: e9 20 fd ff ff               	jmp	0x8048ab0 <.plt>
 8048d90: ff 25 0c d3 04 08            	jmpl	*134533900
 8048d96: 68 68 01 00 00               	pushl	$360
 8048d9b: e9 10 fd ff ff               	jmp	0x8048ab0 <.plt>

Disassembly of section .text:

08048da0 <_start>:
 8048da0: 31 ed                        	xorl	%ebp, %ebp
 8048da2: 5e                           	popl	%esi
 8048da3: 89 e1                        	movl	%esp, %ecx
 8048da5: 83 e4 f0                     	andl	$-16, %esp
 8048da8: 50                           	pushl	%eax
 8048da9: 54                           	pushl	%esp
 8048daa: 52                           	pushl	%edx
 8048dab: 68 8c bc 04 08               	pushl	$134528140
 8048db0: 68 44 bc 04 08               	pushl	$134528068
 8048db5: 51                           	pushl	%ecx
 8048db6: 56                           	pushl	%esi
 8048db7: 68 4b 8f 04 08               	pushl	$134516555
 8048dbc: e8 7f fe ff ff               	calll	0x8048c40 <.plt+0x190>
 8048dc1: f4                           	hlt
 8048dc2: 90                           	nop
 8048dc3: 90                           	nop

08048dc4 <call_gmon_start>:
 8048dc4: 55                           	pushl	%ebp
 8048dc5: 89 e5                        	movl	%esp, %ebp
 8048dc7: 53                           	pushl	%ebx
 8048dc8: e8 00 00 00 00               	calll	0x8048dcd <call_gmon_start+0x9>
 8048dcd: 5b                           	popl	%ebx
 8048dce: 81 c3 7f 44 00 00            	addl	$17535, %ebx
 8048dd4: 50                           	pushl	%eax
 8048dd5: 8b 83 c4 00 00 00            	movl	196(%ebx), %eax
 8048ddb: 85 c0                        	testl	%eax, %eax
 8048ddd: 74 02                        	je	0x8048de1 <call_gmon_start+0x1d>
 8048ddf: ff d0                        	calll	*%eax
 8048de1: 8b 5d fc                     	movl	-4(%ebp), %ebx
 8048de4: c9                           	leave
 8048de5: c3                           	retl
 8048de6: 90                           	nop
 8048de7: 90                           	nop
 8048de8: 90                           	nop
 8048de9: 90                           	nop
 8048dea: 90                           	nop
 8048deb: 90                           	nop
 8048dec: 90                           	nop
 8048ded: 90                           	nop
 8048dee: 90                           	nop
 8048def: 90                           	nop

08048df0 <__do_global_dtors_aux>:
 8048df0: 55                           	pushl	%ebp
 8048df1: 89 e5                        	movl	%esp, %ebp
 8048df3: 83 ec 08                     	subl	$8, %esp
 8048df6: 80 3d 34 d3 04 08 00         	cmpb	$0, 134533940
 8048dfd: 74 0c                        	je	0x8048e0b <__do_global_dtors_aux+0x1b>
 8048dff: eb 1c                        	jmp	0x8048e1d <__do_global_dtors_aux+0x2d>
 8048e01: 83 c0 04                     	addl	$4, %eax
 8048e04: a3 08 d0 04 08               	movl	%eax, 134533128
 8048e09: ff d2                        	calll	*%edx
 8048e0b: a1 08 d0 04 08               	movl	134533128, %eax
 8048e10: 8b 10                        	movl	(%eax), %edx
 8048e12: 85 d2                        	testl	%edx, %edx
 8048e14: 75 eb                        	jne	0x8048e01 <__do_global_dtors_aux+0x11>
 8048e16: c6 05 34 d3 04 08 01         	movb	$1, 134533940
 8048e1d: c9                           	leave
 8048e1e: c3                           	retl
 8048e1f: 90                           	nop

08048e20 <frame_dummy>:
 8048e20: 55                           	pushl	%ebp
 8048e21: 89 e5                        	movl	%esp, %ebp
 8048e23: 83 ec 08                     	subl	$8, %esp
 8048e26: a1 48 d2 04 08               	movl	134533704, %eax
 8048e2b: 85 c0                        	testl	%eax, %eax
 8048e2d: 74 21                        	je	0x8048e50 <frame_dummy+0x30>
 8048e2f: b8 00 00 00 00               	movl	$0, %eax
 8048e34: 85 c0                        	testl	%eax, %eax
 8048e36: 74 18                        	je	0x8048e50 <frame_dummy+0x30>
 8048e38: c7 04 24 48 d2 04 08         	movl	$134533704, (%esp)
 8048e3f: e8 bc 71 fb f7               	calll	0x0 <troll.c>
 8048e44: 8d b6 00 00 00 00            	leal	(%esi), %esi
 8048e4a: 8d bf 00 00 00 00            	leal	(%edi), %edi
 8048e50: c9                           	leave
 8048e51: c3                           	retl
 8048e52: 90                           	nop
 8048e53: 90                           	nop

08048e54 <set_address>:
 8048e54: 55                           	pushl	%ebp
 8048e55: 89 e5                        	movl	%esp, %ebp
 8048e57: 53                           	pushl	%ebx
 8048e58: 83 ec 24                     	subl	$36, %esp
 8048e5b: 8b 45 0c                     	movl	12(%ebp), %eax
 8048e5e: 89 04 24                     	movl	%eax, (%esp)
 8048e61: e8 6a fe ff ff               	calll	0x8048cd0 <.plt+0x220>
 8048e66: 89 45 f8                     	movl	%eax, -8(%ebp)
 8048e69: 8b 45 10                     	movl	16(%ebp), %eax
 8048e6c: 89 45 f4                     	movl	%eax, -12(%ebp)
 8048e6f: 83 7d f8 00                  	cmpl	$0, -8(%ebp)
 8048e73: 75 38                        	jne	0x8048ead <set_address+0x59>
 8048e75: 8b 45 0c                     	movl	12(%ebp), %eax
 8048e78: 89 44 24 10                  	movl	%eax, 16(%esp)
 8048e7c: 8b 45 14                     	movl	20(%ebp), %eax
 8048e7f: 89 44 24 0c                  	movl	%eax, 12(%esp)
 8048e83: a1 54 e3 04 08               	movl	134538068, %eax
 8048e88: 89 44 24 08                  	movl	%eax, 8(%esp)
 8048e8c: c7 44 24 04 71 bd 04 08      	movl	$134528369, 4(%esp)
 8048e94: a1 24 d3 04 08               	movl	134533924, %eax
 8048e99: 89 04 24                     	movl	%eax, (%esp)
 8048e9c: e8 5f fc ff ff               	calll	0x8048b00 <.plt+0x50>
 8048ea1: c7 04 24 01 00 00 00         	movl	$1, (%esp)
 8048ea8: e8 33 fe ff ff               	calll	0x8048ce0 <.plt+0x230>
 8048ead: 81 7d f4 ff 03 00 00         	cmpl	$1023, -12(%ebp)
 8048eb4: 7e 0b                        	jle	0x8048ec1 <set_address+0x6d>
 8048eb6: 81 7d f4 ff ff 00 00         	cmpl	$65535, -12(%ebp)
 8048ebd: 7f 02                        	jg	0x8048ec1 <set_address+0x6d>
 8048ebf: eb 39                        	jmp	0x8048efa <set_address+0xa6>
 8048ec1: c7 44 24 10 ff ff 00 00      	movl	$65535, 16(%esp)
 8048ec9: 8b 45 f4                     	movl	-12(%ebp), %eax
 8048ecc: 89 44 24 0c                  	movl	%eax, 12(%esp)
 8048ed0: a1 54 e3 04 08               	movl	134538068, %eax
 8048ed5: 89 44 24 08                  	movl	%eax, 8(%esp)
 8048ed9: c7 44 24 04 8c bd 04 08      	movl	$134528396, 4(%esp)
 8048ee1: a1 24 d3 04 08               	movl	134533924, %eax
 8048ee6: 89 04 24                     	movl	%eax, (%esp)
 8048ee9: e8 12 fc ff ff               	calll	0x8048b00 <.plt+0x50>
 8048eee: c7 04 24 01 00 00 00         	movl	$1, (%esp)
 8048ef5: e8 e6 fd ff ff               	calll	0x8048ce0 <.plt+0x230>
 8048efa: 8b 5d 08                     	movl	8(%ebp), %ebx
 8048efd: c7 04 24 02 00 00 00         	movl	$2, (%esp)
 8048f04: e8 07 fe ff ff               	calll	0x8048d10 <.plt+0x260>
 8048f09: 66 89 03                     	movw	%ax, (%ebx)
 8048f0c: 8b 45 f8                     	movl	-8(%ebp), %eax
 8048f0f: 8b 40 0c                     	movl	12(%eax), %eax
 8048f12: 89 44 24 08                  	movl	%eax, 8(%esp)
 8048f16: 8b 45 f8                     	movl	-8(%ebp), %eax
 8048f19: 8b 40 10                     	movl	16(%eax), %eax
 8048f1c: 8b 00                        	movl	(%eax), %eax
 8048f1e: 89 44 24 04                  	movl	%eax, 4(%esp)
 8048f22: 8b 45 08                     	movl	8(%ebp), %eax
 8048f25: 83 c0 04                     	addl	$4, %eax
 8048f28: 89 04 24                     	movl	%eax, (%esp)
 8048f2b: e8 60 fd ff ff               	calll	0x8048c90 <.plt+0x1e0>
 8048f30: 8b 5d 08                     	movl	8(%ebp), %ebx
 8048f33: 8b 45 f4                     	movl	-12(%ebp), %eax
 8048f36: 0f b7 c0                     	movzwl	%ax, %eax
 8048f39: 89 04 24                     	movl	%eax, (%esp)
 8048f3c: e8 cf fd ff ff               	calll	0x8048d10 <.plt+0x260>
 8048f41: 66 89 43 02                  	movw	%ax, 2(%ebx)
 8048f45: 83 c4 24                     	addl	$36, %esp
 8048f48: 5b                           	popl	%ebx
 8048f49: 5d                           	popl	%ebp
 8048f4a: c3                           	retl

08048f4b <main>:
 8048f4b: 55                           	pushl	%ebp
 8048f4c: 89 e5                        	movl	%esp, %ebp
 8048f4e: 83 ec 48                     	subl	$72, %esp
 8048f51: 83 e4 f0                     	andl	$-16, %esp
 8048f54: b8 00 00 00 00               	movl	$0, %eax
 8048f59: 83 c0 0f                     	addl	$15, %eax
 8048f5c: 83 c0 0f                     	addl	$15, %eax
 8048f5f: c1 e8 04                     	shrl	$4, %eax
 8048f62: c1 e0 04                     	shll	$4, %eax
 8048f65: 29 c4                        	subl	%eax, %esp
 8048f67: c7 44 24 04 20 00 00 00      	movl	$32, 4(%esp)
 8048f6f: c7 04 24 60 e3 04 08         	movl	$134538080, (%esp)
 8048f76: e8 45 fd ff ff               	calll	0x8048cc0 <.plt+0x210>
 8048f7b: 85 c0                        	testl	%eax, %eax
 8048f7d: 74 18                        	je	0x8048f97 <main+0x4c>
 8048f7f: c7 04 24 c1 bd 04 08         	movl	$134528449, (%esp)
 8048f86: e8 65 fb ff ff               	calll	0x8048af0 <.plt+0x40>
 8048f8b: c7 45 d4 01 00 00 00         	movl	$1, -44(%ebp)
 8048f92: e9 49 05 00 00               	jmp	0x80494e0 <main+0x595>
 8048f97: 8b 45 0c                     	movl	12(%ebp), %eax
 8048f9a: 8b 00                        	movl	(%eax), %eax
 8048f9c: a3 54 e3 04 08               	movl	%eax, 134538068
 8048fa1: c7 44 24 08 cd bd 04 08      	movl	$134528461, 8(%esp)
 8048fa9: 8b 45 0c                     	movl	12(%ebp), %eax
 8048fac: 89 44 24 04                  	movl	%eax, 4(%esp)
 8048fb0: 8b 45 08                     	movl	8(%ebp), %eax
 8048fb3: 89 04 24                     	movl	%eax, (%esp)
 8048fb6: e8 45 fc ff ff               	calll	0x8048c00 <.plt+0x150>
 8048fbb: 89 45 f4                     	movl	%eax, -12(%ebp)
 8048fbe: 83 7d f4 ff                  	cmpl	$-1, -12(%ebp)
 8048fc2: 0f 84 30 02 00 00            	je	0x80491f8 <main+0x2ad>
 8048fc8: 8b 45 f4                     	movl	-12(%ebp), %eax
 8048fcb: 83 e8 43                     	subl	$67, %eax
 8048fce: 89 45 d0                     	movl	%eax, -48(%ebp)
 8048fd1: 83 7d d0 35                  	cmpl	$53, -48(%ebp)
 8048fd5: 0f 87 13 02 00 00            	ja	0x80491ee <main+0x2a3>
 8048fdb: 8b 55 d0                     	movl	-48(%ebp), %edx
 8048fde: 8b 04 95 90 bf 04 08         	movl	134528912(,%edx,4), %eax
 8048fe5: ff e0                        	jmpl	*%eax
 8048fe7: a1 2c d3 04 08               	movl	134533932, %eax
 8048fec: 89 04 24                     	movl	%eax, (%esp)
 8048fef: e8 1b 0e 00 00               	calll	0x8049e0f <parse_int>
 8048ff4: a3 30 d0 04 08               	movl	%eax, 134533168
 8048ff9: eb a6                        	jmp	0x8048fa1 <main+0x56>
 8048ffb: a1 54 e3 04 08               	movl	134538068, %eax
 8049000: 89 44 24 08                  	movl	%eax, 8(%esp)
 8049004: c7 44 24 04 e8 bd 04 08      	movl	$134528488, 4(%esp)
 804900c: a1 24 d3 04 08               	movl	134533924, %eax
 8049011: 89 04 24                     	movl	%eax, (%esp)
 8049014: e8 e7 fa ff ff               	calll	0x8048b00 <.plt+0x50>
 8049019: c7 44 24 04 10 be 04 08      	movl	$134528528, 4(%esp)
 8049021: a1 24 d3 04 08               	movl	134533924, %eax
 8049026: 89 04 24                     	movl	%eax, (%esp)
 8049029: e8 d2 fa ff ff               	calll	0x8048b00 <.plt+0x50>
 804902e: e8 8d 0e 00 00               	calll	0x8049ec0 <usage>
 8049033: a1 2c d3 04 08               	movl	134533932, %eax
 8049038: 89 44 24 04                  	movl	%eax, 4(%esp)
 804903c: c7 04 24 80 f4 04 08         	movl	$134542464, (%esp)
 8049043: e8 48 fd ff ff               	calll	0x8048d90 <.plt+0x2e0>
 8049048: c7 05 28 d0 04 08 00 00 00 00	movl	$0, 134533160
 8049052: e9 4a ff ff ff               	jmp	0x8048fa1 <main+0x56>
 8049057: a1 2c d3 04 08               	movl	134533932, %eax
 804905c: 89 04 24                     	movl	%eax, (%esp)
 804905f: e8 14 0e 00 00               	calll	0x8049e78 <parse_percent>
 8049064: a3 3c d3 04 08               	movl	%eax, 134533948
 8049069: e9 33 ff ff ff               	jmp	0x8048fa1 <main+0x56>
 804906e: a1 2c d3 04 08               	movl	134533932, %eax
 8049073: 89 04 24                     	movl	%eax, (%esp)
 8049076: e8 94 0d 00 00               	calll	0x8049e0f <parse_int>
 804907b: a3 38 d3 04 08               	movl	%eax, 134533944
 8049080: e9 1c ff ff ff               	jmp	0x8048fa1 <main+0x56>
 8049085: a1 2c d3 04 08               	movl	134533932, %eax
 804908a: 89 04 24                     	movl	%eax, (%esp)
 804908d: e8 e6 0d 00 00               	calll	0x8049e78 <parse_percent>
 8049092: a3 40 d3 04 08               	movl	%eax, 134533952
 8049097: e9 05 ff ff ff               	jmp	0x8048fa1 <main+0x56>
 804909c: a1 2c d3 04 08               	movl	134533932, %eax
 80490a1: a3 34 d0 04 08               	movl	%eax, 134533172
 80490a6: e9 f6 fe ff ff               	jmp	0x8048fa1 <main+0x56>
 80490ab: a1 2c d3 04 08               	movl	134533932, %eax
 80490b0: a3 38 d0 04 08               	movl	%eax, 134533176
 80490b5: e9 e7 fe ff ff               	jmp	0x8048fa1 <main+0x56>
 80490ba: a1 2c d3 04 08               	movl	134533932, %eax
 80490bf: 89 04 24                     	movl	%eax, (%esp)
 80490c2: e8 48 0d 00 00               	calll	0x8049e0f <parse_int>
 80490c7: a3 00 e4 04 08               	movl	%eax, 134538240
 80490cc: e9 d0 fe ff ff               	jmp	0x8048fa1 <main+0x56>
 80490d1: a1 2c d3 04 08               	movl	134533932, %eax
 80490d6: 89 04 24                     	movl	%eax, (%esp)
 80490d9: e8 31 0d 00 00               	calll	0x8049e0f <parse_int>
 80490de: a3 24 f4 04 08               	movl	%eax, 134542372
 80490e3: e9 b9 fe ff ff               	jmp	0x8048fa1 <main+0x56>
 80490e8: b8 01 00 00 00               	movl	$1, %eax
 80490ed: 2b 05 48 d3 04 08            	subl	134533960, %eax
 80490f3: a3 48 d3 04 08               	movl	%eax, 134533960
 80490f8: e9 a4 fe ff ff               	jmp	0x8048fa1 <main+0x56>
 80490fd: a1 2c d3 04 08               	movl	134533932, %eax
 8049102: 80 38 65                     	cmpb	$101, (%eax)
 8049105: 0f 85 91 00 00 00            	jne	0x804919c <main+0x251>
 804910b: c7 05 28 d0 04 08 01 00 00 00	movl	$1, 134533160
 8049115: a1 2c d3 04 08               	movl	134533932, %eax
 804911a: 40                           	incl	%eax
 804911b: 80 38 00                     	cmpb	$0, (%eax)
 804911e: 75 64                        	jne	0x8049184 <main+0x239>
 8049120: a1 30 d3 04 08               	movl	134533936, %eax
 8049125: 3b 45 08                     	cmpl	8(%ebp), %eax
 8049128: 7d 2a                        	jge	0x8049154 <main+0x209>
 804912a: a1 30 d3 04 08               	movl	134533936, %eax
 804912f: 8d 14 85 00 00 00 00         	leal	(,%eax,4), %edx
 8049136: 8b 45 0c                     	movl	12(%ebp), %eax
 8049139: 8b 04 02                     	movl	(%edx,%eax), %eax
 804913c: 89 04 24                     	movl	%eax, (%esp)
 804913f: ff 05 30 d3 04 08            	incl	134533936
 8049145: e8 c5 0c 00 00               	calll	0x8049e0f <parse_int>
 804914a: a3 2c d0 04 08               	movl	%eax, 134533164
 804914f: e9 4d fe ff ff               	jmp	0x8048fa1 <main+0x56>
 8049154: c7 44 24 0c 3c be 04 08      	movl	$134528572, 12(%esp)
 804915c: a1 54 e3 04 08               	movl	134538068, %eax
 8049161: 89 44 24 08                  	movl	%eax, 8(%esp)
 8049165: c7 44 24 04 5f be 04 08      	movl	$134528607, 4(%esp)
 804916d: a1 24 d3 04 08               	movl	134533924, %eax
 8049172: 89 04 24                     	movl	%eax, (%esp)
 8049175: e8 86 f9 ff ff               	calll	0x8048b00 <.plt+0x50>
 804917a: e8 41 0d 00 00               	calll	0x8049ec0 <usage>
 804917f: e9 1d fe ff ff               	jmp	0x8048fa1 <main+0x56>
 8049184: a1 2c d3 04 08               	movl	134533932, %eax
 8049189: 40                           	incl	%eax
 804918a: 89 04 24                     	movl	%eax, (%esp)
 804918d: e8 7d 0c 00 00               	calll	0x8049e0f <parse_int>
 8049192: a3 2c d0 04 08               	movl	%eax, 134533164
 8049197: e9 05 fe ff ff               	jmp	0x8048fa1 <main+0x56>
 804919c: c7 05 28 d0 04 08 02 00 00 00	movl	$2, 134533160
 80491a6: a1 2c d3 04 08               	movl	134533932, %eax
 80491ab: 89 04 24                     	movl	%eax, (%esp)
 80491ae: e8 5c 0c 00 00               	calll	0x8049e0f <parse_int>
 80491b3: a3 2c d0 04 08               	movl	%eax, 134533164
 80491b8: e9 e4 fd ff ff               	jmp	0x8048fa1 <main+0x56>
 80491bd: c7 05 20 f4 04 08 01 00 00 00	movl	$1, 134542368
 80491c7: e9 d5 fd ff ff               	jmp	0x8048fa1 <main+0x56>
 80491cc: a1 2c d3 04 08               	movl	134533932, %eax
 80491d1: 89 04 24                     	movl	%eax, (%esp)
 80491d4: e8 9f 0c 00 00               	calll	0x8049e78 <parse_percent>
 80491d9: a3 24 d0 04 08               	movl	%eax, 134533156
 80491de: e9 be fd ff ff               	jmp	0x8048fa1 <main+0x56>
 80491e3: ff 05 58 e3 04 08            	incl	134538072
 80491e9: e9 b3 fd ff ff               	jmp	0x8048fa1 <main+0x56>
 80491ee: e8 cd 0c 00 00               	calll	0x8049ec0 <usage>
 80491f3: e9 a9 fd ff ff               	jmp	0x8048fa1 <main+0x56>
 80491f8: 8b 45 08                     	movl	8(%ebp), %eax
 80491fb: 48                           	decl	%eax
 80491fc: 3b 05 30 d3 04 08            	cmpl	134533936, %eax
 8049202: 7e 5d                        	jle	0x8049261 <main+0x316>
 8049204: ff 05 30 d3 04 08            	incl	134533936
 804920a: a1 30 d3 04 08               	movl	134533936, %eax
 804920f: 3b 45 08                     	cmpl	8(%ebp), %eax
 8049212: 7d 33                        	jge	0x8049247 <main+0x2fc>
 8049214: a1 30 d3 04 08               	movl	134533936, %eax
 8049219: 8d 14 85 00 00 00 00         	leal	(,%eax,4), %edx
 8049220: 8b 45 0c                     	movl	12(%ebp), %eax
 8049223: 8b 04 02                     	movl	(%edx,%eax), %eax
 8049226: 80 38 2d                     	cmpb	$45, (%eax)
 8049229: 75 d9                        	jne	0x8049204 <main+0x2b9>
 804922b: c7 44 24 04 67 be 04 08      	movl	$134528615, 4(%esp)
 8049233: a1 24 d3 04 08               	movl	134533924, %eax
 8049238: 89 04 24                     	movl	%eax, (%esp)
 804923b: e8 c0 f8 ff ff               	calll	0x8048b00 <.plt+0x50>
 8049240: e8 7b 0c 00 00               	calll	0x8049ec0 <usage>
 8049245: eb bd                        	jmp	0x8049204 <main+0x2b9>
 8049247: c7 44 24 04 80 be 04 08      	movl	$134528640, 4(%esp)
 804924f: a1 24 d3 04 08               	movl	134533924, %eax
 8049254: 89 04 24                     	movl	%eax, (%esp)
 8049257: e8 a4 f8 ff ff               	calll	0x8048b00 <.plt+0x50>
 804925c: e8 5f 0c 00 00               	calll	0x8049ec0 <usage>
 8049261: 8b 45 08                     	movl	8(%ebp), %eax
 8049264: 48                           	decl	%eax
 8049265: 3b 05 30 d3 04 08            	cmpl	134533936, %eax
 804926b: 7d 1a                        	jge	0x8049287 <main+0x33c>
 804926d: c7 44 24 04 94 be 04 08      	movl	$134528660, 4(%esp)
 8049275: a1 24 d3 04 08               	movl	134533924, %eax
 804927a: 89 04 24                     	movl	%eax, (%esp)
 804927d: e8 7e f8 ff ff               	calll	0x8048b00 <.plt+0x50>
 8049282: e8 39 0c 00 00               	calll	0x8049ec0 <usage>
 8049287: a1 30 d3 04 08               	movl	134533936, %eax
 804928c: 8d 14 85 00 00 00 00         	leal	(,%eax,4), %edx
 8049293: 8b 45 0c                     	movl	12(%ebp), %eax
 8049296: 8b 04 02                     	movl	(%edx,%eax), %eax
 8049299: 89 04 24                     	movl	%eax, (%esp)
 804929c: e8 4f fa ff ff               	calll	0x8048cf0 <.plt+0x240>
 80492a1: 66 89 45 f2                  	movw	%ax, -14(%ebp)
 80492a5: 66 81 7d f2 ff 03            	cmpw	$1023, -14(%ebp)
 80492ab: 77 29                        	ja	0x80492d6 <main+0x38b>
 80492ad: c7 44 24 08 ff ff 00 00      	movl	$65535, 8(%esp)
 80492b5: a1 54 e3 04 08               	movl	134538068, %eax
 80492ba: 89 44 24 04                  	movl	%eax, 4(%esp)
 80492be: c7 04 24 ac be 04 08         	movl	$134528684, (%esp)
 80492c5: e8 a6 f9 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 80492ca: c7 04 24 01 00 00 00         	movl	$1, (%esp)
 80492d1: e8 0a fa ff ff               	calll	0x8048ce0 <.plt+0x230>
 80492d6: e8 75 f8 ff ff               	calll	0x8048b50 <.plt+0xa0>
 80492db: c7 00 00 00 00 00            	movl	$0, (%eax)
 80492e1: c7 44 24 08 00 00 00 00      	movl	$0, 8(%esp)
 80492e9: c7 44 24 04 02 00 00 00      	movl	$2, 4(%esp)
 80492f1: c7 04 24 02 00 00 00         	movl	$2, (%esp)
 80492f8: e8 63 fa ff ff               	calll	0x8048d60 <.plt+0x2b0>
 80492fd: a3 4c e3 04 08               	movl	%eax, 134538060
 8049302: 83 3d 4c e3 04 08 00         	cmpl	$0, 134538060
 8049309: 79 18                        	jns	0x8049323 <main+0x3d8>
 804930b: c7 04 24 de be 04 08         	movl	$134528734, (%esp)
 8049312: e8 d9 f7 ff ff               	calll	0x8048af0 <.plt+0x40>
 8049317: c7 04 24 01 00 00 00         	movl	$1, (%esp)
 804931e: e8 bd f9 ff ff               	calll	0x8048ce0 <.plt+0x230>
 8049323: c7 44 24 08 10 00 00 00      	movl	$16, 8(%esp)
 804932b: c7 44 24 04 00 00 00 00      	movl	$0, 4(%esp)
 8049333: 8d 45 d8                     	leal	-40(%ebp), %eax
 8049336: 89 04 24                     	movl	%eax, (%esp)
 8049339: e8 e2 f9 ff ff               	calll	0x8048d20 <.plt+0x270>
 804933e: 66 c7 45 d8 02 00            	movw	$2, -40(%ebp)
 8049344: c7 45 dc 00 00 00 00         	movl	$0, -36(%ebp)
 804934b: 0f b7 45 f2                  	movzwl	-14(%ebp), %eax
 804934f: 89 04 24                     	movl	%eax, (%esp)
 8049352: e8 b9 f9 ff ff               	calll	0x8048d10 <.plt+0x260>
 8049357: 66 89 45 da                  	movw	%ax, -38(%ebp)
 804935b: c7 44 24 0c eb be 04 08      	movl	$134528747, 12(%esp)
 8049363: a1 00 e4 04 08               	movl	134538240, %eax
 8049368: 89 44 24 08                  	movl	%eax, 8(%esp)
 804936c: a1 34 d0 04 08               	movl	134533172, %eax
 8049371: 89 44 24 04                  	movl	%eax, 4(%esp)
 8049375: c7 04 24 60 d3 04 08         	movl	$134533984, (%esp)
 804937c: e8 d3 fa ff ff               	calll	0x8048e54 <set_address>
 8049381: c7 44 24 0c f2 be 04 08      	movl	$134528754, 12(%esp)
 8049389: a1 24 f4 04 08               	movl	134542372, %eax
 804938e: 89 44 24 08                  	movl	%eax, 8(%esp)
 8049392: a1 38 d0 04 08               	movl	134533176, %eax
 8049397: 89 44 24 04                  	movl	%eax, 4(%esp)
 804939b: c7 04 24 70 d3 04 08         	movl	$134534000, (%esp)
 80493a2: e8 ad fa ff ff               	calll	0x8048e54 <set_address>
 80493a7: e8 a4 f7 ff ff               	calll	0x8048b50 <.plt+0xa0>
 80493ac: c7 00 00 00 00 00            	movl	$0, (%eax)
 80493b2: c7 44 24 08 10 00 00 00      	movl	$16, 8(%esp)
 80493ba: 8d 45 d8                     	leal	-40(%ebp), %eax
 80493bd: 89 44 24 04                  	movl	%eax, 4(%esp)
 80493c1: a1 4c e3 04 08               	movl	134538060, %eax
 80493c6: 89 04 24                     	movl	%eax, (%esp)
 80493c9: e8 b2 f8 ff ff               	calll	0x8048c80 <.plt+0x1d0>
 80493ce: 85 c0                        	testl	%eax, %eax
 80493d0: 79 2d                        	jns	0x80493ff <main+0x4b4>
 80493d2: c7 04 24 fc be 04 08         	movl	$134528764, (%esp)
 80493d9: e8 12 f7 ff ff               	calll	0x8048af0 <.plt+0x40>
 80493de: c7 44 24 04 20 bf 04 08      	movl	$134528800, 4(%esp)
 80493e6: a1 24 d3 04 08               	movl	134533924, %eax
 80493eb: 89 04 24                     	movl	%eax, (%esp)
 80493ee: e8 0d f7 ff ff               	calll	0x8048b00 <.plt+0x50>
 80493f3: c7 04 24 01 00 00 00         	movl	$1, (%esp)
 80493fa: e8 e1 f8 ff ff               	calll	0x8048ce0 <.plt+0x230>
 80493ff: 0f b7 45 f2                  	movzwl	-14(%ebp), %eax
 8049403: 89 44 24 04                  	movl	%eax, 4(%esp)
 8049407: c7 04 24 4c bf 04 08         	movl	$134528844, (%esp)
 804940e: e8 5d f8 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 8049413: a1 28 d0 04 08               	movl	134533160, %eax
 8049418: 89 45 cc                     	movl	%eax, -52(%ebp)
 804941b: 83 7d cc 00                  	cmpl	$0, -52(%ebp)
 804941f: 74 08                        	je	0x8049429 <main+0x4de>
 8049421: 83 7d cc 02                  	cmpl	$2, -52(%ebp)
 8049425: 77 44                        	ja	0x804946b <main+0x520>
 8049427: eb 1c                        	jmp	0x8049445 <main+0x4fa>
 8049429: c7 04 24 80 f4 04 08         	movl	$134542464, (%esp)
 8049430: e8 7e 24 00 00               	calll	0x804b8b3 <ReadDistrib>
 8049435: 85 c0                        	testl	%eax, %eax
 8049437: 74 02                        	je	0x804943b <main+0x4f0>
 8049439: eb 30                        	jmp	0x804946b <main+0x520>
 804943b: c7 05 28 d0 04 08 02 00 00 00	movl	$2, 134533160
 8049445: a1 28 d0 04 08               	movl	134533160, %eax
 804944a: 89 44 24 04                  	movl	%eax, 4(%esp)
 804944e: a1 2c d0 04 08               	movl	134533164, %eax
 8049453: 89 04 24                     	movl	%eax, (%esp)
 8049456: e8 5e 26 00 00               	calll	0x804bab9 <BuildDistrib>
 804945b: 85 c0                        	testl	%eax, %eax
 804945d: 75 0c                        	jne	0x804946b <main+0x520>
 804945f: c7 04 24 01 00 00 00         	movl	$1, (%esp)
 8049466: e8 75 f8 ff ff               	calll	0x8048ce0 <.plt+0x230>
 804946b: c7 04 24 7a bf 04 08         	movl	$134528890, (%esp)
 8049472: e8 f9 f7 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 8049477: e8 6c 21 00 00               	calll	0x804b5e8 <show_params>
 804947c: c7 04 24 00 00 00 00         	movl	$0, (%esp)
 8049483: e8 68 f7 ff ff               	calll	0x8048bf0 <.plt+0x140>
 8049488: 89 04 24                     	movl	%eax, (%esp)
 804948b: e8 b0 f8 ff ff               	calll	0x8048d40 <.plt+0x290>
 8049490: e8 a9 10 00 00               	calll	0x804a53e <t_init>
 8049495: c7 44 24 08 38 00 00 00      	movl	$56, 8(%esp)
 804949d: c7 44 24 04 00 00 00 00      	movl	$0, 4(%esp)
 80494a5: c7 04 24 40 f4 04 08         	movl	$134542400, (%esp)
 80494ac: e8 6f f8 ff ff               	calll	0x8048d20 <.plt+0x270>
 80494b1: e8 11 0f 00 00               	calll	0x804a3c7 <current_time>
 80494b6: a3 80 d3 04 08               	movl	%eax, 134534016
 80494bb: a1 80 d3 04 08               	movl	134534016, %eax
 80494c0: a3 68 f4 04 08               	movl	%eax, 134542440
 80494c5: a3 64 f4 04 08               	movl	%eax, 134542436
 80494ca: c7 05 74 f4 04 08 a0 d3 04 08	movl	$134534048, 134542452
 80494d4: e8 0c 00 00 00               	calll	0x80494e5 <main_loop>
 80494d9: c7 45 d4 00 00 00 00         	movl	$0, -44(%ebp)
 80494e0: 8b 45 d4                     	movl	-44(%ebp), %eax
 80494e3: c9                           	leave
 80494e4: c3                           	retl

080494e5 <main_loop>:
 80494e5: 55                           	pushl	%ebp
 80494e6: 89 e5                        	movl	%esp, %ebp
 80494e8: 57                           	pushl	%edi
 80494e9: 56                           	pushl	%esi
 80494ea: 53                           	pushl	%ebx
 80494eb: 81 ec 6c 02 00 00            	subl	$620, %esp
 80494f1: e8 ca f5 ff ff               	calll	0x8048ac0 <.plt+0x10>
 80494f6: 89 45 d4                     	movl	%eax, -44(%ebp)
 80494f9: c7 85 54 ff ff ff 00 00 00 00	movl	$0, -172(%ebp)
 8049503: c7 44 24 04 01 00 00 00      	movl	$1, 4(%esp)
 804950b: c7 04 24 15 00 00 00         	movl	$21, (%esp)
 8049512: e8 f9 f5 ff ff               	calll	0x8048b10 <.plt+0x60>
 8049517: b8 00 00 00 00               	movl	$0, %eax
 804951c: b9 20 00 00 00               	movl	$32, %ecx
 8049521: bf 80 e3 04 08               	movl	$134538112, %edi
 8049526: fc                           	cld
 8049527: f3 ab                        	rep		stosl	%eax, %es:(%edi)
 8049529: 89 c8                        	movl	%ecx, %eax
 804952b: 89 85 50 ff ff ff            	movl	%eax, -176(%ebp)
 8049531: 89 f8                        	movl	%edi, %eax
 8049533: 89 85 4c ff ff ff            	movl	%eax, -180(%ebp)
 8049539: a1 4c e3 04 08               	movl	134538060, %eax
 804953e: 89 c2                        	movl	%eax, %edx
 8049540: c1 ea 05                     	shrl	$5, %edx
 8049543: a1 4c e3 04 08               	movl	134538060, %eax
 8049548: 83 e0 1f                     	andl	$31, %eax
 804954b: 0f ab 04 95 80 e3 04 08      	btsl	%eax, 134538112(,%edx,4)
 8049553: c7 04 24 f8 05 00 00         	movl	$1528, (%esp)
 804955a: e8 41 f6 ff ff               	calll	0x8048ba0 <.plt+0xf0>
 804955f: 89 45 d0                     	movl	%eax, -48(%ebp)
 8049562: 8b 45 d0                     	movl	-48(%ebp), %eax
 8049565: 85 c0                        	testl	%eax, %eax
 8049567: 75 2a                        	jne	0x8049593 <main_loop+0xae>
 8049569: a1 54 e3 04 08               	movl	134538068, %eax
 804956e: 89 44 24 08                  	movl	%eax, 8(%esp)
 8049572: c7 44 24 04 68 c0 04 08      	movl	$134529128, 4(%esp)
 804957a: a1 24 d3 04 08               	movl	134533924, %eax
 804957f: 89 04 24                     	movl	%eax, (%esp)
 8049582: e8 79 f5 ff ff               	calll	0x8048b00 <.plt+0x50>
 8049587: c7 04 24 01 00 00 00         	movl	$1, (%esp)
 804958e: e8 4d f7 ff ff               	calll	0x8048ce0 <.plt+0x230>
 8049593: c7 04 24 00 00 00 00         	movl	$0, (%esp)
 804959a: e8 c1 f5 ff ff               	calll	0x8048b60 <.plt+0xb0>
 804959f: 3b 45 d4                     	cmpl	-44(%ebp), %eax
 80495a2: 0f 95 c0                     	setne	%al
 80495a5: 0f b6 c0                     	movzbl	%al, %eax
 80495a8: 89 45 dc                     	movl	%eax, -36(%ebp)
 80495ab: 83 7d dc 00                  	cmpl	$0, -36(%ebp)
 80495af: 75 25                        	jne	0x80495d6 <main_loop+0xf1>
 80495b1: c7 04 24 89 c0 04 08         	movl	$134529161, (%esp)
 80495b8: e8 b3 f6 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 80495bd: a1 20 d3 04 08               	movl	134533920, %eax
 80495c2: 89 04 24                     	movl	%eax, (%esp)
 80495c5: e8 56 f5 ff ff               	calll	0x8048b20 <.plt+0x70>
 80495ca: b8 00 00 00 00               	movl	$0, %eax
 80495cf: 0f ab 05 80 e3 04 08         	btsl	%eax, 134538112
 80495d6: c7 85 a4 fe ff ff 00 00 00 00	movl	$0, -348(%ebp)
 80495e0: e8 6b f5 ff ff               	calll	0x8048b50 <.plt+0xa0>
 80495e5: c7 00 00 00 00 00            	movl	$0, (%eax)
 80495eb: 8d 8d c8 fe ff ff            	leal	-312(%ebp), %ecx
 80495f1: ba 80 e3 04 08               	movl	$134538112, %edx
 80495f6: b8 80 00 00 00               	movl	$128, %eax
 80495fb: 89 44 24 08                  	movl	%eax, 8(%esp)
 80495ff: 89 54 24 04                  	movl	%edx, 4(%esp)
 8049603: 89 0c 24                     	movl	%ecx, (%esp)
 8049606: e8 85 f6 ff ff               	calll	0x8048c90 <.plt+0x1e0>
 804960b: c7 44 24 10 00 00 00 00      	movl	$0, 16(%esp)
 8049613: c7 44 24 0c 00 00 00 00      	movl	$0, 12(%esp)
 804961b: c7 44 24 08 00 00 00 00      	movl	$0, 8(%esp)
 8049623: 8d 85 c8 fe ff ff            	leal	-312(%ebp), %eax
 8049629: 89 44 24 04                  	movl	%eax, 4(%esp)
 804962d: c7 04 24 0a 00 00 00         	movl	$10, (%esp)
 8049634: e8 07 f5 ff ff               	calll	0x8048b40 <.plt+0x90>
 8049639: 85 c0                        	testl	%eax, %eax
 804963b: 79 30                        	jns	0x804966d <main_loop+0x188>
 804963d: e8 0e f5 ff ff               	calll	0x8048b50 <.plt+0xa0>
 8049642: 83 38 04                     	cmpl	$4, (%eax)
 8049645: 75 02                        	jne	0x8049649 <main_loop+0x164>
 8049647: eb 8d                        	jmp	0x80495d6 <main_loop+0xf1>
 8049649: e8 02 f5 ff ff               	calll	0x8048b50 <.plt+0xa0>
 804964e: 83 38 00                     	cmpl	$0, (%eax)
 8049651: 75 02                        	jne	0x8049655 <main_loop+0x170>
 8049653: eb 81                        	jmp	0x80495d6 <main_loop+0xf1>
 8049655: c7 04 24 91 c0 04 08         	movl	$134529169, (%esp)
 804965c: e8 8f f4 ff ff               	calll	0x8048af0 <.plt+0x40>
 8049661: c7 04 24 01 00 00 00         	movl	$1, (%esp)
 8049668: e8 73 f6 ff ff               	calll	0x8048ce0 <.plt+0x230>
 804966d: 8b 45 dc                     	movl	-36(%ebp), %eax
 8049670: 89 45 d8                     	movl	%eax, -40(%ebp)
 8049673: c7 04 24 00 00 00 00         	movl	$0, (%esp)
 804967a: e8 e1 f4 ff ff               	calll	0x8048b60 <.plt+0xb0>
 804967f: 3b 45 d4                     	cmpl	-44(%ebp), %eax
 8049682: 0f 95 c0                     	setne	%al
 8049685: 0f b6 c0                     	movzbl	%al, %eax
 8049688: 89 45 dc                     	movl	%eax, -36(%ebp)
 804968b: b8 00 00 00 00               	movl	$0, %eax
 8049690: 0f a3 85 c8 fe ff ff         	btl	%eax, -312(%ebp)
 8049697: 0f 92 c0                     	setb	%al
 804969a: 84 c0                        	testb	%al, %al
 804969c: 74 6d                        	je	0x804970b <main_loop+0x226>
 804969e: a1 28 d3 04 08               	movl	134533928, %eax
 80496a3: 89 44 24 08                  	movl	%eax, 8(%esp)
 80496a7: c7 44 24 04 64 00 00 00      	movl	$100, 4(%esp)
 80496af: 8d 85 28 fe ff ff            	leal	-472(%ebp), %eax
 80496b5: 89 04 24                     	movl	%eax, (%esp)
 80496b8: e8 53 f5 ff ff               	calll	0x8048c10 <.plt+0x160>
 80496bd: 85 c0                        	testl	%eax, %eax
 80496bf: 75 32                        	jne	0x80496f3 <main_loop+0x20e>
 80496c1: c7 04 24 9e c0 04 08         	movl	$134529182, (%esp)
 80496c8: e8 a3 f5 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 80496cd: c7 44 24 04 a4 c0 04 08      	movl	$134529188, 4(%esp)
 80496d5: a1 24 d3 04 08               	movl	134533924, %eax
 80496da: 89 04 24                     	movl	%eax, (%esp)
 80496dd: e8 1e f4 ff ff               	calll	0x8048b00 <.plt+0x50>
 80496e2: e8 ab 1a 00 00               	calll	0x804b192 <print_stats>
 80496e7: c7 04 24 00 00 00 00         	movl	$0, (%esp)
 80496ee: e8 ed f5 ff ff               	calll	0x8048ce0 <.plt+0x230>
 80496f3: 8d 85 28 fe ff ff            	leal	-472(%ebp), %eax
 80496f9: 89 04 24                     	movl	%eax, (%esp)
 80496fc: e8 66 11 00 00               	calll	0x804a867 <DoCommand>
 8049701: c7 85 a4 fe ff ff 01 00 00 00	movl	$1, -348(%ebp)
 804970b: 8b 45 dc                     	movl	-36(%ebp), %eax
 804970e: 3b 45 d8                     	cmpl	-40(%ebp), %eax
 8049711: 74 20                        	je	0x8049733 <main_loop+0x24e>
 8049713: 83 7d dc 00                  	cmpl	$0, -36(%ebp)
 8049717: 74 0e                        	je	0x8049727 <main_loop+0x242>
 8049719: b8 00 00 00 00               	movl	$0, %eax
 804971e: 0f b3 05 80 e3 04 08         	btrl	%eax, 134538112
 8049725: eb 0c                        	jmp	0x8049733 <main_loop+0x24e>
 8049727: b8 00 00 00 00               	movl	$0, %eax
 804972c: 0f ab 05 80 e3 04 08         	btsl	%eax, 134538112
 8049733: 83 bd a4 fe ff ff 00         	cmpl	$0, -348(%ebp)
 804973a: 75 0c                        	jne	0x8049748 <main_loop+0x263>
 804973c: 83 7d d8 00                  	cmpl	$0, -40(%ebp)
 8049740: 74 1f                        	je	0x8049761 <main_loop+0x27c>
 8049742: 83 7d dc 00                  	cmpl	$0, -36(%ebp)
 8049746: 75 19                        	jne	0x8049761 <main_loop+0x27c>
 8049748: c7 04 24 89 c0 04 08         	movl	$134529161, (%esp)
 804974f: e8 1c f5 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 8049754: a1 20 d3 04 08               	movl	134533920, %eax
 8049759: 89 04 24                     	movl	%eax, (%esp)
 804975c: e8 bf f3 ff ff               	calll	0x8048b20 <.plt+0x70>
 8049761: a1 4c e3 04 08               	movl	134538060, %eax
 8049766: 89 c2                        	movl	%eax, %edx
 8049768: 83 e2 1f                     	andl	$31, %edx
 804976b: a1 4c e3 04 08               	movl	134538060, %eax
 8049770: c1 e8 05                     	shrl	$5, %eax
 8049773: 0f a3 94 85 c8 fe ff ff      	btl	%edx, -312(%ebp,%eax,4)
 804977b: 0f 92 c0                     	setb	%al
 804977e: 84 c0                        	testb	%al, %al
 8049780: 75 05                        	jne	0x8049787 <main_loop+0x2a2>
 8049782: e9 4f fe ff ff               	jmp	0x80495d6 <main_loop+0xf1>
 8049787: e8 c4 f3 ff ff               	calll	0x8048b50 <.plt+0xa0>
 804978c: c7 00 00 00 00 00            	movl	$0, (%eax)
 8049792: c7 85 4c ff ff ff 10 00 00 00	movl	$16, -180(%ebp)
 804979c: c7 44 24 08 cc 05 00 00      	movl	$1484, 8(%esp)
 80497a4: c7 44 24 04 00 00 00 00      	movl	$0, 4(%esp)
 80497ac: 8b 45 d0                     	movl	-48(%ebp), %eax
 80497af: 83 c0 2c                     	addl	$44, %eax
 80497b2: 89 04 24                     	movl	%eax, (%esp)
 80497b5: e8 66 f5 ff ff               	calll	0x8048d20 <.plt+0x270>
 80497ba: 8d 85 4c ff ff ff            	leal	-180(%ebp), %eax
 80497c0: 89 44 24 14                  	movl	%eax, 20(%esp)
 80497c4: 8d 85 b8 fe ff ff            	leal	-328(%ebp), %eax
 80497ca: 89 44 24 10                  	movl	%eax, 16(%esp)
 80497ce: c7 44 24 0c 00 00 00 00      	movl	$0, 12(%esp)
 80497d6: c7 44 24 08 cc 05 00 00      	movl	$1484, 8(%esp)
 80497de: 8b 45 d0                     	movl	-48(%ebp), %eax
 80497e1: 83 c0 2c                     	addl	$44, %eax
 80497e4: 89 44 24 04                  	movl	%eax, 4(%esp)
 80497e8: a1 4c e3 04 08               	movl	134538060, %eax
 80497ed: 89 04 24                     	movl	%eax, (%esp)
 80497f0: e8 db f2 ff ff               	calll	0x8048ad0 <.plt+0x20>
 80497f5: 89 45 e4                     	movl	%eax, -28(%ebp)
 80497f8: 83 7d e4 00                  	cmpl	$0, -28(%ebp)
 80497fc: 79 27                        	jns	0x8049825 <main_loop+0x340>
 80497fe: e8 4d f3 ff ff               	calll	0x8048b50 <.plt+0xa0>
 8049803: 83 38 04                     	cmpl	$4, (%eax)
 8049806: 75 05                        	jne	0x804980d <main_loop+0x328>
 8049808: e9 c9 fd ff ff               	jmp	0x80495d6 <main_loop+0xf1>
 804980d: c7 04 24 cc c0 04 08         	movl	$134529228, (%esp)
 8049814: e8 d7 f2 ff ff               	calll	0x8048af0 <.plt+0x40>
 8049819: c7 04 24 01 00 00 00         	movl	$1, (%esp)
 8049820: e8 bb f4 ff ff               	calll	0x8048ce0 <.plt+0x230>
 8049825: 8b 55 d0                     	movl	-48(%ebp), %edx
 8049828: 8b 45 e4                     	movl	-28(%ebp), %eax
 804982b: 89 42 04                     	movl	%eax, 4(%edx)
 804982e: 8b 55 d0                     	movl	-48(%ebp), %edx
 8049831: 8b 85 b8 fe ff ff            	movl	-328(%ebp), %eax
 8049837: 89 42 0c                     	movl	%eax, 12(%edx)
 804983a: 8b 85 bc fe ff ff            	movl	-324(%ebp), %eax
 8049840: 89 42 10                     	movl	%eax, 16(%edx)
 8049843: 8b 85 c0 fe ff ff            	movl	-320(%ebp), %eax
 8049849: 89 42 14                     	movl	%eax, 20(%edx)
 804984c: 8b 85 c4 fe ff ff            	movl	-316(%ebp), %eax
 8049852: 89 42 18                     	movl	%eax, 24(%edx)
 8049855: a1 64 d3 04 08               	movl	134533988, %eax
 804985a: 89 04 24                     	movl	%eax, (%esp)
 804985d: e8 1e f3 ff ff               	calll	0x8048b80 <.plt+0xd0>
 8049862: 89 44 24 04                  	movl	%eax, 4(%esp)
 8049866: c7 04 24 ee c0 04 08         	movl	$134529262, (%esp)
 804986d: e8 fe f3 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 8049872: 0f b7 05 62 d3 04 08         	movzwl	134533986, %eax
 8049879: 89 04 24                     	movl	%eax, (%esp)
 804987c: e8 9f f3 ff ff               	calll	0x8048c20 <.plt+0x170>
 8049881: 0f b7 c0                     	movzwl	%ax, %eax
 8049884: 89 44 24 04                  	movl	%eax, 4(%esp)
 8049888: c7 04 24 fa c0 04 08         	movl	$134529274, (%esp)
 804988f: e8 dc f3 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 8049894: a1 74 d3 04 08               	movl	134534004, %eax
 8049899: 89 04 24                     	movl	%eax, (%esp)
 804989c: e8 df f2 ff ff               	calll	0x8048b80 <.plt+0xd0>
 80498a1: 89 44 24 04                  	movl	%eax, 4(%esp)
 80498a5: c7 04 24 0b c1 04 08         	movl	$134529291, (%esp)
 80498ac: e8 bf f3 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 80498b1: 0f b7 05 72 d3 04 08         	movzwl	134534002, %eax
 80498b8: 89 04 24                     	movl	%eax, (%esp)
 80498bb: e8 60 f3 ff ff               	calll	0x8048c20 <.plt+0x170>
 80498c0: 0f b7 c0                     	movzwl	%ax, %eax
 80498c3: 89 44 24 04                  	movl	%eax, 4(%esp)
 80498c7: c7 04 24 17 c1 04 08         	movl	$134529303, (%esp)
 80498ce: e8 9d f3 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 80498d3: 8b 45 d0                     	movl	-48(%ebp), %eax
 80498d6: 8b 40 10                     	movl	16(%eax), %eax
 80498d9: 89 04 24                     	movl	%eax, (%esp)
 80498dc: e8 9f f2 ff ff               	calll	0x8048b80 <.plt+0xd0>
 80498e1: 89 44 24 04                  	movl	%eax, 4(%esp)
 80498e5: c7 04 24 28 c1 04 08         	movl	$134529320, (%esp)
 80498ec: e8 7f f3 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 80498f1: 8b 45 d0                     	movl	-48(%ebp), %eax
 80498f4: 0f b7 40 0e                  	movzwl	14(%eax), %eax
 80498f8: 89 04 24                     	movl	%eax, (%esp)
 80498fb: e8 20 f3 ff ff               	calll	0x8048c20 <.plt+0x170>
 8049900: 0f b7 c0                     	movzwl	%ax, %eax
 8049903: 89 44 24 04                  	movl	%eax, 4(%esp)
 8049907: c7 04 24 33 c1 04 08         	movl	$134529331, (%esp)
 804990e: e8 5d f3 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 8049913: 8b 45 d0                     	movl	-48(%ebp), %eax
 8049916: 0f b7 40 0e                  	movzwl	14(%eax), %eax
 804991a: 89 04 24                     	movl	%eax, (%esp)
 804991d: e8 fe f2 ff ff               	calll	0x8048c20 <.plt+0x170>
 8049922: 0f b7 c0                     	movzwl	%ax, %eax
 8049925: 89 85 b4 fd ff ff            	movl	%eax, -588(%ebp)
 804992b: 8b 45 d0                     	movl	-48(%ebp), %eax
 804992e: 8b 40 10                     	movl	16(%eax), %eax
 8049931: 89 04 24                     	movl	%eax, (%esp)
 8049934: e8 47 f2 ff ff               	calll	0x8048b80 <.plt+0xd0>
 8049939: 89 44 24 04                  	movl	%eax, 4(%esp)
 804993d: 8d 85 b8 fd ff ff            	leal	-584(%ebp), %eax
 8049943: 89 04 24                     	movl	%eax, (%esp)
 8049946: e8 45 f4 ff ff               	calll	0x8048d90 <.plt+0x2e0>
 804994b: a1 64 d3 04 08               	movl	134533988, %eax
 8049950: 89 04 24                     	movl	%eax, (%esp)
 8049953: e8 28 f2 ff ff               	calll	0x8048b80 <.plt+0xd0>
 8049958: 8d 95 b8 fd ff ff            	leal	-584(%ebp), %edx
 804995e: 89 44 24 04                  	movl	%eax, 4(%esp)
 8049962: 89 14 24                     	movl	%edx, (%esp)
 8049965: e8 76 f1 ff ff               	calll	0x8048ae0 <.plt+0x30>
 804996a: 85 c0                        	testl	%eax, %eax
 804996c: 75 3f                        	jne	0x80499ad <main_loop+0x4c8>
 804996e: 0f b7 05 62 d3 04 08         	movzwl	134533986, %eax
 8049975: 89 04 24                     	movl	%eax, (%esp)
 8049978: e8 a3 f2 ff ff               	calll	0x8048c20 <.plt+0x170>
 804997d: 0f b7 c0                     	movzwl	%ax, %eax
 8049980: 3b 85 b4 fd ff ff            	cmpl	-588(%ebp), %eax
 8049986: 75 25                        	jne	0x80499ad <main_loop+0x4c8>
 8049988: 8b 55 d0                     	movl	-48(%ebp), %edx
 804998b: a1 70 d3 04 08               	movl	134534000, %eax
 8049990: 89 42 1c                     	movl	%eax, 28(%edx)
 8049993: a1 74 d3 04 08               	movl	134534004, %eax
 8049998: 89 42 20                     	movl	%eax, 32(%edx)
 804999b: a1 78 d3 04 08               	movl	134534008, %eax
 80499a0: 89 42 24                     	movl	%eax, 36(%edx)
 80499a3: a1 7c d3 04 08               	movl	134534012, %eax
 80499a8: 89 42 28                     	movl	%eax, 40(%edx)
 80499ab: eb 60                        	jmp	0x8049a0d <main_loop+0x528>
 80499ad: a1 74 d3 04 08               	movl	134534004, %eax
 80499b2: 89 04 24                     	movl	%eax, (%esp)
 80499b5: e8 c6 f1 ff ff               	calll	0x8048b80 <.plt+0xd0>
 80499ba: 8d 95 b8 fd ff ff            	leal	-584(%ebp), %edx
 80499c0: 89 44 24 04                  	movl	%eax, 4(%esp)
 80499c4: 89 14 24                     	movl	%edx, (%esp)
 80499c7: e8 14 f1 ff ff               	calll	0x8048ae0 <.plt+0x30>
 80499cc: 85 c0                        	testl	%eax, %eax
 80499ce: 75 3d                        	jne	0x8049a0d <main_loop+0x528>
 80499d0: 0f b7 05 72 d3 04 08         	movzwl	134534002, %eax
 80499d7: 89 04 24                     	movl	%eax, (%esp)
 80499da: e8 41 f2 ff ff               	calll	0x8048c20 <.plt+0x170>
 80499df: 0f b7 c0                     	movzwl	%ax, %eax
 80499e2: 3b 85 b4 fd ff ff            	cmpl	-588(%ebp), %eax
 80499e8: 75 23                        	jne	0x8049a0d <main_loop+0x528>
 80499ea: 8b 55 d0                     	movl	-48(%ebp), %edx
 80499ed: a1 60 d3 04 08               	movl	134533984, %eax
 80499f2: 89 42 1c                     	movl	%eax, 28(%edx)
 80499f5: a1 64 d3 04 08               	movl	134533988, %eax
 80499fa: 89 42 20                     	movl	%eax, 32(%edx)
 80499fd: a1 68 d3 04 08               	movl	134533992, %eax
 8049a02: 89 42 24                     	movl	%eax, 36(%edx)
 8049a05: a1 6c d3 04 08               	movl	134533996, %eax
 8049a0a: 89 42 28                     	movl	%eax, 40(%edx)
 8049a0d: e8 b5 09 00 00               	calll	0x804a3c7 <current_time>
 8049a12: a3 80 d3 04 08               	movl	%eax, 134534016
 8049a17: 8b 4d d0                     	movl	-48(%ebp), %ecx
 8049a1a: 8b 95 54 ff ff ff            	movl	-172(%ebp), %edx
 8049a20: 8d 85 54 ff ff ff            	leal	-172(%ebp), %eax
 8049a26: ff 00                        	incl	(%eax)
 8049a28: 89 11                        	movl	%edx, (%ecx)
 8049a2a: 83 3d 20 f4 04 08 00         	cmpl	$0, 134542368
 8049a31: 0f 84 aa 00 00 00            	je	0x8049ae1 <main_loop+0x5fc>
 8049a37: 0f b7 85 ba fe ff ff         	movzwl	-326(%ebp), %eax
 8049a3e: 89 04 24                     	movl	%eax, (%esp)
 8049a41: e8 da f1 ff ff               	calll	0x8048c20 <.plt+0x170>
 8049a46: 0f b7 d8                     	movzwl	%ax, %ebx
 8049a49: 8b 85 bc fe ff ff            	movl	-324(%ebp), %eax
 8049a4f: 89 04 24                     	movl	%eax, (%esp)
 8049a52: e8 29 f1 ff ff               	calll	0x8048b80 <.plt+0xd0>
 8049a57: 89 5c 24 18                  	movl	%ebx, 24(%esp)
 8049a5b: 89 44 24 14                  	movl	%eax, 20(%esp)
 8049a5f: 8b 45 d0                     	movl	-48(%ebp), %eax
 8049a62: 8b 00                        	movl	(%eax), %eax
 8049a64: 89 44 24 10                  	movl	%eax, 16(%esp)
 8049a68: db 05 80 d3 04 08            	fildl	134534016
 8049a6e: dd 05 b0 c1 04 08            	fldl	134529456
 8049a74: de f9                        	fdivrp	%st, %st(1)
 8049a76: dd 5c 24 08                  	fstpl	8(%esp)
 8049a7a: c7 44 24 04 44 c1 04 08      	movl	$134529348, 4(%esp)
 8049a82: 8d 85 58 ff ff ff            	leal	-168(%ebp), %eax
 8049a88: 89 04 24                     	movl	%eax, (%esp)
 8049a8b: e8 c0 f2 ff ff               	calll	0x8048d50 <.plt+0x2a0>
 8049a90: 8b 45 d0                     	movl	-48(%ebp), %eax
 8049a93: 0f b7 40 1e                  	movzwl	30(%eax), %eax
 8049a97: 89 04 24                     	movl	%eax, (%esp)
 8049a9a: e8 81 f1 ff ff               	calll	0x8048c20 <.plt+0x170>
 8049a9f: 0f b7 f8                     	movzwl	%ax, %edi
 8049aa2: 8b 45 d0                     	movl	-48(%ebp), %eax
 8049aa5: 8b 40 20                     	movl	32(%eax), %eax
 8049aa8: 89 04 24                     	movl	%eax, (%esp)
 8049aab: e8 d0 f0 ff ff               	calll	0x8048b80 <.plt+0xd0>
 8049ab0: 89 c3                        	movl	%eax, %ebx
 8049ab2: 8d b5 58 ff ff ff            	leal	-168(%ebp), %esi
 8049ab8: 8d 85 58 ff ff ff            	leal	-168(%ebp), %eax
 8049abe: 89 04 24                     	movl	%eax, (%esp)
 8049ac1: e8 6a f1 ff ff               	calll	0x8048c30 <.plt+0x180>
 8049ac6: 8d 04 06                     	leal	(%esi,%eax), %eax
 8049ac9: 89 7c 24 0c                  	movl	%edi, 12(%esp)
 8049acd: 89 5c 24 08                  	movl	%ebx, 8(%esp)
 8049ad1: c7 44 24 04 5c c1 04 08      	movl	$134529372, 4(%esp)
 8049ad9: 89 04 24                     	movl	%eax, (%esp)
 8049adc: e8 6f f2 ff ff               	calll	0x8048d50 <.plt+0x2a0>
 8049ae1: ff 05 40 f4 04 08            	incl	134542400
 8049ae7: e8 a4 f0 ff ff               	calll	0x8048b90 <.plt+0xe0>
 8049aec: 89 c1                        	movl	%eax, %ecx
 8049aee: b8 1f 85 eb 51               	movl	$1374389535, %eax
 8049af3: f7 e9                        	imull	%ecx
 8049af5: c1 fa 05                     	sarl	$5, %edx
 8049af8: 89 c8                        	movl	%ecx, %eax
 8049afa: c1 f8 1f                     	sarl	$31, %eax
 8049afd: 29 c2                        	subl	%eax, %edx
 8049aff: 89 d0                        	movl	%edx, %eax
 8049b01: c1 e0 02                     	shll	$2, %eax
 8049b04: 01 d0                        	addl	%edx, %eax
 8049b06: 8d 14 85 00 00 00 00         	leal	(,%eax,4), %edx
 8049b0d: 01 d0                        	addl	%edx, %eax
 8049b0f: c1 e0 02                     	shll	$2, %eax
 8049b12: 29 c1                        	subl	%eax, %ecx
 8049b14: 89 c8                        	movl	%ecx, %eax
 8049b16: 3b 05 24 d0 04 08            	cmpl	134533156, %eax
 8049b1c: 7d 48                        	jge	0x8049b66 <main_loop+0x681>
 8049b1e: ff 05 44 f4 04 08            	incl	134542404
 8049b24: 83 3d 20 f4 04 08 00         	cmpl	$0, 134542368
 8049b2b: 0f 84 a5 fa ff ff            	je	0x80495d6 <main_loop+0xf1>
 8049b31: c7 04 24 00 20 00 00         	movl	$8192, (%esp)
 8049b38: e8 f3 ef ff ff               	calll	0x8048b30 <.plt+0x80>
 8049b3d: 89 45 e0                     	movl	%eax, -32(%ebp)
 8049b40: 8d 85 58 ff ff ff            	leal	-168(%ebp), %eax
 8049b46: 89 44 24 04                  	movl	%eax, 4(%esp)
 8049b4a: c7 04 24 64 c1 04 08         	movl	$134529380, (%esp)
 8049b51: e8 1a f1 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 8049b56: 8b 45 e0                     	movl	-32(%ebp), %eax
 8049b59: 89 04 24                     	movl	%eax, (%esp)
 8049b5c: e8 ef f0 ff ff               	calll	0x8048c50 <.plt+0x1a0>
 8049b61: e9 70 fa ff ff               	jmp	0x80495d6 <main_loop+0xf1>
 8049b66: 8b 55 d0                     	movl	-48(%ebp), %edx
 8049b69: 8b 42 1c                     	movl	28(%edx), %eax
 8049b6c: 89 85 a8 fe ff ff            	movl	%eax, -344(%ebp)
 8049b72: 8b 42 20                     	movl	32(%edx), %eax
 8049b75: 89 85 ac fe ff ff            	movl	%eax, -340(%ebp)
 8049b7b: 8b 42 24                     	movl	36(%edx), %eax
 8049b7e: 89 85 b0 fe ff ff            	movl	%eax, -336(%ebp)
 8049b84: 8b 42 28                     	movl	40(%edx), %eax
 8049b87: 89 85 b4 fe ff ff            	movl	%eax, -332(%ebp)
 8049b8d: c7 04 24 02 00 00 00         	movl	$2, (%esp)
 8049b94: e8 87 f0 ff ff               	calll	0x8048c20 <.plt+0x170>
 8049b99: 66 39 85 a8 fe ff ff         	cmpw	%ax, -344(%ebp)
 8049ba0: 75 1e                        	jne	0x8049bc0 <main_loop+0x6db>
 8049ba2: 0f b7 85 aa fe ff ff         	movzwl	-342(%ebp), %eax
 8049ba9: 89 04 24                     	movl	%eax, (%esp)
 8049bac: e8 6f f0 ff ff               	calll	0x8048c20 <.plt+0x170>
 8049bb1: 66 3d ff 03                  	cmpw	$1023, %ax
 8049bb5: 76 09                        	jbe	0x8049bc0 <main_loop+0x6db>
 8049bb7: 83 bd ac fe ff ff 00         	cmpl	$0, -340(%ebp)
 8049bbe: 75 48                        	jne	0x8049c08 <main_loop+0x723>
 8049bc0: ff 05 50 f4 04 08            	incl	134542416
 8049bc6: 83 3d 20 f4 04 08 00         	cmpl	$0, 134542368
 8049bcd: 0f 84 03 fa ff ff            	je	0x80495d6 <main_loop+0xf1>
 8049bd3: c7 04 24 00 20 00 00         	movl	$8192, (%esp)
 8049bda: e8 51 ef ff ff               	calll	0x8048b30 <.plt+0x80>
 8049bdf: 89 45 e0                     	movl	%eax, -32(%ebp)
 8049be2: 8d 85 58 ff ff ff            	leal	-168(%ebp), %eax
 8049be8: 89 44 24 04                  	movl	%eax, 4(%esp)
 8049bec: c7 04 24 72 c1 04 08         	movl	$134529394, (%esp)
 8049bf3: e8 78 f0 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 8049bf8: 8b 45 e0                     	movl	-32(%ebp), %eax
 8049bfb: 89 04 24                     	movl	%eax, (%esp)
 8049bfe: e8 4d f0 ff ff               	calll	0x8048c50 <.plt+0x1a0>
 8049c03: e9 ce f9 ff ff               	jmp	0x80495d6 <main_loop+0xf1>
 8049c08: a1 44 d3 04 08               	movl	134533956, %eax
 8049c0d: 3b 05 30 d0 04 08            	cmpl	134533168, %eax
 8049c13: 7c 48                        	jl	0x8049c5d <main_loop+0x778>
 8049c15: ff 05 48 f4 04 08            	incl	134542408
 8049c1b: 83 3d 20 f4 04 08 00         	cmpl	$0, 134542368
 8049c22: 0f 84 ae f9 ff ff            	je	0x80495d6 <main_loop+0xf1>
 8049c28: c7 04 24 00 20 00 00         	movl	$8192, (%esp)
 8049c2f: e8 fc ee ff ff               	calll	0x8048b30 <.plt+0x80>
 8049c34: 89 45 e0                     	movl	%eax, -32(%ebp)
 8049c37: 8d 85 58 ff ff ff            	leal	-168(%ebp), %eax
 8049c3d: 89 44 24 04                  	movl	%eax, 4(%esp)
 8049c41: c7 04 24 84 c1 04 08         	movl	$134529412, (%esp)
 8049c48: e8 23 f0 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 8049c4d: 8b 45 e0                     	movl	-32(%ebp), %eax
 8049c50: 89 04 24                     	movl	%eax, (%esp)
 8049c53: e8 f8 ef ff ff               	calll	0x8048c50 <.plt+0x1a0>
 8049c58: e9 79 f9 ff ff               	jmp	0x80495d6 <main_loop+0xf1>
 8049c5d: 8b 45 d0                     	movl	-48(%ebp), %eax
 8049c60: 8b 15 80 d3 04 08            	movl	134534016, %edx
 8049c66: 89 50 08                     	movl	%edx, 8(%eax)
 8049c69: c7 04 24 00 20 00 00         	movl	$8192, (%esp)
 8049c70: e8 bb ee ff ff               	calll	0x8048b30 <.plt+0x80>
 8049c75: 89 45 e0                     	movl	%eax, -32(%ebp)
 8049c78: e8 13 ef ff ff               	calll	0x8048b90 <.plt+0xe0>
 8049c7d: 89 85 b0 fd ff ff            	movl	%eax, -592(%ebp)
 8049c83: 8b 85 b0 fd ff ff            	movl	-592(%ebp), %eax
 8049c89: 89 85 ac fd ff ff            	movl	%eax, -596(%ebp)
 8049c8f: 83 bd ac fd ff ff 00         	cmpl	$0, -596(%ebp)
 8049c96: 79 0a                        	jns	0x8049ca2 <main_loop+0x7bd>
 8049c98: 81 85 ac fd ff ff ff 03 00 00	addl	$1023, -596(%ebp)
 8049ca2: 8b 85 ac fd ff ff            	movl	-596(%ebp), %eax
 8049ca8: c1 f8 0a                     	sarl	$10, %eax
 8049cab: c1 e0 0a                     	shll	$10, %eax
 8049cae: 8b 95 b0 fd ff ff            	movl	-592(%ebp), %edx
 8049cb4: 29 c2                        	subl	%eax, %edx
 8049cb6: 89 d0                        	movl	%edx, %eax
 8049cb8: 8b 04 85 20 e4 04 08         	movl	134538272(,%eax,4), %eax
 8049cbf: 89 85 50 ff ff ff            	movl	%eax, -176(%ebp)
 8049cc5: 8b 45 d0                     	movl	-48(%ebp), %eax
 8049cc8: 89 45 cc                     	movl	%eax, -52(%ebp)
 8049ccb: c7 04 24 f8 05 00 00         	movl	$1528, (%esp)
 8049cd2: e8 c9 ee ff ff               	calll	0x8048ba0 <.plt+0xf0>
 8049cd7: 89 45 d0                     	movl	%eax, -48(%ebp)
 8049cda: 8b 45 d0                     	movl	-48(%ebp), %eax
 8049cdd: 85 c0                        	testl	%eax, %eax
 8049cdf: 75 2a                        	jne	0x8049d0b <main_loop+0x826>
 8049ce1: a1 54 e3 04 08               	movl	134538068, %eax
 8049ce6: 89 44 24 08                  	movl	%eax, 8(%esp)
 8049cea: c7 44 24 04 68 c0 04 08      	movl	$134529128, 4(%esp)
 8049cf2: a1 24 d3 04 08               	movl	134533924, %eax
 8049cf7: 89 04 24                     	movl	%eax, (%esp)
 8049cfa: e8 01 ee ff ff               	calll	0x8048b00 <.plt+0x50>
 8049cff: c7 04 24 01 00 00 00         	movl	$1, (%esp)
 8049d06: e8 d5 ef ff ff               	calll	0x8048ce0 <.plt+0x230>
 8049d0b: c7 04 24 01 00 00 00         	movl	$1, (%esp)
 8049d12: e8 e1 19 00 00               	calll	0x804b6f8 <inc_queue>
 8049d17: 8b 45 cc                     	movl	-52(%ebp), %eax
 8049d1a: 89 44 24 08                  	movl	%eax, 8(%esp)
 8049d1e: c7 44 24 04 2b a0 04 08      	movl	$134520875, 4(%esp)
 8049d26: 8b 85 50 ff ff ff            	movl	-176(%ebp), %eax
 8049d2c: 89 04 24                     	movl	%eax, (%esp)
 8049d2f: e8 4d 08 00 00               	calll	0x804a581 <t_schedule>
 8049d34: 83 3d 20 f4 04 08 00         	cmpl	$0, 134542368
 8049d3b: 74 20                        	je	0x8049d5d <main_loop+0x878>
 8049d3d: 8b 85 50 ff ff ff            	movl	-176(%ebp), %eax
 8049d43: 89 44 24 08                  	movl	%eax, 8(%esp)
 8049d47: 8d 85 58 ff ff ff            	leal	-168(%ebp), %eax
 8049d4d: 89 44 24 04                  	movl	%eax, 4(%esp)
 8049d51: c7 04 24 93 c1 04 08         	movl	$134529427, (%esp)
 8049d58: e8 13 ef ff ff               	calll	0x8048c70 <.plt+0x1c0>
 8049d5d: e8 2e ee ff ff               	calll	0x8048b90 <.plt+0xe0>
 8049d62: 89 c1                        	movl	%eax, %ecx
 8049d64: b8 1f 85 eb 51               	movl	$1374389535, %eax
 8049d69: f7 e9                        	imull	%ecx
 8049d6b: c1 fa 05                     	sarl	$5, %edx
 8049d6e: 89 c8                        	movl	%ecx, %eax
 8049d70: c1 f8 1f                     	sarl	$31, %eax
 8049d73: 29 c2                        	subl	%eax, %edx
 8049d75: 89 d0                        	movl	%edx, %eax
 8049d77: c1 e0 02                     	shll	$2, %eax
 8049d7a: 01 d0                        	addl	%edx, %eax
 8049d7c: 8d 14 85 00 00 00 00         	leal	(,%eax,4), %edx
 8049d83: 01 d0                        	addl	%edx, %eax
 8049d85: c1 e0 02                     	shll	$2, %eax
 8049d88: 29 c1                        	subl	%eax, %ecx
 8049d8a: 89 c8                        	movl	%ecx, %eax
 8049d8c: 3b 05 40 d3 04 08            	cmpl	134533952, %eax
 8049d92: 7c 25                        	jl	0x8049db9 <main_loop+0x8d4>
 8049d94: 83 3d 20 f4 04 08 00         	cmpl	$0, 134542368
 8049d9b: 74 0c                        	je	0x8049da9 <main_loop+0x8c4>
 8049d9d: c7 04 24 9f c1 04 08         	movl	$134529439, (%esp)
 8049da4: e8 c7 ee ff ff               	calll	0x8048c70 <.plt+0x1c0>
 8049da9: 8b 45 e0                     	movl	-32(%ebp), %eax
 8049dac: 89 04 24                     	movl	%eax, (%esp)
 8049daf: e8 9c ee ff ff               	calll	0x8048c50 <.plt+0x1a0>
 8049db4: e9 1d f8 ff ff               	jmp	0x80495d6 <main_loop+0xf1>
 8049db9: 8b 55 cc                     	movl	-52(%ebp), %edx
 8049dbc: 8b 45 cc                     	movl	-52(%ebp), %eax
 8049dbf: 03 42 04                     	addl	4(%edx), %eax
 8049dc2: 2b 45 cc                     	subl	-52(%ebp), %eax
 8049dc5: 83 c0 2c                     	addl	$44, %eax
 8049dc8: 89 45 e4                     	movl	%eax, -28(%ebp)
 8049dcb: 8b 45 e4                     	movl	-28(%ebp), %eax
 8049dce: 89 44 24 08                  	movl	%eax, 8(%esp)
 8049dd2: 8b 45 cc                     	movl	-52(%ebp), %eax
 8049dd5: 89 44 24 04                  	movl	%eax, 4(%esp)
 8049dd9: 8b 45 d0                     	movl	-48(%ebp), %eax
 8049ddc: 89 04 24                     	movl	%eax, (%esp)
 8049ddf: e8 ac ee ff ff               	calll	0x8048c90 <.plt+0x1e0>
 8049de4: 83 3d 20 f4 04 08 00         	cmpl	$0, 134542368
 8049deb: 74 0c                        	je	0x8049df9 <main_loop+0x914>
 8049ded: c7 04 24 a1 c1 04 08         	movl	$134529441, (%esp)
 8049df4: e8 77 ee ff ff               	calll	0x8048c70 <.plt+0x1c0>
 8049df9: ff 05 58 f4 04 08            	incl	134542424
 8049dff: 8b 45 e0                     	movl	-32(%ebp), %eax
 8049e02: 89 04 24                     	movl	%eax, (%esp)
 8049e05: e8 46 ee ff ff               	calll	0x8048c50 <.plt+0x1a0>
 8049e0a: e9 fe fb ff ff               	jmp	0x8049a0d <main_loop+0x528>

08049e0f <parse_int>:
 8049e0f: 55                           	pushl	%ebp
 8049e10: 89 e5                        	movl	%esp, %ebp
 8049e12: 83 ec 18                     	subl	$24, %esp
 8049e15: 8b 45 08                     	movl	8(%ebp), %eax
 8049e18: 89 45 fc                     	movl	%eax, -4(%ebp)
 8049e1b: 8b 45 fc                     	movl	-4(%ebp), %eax
 8049e1e: 80 38 00                     	cmpb	$0, (%eax)
 8049e21: 74 48                        	je	0x8049e6b <parse_int+0x5c>
 8049e23: e8 48 ef ff ff               	calll	0x8048d70 <.plt+0x2c0>
 8049e28: 89 c1                        	movl	%eax, %ecx
 8049e2a: 8b 45 fc                     	movl	-4(%ebp), %eax
 8049e2d: 0f be 00                     	movsbl	(%eax), %eax
 8049e30: 8d 14 00                     	leal	(%eax,%eax), %edx
 8049e33: 8b 01                        	movl	(%ecx), %eax
 8049e35: 0f b7 04 02                  	movzwl	(%edx,%eax), %eax
 8049e39: c1 e8 0b                     	shrl	$11, %eax
 8049e3c: 83 e0 01                     	andl	$1, %eax
 8049e3f: 85 c0                        	testl	%eax, %eax
 8049e41: 75 21                        	jne	0x8049e64 <parse_int+0x55>
 8049e43: 8b 45 08                     	movl	8(%ebp), %eax
 8049e46: 89 44 24 08                  	movl	%eax, 8(%esp)
 8049e4a: c7 44 24 04 b8 c1 04 08      	movl	$134529464, 4(%esp)
 8049e52: a1 24 d3 04 08               	movl	134533924, %eax
 8049e57: 89 04 24                     	movl	%eax, (%esp)
 8049e5a: e8 a1 ec ff ff               	calll	0x8048b00 <.plt+0x50>
 8049e5f: e8 5c 00 00 00               	calll	0x8049ec0 <usage>
 8049e64: 8d 45 fc                     	leal	-4(%ebp), %eax
 8049e67: ff 00                        	incl	(%eax)
 8049e69: eb b0                        	jmp	0x8049e1b <parse_int+0xc>
 8049e6b: 8b 45 08                     	movl	8(%ebp), %eax
 8049e6e: 89 04 24                     	movl	%eax, (%esp)
 8049e71: e8 7a ee ff ff               	calll	0x8048cf0 <.plt+0x240>
 8049e76: c9                           	leave
 8049e77: c3                           	retl

08049e78 <parse_percent>:
 8049e78: 55                           	pushl	%ebp
 8049e79: 89 e5                        	movl	%esp, %ebp
 8049e7b: 83 ec 18                     	subl	$24, %esp
 8049e7e: 8b 45 08                     	movl	8(%ebp), %eax
 8049e81: 89 04 24                     	movl	%eax, (%esp)
 8049e84: e8 86 ff ff ff               	calll	0x8049e0f <parse_int>
 8049e89: 89 45 fc                     	movl	%eax, -4(%ebp)
 8049e8c: 83 7d fc 00                  	cmpl	$0, -4(%ebp)
 8049e90: 78 08                        	js	0x8049e9a <parse_percent+0x22>
 8049e92: 83 7d fc 64                  	cmpl	$100, -4(%ebp)
 8049e96: 7f 02                        	jg	0x8049e9a <parse_percent+0x22>
 8049e98: eb 21                        	jmp	0x8049ebb <parse_percent+0x43>
 8049e9a: 8b 45 08                     	movl	8(%ebp), %eax
 8049e9d: 89 44 24 08                  	movl	%eax, 8(%esp)
 8049ea1: c7 44 24 04 d0 c1 04 08      	movl	$134529488, 4(%esp)
 8049ea9: a1 24 d3 04 08               	movl	134533924, %eax
 8049eae: 89 04 24                     	movl	%eax, (%esp)
 8049eb1: e8 4a ec ff ff               	calll	0x8048b00 <.plt+0x50>
 8049eb6: e8 05 00 00 00               	calll	0x8049ec0 <usage>
 8049ebb: 8b 45 fc                     	movl	-4(%ebp), %eax
 8049ebe: c9                           	leave
 8049ebf: c3                           	retl

08049ec0 <usage>:
 8049ec0: 55                           	pushl	%ebp
 8049ec1: 89 e5                        	movl	%esp, %ebp
 8049ec3: 83 ec 18                     	subl	$24, %esp
 8049ec6: a1 54 e3 04 08               	movl	134538068, %eax
 8049ecb: 89 44 24 08                  	movl	%eax, 8(%esp)
 8049ecf: c7 44 24 04 f2 c1 04 08      	movl	$134529522, 4(%esp)
 8049ed7: a1 24 d3 04 08               	movl	134533924, %eax
 8049edc: 89 04 24                     	movl	%eax, (%esp)
 8049edf: e8 1c ec ff ff               	calll	0x8048b00 <.plt+0x50>
 8049ee4: c7 44 24 04 0c c2 04 08      	movl	$134529548, 4(%esp)
 8049eec: a1 24 d3 04 08               	movl	134533924, %eax
 8049ef1: 89 04 24                     	movl	%eax, (%esp)
 8049ef4: e8 07 ec ff ff               	calll	0x8048b00 <.plt+0x50>
 8049ef9: c7 44 24 04 44 c2 04 08      	movl	$134529604, 4(%esp)
 8049f01: a1 24 d3 04 08               	movl	134533924, %eax
 8049f06: 89 04 24                     	movl	%eax, (%esp)
 8049f09: e8 f2 eb ff ff               	calll	0x8048b00 <.plt+0x50>
 8049f0e: c7 44 24 04 74 c2 04 08      	movl	$134529652, 4(%esp)
 8049f16: a1 24 d3 04 08               	movl	134533924, %eax
 8049f1b: 89 04 24                     	movl	%eax, (%esp)
 8049f1e: e8 dd eb ff ff               	calll	0x8048b00 <.plt+0x50>
 8049f23: c7 44 24 04 9c c2 04 08      	movl	$134529692, 4(%esp)
 8049f2b: a1 24 d3 04 08               	movl	134533924, %eax
 8049f30: 89 04 24                     	movl	%eax, (%esp)
 8049f33: e8 c8 eb ff ff               	calll	0x8048b00 <.plt+0x50>
 8049f38: c7 44 24 04 bc c2 04 08      	movl	$134529724, 4(%esp)
 8049f40: a1 24 d3 04 08               	movl	134533924, %eax
 8049f45: 89 04 24                     	movl	%eax, (%esp)
 8049f48: e8 b3 eb ff ff               	calll	0x8048b00 <.plt+0x50>
 8049f4d: c7 44 24 04 fc c2 04 08      	movl	$134529788, 4(%esp)
 8049f55: a1 24 d3 04 08               	movl	134533924, %eax
 8049f5a: 89 04 24                     	movl	%eax, (%esp)
 8049f5d: e8 9e eb ff ff               	calll	0x8048b00 <.plt+0x50>
 8049f62: c7 44 24 04 34 c3 04 08      	movl	$134529844, 4(%esp)
 8049f6a: a1 24 d3 04 08               	movl	134533924, %eax
 8049f6f: 89 04 24                     	movl	%eax, (%esp)
 8049f72: e8 89 eb ff ff               	calll	0x8048b00 <.plt+0x50>
 8049f77: c7 44 24 04 66 c3 04 08      	movl	$134529894, 4(%esp)
 8049f7f: a1 24 d3 04 08               	movl	134533924, %eax
 8049f84: 89 04 24                     	movl	%eax, (%esp)
 8049f87: e8 74 eb ff ff               	calll	0x8048b00 <.plt+0x50>
 8049f8c: c7 44 24 04 84 c3 04 08      	movl	$134529924, 4(%esp)
 8049f94: a1 24 d3 04 08               	movl	134533924, %eax
 8049f99: 89 04 24                     	movl	%eax, (%esp)
 8049f9c: e8 5f eb ff ff               	calll	0x8048b00 <.plt+0x50>
 8049fa1: c7 44 24 04 bc c3 04 08      	movl	$134529980, 4(%esp)
 8049fa9: a1 24 d3 04 08               	movl	134533924, %eax
 8049fae: 89 04 24                     	movl	%eax, (%esp)
 8049fb1: e8 4a eb ff ff               	calll	0x8048b00 <.plt+0x50>
 8049fb6: c7 44 24 04 dc c3 04 08      	movl	$134530012, 4(%esp)
 8049fbe: a1 24 d3 04 08               	movl	134533924, %eax
 8049fc3: 89 04 24                     	movl	%eax, (%esp)
 8049fc6: e8 35 eb ff ff               	calll	0x8048b00 <.plt+0x50>
 8049fcb: c7 44 24 04 fd c3 04 08      	movl	$134530045, 4(%esp)
 8049fd3: a1 24 d3 04 08               	movl	134533924, %eax
 8049fd8: 89 04 24                     	movl	%eax, (%esp)
 8049fdb: e8 20 eb ff ff               	calll	0x8048b00 <.plt+0x50>
 8049fe0: c7 44 24 04 11 c4 04 08      	movl	$134530065, 4(%esp)
 8049fe8: a1 24 d3 04 08               	movl	134533924, %eax
 8049fed: 89 04 24                     	movl	%eax, (%esp)
 8049ff0: e8 0b eb ff ff               	calll	0x8048b00 <.plt+0x50>
 8049ff5: c7 44 24 04 25 c4 04 08      	movl	$134530085, 4(%esp)
 8049ffd: a1 24 d3 04 08               	movl	134533924, %eax
 804a002: 89 04 24                     	movl	%eax, (%esp)
 804a005: e8 f6 ea ff ff               	calll	0x8048b00 <.plt+0x50>
 804a00a: c7 44 24 04 41 c4 04 08      	movl	$134530113, 4(%esp)
 804a012: a1 24 d3 04 08               	movl	134533924, %eax
 804a017: 89 04 24                     	movl	%eax, (%esp)
 804a01a: e8 e1 ea ff ff               	calll	0x8048b00 <.plt+0x50>
 804a01f: c7 04 24 01 00 00 00         	movl	$1, (%esp)
 804a026: e8 b5 ec ff ff               	calll	0x8048ce0 <.plt+0x230>

0804a02b <SendMessage>:
 804a02b: 55                           	pushl	%ebp
 804a02c: 89 e5                        	movl	%esp, %ebp
 804a02e: 53                           	pushl	%ebx
 804a02f: 83 ec 44                     	subl	$68, %esp
 804a032: 8b 45 08                     	movl	8(%ebp), %eax
 804a035: 83 c0 1c                     	addl	$28, %eax
 804a038: 89 45 f0                     	movl	%eax, -16(%ebp)
 804a03b: 8b 45 08                     	movl	8(%ebp), %eax
 804a03e: 8b 40 04                     	movl	4(%eax), %eax
 804a041: 89 45 ec                     	movl	%eax, -20(%ebp)
 804a044: 8b 55 08                     	movl	8(%ebp), %edx
 804a047: 8b 42 1c                     	movl	28(%edx), %eax
 804a04a: 89 45 d8                     	movl	%eax, -40(%ebp)
 804a04d: 8b 42 20                     	movl	32(%edx), %eax
 804a050: 89 45 dc                     	movl	%eax, -36(%ebp)
 804a053: 8b 42 24                     	movl	36(%edx), %eax
 804a056: 89 45 e0                     	movl	%eax, -32(%ebp)
 804a059: 8b 42 28                     	movl	40(%edx), %eax
 804a05c: 89 45 e4                     	movl	%eax, -28(%ebp)
 804a05f: e8 63 03 00 00               	calll	0x804a3c7 <current_time>
 804a064: a3 80 d3 04 08               	movl	%eax, 134534016
 804a069: c7 04 24 ff ff ff ff         	movl	$4294967295, (%esp)
 804a070: e8 83 16 00 00               	calll	0x804b6f8 <inc_queue>
 804a075: 8b 45 08                     	movl	8(%ebp), %eax
 804a078: 8b 50 08                     	movl	8(%eax), %edx
 804a07b: a1 80 d3 04 08               	movl	134534016, %eax
 804a080: 29 d0                        	subl	%edx, %eax
 804a082: 89 45 e8                     	movl	%eax, -24(%ebp)
 804a085: 83 3d 20 f4 04 08 00         	cmpl	$0, 134542368
 804a08c: 0f 84 86 00 00 00            	je	0x804a118 <SendMessage+0xed>
 804a092: 8b 45 08                     	movl	8(%ebp), %eax
 804a095: 0f b7 40 0e                  	movzwl	14(%eax), %eax
 804a099: 89 04 24                     	movl	%eax, (%esp)
 804a09c: e8 7f eb ff ff               	calll	0x8048c20 <.plt+0x170>
 804a0a1: 0f b7 d8                     	movzwl	%ax, %ebx
 804a0a4: 8b 45 08                     	movl	8(%ebp), %eax
 804a0a7: 8b 40 10                     	movl	16(%eax), %eax
 804a0aa: 89 04 24                     	movl	%eax, (%esp)
 804a0ad: e8 ce ea ff ff               	calll	0x8048b80 <.plt+0xd0>
 804a0b2: 89 5c 24 14                  	movl	%ebx, 20(%esp)
 804a0b6: 89 44 24 10                  	movl	%eax, 16(%esp)
 804a0ba: 8b 45 08                     	movl	8(%ebp), %eax
 804a0bd: 8b 00                        	movl	(%eax), %eax
 804a0bf: 89 44 24 0c                  	movl	%eax, 12(%esp)
 804a0c3: db 05 80 d3 04 08            	fildl	134534016
 804a0c9: dd 05 08 c5 04 08            	fldl	134530312
 804a0cf: de f9                        	fdivrp	%st, %st(1)
 804a0d1: dd 5c 24 04                  	fstpl	4(%esp)
 804a0d5: c7 04 24 5d c4 04 08         	movl	$134530141, (%esp)
 804a0dc: e8 8f eb ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804a0e1: 0f b7 45 da                  	movzwl	-38(%ebp), %eax
 804a0e5: 89 04 24                     	movl	%eax, (%esp)
 804a0e8: e8 33 eb ff ff               	calll	0x8048c20 <.plt+0x170>
 804a0ed: 0f b7 d8                     	movzwl	%ax, %ebx
 804a0f0: 8b 45 dc                     	movl	-36(%ebp), %eax
 804a0f3: 89 04 24                     	movl	%eax, (%esp)
 804a0f6: e8 85 ea ff ff               	calll	0x8048b80 <.plt+0xd0>
 804a0fb: 89 c2                        	movl	%eax, %edx
 804a0fd: 8b 45 e8                     	movl	-24(%ebp), %eax
 804a100: 89 44 24 0c                  	movl	%eax, 12(%esp)
 804a104: 89 5c 24 08                  	movl	%ebx, 8(%esp)
 804a108: 89 54 24 04                  	movl	%edx, 4(%esp)
 804a10c: c7 04 24 75 c4 04 08         	movl	$134530165, (%esp)
 804a113: e8 58 eb ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804a118: 83 3d 38 d3 04 08 00         	cmpl	$0, 134533944
 804a11f: 74 2b                        	je	0x804a14c <SendMessage+0x121>
 804a121: 8b 45 e8                     	movl	-24(%ebp), %eax
 804a124: 3b 05 38 d3 04 08            	cmpl	134533944, %eax
 804a12a: 7e 20                        	jle	0x804a14c <SendMessage+0x121>
 804a12c: 83 3d 20 f4 04 08 00         	cmpl	$0, 134542368
 804a133: 74 0c                        	je	0x804a141 <SendMessage+0x116>
 804a135: c7 04 24 88 c4 04 08         	movl	$134530184, (%esp)
 804a13c: e8 2f eb ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804a141: ff 05 4c f4 04 08            	incl	134542412
 804a147: e9 c3 01 00 00               	jmp	0x804a30f <SendMessage+0x2e4>
 804a14c: 8b 4d e8                     	movl	-24(%ebp), %ecx
 804a14f: b8 67 66 66 66               	movl	$1717986919, %eax
 804a154: f7 e9                        	imull	%ecx
 804a156: c1 fa 02                     	sarl	$2, %edx
 804a159: 89 c8                        	movl	%ecx, %eax
 804a15b: c1 f8 1f                     	sarl	$31, %eax
 804a15e: 29 c2                        	subl	%eax, %edx
 804a160: 89 d0                        	movl	%edx, %eax
 804a162: 89 45 e8                     	movl	%eax, -24(%ebp)
 804a165: 81 7d e8 e8 03 00 00         	cmpl	$1000, -24(%ebp)
 804a16c: 76 07                        	jbe	0x804a175 <SendMessage+0x14a>
 804a16e: c7 45 e8 e8 03 00 00         	movl	$1000, -24(%ebp)
 804a175: 8b 45 e8                     	movl	-24(%ebp), %eax
 804a178: 8d 14 85 00 00 00 00         	leal	(,%eax,4), %edx
 804a17f: a1 74 f4 04 08               	movl	134542452, %eax
 804a184: ff 04 02                     	incl	(%edx,%eax)
 804a187: e8 04 ea ff ff               	calll	0x8048b90 <.plt+0xe0>
 804a18c: 89 c1                        	movl	%eax, %ecx
 804a18e: b8 1f 85 eb 51               	movl	$1374389535, %eax
 804a193: f7 e9                        	imull	%ecx
 804a195: c1 fa 05                     	sarl	$5, %edx
 804a198: 89 c8                        	movl	%ecx, %eax
 804a19a: c1 f8 1f                     	sarl	$31, %eax
 804a19d: 29 c2                        	subl	%eax, %edx
 804a19f: 89 d0                        	movl	%edx, %eax
 804a1a1: c1 e0 02                     	shll	$2, %eax
 804a1a4: 01 d0                        	addl	%edx, %eax
 804a1a6: 8d 14 85 00 00 00 00         	leal	(,%eax,4), %edx
 804a1ad: 01 d0                        	addl	%edx, %eax
 804a1af: c1 e0 02                     	shll	$2, %eax
 804a1b2: 29 c1                        	subl	%eax, %ecx
 804a1b4: 89 c8                        	movl	%ecx, %eax
 804a1b6: 3b 05 3c d3 04 08            	cmpl	134533948, %eax
 804a1bc: 7d 33                        	jge	0x804a1f1 <SendMessage+0x1c6>
 804a1be: 8b 45 08                     	movl	8(%ebp), %eax
 804a1c1: 8b 40 04                     	movl	4(%eax), %eax
 804a1c4: 89 44 24 04                  	movl	%eax, 4(%esp)
 804a1c8: 8b 45 08                     	movl	8(%ebp), %eax
 804a1cb: 83 c0 1c                     	addl	$28, %eax
 804a1ce: 89 04 24                     	movl	%eax, (%esp)
 804a1d1: e8 6b 15 00 00               	calll	0x804b741 <do_garble>
 804a1d6: 83 3d 20 f4 04 08 00         	cmpl	$0, 134542368
 804a1dd: 74 0c                        	je	0x804a1eb <SendMessage+0x1c0>
 804a1df: c7 04 24 9c c4 04 08         	movl	$134530204, (%esp)
 804a1e6: e8 85 ea ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804a1eb: ff 05 54 f4 04 08            	incl	134542420
 804a1f1: e8 5a e9 ff ff               	calll	0x8048b50 <.plt+0xa0>
 804a1f6: c7 00 00 00 00 00            	movl	$0, (%eax)
 804a1fc: 0f b7 45 d8                  	movzwl	-40(%ebp), %eax
 804a200: 89 04 24                     	movl	%eax, (%esp)
 804a203: e8 18 ea ff ff               	calll	0x8048c20 <.plt+0x170>
 804a208: 66 89 45 d8                  	movw	%ax, -40(%ebp)
 804a20c: c7 44 24 14 10 00 00 00      	movl	$16, 20(%esp)
 804a214: 8d 45 d8                     	leal	-40(%ebp), %eax
 804a217: 89 44 24 10                  	movl	%eax, 16(%esp)
 804a21b: c7 44 24 0c 00 00 00 00      	movl	$0, 12(%esp)
 804a223: 8b 45 ec                     	movl	-20(%ebp), %eax
 804a226: 89 44 24 08                  	movl	%eax, 8(%esp)
 804a22a: 8b 45 f0                     	movl	-16(%ebp), %eax
 804a22d: 83 c0 10                     	addl	$16, %eax
 804a230: 89 44 24 04                  	movl	%eax, 4(%esp)
 804a234: a1 4c e3 04 08               	movl	134538060, %eax
 804a239: 89 04 24                     	movl	%eax, (%esp)
 804a23c: e8 6f e9 ff ff               	calll	0x8048bb0 <.plt+0x100>
 804a241: 89 45 f4                     	movl	%eax, -12(%ebp)
 804a244: 83 7d f4 00                  	cmpl	$0, -12(%ebp)
 804a248: 79 3e                        	jns	0x804a288 <SendMessage+0x25d>
 804a24a: e8 01 e9 ff ff               	calll	0x8048b50 <.plt+0xa0>
 804a24f: 83 38 04                     	cmpl	$4, (%eax)
 804a252: 75 0d                        	jne	0x804a261 <SendMessage+0x236>
 804a254: e8 f7 e8 ff ff               	calll	0x8048b50 <.plt+0xa0>
 804a259: c7 00 00 00 00 00            	movl	$0, (%eax)
 804a25f: eb ab                        	jmp	0x804a20c <SendMessage+0x1e1>
 804a261: 83 3d 20 f4 04 08 00         	cmpl	$0, 134542368
 804a268: 74 0c                        	je	0x804a276 <SendMessage+0x24b>
 804a26a: c7 04 24 a7 c4 04 08         	movl	$134530215, (%esp)
 804a271: e8 fa e9 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804a276: c7 04 24 b1 c4 04 08         	movl	$134530225, (%esp)
 804a27d: e8 6e e8 ff ff               	calll	0x8048af0 <.plt+0x40>
 804a282: ff 05 50 f4 04 08            	incl	134542416
 804a288: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a28b: 3b 45 ec                     	cmpl	-20(%ebp), %eax
 804a28e: 74 25                        	je	0x804a2b5 <SendMessage+0x28a>
 804a290: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a293: 89 44 24 0c                  	movl	%eax, 12(%esp)
 804a297: 8b 45 ec                     	movl	-20(%ebp), %eax
 804a29a: 89 44 24 08                  	movl	%eax, 8(%esp)
 804a29e: c7 44 24 04 c0 c4 04 08      	movl	$134530240, 4(%esp)
 804a2a6: a1 24 d3 04 08               	movl	134533924, %eax
 804a2ab: 89 04 24                     	movl	%eax, (%esp)
 804a2ae: e8 4d e8 ff ff               	calll	0x8048b00 <.plt+0x50>
 804a2b3: eb 5a                        	jmp	0x804a30f <SendMessage+0x2e4>
 804a2b5: ff 05 60 f4 04 08            	incl	134542432
 804a2bb: 8b 45 08                     	movl	8(%ebp), %eax
 804a2be: 8b 00                        	movl	(%eax), %eax
 804a2c0: 3b 05 3c d0 04 08            	cmpl	134533180, %eax
 804a2c6: 7d 1b                        	jge	0x804a2e3 <SendMessage+0x2b8>
 804a2c8: 83 3d 20 f4 04 08 00         	cmpl	$0, 134542368
 804a2cf: 74 0c                        	je	0x804a2dd <SendMessage+0x2b2>
 804a2d1: c7 04 24 e3 c4 04 08         	movl	$134530275, (%esp)
 804a2d8: e8 93 e9 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804a2dd: ff 05 5c f4 04 08            	incl	134542428
 804a2e3: 8b 45 08                     	movl	8(%ebp), %eax
 804a2e6: 8b 00                        	movl	(%eax), %eax
 804a2e8: 3b 05 3c d0 04 08            	cmpl	134533180, %eax
 804a2ee: 75 15                        	jne	0x804a305 <SendMessage+0x2da>
 804a2f0: 83 3d 20 f4 04 08 00         	cmpl	$0, 134542368
 804a2f7: 74 0c                        	je	0x804a305 <SendMessage+0x2da>
 804a2f9: c7 04 24 f3 c4 04 08         	movl	$134530291, (%esp)
 804a300: e8 6b e9 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804a305: 8b 45 08                     	movl	8(%ebp), %eax
 804a308: 8b 00                        	movl	(%eax), %eax
 804a30a: a3 3c d0 04 08               	movl	%eax, 134533180
 804a30f: 83 3d 20 f4 04 08 00         	cmpl	$0, 134542368
 804a316: 74 0c                        	je	0x804a324 <SendMessage+0x2f9>
 804a318: c7 04 24 9f c1 04 08         	movl	$134529439, (%esp)
 804a31f: e8 4c e9 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804a324: 8b 45 08                     	movl	8(%ebp), %eax
 804a327: 89 04 24                     	movl	%eax, (%esp)
 804a32a: e8 d1 e9 ff ff               	calll	0x8048d00 <.plt+0x250>
 804a32f: 83 c4 44                     	addl	$68, %esp
 804a332: 5b                           	popl	%ebx
 804a333: 5d                           	popl	%ebp
 804a334: c3                           	retl

0804a335 <set_interval>:
 804a335: 55                           	pushl	%ebp
 804a336: 89 e5                        	movl	%esp, %ebp
 804a338: 53                           	pushl	%ebx
 804a339: 8b 5d 08                     	movl	8(%ebp), %ebx
 804a33c: 8b 4d 0c                     	movl	12(%ebp), %ecx
 804a33f: b8 d3 4d 62 10               	movl	$274877907, %eax
 804a344: f7 e9                        	imull	%ecx
 804a346: c1 fa 06                     	sarl	$6, %edx
 804a349: 89 c8                        	movl	%ecx, %eax
 804a34b: c1 f8 1f                     	sarl	$31, %eax
 804a34e: 29 c2                        	subl	%eax, %edx
 804a350: 89 d0                        	movl	%edx, %eax
 804a352: 89 43 08                     	movl	%eax, 8(%ebx)
 804a355: 8b 5d 08                     	movl	8(%ebp), %ebx
 804a358: 8b 4d 0c                     	movl	12(%ebp), %ecx
 804a35b: b8 d3 4d 62 10               	movl	$274877907, %eax
 804a360: f7 e9                        	imull	%ecx
 804a362: c1 fa 06                     	sarl	$6, %edx
 804a365: 89 c8                        	movl	%ecx, %eax
 804a367: c1 f8 1f                     	sarl	$31, %eax
 804a36a: 29 c2                        	subl	%eax, %edx
 804a36c: 89 d0                        	movl	%edx, %eax
 804a36e: 69 c0 e8 03 00 00            	imull	$1000, %eax, %eax
 804a374: 29 c1                        	subl	%eax, %ecx
 804a376: 89 c8                        	movl	%ecx, %eax
 804a378: 69 c0 e8 03 00 00            	imull	$1000, %eax, %eax
 804a37e: 89 43 0c                     	movl	%eax, 12(%ebx)
 804a381: 8b 55 08                     	movl	8(%ebp), %edx
 804a384: 8b 45 08                     	movl	8(%ebp), %eax
 804a387: c7 40 04 00 00 00 00         	movl	$0, 4(%eax)
 804a38e: c7 02 00 00 00 00            	movl	$0, (%edx)
 804a394: 5b                           	popl	%ebx
 804a395: 5d                           	popl	%ebp
 804a396: c3                           	retl

0804a397 <get_interval>:
 804a397: 55                           	pushl	%ebp
 804a398: 89 e5                        	movl	%esp, %ebp
 804a39a: 53                           	pushl	%ebx
 804a39b: 8b 45 08                     	movl	8(%ebp), %eax
 804a39e: 8b 40 08                     	movl	8(%eax), %eax
 804a3a1: 69 c8 e8 03 00 00            	imull	$1000, %eax, %ecx
 804a3a7: 8b 45 08                     	movl	8(%ebp), %eax
 804a3aa: 8b 58 0c                     	movl	12(%eax), %ebx
 804a3ad: b8 d3 4d 62 10               	movl	$274877907, %eax
 804a3b2: f7 eb                        	imull	%ebx
 804a3b4: c1 fa 06                     	sarl	$6, %edx
 804a3b7: 89 d8                        	movl	%ebx, %eax
 804a3b9: c1 f8 1f                     	sarl	$31, %eax
 804a3bc: 29 c2                        	subl	%eax, %edx
 804a3be: 89 d0                        	movl	%edx, %eax
 804a3c0: 01 c1                        	addl	%eax, %ecx
 804a3c2: 89 c8                        	movl	%ecx, %eax
 804a3c4: 5b                           	popl	%ebx
 804a3c5: 5d                           	popl	%ebp
 804a3c6: c3                           	retl

0804a3c7 <current_time>:
 804a3c7: 55                           	pushl	%ebp
 804a3c8: 89 e5                        	movl	%esp, %ebp
 804a3ca: 53                           	pushl	%ebx
 804a3cb: 83 ec 24                     	subl	$36, %esp
 804a3ce: 8d 45 e8                     	leal	-24(%ebp), %eax
 804a3d1: 89 44 24 04                  	movl	%eax, 4(%esp)
 804a3d5: 8d 45 f0                     	leal	-16(%ebp), %eax
 804a3d8: 89 04 24                     	movl	%eax, (%esp)
 804a3db: e8 d0 e8 ff ff               	calll	0x8048cb0 <.plt+0x200>
 804a3e0: 8b 15 44 e3 04 08            	movl	134538052, %edx
 804a3e6: 8b 45 f0                     	movl	-16(%ebp), %eax
 804a3e9: 89 c1                        	movl	%eax, %ecx
 804a3eb: 29 d1                        	subl	%edx, %ecx
 804a3ed: 69 c9 e8 03 00 00            	imull	$1000, %ecx, %ecx
 804a3f3: 8b 15 48 e3 04 08            	movl	134538056, %edx
 804a3f9: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a3fc: 89 c3                        	movl	%eax, %ebx
 804a3fe: 29 d3                        	subl	%edx, %ebx
 804a400: b8 d3 4d 62 10               	movl	$274877907, %eax
 804a405: f7 eb                        	imull	%ebx
 804a407: c1 fa 06                     	sarl	$6, %edx
 804a40a: 89 d8                        	movl	%ebx, %eax
 804a40c: c1 f8 1f                     	sarl	$31, %eax
 804a40f: 29 c2                        	subl	%eax, %edx
 804a411: 89 d0                        	movl	%edx, %eax
 804a413: 01 c1                        	addl	%eax, %ecx
 804a415: 89 c8                        	movl	%ecx, %eax
 804a417: 83 c4 24                     	addl	$36, %esp
 804a41a: 5b                           	popl	%ebx
 804a41b: 5d                           	popl	%ebp
 804a41c: c3                           	retl

0804a41d <ding>:
 804a41d: 55                           	pushl	%ebp
 804a41e: 89 e5                        	movl	%esp, %ebp
 804a420: 83 ec 38                     	subl	$56, %esp
 804a423: 83 3d 50 e3 04 08 00         	cmpl	$0, 134538064
 804a42a: 0f 84 c1 00 00 00            	je	0x804a4f1 <ding+0xd4>
 804a430: a1 50 e3 04 08               	movl	134538064, %eax
 804a435: 89 45 f4                     	movl	%eax, -12(%ebp)
 804a438: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a43b: 8b 40 0c                     	movl	12(%eax), %eax
 804a43e: 89 45 f4                     	movl	%eax, -12(%ebp)
 804a441: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a444: 83 38 00                     	cmpl	$0, (%eax)
 804a447: 74 43                        	je	0x804a48c <ding+0x6f>
 804a449: a1 50 e3 04 08               	movl	134538064, %eax
 804a44e: 8b 40 0c                     	movl	12(%eax), %eax
 804a451: 89 45 f0                     	movl	%eax, -16(%ebp)
 804a454: 8b 45 f0                     	movl	-16(%ebp), %eax
 804a457: 3b 45 f4                     	cmpl	-12(%ebp), %eax
 804a45a: 74 22                        	je	0x804a47e <ding+0x61>
 804a45c: 8b 45 f0                     	movl	-16(%ebp), %eax
 804a45f: 8b 40 0c                     	movl	12(%eax), %eax
 804a462: 89 45 ec                     	movl	%eax, -20(%ebp)
 804a465: 8b 45 f0                     	movl	-16(%ebp), %eax
 804a468: 89 04 24                     	movl	%eax, (%esp)
 804a46b: e8 90 e8 ff ff               	calll	0x8048d00 <.plt+0x250>
 804a470: ff 0d 5c e3 04 08            	decl	134538076
 804a476: 8b 45 ec                     	movl	-20(%ebp), %eax
 804a479: 89 45 f0                     	movl	%eax, -16(%ebp)
 804a47c: eb d6                        	jmp	0x804a454 <ding+0x37>
 804a47e: 8b 15 50 e3 04 08            	movl	134538064, %edx
 804a484: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a487: 89 42 0c                     	movl	%eax, 12(%edx)
 804a48a: eb 65                        	jmp	0x804a4f1 <ding+0xd4>
 804a48c: 8b 55 f4                     	movl	-12(%ebp), %edx
 804a48f: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a492: 8b 40 08                     	movl	8(%eax), %eax
 804a495: 89 04 24                     	movl	%eax, (%esp)
 804a498: 8b 42 04                     	movl	4(%edx), %eax
 804a49b: ff d0                        	calll	*%eax
 804a49d: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a4a0: 3b 05 50 e3 04 08            	cmpl	134538064, %eax
 804a4a6: 75 90                        	jne	0x804a438 <ding+0x1b>
 804a4a8: a1 50 e3 04 08               	movl	134538064, %eax
 804a4ad: 8b 40 0c                     	movl	12(%eax), %eax
 804a4b0: 89 45 f4                     	movl	%eax, -12(%ebp)
 804a4b3: a1 50 e3 04 08               	movl	134538064, %eax
 804a4b8: c7 40 0c 00 00 00 00         	movl	$0, 12(%eax)
 804a4bf: c7 05 50 e3 04 08 00 00 00 00	movl	$0, 134538064
 804a4c9: 83 7d f4 00                  	cmpl	$0, -12(%ebp)
 804a4cd: 74 22                        	je	0x804a4f1 <ding+0xd4>
 804a4cf: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a4d2: 8b 40 0c                     	movl	12(%eax), %eax
 804a4d5: 89 45 f0                     	movl	%eax, -16(%ebp)
 804a4d8: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a4db: 89 04 24                     	movl	%eax, (%esp)
 804a4de: e8 1d e8 ff ff               	calll	0x8048d00 <.plt+0x250>
 804a4e3: 8b 45 f0                     	movl	-16(%ebp), %eax
 804a4e6: 89 45 f4                     	movl	%eax, -12(%ebp)
 804a4e9: ff 0d 5c e3 04 08            	decl	134538076
 804a4ef: eb d8                        	jmp	0x804a4c9 <ding+0xac>
 804a4f1: 83 3d 50 e3 04 08 00         	cmpl	$0, 134538064
 804a4f8: 74 42                        	je	0x804a53c <ding+0x11f>
 804a4fa: a1 50 e3 04 08               	movl	134538064, %eax
 804a4ff: 8b 40 0c                     	movl	12(%eax), %eax
 804a502: 8b 00                        	movl	(%eax), %eax
 804a504: 89 44 24 04                  	movl	%eax, 4(%esp)
 804a508: 8d 45 d8                     	leal	-40(%ebp), %eax
 804a50b: 89 04 24                     	movl	%eax, (%esp)
 804a50e: e8 22 fe ff ff               	calll	0x804a335 <set_interval>
 804a513: a1 50 e3 04 08               	movl	134538064, %eax
 804a518: 8b 40 0c                     	movl	12(%eax), %eax
 804a51b: c7 00 00 00 00 00            	movl	$0, (%eax)
 804a521: c7 44 24 08 00 00 00 00      	movl	$0, 8(%esp)
 804a529: 8d 45 d8                     	leal	-40(%ebp), %eax
 804a52c: 89 44 24 04                  	movl	%eax, 4(%esp)
 804a530: c7 04 24 00 00 00 00         	movl	$0, (%esp)
 804a537: e8 84 e6 ff ff               	calll	0x8048bc0 <.plt+0x110>
 804a53c: c9                           	leave
 804a53d: c3                           	retl

0804a53e <t_init>:
 804a53e: 55                           	pushl	%ebp
 804a53f: 89 e5                        	movl	%esp, %ebp
 804a541: 83 ec 18                     	subl	$24, %esp
 804a544: 8d 45 f8                     	leal	-8(%ebp), %eax
 804a547: 89 44 24 04                  	movl	%eax, 4(%esp)
 804a54b: c7 04 24 44 e3 04 08         	movl	$134538052, (%esp)
 804a552: e8 59 e7 ff ff               	calll	0x8048cb0 <.plt+0x200>
 804a557: c7 05 80 d3 04 08 00 00 00 00	movl	$0, 134534016
 804a561: c7 05 50 e3 04 08 00 00 00 00	movl	$0, 134538064
 804a56b: c7 44 24 04 1d a4 04 08      	movl	$134521885, 4(%esp)
 804a573: c7 04 24 0e 00 00 00         	movl	$14, (%esp)
 804a57a: e8 91 e5 ff ff               	calll	0x8048b10 <.plt+0x60>
 804a57f: c9                           	leave
 804a580: c3                           	retl

0804a581 <t_schedule>:
 804a581: 55                           	pushl	%ebp
 804a582: 89 e5                        	movl	%esp, %ebp
 804a584: 53                           	pushl	%ebx
 804a585: 83 ec 44                     	subl	$68, %esp
 804a588: 83 3d 50 e3 04 08 00         	cmpl	$0, 134538064
 804a58f: 74 30                        	je	0x804a5c1 <t_schedule+0x40>
 804a591: 8d 45 d8                     	leal	-40(%ebp), %eax
 804a594: 89 44 24 08                  	movl	%eax, 8(%esp)
 804a598: c7 44 24 04 28 f4 04 08      	movl	$134542376, 4(%esp)
 804a5a0: c7 04 24 00 00 00 00         	movl	$0, (%esp)
 804a5a7: e8 14 e6 ff ff               	calll	0x8048bc0 <.plt+0x110>
 804a5ac: a1 50 e3 04 08               	movl	134538064, %eax
 804a5b1: 8b 58 0c                     	movl	12(%eax), %ebx
 804a5b4: 8d 45 d8                     	leal	-40(%ebp), %eax
 804a5b7: 89 04 24                     	movl	%eax, (%esp)
 804a5ba: e8 d8 fd ff ff               	calll	0x804a397 <get_interval>
 804a5bf: 89 03                        	movl	%eax, (%ebx)
 804a5c1: c7 04 24 10 00 00 00         	movl	$16, (%esp)
 804a5c8: e8 d3 e5 ff ff               	calll	0x8048ba0 <.plt+0xf0>
 804a5cd: 89 45 f4                     	movl	%eax, -12(%ebp)
 804a5d0: 8b 55 f4                     	movl	-12(%ebp), %edx
 804a5d3: 8b 45 0c                     	movl	12(%ebp), %eax
 804a5d6: 89 42 04                     	movl	%eax, 4(%edx)
 804a5d9: 8b 55 f4                     	movl	-12(%ebp), %edx
 804a5dc: 8b 45 10                     	movl	16(%ebp), %eax
 804a5df: 89 42 08                     	movl	%eax, 8(%edx)
 804a5e2: 83 3d 50 e3 04 08 00         	cmpl	$0, 134538064
 804a5e9: 75 16                        	jne	0x804a601 <t_schedule+0x80>
 804a5eb: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a5ee: 8b 55 f4                     	movl	-12(%ebp), %edx
 804a5f1: 89 50 0c                     	movl	%edx, 12(%eax)
 804a5f4: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a5f7: a3 50 e3 04 08               	movl	%eax, 134538064
 804a5fc: e9 a6 00 00 00               	jmp	0x804a6a7 <t_schedule+0x126>
 804a601: 83 3d 48 d3 04 08 00         	cmpl	$0, 134533960
 804a608: 74 24                        	je	0x804a62e <t_schedule+0xad>
 804a60a: 8b 55 f4                     	movl	-12(%ebp), %edx
 804a60d: a1 50 e3 04 08               	movl	134538064, %eax
 804a612: 8b 40 0c                     	movl	12(%eax), %eax
 804a615: 89 42 0c                     	movl	%eax, 12(%edx)
 804a618: 8b 15 50 e3 04 08            	movl	134538064, %edx
 804a61e: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a621: 89 42 0c                     	movl	%eax, 12(%edx)
 804a624: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a627: a3 50 e3 04 08               	movl	%eax, 134538064
 804a62c: eb 79                        	jmp	0x804a6a7 <t_schedule+0x126>
 804a62e: a1 50 e3 04 08               	movl	134538064, %eax
 804a633: 89 45 d4                     	movl	%eax, -44(%ebp)
 804a636: 8b 45 d4                     	movl	-44(%ebp), %eax
 804a639: 8b 40 0c                     	movl	12(%eax), %eax
 804a63c: 8b 00                        	movl	(%eax), %eax
 804a63e: 3b 45 08                     	cmpl	8(%ebp), %eax
 804a641: 7e 2c                        	jle	0x804a66f <t_schedule+0xee>
 804a643: 8b 45 d4                     	movl	-44(%ebp), %eax
 804a646: 8b 48 0c                     	movl	12(%eax), %ecx
 804a649: 8b 45 d4                     	movl	-44(%ebp), %eax
 804a64c: 8b 40 0c                     	movl	12(%eax), %eax
 804a64f: 8b 55 08                     	movl	8(%ebp), %edx
 804a652: 8b 00                        	movl	(%eax), %eax
 804a654: 29 d0                        	subl	%edx, %eax
 804a656: 89 01                        	movl	%eax, (%ecx)
 804a658: 8b 55 f4                     	movl	-12(%ebp), %edx
 804a65b: 8b 45 d4                     	movl	-44(%ebp), %eax
 804a65e: 8b 40 0c                     	movl	12(%eax), %eax
 804a661: 89 42 0c                     	movl	%eax, 12(%edx)
 804a664: 8b 55 d4                     	movl	-44(%ebp), %edx
 804a667: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a66a: 89 42 0c                     	movl	%eax, 12(%edx)
 804a66d: eb 38                        	jmp	0x804a6a7 <t_schedule+0x126>
 804a66f: 8b 45 d4                     	movl	-44(%ebp), %eax
 804a672: 8b 40 0c                     	movl	12(%eax), %eax
 804a675: 8b 00                        	movl	(%eax), %eax
 804a677: 29 45 08                     	subl	%eax, 8(%ebp)
 804a67a: 8b 45 d4                     	movl	-44(%ebp), %eax
 804a67d: 3b 05 50 e3 04 08            	cmpl	134538064, %eax
 804a683: 75 b1                        	jne	0x804a636 <t_schedule+0xb5>
 804a685: 8b 55 f4                     	movl	-12(%ebp), %edx
 804a688: a1 50 e3 04 08               	movl	134538064, %eax
 804a68d: 8b 40 0c                     	movl	12(%eax), %eax
 804a690: 89 42 0c                     	movl	%eax, 12(%edx)
 804a693: 8b 15 50 e3 04 08            	movl	134538064, %edx
 804a699: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a69c: 89 42 0c                     	movl	%eax, 12(%edx)
 804a69f: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a6a2: a3 50 e3 04 08               	movl	%eax, 134538064
 804a6a7: 8b 55 f4                     	movl	-12(%ebp), %edx
 804a6aa: 8b 45 08                     	movl	8(%ebp), %eax
 804a6ad: 89 02                        	movl	%eax, (%edx)
 804a6af: ff 05 5c e3 04 08            	incl	134538076
 804a6b5: c7 04 24 00 00 00 00         	movl	$0, (%esp)
 804a6bc: e8 5c fd ff ff               	calll	0x804a41d <ding>
 804a6c1: 83 c4 44                     	addl	$68, %esp
 804a6c4: 5b                           	popl	%ebx
 804a6c5: 5d                           	popl	%ebp
 804a6c6: c3                           	retl

0804a6c7 <t_printq>:
 804a6c7: 55                           	pushl	%ebp
 804a6c8: 89 e5                        	movl	%esp, %ebp
 804a6ca: 83 ec 18                     	subl	$24, %esp
 804a6cd: a1 50 e3 04 08               	movl	134538064, %eax
 804a6d2: 89 45 fc                     	movl	%eax, -4(%ebp)
 804a6d5: e8 ed fc ff ff               	calll	0x804a3c7 <current_time>
 804a6da: 89 c2                        	movl	%eax, %edx
 804a6dc: a1 80 d3 04 08               	movl	134534016, %eax
 804a6e1: 89 44 24 08                  	movl	%eax, 8(%esp)
 804a6e5: 89 54 24 04                  	movl	%edx, 4(%esp)
 804a6e9: c7 04 24 10 c5 04 08         	movl	$134530320, (%esp)
 804a6f0: e8 7b e5 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804a6f5: 83 7d fc 00                  	cmpl	$0, -4(%ebp)
 804a6f9: 75 0e                        	jne	0x804a709 <t_printq+0x42>
 804a6fb: c7 04 24 33 c5 04 08         	movl	$134530355, (%esp)
 804a702: e8 69 e5 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804a707: eb 47                        	jmp	0x804a750 <t_printq+0x89>
 804a709: 8b 45 fc                     	movl	-4(%ebp), %eax
 804a70c: 8b 40 0c                     	movl	12(%eax), %eax
 804a70f: 89 45 fc                     	movl	%eax, -4(%ebp)
 804a712: 8b 45 fc                     	movl	-4(%ebp), %eax
 804a715: 8b 40 08                     	movl	8(%eax), %eax
 804a718: 89 45 f8                     	movl	%eax, -8(%ebp)
 804a71b: 8b 45 f8                     	movl	-8(%ebp), %eax
 804a71e: 8b 00                        	movl	(%eax), %eax
 804a720: 89 44 24 0c                  	movl	%eax, 12(%esp)
 804a724: 8b 45 f8                     	movl	-8(%ebp), %eax
 804a727: 8b 40 08                     	movl	8(%eax), %eax
 804a72a: 89 44 24 08                  	movl	%eax, 8(%esp)
 804a72e: 8b 45 fc                     	movl	-4(%ebp), %eax
 804a731: 8b 00                        	movl	(%eax), %eax
 804a733: 89 44 24 04                  	movl	%eax, 4(%esp)
 804a737: c7 04 24 3c c5 04 08         	movl	$134530364, (%esp)
 804a73e: e8 2d e5 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804a743: 8b 45 fc                     	movl	-4(%ebp), %eax
 804a746: 3b 05 50 e3 04 08            	cmpl	134538064, %eax
 804a74c: 74 02                        	je	0x804a750 <t_printq+0x89>
 804a74e: eb b9                        	jmp	0x804a709 <t_printq+0x42>
 804a750: c9                           	leave
 804a751: c3                           	retl

0804a752 <lookup>:
 804a752: 55                           	pushl	%ebp
 804a753: 89 e5                        	movl	%esp, %ebp
 804a755: 83 ec 28                     	subl	$40, %esp
 804a758: 8b 45 0c                     	movl	12(%ebp), %eax
 804a75b: 89 45 fc                     	movl	%eax, -4(%ebp)
 804a75e: 8b 45 10                     	movl	16(%ebp), %eax
 804a761: 83 e8 0c                     	subl	$12, %eax
 804a764: 89 45 f8                     	movl	%eax, -8(%ebp)
 804a767: c7 45 f4 00 00 00 00         	movl	$0, -12(%ebp)
 804a76e: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a771: 03 45 08                     	addl	8(%ebp), %eax
 804a774: 0f be 00                     	movsbl	(%eax), %eax
 804a777: 89 45 f0                     	movl	%eax, -16(%ebp)
 804a77a: 8b 45 f0                     	movl	-16(%ebp), %eax
 804a77d: 85 c0                        	testl	%eax, %eax
 804a77f: 74 76                        	je	0x804a7f7 <lookup+0xa5>
 804a781: e8 ea e5 ff ff               	calll	0x8048d70 <.plt+0x2c0>
 804a786: 89 c1                        	movl	%eax, %ecx
 804a788: 8b 45 f0                     	movl	-16(%ebp), %eax
 804a78b: 8d 14 00                     	leal	(%eax,%eax), %edx
 804a78e: 8b 01                        	movl	(%ecx), %eax
 804a790: 0f b7 04 02                  	movzwl	(%edx,%eax), %eax
 804a794: c1 e8 08                     	shrl	$8, %eax
 804a797: 83 e0 01                     	andl	$1, %eax
 804a79a: 85 c0                        	testl	%eax, %eax
 804a79c: 74 0e                        	je	0x804a7ac <lookup+0x5a>
 804a79e: 8b 45 f0                     	movl	-16(%ebp), %eax
 804a7a1: 89 04 24                     	movl	%eax, (%esp)
 804a7a4: e8 c7 e3 ff ff               	calll	0x8048b70 <.plt+0xc0>
 804a7a9: 89 45 f0                     	movl	%eax, -16(%ebp)
 804a7ac: 8b 55 fc                     	movl	-4(%ebp), %edx
 804a7af: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a7b2: 03 02                        	addl	(%edx), %eax
 804a7b4: 0f be 00                     	movsbl	(%eax), %eax
 804a7b7: 3b 45 f0                     	cmpl	-16(%ebp), %eax
 804a7ba: 7d 08                        	jge	0x804a7c4 <lookup+0x72>
 804a7bc: 8d 45 fc                     	leal	-4(%ebp), %eax
 804a7bf: 83 00 0c                     	addl	$12, (%eax)
 804a7c2: eb e8                        	jmp	0x804a7ac <lookup+0x5a>
 804a7c4: 8b 55 f8                     	movl	-8(%ebp), %edx
 804a7c7: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a7ca: 03 02                        	addl	(%edx), %eax
 804a7cc: 0f be 00                     	movsbl	(%eax), %eax
 804a7cf: 3b 45 f0                     	cmpl	-16(%ebp), %eax
 804a7d2: 7e 08                        	jle	0x804a7dc <lookup+0x8a>
 804a7d4: 8d 45 f8                     	leal	-8(%ebp), %eax
 804a7d7: 83 28 0c                     	subl	$12, (%eax)
 804a7da: eb e8                        	jmp	0x804a7c4 <lookup+0x72>
 804a7dc: 8b 45 f8                     	movl	-8(%ebp), %eax
 804a7df: 3b 45 fc                     	cmpl	-4(%ebp), %eax
 804a7e2: 73 09                        	jae	0x804a7ed <lookup+0x9b>
 804a7e4: c7 45 e8 00 00 00 00         	movl	$0, -24(%ebp)
 804a7eb: eb 75                        	jmp	0x804a862 <lookup+0x110>
 804a7ed: 8d 45 f4                     	leal	-12(%ebp), %eax
 804a7f0: ff 00                        	incl	(%eax)
 804a7f2: e9 77 ff ff ff               	jmp	0x804a76e <lookup+0x1c>
 804a7f7: 8b 45 fc                     	movl	-4(%ebp), %eax
 804a7fa: 3b 45 f8                     	cmpl	-8(%ebp), %eax
 804a7fd: 73 5d                        	jae	0x804a85c <lookup+0x10a>
 804a7ff: c6 45 ef 28                  	movb	$40, -17(%ebp)
 804a803: 8b 45 08                     	movl	8(%ebp), %eax
 804a806: 89 44 24 04                  	movl	%eax, 4(%esp)
 804a80a: c7 04 24 24 c6 04 08         	movl	$134530596, (%esp)
 804a811: e8 5a e4 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804a816: 8b 45 fc                     	movl	-4(%ebp), %eax
 804a819: 3b 45 f8                     	cmpl	-8(%ebp), %eax
 804a81c: 77 29                        	ja	0x804a847 <lookup+0xf5>
 804a81e: 8b 45 fc                     	movl	-4(%ebp), %eax
 804a821: 8b 00                        	movl	(%eax), %eax
 804a823: 89 44 24 08                  	movl	%eax, 8(%esp)
 804a827: 0f be 45 ef                  	movsbl	-17(%ebp), %eax
 804a82b: 89 44 24 04                  	movl	%eax, 4(%esp)
 804a82f: c7 04 24 37 c6 04 08         	movl	$134530615, (%esp)
 804a836: e8 35 e4 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804a83b: c6 45 ef 2c                  	movb	$44, -17(%ebp)
 804a83f: 8d 45 fc                     	leal	-4(%ebp), %eax
 804a842: 83 00 0c                     	addl	$12, (%eax)
 804a845: eb cf                        	jmp	0x804a816 <lookup+0xc4>
 804a847: c7 04 24 3c c6 04 08         	movl	$134530620, (%esp)
 804a84e: e8 1d e4 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804a853: c7 45 e8 00 00 00 00         	movl	$0, -24(%ebp)
 804a85a: eb 06                        	jmp	0x804a862 <lookup+0x110>
 804a85c: 8b 45 fc                     	movl	-4(%ebp), %eax
 804a85f: 89 45 e8                     	movl	%eax, -24(%ebp)
 804a862: 8b 45 e8                     	movl	-24(%ebp), %eax
 804a865: c9                           	leave
 804a866: c3                           	retl

0804a867 <DoCommand>:
 804a867: 55                           	pushl	%ebp
 804a868: 89 e5                        	movl	%esp, %ebp
 804a86a: 81 ec 98 00 00 00            	subl	$152, %esp
 804a870: 8d 45 b8                     	leal	-72(%ebp), %eax
 804a873: 89 44 24 04                  	movl	%eax, 4(%esp)
 804a877: 8b 45 08                     	movl	8(%ebp), %eax
 804a87a: 89 04 24                     	movl	%eax, (%esp)
 804a87d: e8 26 05 00 00               	calll	0x804ada8 <splitargs>
 804a882: 89 45 b4                     	movl	%eax, -76(%ebp)
 804a885: 83 7d b4 00                  	cmpl	$0, -76(%ebp)
 804a889: 75 05                        	jne	0x804a890 <DoCommand+0x29>
 804a88b: e9 a6 04 00 00               	jmp	0x804ad36 <DoCommand+0x4cf>
 804a890: c7 44 24 08 18 d1 04 08      	movl	$134533400, 8(%esp)
 804a898: c7 44 24 04 40 d0 04 08      	movl	$134533184, 4(%esp)
 804a8a0: 8b 45 b8                     	movl	-72(%ebp), %eax
 804a8a3: 89 04 24                     	movl	%eax, (%esp)
 804a8a6: e8 a7 fe ff ff               	calll	0x804a752 <lookup>
 804a8ab: 89 45 f4                     	movl	%eax, -12(%ebp)
 804a8ae: 83 7d f4 00                  	cmpl	$0, -12(%ebp)
 804a8b2: 75 05                        	jne	0x804a8b9 <DoCommand+0x52>
 804a8b4: e9 65 04 00 00               	jmp	0x804ad1e <DoCommand+0x4b7>
 804a8b9: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a8bc: 83 78 08 00                  	cmpl	$0, 8(%eax)
 804a8c0: 78 50                        	js	0x804a912 <DoCommand+0xab>
 804a8c2: 8b 55 b4                     	movl	-76(%ebp), %edx
 804a8c5: 4a                           	decl	%edx
 804a8c6: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a8c9: 3b 50 08                     	cmpl	8(%eax), %edx
 804a8cc: 74 44                        	je	0x804a912 <DoCommand+0xab>
 804a8ce: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a8d1: 83 78 08 01                  	cmpl	$1, 8(%eax)
 804a8d5: 75 09                        	jne	0x804a8e0 <DoCommand+0x79>
 804a8d7: c7 45 a0 3f c6 04 08         	movl	$134530623, -96(%ebp)
 804a8de: eb 07                        	jmp	0x804a8e7 <DoCommand+0x80>
 804a8e0: c7 45 a0 40 c6 04 08         	movl	$134530624, -96(%ebp)
 804a8e7: 8b 45 a0                     	movl	-96(%ebp), %eax
 804a8ea: 89 44 24 0c                  	movl	%eax, 12(%esp)
 804a8ee: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a8f1: 8b 40 08                     	movl	8(%eax), %eax
 804a8f4: 89 44 24 08                  	movl	%eax, 8(%esp)
 804a8f8: 8b 45 f4                     	movl	-12(%ebp), %eax
 804a8fb: 8b 00                        	movl	(%eax), %eax
 804a8fd: 89 44 24 04                  	movl	%eax, 4(%esp)
 804a901: c7 04 24 42 c6 04 08         	movl	$134530626, (%esp)
 804a908: e8 63 e3 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804a90d: e9 24 04 00 00               	jmp	0x804ad36 <DoCommand+0x4cf>
 804a912: 8b 55 f4                     	movl	-12(%ebp), %edx
 804a915: 89 55 84                     	movl	%edx, -124(%ebp)
 804a918: 8b 45 84                     	movl	-124(%ebp), %eax
 804a91b: 83 78 04 13                  	cmpl	$19, 4(%eax)
 804a91f: 0f 87 f9 03 00 00            	ja	0x804ad1e <DoCommand+0x4b7>
 804a925: 8b 55 84                     	movl	-124(%ebp), %edx
 804a928: 8b 42 04                     	movl	4(%edx), %eax
 804a92b: c1 e0 02                     	shll	$2, %eax
 804a92e: 8b 80 44 c8 04 08            	movl	134531140(%eax), %eax
 804a934: ff e0                        	jmpl	*%eax
 804a936: c7 04 24 5c c6 04 08         	movl	$134530652, (%esp)
 804a93d: e8 2e e3 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804a942: e8 a1 0c 00 00               	calll	0x804b5e8 <show_params>
 804a947: e9 ea 03 00 00               	jmp	0x804ad36 <DoCommand+0x4cf>
 804a94c: e8 41 08 00 00               	calll	0x804b192 <print_stats>
 804a951: e9 e0 03 00 00               	jmp	0x804ad36 <DoCommand+0x4cf>
 804a956: e8 d0 0b 00 00               	calll	0x804b52b <print_dist>
 804a95b: e9 d6 03 00 00               	jmp	0x804ad36 <DoCommand+0x4cf>
 804a960: e8 62 fd ff ff               	calll	0x804a6c7 <t_printq>
 804a965: e9 cc 03 00 00               	jmp	0x804ad36 <DoCommand+0x4cf>
 804a96a: c7 44 24 08 38 00 00 00      	movl	$56, 8(%esp)
 804a972: c7 44 24 04 00 00 00 00      	movl	$0, 4(%esp)
 804a97a: c7 04 24 40 f4 04 08         	movl	$134542400, (%esp)
 804a981: e8 9a e3 ff ff               	calll	0x8048d20 <.plt+0x270>
 804a986: c7 44 24 08 a4 0f 00 00      	movl	$4004, 8(%esp)
 804a98e: c7 44 24 04 00 00 00 00      	movl	$0, 4(%esp)
 804a996: c7 04 24 a0 d3 04 08         	movl	$134534048, (%esp)
 804a99d: e8 7e e3 ff ff               	calll	0x8048d20 <.plt+0x270>
 804a9a2: c7 05 74 f4 04 08 a0 d3 04 08	movl	$134534048, 134542452
 804a9ac: e8 16 fa ff ff               	calll	0x804a3c7 <current_time>
 804a9b1: a3 80 d3 04 08               	movl	%eax, 134534016
 804a9b6: a1 80 d3 04 08               	movl	134534016, %eax
 804a9bb: a3 68 f4 04 08               	movl	%eax, 134542440
 804a9c0: a3 64 f4 04 08               	movl	%eax, 134542436
 804a9c5: c7 04 24 77 c6 04 08         	movl	$134530679, (%esp)
 804a9cc: e8 9f e2 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804a9d1: e9 60 03 00 00               	jmp	0x804ad36 <DoCommand+0x4cf>
 804a9d6: e8 b7 07 00 00               	calll	0x804b192 <print_stats>
 804a9db: c7 04 24 00 00 00 00         	movl	$0, (%esp)
 804a9e2: e8 f9 e2 ff ff               	calll	0x8048ce0 <.plt+0x230>
 804a9e7: 83 7d b4 01                  	cmpl	$1, -76(%ebp)
 804a9eb: 7f 11                        	jg	0x804a9fe <DoCommand+0x197>
 804a9ed: c7 04 24 93 c6 04 08         	movl	$134530707, (%esp)
 804a9f4: e8 77 e2 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804a9f9: e9 38 03 00 00               	jmp	0x804ad36 <DoCommand+0x4cf>
 804a9fe: e8 6d e3 ff ff               	calll	0x8048d70 <.plt+0x2c0>
 804aa03: 89 c1                        	movl	%eax, %ecx
 804aa05: 8b 45 bc                     	movl	-68(%ebp), %eax
 804aa08: 0f be 00                     	movsbl	(%eax), %eax
 804aa0b: 8d 14 00                     	leal	(%eax,%eax), %edx
 804aa0e: 8b 01                        	movl	(%ecx), %eax
 804aa10: 0f b7 04 02                  	movzwl	(%edx,%eax), %eax
 804aa14: c1 e8 0b                     	shrl	$11, %eax
 804aa17: 83 e0 01                     	andl	$1, %eax
 804aa1a: 85 c0                        	testl	%eax, %eax
 804aa1c: 74 1a                        	je	0x804aa38 <DoCommand+0x1d1>
 804aa1e: 8b 45 bc                     	movl	-68(%ebp), %eax
 804aa21: 89 04 24                     	movl	%eax, (%esp)
 804aa24: e8 c7 e2 ff ff               	calll	0x8048cf0 <.plt+0x240>
 804aa29: 89 45 a4                     	movl	%eax, -92(%ebp)
 804aa2c: c7 45 a8 02 00 00 00         	movl	$2, -88(%ebp)
 804aa33: e9 0c 01 00 00               	jmp	0x804ab44 <DoCommand+0x2dd>
 804aa38: c7 44 24 08 5c d1 04 08      	movl	$134533468, 8(%esp)
 804aa40: c7 44 24 04 20 d1 04 08      	movl	$134533408, 4(%esp)
 804aa48: 8b 45 bc                     	movl	-68(%ebp), %eax
 804aa4b: 89 04 24                     	movl	%eax, (%esp)
 804aa4e: e8 ff fc ff ff               	calll	0x804a752 <lookup>
 804aa53: 89 45 ac                     	movl	%eax, -84(%ebp)
 804aa56: 83 7d ac 00                  	cmpl	$0, -84(%ebp)
 804aa5a: 75 05                        	jne	0x804aa61 <DoCommand+0x1fa>
 804aa5c: e9 ba 00 00 00               	jmp	0x804ab1b <DoCommand+0x2b4>
 804aa61: 83 7d b4 03                  	cmpl	$3, -76(%ebp)
 804aa65: 74 18                        	je	0x804aa7f <DoCommand+0x218>
 804aa67: 8b 45 bc                     	movl	-68(%ebp), %eax
 804aa6a: 89 44 24 04                  	movl	%eax, 4(%esp)
 804aa6e: c7 04 24 b4 c6 04 08         	movl	$134530740, (%esp)
 804aa75: e8 f6 e1 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804aa7a: e9 b7 02 00 00               	jmp	0x804ad36 <DoCommand+0x4cf>
 804aa7f: 8b 45 ac                     	movl	-84(%ebp), %eax
 804aa82: 8b 40 04                     	movl	4(%eax), %eax
 804aa85: 89 45 9c                     	movl	%eax, -100(%ebp)
 804aa88: 83 7d 9c 07                  	cmpl	$7, -100(%ebp)
 804aa8c: 74 76                        	je	0x804ab04 <DoCommand+0x29d>
 804aa8e: 83 7d 9c 07                  	cmpl	$7, -100(%ebp)
 804aa92: 77 08                        	ja	0x804aa9c <DoCommand+0x235>
 804aa94: 83 7d 9c 06                  	cmpl	$6, -100(%ebp)
 804aa98: 74 0a                        	je	0x804aaa4 <DoCommand+0x23d>
 804aa9a: eb 7f                        	jmp	0x804ab1b <DoCommand+0x2b4>
 804aa9c: 83 7d 9c 09                  	cmpl	$9, -100(%ebp)
 804aaa0: 74 4b                        	je	0x804aaed <DoCommand+0x286>
 804aaa2: eb 77                        	jmp	0x804ab1b <DoCommand+0x2b4>
 804aaa4: 8b 45 c0                     	movl	-64(%ebp), %eax
 804aaa7: 89 04 24                     	movl	%eax, (%esp)
 804aaaa: e8 04 0e 00 00               	calll	0x804b8b3 <ReadDistrib>
 804aaaf: 85 c0                        	testl	%eax, %eax
 804aab1: 0f 84 7f 02 00 00            	je	0x804ad36 <DoCommand+0x4cf>
 804aab7: 8b 45 bc                     	movl	-68(%ebp), %eax
 804aaba: 89 44 24 04                  	movl	%eax, 4(%esp)
 804aabe: c7 04 24 80 f4 04 08         	movl	$134542464, (%esp)
 804aac5: e8 c6 e2 ff ff               	calll	0x8048d90 <.plt+0x2e0>
 804aaca: c7 44 24 04 80 f4 04 08      	movl	$134542464, 4(%esp)
 804aad2: c7 04 24 d6 c6 04 08         	movl	$134530774, (%esp)
 804aad9: e8 92 e1 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804aade: c7 05 28 d0 04 08 00 00 00 00	movl	$0, 134533160
 804aae8: e9 49 02 00 00               	jmp	0x804ad36 <DoCommand+0x4cf>
 804aaed: c7 45 a8 01 00 00 00         	movl	$1, -88(%ebp)
 804aaf4: 8b 45 c0                     	movl	-64(%ebp), %eax
 804aaf7: 89 04 24                     	movl	%eax, (%esp)
 804aafa: e8 f1 e1 ff ff               	calll	0x8048cf0 <.plt+0x240>
 804aaff: 89 45 a4                     	movl	%eax, -92(%ebp)
 804ab02: eb 40                        	jmp	0x804ab44 <DoCommand+0x2dd>
 804ab04: c7 45 a8 02 00 00 00         	movl	$2, -88(%ebp)
 804ab0b: 8b 45 c0                     	movl	-64(%ebp), %eax
 804ab0e: 89 04 24                     	movl	%eax, (%esp)
 804ab11: e8 da e1 ff ff               	calll	0x8048cf0 <.plt+0x240>
 804ab16: 89 45 a4                     	movl	%eax, -92(%ebp)
 804ab19: eb 29                        	jmp	0x804ab44 <DoCommand+0x2dd>
 804ab1b: c7 44 24 0c f1 c6 04 08      	movl	$134530801, 12(%esp)
 804ab23: c7 44 24 08 00 c7 04 08      	movl	$134530816, 8(%esp)
 804ab2b: c7 44 24 04 22 c7 04 08      	movl	$134530850, 4(%esp)
 804ab33: c7 04 24 3a c7 04 08         	movl	$134530874, (%esp)
 804ab3a: e8 31 e1 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804ab3f: e9 f2 01 00 00               	jmp	0x804ad36 <DoCommand+0x4cf>
 804ab44: 8b 45 a8                     	movl	-88(%ebp), %eax
 804ab47: 89 44 24 04                  	movl	%eax, 4(%esp)
 804ab4b: 8b 45 a4                     	movl	-92(%ebp), %eax
 804ab4e: 89 04 24                     	movl	%eax, (%esp)
 804ab51: e8 63 0f 00 00               	calll	0x804bab9 <BuildDistrib>
 804ab56: 85 c0                        	testl	%eax, %eax
 804ab58: 75 05                        	jne	0x804ab5f <DoCommand+0x2f8>
 804ab5a: e9 d7 01 00 00               	jmp	0x804ad36 <DoCommand+0x4cf>
 804ab5f: 83 3d 48 d3 04 08 00         	cmpl	$0, 134533960
 804ab66: 74 09                        	je	0x804ab71 <DoCommand+0x30a>
 804ab68: c7 45 98 42 c7 04 08         	movl	$134530882, -104(%ebp)
 804ab6f: eb 07                        	jmp	0x804ab78 <DoCommand+0x311>
 804ab71: c7 45 98 4b c7 04 08         	movl	$134530891, -104(%ebp)
 804ab78: 8b 45 98                     	movl	-104(%ebp), %eax
 804ab7b: 89 44 24 0c                  	movl	%eax, 12(%esp)
 804ab7f: 83 7d a8 02                  	cmpl	$2, -88(%ebp)
 804ab83: 75 09                        	jne	0x804ab8e <DoCommand+0x327>
 804ab85: c7 45 94 1e c6 04 08         	movl	$134530590, -108(%ebp)
 804ab8c: eb 07                        	jmp	0x804ab95 <DoCommand+0x32e>
 804ab8e: c7 45 94 0d c6 04 08         	movl	$134530573, -108(%ebp)
 804ab95: 8b 55 94                     	movl	-108(%ebp), %edx
 804ab98: 89 54 24 08                  	movl	%edx, 8(%esp)
 804ab9c: a1 2c d0 04 08               	movl	134533164, %eax
 804aba1: 89 44 24 04                  	movl	%eax, 4(%esp)
 804aba5: c7 04 24 54 c7 04 08         	movl	$134530900, (%esp)
 804abac: e8 bf e0 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804abb1: e9 80 01 00 00               	jmp	0x804ad36 <DoCommand+0x4cf>
 804abb6: 8b 45 bc                     	movl	-68(%ebp), %eax
 804abb9: 89 04 24                     	movl	%eax, (%esp)
 804abbc: e8 2f e1 ff ff               	calll	0x8048cf0 <.plt+0x240>
 804abc1: 89 45 b0                     	movl	%eax, -80(%ebp)
 804abc4: 83 7d b0 00                  	cmpl	$0, -80(%ebp)
 804abc8: 78 08                        	js	0x804abd2 <DoCommand+0x36b>
 804abca: 83 7d b0 64                  	cmpl	$100, -80(%ebp)
 804abce: 7f 02                        	jg	0x804abd2 <DoCommand+0x36b>
 804abd0: eb 2d                        	jmp	0x804abff <DoCommand+0x398>
 804abd2: 8b 45 f4                     	movl	-12(%ebp), %eax
 804abd5: 8b 00                        	movl	(%eax), %eax
 804abd7: 89 44 24 04                  	movl	%eax, 4(%esp)
 804abdb: c7 04 24 70 c7 04 08         	movl	$134530928, (%esp)
 804abe2: e8 89 e0 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804abe7: 8b 45 b0                     	movl	-80(%ebp), %eax
 804abea: 89 44 24 04                  	movl	%eax, 4(%esp)
 804abee: c7 04 24 a8 c7 04 08         	movl	$134530984, (%esp)
 804abf5: e8 76 e0 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804abfa: e9 37 01 00 00               	jmp	0x804ad36 <DoCommand+0x4cf>
 804abff: 8b 45 f4                     	movl	-12(%ebp), %eax
 804ac02: 8b 40 04                     	movl	4(%eax), %eax
 804ac05: 89 45 90                     	movl	%eax, -112(%ebp)
 804ac08: 83 7d 90 05                  	cmpl	$5, -112(%ebp)
 804ac0c: 74 20                        	je	0x804ac2e <DoCommand+0x3c7>
 804ac0e: 83 7d 90 05                  	cmpl	$5, -112(%ebp)
 804ac12: 77 08                        	ja	0x804ac1c <DoCommand+0x3b5>
 804ac14: 83 7d 90 04                  	cmpl	$4, -112(%ebp)
 804ac18: 74 0a                        	je	0x804ac24 <DoCommand+0x3bd>
 804ac1a: eb 26                        	jmp	0x804ac42 <DoCommand+0x3db>
 804ac1c: 83 7d 90 08                  	cmpl	$8, -112(%ebp)
 804ac20: 74 16                        	je	0x804ac38 <DoCommand+0x3d1>
 804ac22: eb 1e                        	jmp	0x804ac42 <DoCommand+0x3db>
 804ac24: 8b 45 b0                     	movl	-80(%ebp), %eax
 804ac27: a3 24 d0 04 08               	movl	%eax, 134533156
 804ac2c: eb 19                        	jmp	0x804ac47 <DoCommand+0x3e0>
 804ac2e: 8b 45 b0                     	movl	-80(%ebp), %eax
 804ac31: a3 40 d3 04 08               	movl	%eax, 134533952
 804ac36: eb 0f                        	jmp	0x804ac47 <DoCommand+0x3e0>
 804ac38: 8b 45 b0                     	movl	-80(%ebp), %eax
 804ac3b: a3 3c d3 04 08               	movl	%eax, 134533948
 804ac40: eb 05                        	jmp	0x804ac47 <DoCommand+0x3e0>
 804ac42: e8 99 df ff ff               	calll	0x8048be0 <.plt+0x130>
 804ac47: 8b 45 b0                     	movl	-80(%ebp), %eax
 804ac4a: 89 44 24 08                  	movl	%eax, 8(%esp)
 804ac4e: 8b 45 f4                     	movl	-12(%ebp), %eax
 804ac51: 8b 00                        	movl	(%eax), %eax
 804ac53: 89 44 24 04                  	movl	%eax, 4(%esp)
 804ac57: c7 04 24 de c7 04 08         	movl	$134531038, (%esp)
 804ac5e: e8 0d e0 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804ac63: e9 ce 00 00 00               	jmp	0x804ad36 <DoCommand+0x4cf>
 804ac68: 8b 45 bc                     	movl	-68(%ebp), %eax
 804ac6b: 89 04 24                     	movl	%eax, (%esp)
 804ac6e: e8 7d e0 ff ff               	calll	0x8048cf0 <.plt+0x240>
 804ac73: a3 38 d3 04 08               	movl	%eax, 134533944
 804ac78: e9 b9 00 00 00               	jmp	0x804ad36 <DoCommand+0x4cf>
 804ac7d: 8b 45 bc                     	movl	-68(%ebp), %eax
 804ac80: 89 04 24                     	movl	%eax, (%esp)
 804ac83: e8 68 e0 ff ff               	calll	0x8048cf0 <.plt+0x240>
 804ac88: a3 30 d0 04 08               	movl	%eax, 134533168
 804ac8d: e9 a4 00 00 00               	jmp	0x804ad36 <DoCommand+0x4cf>
 804ac92: 8b 45 bc                     	movl	-68(%ebp), %eax
 804ac95: 89 04 24                     	movl	%eax, (%esp)
 804ac98: e8 9b 00 00 00               	calll	0x804ad38 <read_file>
 804ac9d: e9 94 00 00 00               	jmp	0x804ad36 <DoCommand+0x4cf>
 804aca2: b8 01 00 00 00               	movl	$1, %eax
 804aca7: 2b 05 20 f4 04 08            	subl	134542368, %eax
 804acad: a3 20 f4 04 08               	movl	%eax, 134542368
 804acb2: 83 3d 20 f4 04 08 00         	cmpl	$0, 134542368
 804acb9: 74 09                        	je	0x804acc4 <DoCommand+0x45d>
 804acbb: c7 45 8c ee c7 04 08         	movl	$134531054, -116(%ebp)
 804acc2: eb 07                        	jmp	0x804accb <DoCommand+0x464>
 804acc4: c7 45 8c f1 c7 04 08         	movl	$134531057, -116(%ebp)
 804accb: 8b 45 8c                     	movl	-116(%ebp), %eax
 804acce: 89 44 24 04                  	movl	%eax, 4(%esp)
 804acd2: c7 04 24 f5 c7 04 08         	movl	$134531061, (%esp)
 804acd9: e8 92 df ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804acde: eb 56                        	jmp	0x804ad36 <DoCommand+0x4cf>
 804ace0: b8 01 00 00 00               	movl	$1, %eax
 804ace5: 2b 05 48 d3 04 08            	subl	134533960, %eax
 804aceb: a3 48 d3 04 08               	movl	%eax, 134533960
 804acf0: 83 3d 48 d3 04 08 00         	cmpl	$0, 134533960
 804acf7: 74 09                        	je	0x804ad02 <DoCommand+0x49b>
 804acf9: c7 45 88 f1 c7 04 08         	movl	$134531057, -120(%ebp)
 804ad00: eb 07                        	jmp	0x804ad09 <DoCommand+0x4a2>
 804ad02: c7 45 88 ee c7 04 08         	movl	$134531054, -120(%ebp)
 804ad09: 8b 55 88                     	movl	-120(%ebp), %edx
 804ad0c: 89 54 24 04                  	movl	%edx, 4(%esp)
 804ad10: c7 04 24 01 c8 04 08         	movl	$134531073, (%esp)
 804ad17: e8 54 df ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804ad1c: eb 18                        	jmp	0x804ad36 <DoCommand+0x4cf>
 804ad1e: c7 04 24 18 c8 04 08         	movl	$134531096, (%esp)
 804ad25: e8 46 df ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804ad2a: e8 3a 01 00 00               	calll	0x804ae69 <DoHelp>
 804ad2f: eb 05                        	jmp	0x804ad36 <DoCommand+0x4cf>
 804ad31: e8 33 01 00 00               	calll	0x804ae69 <DoHelp>
 804ad36: c9                           	leave
 804ad37: c3                           	retl

0804ad38 <read_file>:
 804ad38: 55                           	pushl	%ebp
 804ad39: 89 e5                        	movl	%esp, %ebp
 804ad3b: 81 ec 28 20 00 00            	subl	$8232, %esp
 804ad41: c7 44 24 04 94 c8 04 08      	movl	$134531220, 4(%esp)
 804ad49: 8b 45 08                     	movl	8(%ebp), %eax
 804ad4c: 89 04 24                     	movl	%eax, (%esp)
 804ad4f: e8 dc df ff ff               	calll	0x8048d30 <.plt+0x280>
 804ad54: 89 45 f4                     	movl	%eax, -12(%ebp)
 804ad57: 83 7d f4 00                  	cmpl	$0, -12(%ebp)
 804ad5b: 75 0d                        	jne	0x804ad6a <read_file+0x32>
 804ad5d: 8b 45 08                     	movl	8(%ebp), %eax
 804ad60: 89 04 24                     	movl	%eax, (%esp)
 804ad63: e8 88 dd ff ff               	calll	0x8048af0 <.plt+0x40>
 804ad68: eb 3c                        	jmp	0x804ada6 <read_file+0x6e>
 804ad6a: 8b 45 f4                     	movl	-12(%ebp), %eax
 804ad6d: 89 44 24 08                  	movl	%eax, 8(%esp)
 804ad71: c7 44 24 04 00 20 00 00      	movl	$8192, 4(%esp)
 804ad79: 8d 85 e8 df ff ff            	leal	-8216(%ebp), %eax
 804ad7f: 89 04 24                     	movl	%eax, (%esp)
 804ad82: e8 89 de ff ff               	calll	0x8048c10 <.plt+0x160>
 804ad87: 85 c0                        	testl	%eax, %eax
 804ad89: 74 10                        	je	0x804ad9b <read_file+0x63>
 804ad8b: 8d 85 e8 df ff ff            	leal	-8216(%ebp), %eax
 804ad91: 89 04 24                     	movl	%eax, (%esp)
 804ad94: e8 ce fa ff ff               	calll	0x804a867 <DoCommand>
 804ad99: eb cf                        	jmp	0x804ad6a <read_file+0x32>
 804ad9b: 8b 45 f4                     	movl	-12(%ebp), %eax
 804ad9e: 89 04 24                     	movl	%eax, (%esp)
 804ada1: e8 fa de ff ff               	calll	0x8048ca0 <.plt+0x1f0>
 804ada6: c9                           	leave
 804ada7: c3                           	retl

0804ada8 <splitargs>:
 804ada8: 55                           	pushl	%ebp
 804ada9: 89 e5                        	movl	%esp, %ebp
 804adab: 83 ec 18                     	subl	$24, %esp
 804adae: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
 804adb5: 8b 45 08                     	movl	8(%ebp), %eax
 804adb8: 89 45 f8                     	movl	%eax, -8(%ebp)
 804adbb: e8 b0 df ff ff               	calll	0x8048d70 <.plt+0x2c0>
 804adc0: 89 c1                        	movl	%eax, %ecx
 804adc2: 8b 45 f8                     	movl	-8(%ebp), %eax
 804adc5: 0f be 00                     	movsbl	(%eax), %eax
 804adc8: 8d 14 00                     	leal	(%eax,%eax), %edx
 804adcb: 8b 01                        	movl	(%ecx), %eax
 804adcd: 0f b7 04 02                  	movzwl	(%edx,%eax), %eax
 804add1: c1 e8 0d                     	shrl	$13, %eax
 804add4: 83 e0 01                     	andl	$1, %eax
 804add7: 85 c0                        	testl	%eax, %eax
 804add9: 74 07                        	je	0x804ade2 <splitargs+0x3a>
 804addb: 8d 45 f8                     	leal	-8(%ebp), %eax
 804adde: ff 00                        	incl	(%eax)
 804ade0: eb d9                        	jmp	0x804adbb <splitargs+0x13>
 804ade2: 8b 45 f8                     	movl	-8(%ebp), %eax
 804ade5: 80 38 00                     	cmpb	$0, (%eax)
 804ade8: 75 08                        	jne	0x804adf2 <splitargs+0x4a>
 804adea: 8b 45 fc                     	movl	-4(%ebp), %eax
 804aded: 89 45 f4                     	movl	%eax, -12(%ebp)
 804adf0: eb 72                        	jmp	0x804ae64 <splitargs+0xbc>
 804adf2: 8b 45 fc                     	movl	-4(%ebp), %eax
 804adf5: 8d 0c 85 00 00 00 00         	leal	(,%eax,4), %ecx
 804adfc: 8b 55 0c                     	movl	12(%ebp), %edx
 804adff: 8b 45 f8                     	movl	-8(%ebp), %eax
 804ae02: 89 04 11                     	movl	%eax, (%ecx,%edx)
 804ae05: 8d 45 fc                     	leal	-4(%ebp), %eax
 804ae08: ff 00                        	incl	(%eax)
 804ae0a: 8b 45 f8                     	movl	-8(%ebp), %eax
 804ae0d: 80 38 00                     	cmpb	$0, (%eax)
 804ae10: 74 27                        	je	0x804ae39 <splitargs+0x91>
 804ae12: e8 59 df ff ff               	calll	0x8048d70 <.plt+0x2c0>
 804ae17: 89 c1                        	movl	%eax, %ecx
 804ae19: 8b 45 f8                     	movl	-8(%ebp), %eax
 804ae1c: 0f be 00                     	movsbl	(%eax), %eax
 804ae1f: 8d 14 00                     	leal	(%eax,%eax), %edx
 804ae22: 8b 01                        	movl	(%ecx), %eax
 804ae24: 0f b7 04 02                  	movzwl	(%edx,%eax), %eax
 804ae28: c1 e8 0d                     	shrl	$13, %eax
 804ae2b: 83 e0 01                     	andl	$1, %eax
 804ae2e: 85 c0                        	testl	%eax, %eax
 804ae30: 75 07                        	jne	0x804ae39 <splitargs+0x91>
 804ae32: 8d 45 f8                     	leal	-8(%ebp), %eax
 804ae35: ff 00                        	incl	(%eax)
 804ae37: eb d1                        	jmp	0x804ae0a <splitargs+0x62>
 804ae39: 8b 45 f8                     	movl	-8(%ebp), %eax
 804ae3c: 80 38 00                     	cmpb	$0, (%eax)
 804ae3f: 75 08                        	jne	0x804ae49 <splitargs+0xa1>
 804ae41: 8b 45 fc                     	movl	-4(%ebp), %eax
 804ae44: 89 45 f4                     	movl	%eax, -12(%ebp)
 804ae47: eb 1b                        	jmp	0x804ae64 <splitargs+0xbc>
 804ae49: 8b 45 f8                     	movl	-8(%ebp), %eax
 804ae4c: c6 00 00                     	movb	$0, (%eax)
 804ae4f: 8d 45 f8                     	leal	-8(%ebp), %eax
 804ae52: ff 00                        	incl	(%eax)
 804ae54: 83 7d fc 09                  	cmpl	$9, -4(%ebp)
 804ae58: 0f 8e 5d ff ff ff            	jle	0x804adbb <splitargs+0x13>
 804ae5e: 8b 45 fc                     	movl	-4(%ebp), %eax
 804ae61: 89 45 f4                     	movl	%eax, -12(%ebp)
 804ae64: 8b 45 f4                     	movl	-12(%ebp), %eax
 804ae67: c9                           	leave
 804ae68: c3                           	retl

0804ae69 <DoHelp>:
 804ae69: 55                           	pushl	%ebp
 804ae6a: 89 e5                        	movl	%esp, %ebp
 804ae6c: 83 ec 28                     	subl	$40, %esp
 804ae6f: c7 04 24 98 c8 04 08         	movl	$134531224, (%esp)
 804ae76: e8 f5 dd ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804ae7b: c7 45 fc 4c d0 04 08         	movl	$134533196, -4(%ebp)
 804ae82: 81 7d fc 0c d1 04 08         	cmpl	$134533388, -4(%ebp)
 804ae89: 0f 83 d6 00 00 00            	jae	0x804af65 <DoHelp+0xfc>
 804ae8f: c7 04 24 bd c8 04 08         	movl	$134531261, (%esp)
 804ae96: e8 d5 dd ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804ae9b: 8b 45 fc                     	movl	-4(%ebp), %eax
 804ae9e: 8b 40 08                     	movl	8(%eax), %eax
 804aea1: 89 45 ec                     	movl	%eax, -20(%ebp)
 804aea4: 83 7d ec 00                  	cmpl	$0, -20(%ebp)
 804aea8: 74 0b                        	je	0x804aeb5 <DoHelp+0x4c>
 804aeaa: 83 7d ec 01                  	cmpl	$1, -20(%ebp)
 804aeae: 74 1f                        	je	0x804aecf <DoHelp+0x66>
 804aeb0: e9 81 00 00 00               	jmp	0x804af36 <DoHelp+0xcd>
 804aeb5: 8b 45 fc                     	movl	-4(%ebp), %eax
 804aeb8: 8b 00                        	movl	(%eax), %eax
 804aeba: 89 44 24 04                  	movl	%eax, 4(%esp)
 804aebe: c7 04 24 bf c8 04 08         	movl	$134531263, (%esp)
 804aec5: e8 a6 dd ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804aeca: e9 8b 00 00 00               	jmp	0x804af5a <DoHelp+0xf1>
 804aecf: 8b 45 fc                     	movl	-4(%ebp), %eax
 804aed2: 83 78 04 0f                  	cmpl	$15, 4(%eax)
 804aed6: 74 39                        	je	0x804af11 <DoHelp+0xa8>
 804aed8: 8b 45 fc                     	movl	-4(%ebp), %eax
 804aedb: 83 78 04 0c                  	cmpl	$12, 4(%eax)
 804aedf: 74 21                        	je	0x804af02 <DoHelp+0x99>
 804aee1: 8b 45 fc                     	movl	-4(%ebp), %eax
 804aee4: 83 78 04 00                  	cmpl	$0, 4(%eax)
 804aee8: 75 09                        	jne	0x804aef3 <DoHelp+0x8a>
 804aeea: c7 45 f0 c3 c8 04 08         	movl	$134531267, -16(%ebp)
 804aef1: eb 07                        	jmp	0x804aefa <DoHelp+0x91>
 804aef3: c7 45 f0 cb c8 04 08         	movl	$134531275, -16(%ebp)
 804aefa: 8b 45 f0                     	movl	-16(%ebp), %eax
 804aefd: 89 45 f4                     	movl	%eax, -12(%ebp)
 804af00: eb 07                        	jmp	0x804af09 <DoHelp+0xa0>
 804af02: c7 45 f4 d3 c8 04 08         	movl	$134531283, -12(%ebp)
 804af09: 8b 45 f4                     	movl	-12(%ebp), %eax
 804af0c: 89 45 f8                     	movl	%eax, -8(%ebp)
 804af0f: eb 07                        	jmp	0x804af18 <DoHelp+0xaf>
 804af11: c7 45 f8 19 c6 04 08         	movl	$134530585, -8(%ebp)
 804af18: 8b 45 f8                     	movl	-8(%ebp), %eax
 804af1b: 89 44 24 08                  	movl	%eax, 8(%esp)
 804af1f: 8b 45 fc                     	movl	-4(%ebp), %eax
 804af22: 8b 00                        	movl	(%eax), %eax
 804af24: 89 44 24 04                  	movl	%eax, 4(%esp)
 804af28: c7 04 24 f0 c8 04 08         	movl	$134531312, (%esp)
 804af2f: e8 3c dd ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804af34: eb 24                        	jmp	0x804af5a <DoHelp+0xf1>
 804af36: c7 04 24 f7 c8 04 08         	movl	$134531319, (%esp)
 804af3d: e8 2e dd ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804af42: c7 04 24 18 c9 04 08         	movl	$134531352, (%esp)
 804af49: e8 22 dd ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804af4e: c7 04 24 3b c9 04 08         	movl	$134531387, (%esp)
 804af55: e8 16 dd ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804af5a: 8d 45 fc                     	leal	-4(%ebp), %eax
 804af5d: 83 00 0c                     	addl	$12, (%eax)
 804af60: e9 1d ff ff ff               	jmp	0x804ae82 <DoHelp+0x19>
 804af65: c7 04 24 53 c9 04 08         	movl	$134531411, (%esp)
 804af6c: e8 ff dc ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804af71: c9                           	leave
 804af72: c3                           	retl

0804af73 <print_hist>:
 804af73: 55                           	pushl	%ebp
 804af74: 89 e5                        	movl	%esp, %ebp
 804af76: 83 ec 38                     	subl	$56, %esp
 804af79: c7 45 e8 00 00 00 00         	movl	$0, -24(%ebp)
 804af80: c7 45 f4 00 00 00 00         	movl	$0, -12(%ebp)
 804af87: c7 45 f0 00 00 00 00         	movl	$0, -16(%ebp)
 804af8e: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
 804af95: 8b 45 fc                     	movl	-4(%ebp), %eax
 804af98: 3b 45 0c                     	cmpl	12(%ebp), %eax
 804af9b: 7d 3a                        	jge	0x804afd7 <print_hist+0x64>
 804af9d: 8b 45 fc                     	movl	-4(%ebp), %eax
 804afa0: 8d 14 85 00 00 00 00         	leal	(,%eax,4), %edx
 804afa7: 8b 45 08                     	movl	8(%ebp), %eax
 804afaa: 8b 04 02                     	movl	(%edx,%eax), %eax
 804afad: 89 45 f8                     	movl	%eax, -8(%ebp)
 804afb0: 85 c0                        	testl	%eax, %eax
 804afb2: 74 06                        	je	0x804afba <print_hist+0x47>
 804afb4: 8b 45 fc                     	movl	-4(%ebp), %eax
 804afb7: 89 45 f0                     	movl	%eax, -16(%ebp)
 804afba: 8b 45 f8                     	movl	-8(%ebp), %eax
 804afbd: 3b 45 f4                     	cmpl	-12(%ebp), %eax
 804afc0: 7e 06                        	jle	0x804afc8 <print_hist+0x55>
 804afc2: 8b 45 f8                     	movl	-8(%ebp), %eax
 804afc5: 89 45 f4                     	movl	%eax, -12(%ebp)
 804afc8: 8b 45 f8                     	movl	-8(%ebp), %eax
 804afcb: 8d 55 e8                     	leal	-24(%ebp), %edx
 804afce: 01 02                        	addl	%eax, (%edx)
 804afd0: 8d 45 fc                     	leal	-4(%ebp), %eax
 804afd3: ff 00                        	incl	(%eax)
 804afd5: eb be                        	jmp	0x804af95 <print_hist+0x22>
 804afd7: 83 7d f4 00                  	cmpl	$0, -12(%ebp)
 804afdb: 75 0c                        	jne	0x804afe9 <print_hist+0x76>
 804afdd: c7 45 dc ff ff ff ff         	movl	$4294967295, -36(%ebp)
 804afe4: e9 a4 01 00 00               	jmp	0x804b18d <print_hist+0x21a>
 804afe9: 8b 45 e8                     	movl	-24(%ebp), %eax
 804afec: 6b c0 5a                     	imull	$90, %eax, %eax
 804afef: 89 45 e4                     	movl	%eax, -28(%ebp)
 804aff2: 8b 4d e4                     	movl	-28(%ebp), %ecx
 804aff5: 83 c1 63                     	addl	$99, %ecx
 804aff8: b8 1f 85 eb 51               	movl	$1374389535, %eax
 804affd: f7 e9                        	imull	%ecx
 804afff: c1 fa 05                     	sarl	$5, %edx
 804b002: 89 c8                        	movl	%ecx, %eax
 804b004: c1 f8 1f                     	sarl	$31, %eax
 804b007: 29 c2                        	subl	%eax, %edx
 804b009: 89 d0                        	movl	%edx, %eax
 804b00b: 89 45 e4                     	movl	%eax, -28(%ebp)
 804b00e: c7 45 f8 00 00 00 00         	movl	$0, -8(%ebp)
 804b015: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
 804b01c: 8b 45 fc                     	movl	-4(%ebp), %eax
 804b01f: 3b 45 f0                     	cmpl	-16(%ebp), %eax
 804b022: 7f 26                        	jg	0x804b04a <print_hist+0xd7>
 804b024: 8b 45 fc                     	movl	-4(%ebp), %eax
 804b027: 8d 14 85 00 00 00 00         	leal	(,%eax,4), %edx
 804b02e: 8b 45 08                     	movl	8(%ebp), %eax
 804b031: 8b 14 02                     	movl	(%edx,%eax), %edx
 804b034: 8d 45 f8                     	leal	-8(%ebp), %eax
 804b037: 01 10                        	addl	%edx, (%eax)
 804b039: 8b 45 f8                     	movl	-8(%ebp), %eax
 804b03c: 3b 45 e4                     	cmpl	-28(%ebp), %eax
 804b03f: 7c 02                        	jl	0x804b043 <print_hist+0xd0>
 804b041: eb 07                        	jmp	0x804b04a <print_hist+0xd7>
 804b043: 8d 45 fc                     	leal	-4(%ebp), %eax
 804b046: ff 00                        	incl	(%eax)
 804b048: eb d2                        	jmp	0x804b01c <print_hist+0xa9>
 804b04a: 8b 45 fc                     	movl	-4(%ebp), %eax
 804b04d: 89 45 e0                     	movl	%eax, -32(%ebp)
 804b050: 8b 45 f8                     	movl	-8(%ebp), %eax
 804b053: 89 45 e4                     	movl	%eax, -28(%ebp)
 804b056: 8b 4d f4                     	movl	-12(%ebp), %ecx
 804b059: 83 c1 45                     	addl	$69, %ecx
 804b05c: b8 eb a0 0e ea               	movl	$3926827243, %eax
 804b061: f7 e9                        	imull	%ecx
 804b063: 8d 04 0a                     	leal	(%edx,%ecx), %eax
 804b066: 89 c2                        	movl	%eax, %edx
 804b068: c1 fa 06                     	sarl	$6, %edx
 804b06b: 89 c8                        	movl	%ecx, %eax
 804b06d: c1 f8 1f                     	sarl	$31, %eax
 804b070: 29 c2                        	subl	%eax, %edx
 804b072: 89 d0                        	movl	%edx, %eax
 804b074: 89 45 ec                     	movl	%eax, -20(%ebp)
 804b077: 8b 45 14                     	movl	20(%ebp), %eax
 804b07a: 89 44 24 04                  	movl	%eax, 4(%esp)
 804b07e: c7 04 24 70 c9 04 08         	movl	$134531440, (%esp)
 804b085: e8 e6 db ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b08a: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
 804b091: 8b 45 fc                     	movl	-4(%ebp), %eax
 804b094: 3b 45 e0                     	cmpl	-32(%ebp), %eax
 804b097: 7f 74                        	jg	0x804b10d <print_hist+0x19a>
 804b099: 8b 45 fc                     	movl	-4(%ebp), %eax
 804b09c: 8d 14 85 00 00 00 00         	leal	(,%eax,4), %edx
 804b0a3: 8b 45 08                     	movl	8(%ebp), %eax
 804b0a6: 8b 04 02                     	movl	(%edx,%eax), %eax
 804b0a9: 89 45 f8                     	movl	%eax, -8(%ebp)
 804b0ac: 89 44 24 08                  	movl	%eax, 8(%esp)
 804b0b0: 8b 45 fc                     	movl	-4(%ebp), %eax
 804b0b3: 0f af 45 10                  	imull	16(%ebp), %eax
 804b0b7: 89 44 24 04                  	movl	%eax, 4(%esp)
 804b0bb: c7 04 24 73 c9 04 08         	movl	$134531443, (%esp)
 804b0c2: e8 a9 db ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b0c7: 8b 55 f8                     	movl	-8(%ebp), %edx
 804b0ca: 8d 45 ec                     	leal	-20(%ebp), %eax
 804b0cd: 89 45 d8                     	movl	%eax, -40(%ebp)
 804b0d0: 89 d0                        	movl	%edx, %eax
 804b0d2: 8b 4d d8                     	movl	-40(%ebp), %ecx
 804b0d5: 99                           	cltd
 804b0d6: f7 39                        	idivl	(%ecx)
 804b0d8: 89 45 d8                     	movl	%eax, -40(%ebp)
 804b0db: 8b 45 d8                     	movl	-40(%ebp), %eax
 804b0de: 89 45 f8                     	movl	%eax, -8(%ebp)
 804b0e1: 8d 45 f8                     	leal	-8(%ebp), %eax
 804b0e4: ff 08                        	decl	(%eax)
 804b0e6: 83 7d f8 ff                  	cmpl	$-1, -8(%ebp)
 804b0ea: 74 0e                        	je	0x804b0fa <print_hist+0x187>
 804b0ec: c7 04 24 7d c9 04 08         	movl	$134531453, (%esp)
 804b0f3: e8 78 db ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b0f8: eb e7                        	jmp	0x804b0e1 <print_hist+0x16e>
 804b0fa: c7 04 24 9f c1 04 08         	movl	$134529439, (%esp)
 804b101: e8 6a db ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b106: 8d 45 fc                     	leal	-4(%ebp), %eax
 804b109: ff 00                        	incl	(%eax)
 804b10b: eb 84                        	jmp	0x804b091 <print_hist+0x11e>
 804b10d: 8b 55 e4                     	movl	-28(%ebp), %edx
 804b110: 8b 45 e8                     	movl	-24(%ebp), %eax
 804b113: 29 d0                        	subl	%edx, %eax
 804b115: 89 45 f8                     	movl	%eax, -8(%ebp)
 804b118: 8b 45 f8                     	movl	-8(%ebp), %eax
 804b11b: 89 44 24 08                  	movl	%eax, 8(%esp)
 804b11f: 8b 45 e0                     	movl	-32(%ebp), %eax
 804b122: 0f af 45 10                  	imull	16(%ebp), %eax
 804b126: 89 44 24 04                  	movl	%eax, 4(%esp)
 804b12a: c7 04 24 7f c9 04 08         	movl	$134531455, (%esp)
 804b131: e8 3a db ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b136: 8b 55 f8                     	movl	-8(%ebp), %edx
 804b139: 8d 4d ec                     	leal	-20(%ebp), %ecx
 804b13c: 89 4d d8                     	movl	%ecx, -40(%ebp)
 804b13f: 89 d0                        	movl	%edx, %eax
 804b141: 8b 4d d8                     	movl	-40(%ebp), %ecx
 804b144: 99                           	cltd
 804b145: f7 39                        	idivl	(%ecx)
 804b147: 89 45 d8                     	movl	%eax, -40(%ebp)
 804b14a: 8b 45 d8                     	movl	-40(%ebp), %eax
 804b14d: 89 45 f8                     	movl	%eax, -8(%ebp)
 804b150: 83 7d f8 46                  	cmpl	$70, -8(%ebp)
 804b154: 7f 19                        	jg	0x804b16f <print_hist+0x1fc>
 804b156: 8d 45 f8                     	leal	-8(%ebp), %eax
 804b159: ff 08                        	decl	(%eax)
 804b15b: 83 7d f8 ff                  	cmpl	$-1, -8(%ebp)
 804b15f: 74 1a                        	je	0x804b17b <print_hist+0x208>
 804b161: c7 04 24 7d c9 04 08         	movl	$134531453, (%esp)
 804b168: e8 03 db ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b16d: eb e7                        	jmp	0x804b156 <print_hist+0x1e3>
 804b16f: c7 04 24 8a c9 04 08         	movl	$134531466, (%esp)
 804b176: e8 f5 da ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b17b: c7 04 24 9f c1 04 08         	movl	$134529439, (%esp)
 804b182: e8 e9 da ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b187: 8b 45 f0                     	movl	-16(%ebp), %eax
 804b18a: 89 45 dc                     	movl	%eax, -36(%ebp)
 804b18d: 8b 45 dc                     	movl	-36(%ebp), %eax
 804b190: c9                           	leave
 804b191: c3                           	retl

0804b192 <print_stats>:
 804b192: 55                           	pushl	%ebp
 804b193: 89 e5                        	movl	%esp, %ebp
 804b195: 83 ec 38                     	subl	$56, %esp
 804b198: c7 45 f4 00 00 00 00         	movl	$0, -12(%ebp)
 804b19f: c7 45 f0 00 00 00 00         	movl	$0, -16(%ebp)
 804b1a6: e8 1c f2 ff ff               	calll	0x804a3c7 <current_time>
 804b1ab: a3 80 d3 04 08               	movl	%eax, 134534016
 804b1b0: 8b 15 64 f4 04 08            	movl	134542436, %edx
 804b1b6: a1 80 d3 04 08               	movl	134534016, %eax
 804b1bb: 29 d0                        	subl	%edx, %eax
 804b1bd: 50                           	pushl	%eax
 804b1be: db 04 24                     	fildl	(%esp)
 804b1c1: 8d 64 24 04                  	leal	4(%esp), %esp
 804b1c5: dd 05 f0 ca 04 08            	fldl	134531824
 804b1cb: de f9                        	fdivrp	%st, %st(1)
 804b1cd: dd 5d e8                     	fstpl	-24(%ebp)
 804b1d0: c7 45 f8 e9 03 00 00         	movl	$1001, -8(%ebp)
 804b1d7: 83 7d f8 00                  	cmpl	$0, -8(%ebp)
 804b1db: 78 1e                        	js	0x804b1fb <print_stats+0x69>
 804b1dd: 8b 45 f8                     	movl	-8(%ebp), %eax
 804b1e0: 8d 14 85 00 00 00 00         	leal	(,%eax,4), %edx
 804b1e7: a1 74 f4 04 08               	movl	134542452, %eax
 804b1ec: 83 3c 02 00                  	cmpl	$0, (%edx,%eax)
 804b1f0: 74 02                        	je	0x804b1f4 <print_stats+0x62>
 804b1f2: eb 07                        	jmp	0x804b1fb <print_stats+0x69>
 804b1f4: 8d 45 f8                     	leal	-8(%ebp), %eax
 804b1f7: ff 08                        	decl	(%eax)
 804b1f9: eb dc                        	jmp	0x804b1d7 <print_stats+0x45>
 804b1fb: 83 7d f8 00                  	cmpl	$0, -8(%ebp)
 804b1ff: 79 11                        	jns	0x804b212 <print_stats+0x80>
 804b201: c7 04 24 8e c9 04 08         	movl	$134531470, (%esp)
 804b208: e8 63 da ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b20d: e9 17 03 00 00               	jmp	0x804b529 <print_stats+0x397>
 804b212: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
 804b219: 8b 45 fc                     	movl	-4(%ebp), %eax
 804b21c: 3b 45 f8                     	cmpl	-8(%ebp), %eax
 804b21f: 7f 32                        	jg	0x804b253 <print_stats+0xc1>
 804b221: 8b 45 fc                     	movl	-4(%ebp), %eax
 804b224: 8d 14 85 00 00 00 00         	leal	(,%eax,4), %edx
 804b22b: a1 74 f4 04 08               	movl	134542452, %eax
 804b230: 8b 04 02                     	movl	(%edx,%eax), %eax
 804b233: 89 45 e4                     	movl	%eax, -28(%ebp)
 804b236: 8b 45 e4                     	movl	-28(%ebp), %eax
 804b239: 89 c2                        	movl	%eax, %edx
 804b23b: 0f af 55 fc                  	imull	-4(%ebp), %edx
 804b23f: 8d 45 f4                     	leal	-12(%ebp), %eax
 804b242: 01 10                        	addl	%edx, (%eax)
 804b244: 8b 55 e4                     	movl	-28(%ebp), %edx
 804b247: 8d 45 f0                     	leal	-16(%ebp), %eax
 804b24a: 01 10                        	addl	%edx, (%eax)
 804b24c: 8d 45 fc                     	leal	-4(%ebp), %eax
 804b24f: ff 00                        	incl	(%eax)
 804b251: eb c6                        	jmp	0x804b219 <print_stats+0x87>
 804b253: db 45 f4                     	fildl	-12(%ebp)
 804b256: dd 05 f8 ca 04 08            	fldl	134531832
 804b25c: de c9                        	fmulp	%st, %st(1)
 804b25e: db 45 f0                     	fildl	-16(%ebp)
 804b261: de f9                        	fdivrp	%st, %st(1)
 804b263: dd 5c 24 04                  	fstpl	4(%esp)
 804b267: c7 04 24 a6 c9 04 08         	movl	$134531494, (%esp)
 804b26e: e8 fd d9 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b273: dd 45 e8                     	fldl	-24(%ebp)
 804b276: dd 5c 24 04                  	fstpl	4(%esp)
 804b27a: c7 04 24 c0 c9 04 08         	movl	$134531520, (%esp)
 804b281: e8 ea d9 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b286: a1 40 f4 04 08               	movl	134542400, %eax
 804b28b: 89 44 24 04                  	movl	%eax, 4(%esp)
 804b28f: c7 04 24 e0 c9 04 08         	movl	$134531552, (%esp)
 804b296: e8 d5 d9 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b29b: dd 45 e8                     	fldl	-24(%ebp)
 804b29e: d9 ee                        	fldz
 804b2a0: d9 c9                        	fxch	%st(1)
 804b2a2: da e9                        	fucompp
 804b2a4: df e0                        	fnstsw	%ax
 804b2a6: 9e                           	sahf
 804b2a7: 75 04                        	jne	0x804b2ad <print_stats+0x11b>
 804b2a9: 7a 02                        	jp	0x804b2ad <print_stats+0x11b>
 804b2ab: eb 19                        	jmp	0x804b2c6 <print_stats+0x134>
 804b2ad: db 05 40 f4 04 08            	fildl	134542400
 804b2b3: dc 75 e8                     	fdivl	-24(%ebp)
 804b2b6: dd 5c 24 04                  	fstpl	4(%esp)
 804b2ba: c7 04 24 f7 c9 04 08         	movl	$134531575, (%esp)
 804b2c1: e8 aa d9 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b2c6: c7 04 24 9f c1 04 08         	movl	$134529439, (%esp)
 804b2cd: e8 9e d9 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b2d2: a1 44 d3 04 08               	movl	134533956, %eax
 804b2d7: 89 44 24 10                  	movl	%eax, 16(%esp)
 804b2db: db 05 6c f4 04 08            	fildl	134542444
 804b2e1: 8b 15 64 f4 04 08            	movl	134542436, %edx
 804b2e7: a1 80 d3 04 08               	movl	134534016, %eax
 804b2ec: 29 d0                        	subl	%edx, %eax
 804b2ee: 50                           	pushl	%eax
 804b2ef: db 04 24                     	fildl	(%esp)
 804b2f2: 8d 64 24 04                  	leal	4(%esp), %esp
 804b2f6: de f9                        	fdivrp	%st, %st(1)
 804b2f8: dd 5c 24 08                  	fstpl	8(%esp)
 804b2fc: a1 70 f4 04 08               	movl	134542448, %eax
 804b301: 89 44 24 04                  	movl	%eax, 4(%esp)
 804b305: c7 04 24 04 ca 04 08         	movl	$134531588, (%esp)
 804b30c: e8 5f d9 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b311: a1 44 f4 04 08               	movl	134542404, %eax
 804b316: 89 44 24 04                  	movl	%eax, 4(%esp)
 804b31a: c7 04 24 31 ca 04 08         	movl	$134531633, (%esp)
 804b321: e8 4a d9 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b326: 83 3d 44 f4 04 08 00         	cmpl	$0, 134542404
 804b32d: 74 38                        	je	0x804b367 <print_stats+0x1d5>
 804b32f: a1 44 f4 04 08               	movl	134542404, %eax
 804b334: 69 c0 e8 03 00 00            	imull	$1000, %eax, %eax
 804b33a: 99                           	cltd
 804b33b: f7 3d 40 f4 04 08            	idivl	134542400
 804b341: 8d 48 05                     	leal	5(%eax), %ecx
 804b344: b8 67 66 66 66               	movl	$1717986919, %eax
 804b349: f7 e9                        	imull	%ecx
 804b34b: c1 fa 02                     	sarl	$2, %edx
 804b34e: 89 c8                        	movl	%ecx, %eax
 804b350: c1 f8 1f                     	sarl	$31, %eax
 804b353: 29 c2                        	subl	%eax, %edx
 804b355: 89 d0                        	movl	%edx, %eax
 804b357: 89 44 24 04                  	movl	%eax, 4(%esp)
 804b35b: c7 04 24 4a ca 04 08         	movl	$134531658, (%esp)
 804b362: e8 09 d9 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b367: a1 48 f4 04 08               	movl	134542408, %eax
 804b36c: 89 44 24 04                  	movl	%eax, 4(%esp)
 804b370: c7 04 24 52 ca 04 08         	movl	$134531666, (%esp)
 804b377: e8 f4 d8 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b37c: 83 3d 48 f4 04 08 00         	cmpl	$0, 134542408
 804b383: 74 38                        	je	0x804b3bd <print_stats+0x22b>
 804b385: a1 48 f4 04 08               	movl	134542408, %eax
 804b38a: 69 c0 e8 03 00 00            	imull	$1000, %eax, %eax
 804b390: 99                           	cltd
 804b391: f7 3d 40 f4 04 08            	idivl	134542400
 804b397: 8d 48 05                     	leal	5(%eax), %ecx
 804b39a: b8 67 66 66 66               	movl	$1717986919, %eax
 804b39f: f7 e9                        	imull	%ecx
 804b3a1: c1 fa 02                     	sarl	$2, %edx
 804b3a4: 89 c8                        	movl	%ecx, %eax
 804b3a6: c1 f8 1f                     	sarl	$31, %eax
 804b3a9: 29 c2                        	subl	%eax, %edx
 804b3ab: 89 d0                        	movl	%edx, %eax
 804b3ad: 89 44 24 04                  	movl	%eax, 4(%esp)
 804b3b1: c7 04 24 4a ca 04 08         	movl	$134531658, (%esp)
 804b3b8: e8 b3 d8 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b3bd: a1 50 f4 04 08               	movl	134542416, %eax
 804b3c2: 89 44 24 04                  	movl	%eax, 4(%esp)
 804b3c6: c7 04 24 6a ca 04 08         	movl	$134531690, (%esp)
 804b3cd: e8 9e d8 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b3d2: 83 3d 50 f4 04 08 00         	cmpl	$0, 134542416
 804b3d9: 74 38                        	je	0x804b413 <print_stats+0x281>
 804b3db: a1 50 f4 04 08               	movl	134542416, %eax
 804b3e0: 69 c0 e8 03 00 00            	imull	$1000, %eax, %eax
 804b3e6: 99                           	cltd
 804b3e7: f7 3d 40 f4 04 08            	idivl	134542400
 804b3ed: 8d 48 05                     	leal	5(%eax), %ecx
 804b3f0: b8 67 66 66 66               	movl	$1717986919, %eax
 804b3f5: f7 e9                        	imull	%ecx
 804b3f7: c1 fa 02                     	sarl	$2, %edx
 804b3fa: 89 c8                        	movl	%ecx, %eax
 804b3fc: c1 f8 1f                     	sarl	$31, %eax
 804b3ff: 29 c2                        	subl	%eax, %edx
 804b401: 89 d0                        	movl	%edx, %eax
 804b403: 89 44 24 04                  	movl	%eax, 4(%esp)
 804b407: c7 04 24 4a ca 04 08         	movl	$134531658, (%esp)
 804b40e: e8 5d d8 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b413: a1 4c f4 04 08               	movl	134542412, %eax
 804b418: 89 44 24 04                  	movl	%eax, 4(%esp)
 804b41c: c7 04 24 84 ca 04 08         	movl	$134531716, (%esp)
 804b423: e8 48 d8 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b428: 83 3d 4c f4 04 08 00         	cmpl	$0, 134542412
 804b42f: 74 38                        	je	0x804b469 <print_stats+0x2d7>
 804b431: a1 4c f4 04 08               	movl	134542412, %eax
 804b436: 69 c0 e8 03 00 00            	imull	$1000, %eax, %eax
 804b43c: 99                           	cltd
 804b43d: f7 3d 40 f4 04 08            	idivl	134542400
 804b443: 8d 48 05                     	leal	5(%eax), %ecx
 804b446: b8 67 66 66 66               	movl	$1717986919, %eax
 804b44b: f7 e9                        	imull	%ecx
 804b44d: c1 fa 02                     	sarl	$2, %edx
 804b450: 89 c8                        	movl	%ecx, %eax
 804b452: c1 f8 1f                     	sarl	$31, %eax
 804b455: 29 c2                        	subl	%eax, %edx
 804b457: 89 d0                        	movl	%edx, %eax
 804b459: 89 44 24 04                  	movl	%eax, 4(%esp)
 804b45d: c7 04 24 4a ca 04 08         	movl	$134531658, (%esp)
 804b464: e8 07 d8 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b469: a1 58 f4 04 08               	movl	134542424, %eax
 804b46e: 89 44 24 04                  	movl	%eax, 4(%esp)
 804b472: c7 04 24 a7 ca 04 08         	movl	$134531751, (%esp)
 804b479: e8 f2 d7 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b47e: a1 5c f4 04 08               	movl	134542428, %eax
 804b483: 89 44 24 04                  	movl	%eax, 4(%esp)
 804b487: c7 04 24 b8 ca 04 08         	movl	$134531768, (%esp)
 804b48e: e8 dd d7 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b493: a1 60 f4 04 08               	movl	134542432, %eax
 804b498: 89 44 24 04                  	movl	%eax, 4(%esp)
 804b49c: c7 04 24 c7 ca 04 08         	movl	$134531783, (%esp)
 804b4a3: e8 c8 d7 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b4a8: dd 45 e8                     	fldl	-24(%ebp)
 804b4ab: d9 ee                        	fldz
 804b4ad: d9 c9                        	fxch	%st(1)
 804b4af: da e9                        	fucompp
 804b4b1: df e0                        	fnstsw	%ax
 804b4b3: 9e                           	sahf
 804b4b4: 75 04                        	jne	0x804b4ba <print_stats+0x328>
 804b4b6: 7a 02                        	jp	0x804b4ba <print_stats+0x328>
 804b4b8: eb 19                        	jmp	0x804b4d3 <print_stats+0x341>
 804b4ba: db 05 60 f4 04 08            	fildl	134542432
 804b4c0: dc 75 e8                     	fdivl	-24(%ebp)
 804b4c3: dd 5c 24 04                  	fstpl	4(%esp)
 804b4c7: c7 04 24 f7 c9 04 08         	movl	$134531575, (%esp)
 804b4ce: e8 9d d7 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b4d3: c7 04 24 9f c1 04 08         	movl	$134529439, (%esp)
 804b4da: e8 91 d7 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b4df: 83 3d 60 f4 04 08 00         	cmpl	$0, 134542432
 804b4e6: 74 41                        	je	0x804b529 <print_stats+0x397>
 804b4e8: a1 54 f4 04 08               	movl	134542420, %eax
 804b4ed: 69 c0 e8 03 00 00            	imull	$1000, %eax, %eax
 804b4f3: 99                           	cltd
 804b4f4: f7 3d 60 f4 04 08            	idivl	134542432
 804b4fa: 8d 48 05                     	leal	5(%eax), %ecx
 804b4fd: b8 67 66 66 66               	movl	$1717986919, %eax
 804b502: f7 e9                        	imull	%ecx
 804b504: c1 fa 02                     	sarl	$2, %edx
 804b507: 89 c8                        	movl	%ecx, %eax
 804b509: c1 f8 1f                     	sarl	$31, %eax
 804b50c: 29 c2                        	subl	%eax, %edx
 804b50e: 89 d0                        	movl	%edx, %eax
 804b510: 89 44 24 08                  	movl	%eax, 8(%esp)
 804b514: a1 54 f4 04 08               	movl	134542420, %eax
 804b519: 89 44 24 04                  	movl	%eax, 4(%esp)
 804b51d: c7 04 24 da ca 04 08         	movl	$134531802, (%esp)
 804b524: e8 47 d7 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b529: c9                           	leave
 804b52a: c3                           	retl

0804b52b <print_dist>:
 804b52b: 55                           	pushl	%ebp
 804b52c: 89 e5                        	movl	%esp, %ebp
 804b52e: 83 ec 28                     	subl	$40, %esp
 804b531: c7 45 f4 00 00 00 00         	movl	$0, -12(%ebp)
 804b538: c7 45 f0 00 00 00 00         	movl	$0, -16(%ebp)
 804b53f: e8 83 ee ff ff               	calll	0x804a3c7 <current_time>
 804b544: a3 80 d3 04 08               	movl	%eax, 134534016
 804b549: c7 44 24 0c 00 cb 04 08      	movl	$134531840, 12(%esp)
 804b551: c7 44 24 08 0a 00 00 00      	movl	$10, 8(%esp)
 804b559: c7 44 24 04 e9 03 00 00      	movl	$1001, 4(%esp)
 804b561: a1 74 f4 04 08               	movl	134542452, %eax
 804b566: 89 04 24                     	movl	%eax, (%esp)
 804b569: e8 05 fa ff ff               	calll	0x804af73 <print_hist>
 804b56e: 89 45 f8                     	movl	%eax, -8(%ebp)
 804b571: 83 7d f8 00                  	cmpl	$0, -8(%ebp)
 804b575: 79 0e                        	jns	0x804b585 <print_dist+0x5a>
 804b577: c7 04 24 8e c9 04 08         	movl	$134531470, (%esp)
 804b57e: e8 ed d6 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b583: eb 61                        	jmp	0x804b5e6 <print_dist+0xbb>
 804b585: c7 45 fc 00 00 00 00         	movl	$0, -4(%ebp)
 804b58c: 8b 45 fc                     	movl	-4(%ebp), %eax
 804b58f: 3b 45 f8                     	cmpl	-8(%ebp), %eax
 804b592: 7f 32                        	jg	0x804b5c6 <print_dist+0x9b>
 804b594: 8b 45 fc                     	movl	-4(%ebp), %eax
 804b597: 8d 14 85 00 00 00 00         	leal	(,%eax,4), %edx
 804b59e: a1 74 f4 04 08               	movl	134542452, %eax
 804b5a3: 8b 04 02                     	movl	(%edx,%eax), %eax
 804b5a6: 89 45 ec                     	movl	%eax, -20(%ebp)
 804b5a9: 8b 45 ec                     	movl	-20(%ebp), %eax
 804b5ac: 89 c2                        	movl	%eax, %edx
 804b5ae: 0f af 55 fc                  	imull	-4(%ebp), %edx
 804b5b2: 8d 45 f4                     	leal	-12(%ebp), %eax
 804b5b5: 01 10                        	addl	%edx, (%eax)
 804b5b7: 8b 55 ec                     	movl	-20(%ebp), %edx
 804b5ba: 8d 45 f0                     	leal	-16(%ebp), %eax
 804b5bd: 01 10                        	addl	%edx, (%eax)
 804b5bf: 8d 45 fc                     	leal	-4(%ebp), %eax
 804b5c2: ff 00                        	incl	(%eax)
 804b5c4: eb c6                        	jmp	0x804b58c <print_dist+0x61>
 804b5c6: db 45 f4                     	fildl	-12(%ebp)
 804b5c9: dd 05 18 cb 04 08            	fldl	134531864
 804b5cf: de c9                        	fmulp	%st, %st(1)
 804b5d1: db 45 f0                     	fildl	-16(%ebp)
 804b5d4: de f9                        	fdivrp	%st, %st(1)
 804b5d6: dd 5c 24 04                  	fstpl	4(%esp)
 804b5da: c7 04 24 a6 c9 04 08         	movl	$134531494, (%esp)
 804b5e1: e8 8a d6 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b5e6: c9                           	leave
 804b5e7: c3                           	retl

0804b5e8 <show_params>:
 804b5e8: 55                           	pushl	%ebp
 804b5e9: 89 e5                        	movl	%esp, %ebp
 804b5eb: 83 ec 28                     	subl	$40, %esp
 804b5ee: a1 24 d0 04 08               	movl	134533156, %eax
 804b5f3: 89 44 24 04                  	movl	%eax, 4(%esp)
 804b5f7: c7 04 24 20 cb 04 08         	movl	$134531872, (%esp)
 804b5fe: e8 6d d6 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b603: 83 3d 28 d0 04 08 00         	cmpl	$0, 134533160
 804b60a: 75 16                        	jne	0x804b622 <show_params+0x3a>
 804b60c: c7 44 24 04 80 f4 04 08      	movl	$134542464, 4(%esp)
 804b614: c7 04 24 2e cb 04 08         	movl	$134531886, (%esp)
 804b61b: e8 50 d6 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b620: eb 55                        	jmp	0x804b677 <show_params+0x8f>
 804b622: 83 3d 48 d3 04 08 00         	cmpl	$0, 134533960
 804b629: 74 09                        	je	0x804b634 <show_params+0x4c>
 804b62b: c7 45 fc 42 c7 04 08         	movl	$134530882, -4(%ebp)
 804b632: eb 07                        	jmp	0x804b63b <show_params+0x53>
 804b634: c7 45 fc 4b c7 04 08         	movl	$134530891, -4(%ebp)
 804b63b: 8b 45 fc                     	movl	-4(%ebp), %eax
 804b63e: 89 44 24 0c                  	movl	%eax, 12(%esp)
 804b642: 83 3d 28 d0 04 08 02         	cmpl	$2, 134533160
 804b649: 75 09                        	jne	0x804b654 <show_params+0x6c>
 804b64b: c7 45 f8 1e c6 04 08         	movl	$134530590, -8(%ebp)
 804b652: eb 07                        	jmp	0x804b65b <show_params+0x73>
 804b654: c7 45 f8 0d c6 04 08         	movl	$134530573, -8(%ebp)
 804b65b: 8b 45 f8                     	movl	-8(%ebp), %eax
 804b65e: 89 44 24 08                  	movl	%eax, 8(%esp)
 804b662: a1 2c d0 04 08               	movl	134533164, %eax
 804b667: 89 44 24 04                  	movl	%eax, 4(%esp)
 804b66b: c7 04 24 3d cb 04 08         	movl	$134531901, (%esp)
 804b672: e8 f9 d5 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b677: a1 40 d3 04 08               	movl	134533952, %eax
 804b67c: 89 44 24 08                  	movl	%eax, 8(%esp)
 804b680: a1 3c d3 04 08               	movl	134533948, %eax
 804b685: 89 44 24 04                  	movl	%eax, 4(%esp)
 804b689: c7 04 24 58 cb 04 08         	movl	$134531928, (%esp)
 804b690: e8 db d5 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b695: 83 3d 30 d0 04 08 01         	cmpl	$1, 134533168
 804b69c: 75 09                        	jne	0x804b6a7 <show_params+0xbf>
 804b69e: c7 45 f4 3f c6 04 08         	movl	$134530623, -12(%ebp)
 804b6a5: eb 07                        	jmp	0x804b6ae <show_params+0xc6>
 804b6a7: c7 45 f4 40 c6 04 08         	movl	$134530624, -12(%ebp)
 804b6ae: 8b 45 f4                     	movl	-12(%ebp), %eax
 804b6b1: 89 44 24 08                  	movl	%eax, 8(%esp)
 804b6b5: a1 30 d0 04 08               	movl	134533168, %eax
 804b6ba: 89 44 24 04                  	movl	%eax, 4(%esp)
 804b6be: c7 04 24 79 cb 04 08         	movl	$134531961, (%esp)
 804b6c5: e8 a6 d5 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b6ca: 83 3d 38 d3 04 08 00         	cmpl	$0, 134533944
 804b6d1: 74 17                        	je	0x804b6ea <show_params+0x102>
 804b6d3: a1 38 d3 04 08               	movl	134533944, %eax
 804b6d8: 89 44 24 04                  	movl	%eax, 4(%esp)
 804b6dc: c7 04 24 91 cb 04 08         	movl	$134531985, (%esp)
 804b6e3: e8 88 d5 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b6e8: eb 0c                        	jmp	0x804b6f6 <show_params+0x10e>
 804b6ea: c7 04 24 aa cb 04 08         	movl	$134532010, (%esp)
 804b6f1: e8 7a d5 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804b6f6: c9                           	leave
 804b6f7: c3                           	retl

0804b6f8 <inc_queue>:
 804b6f8: 55                           	pushl	%ebp
 804b6f9: 89 e5                        	movl	%esp, %ebp
 804b6fb: 8b 15 68 f4 04 08            	movl	134542440, %edx
 804b701: a1 80 d3 04 08               	movl	134534016, %eax
 804b706: 29 d0                        	subl	%edx, %eax
 804b708: 0f af 05 44 d3 04 08         	imull	134533956, %eax
 804b70f: 01 05 6c f4 04 08            	addl	%eax, 134542444
 804b715: a1 80 d3 04 08               	movl	134534016, %eax
 804b71a: a3 68 f4 04 08               	movl	%eax, 134542440
 804b71f: 8b 45 08                     	movl	8(%ebp), %eax
 804b722: 01 05 44 d3 04 08            	addl	%eax, 134533956
 804b728: a1 70 f4 04 08               	movl	134542448, %eax
 804b72d: 3b 05 44 d3 04 08            	cmpl	134533956, %eax
 804b733: 7d 0a                        	jge	0x804b73f <inc_queue+0x47>
 804b735: a1 44 d3 04 08               	movl	134533956, %eax
 804b73a: a3 70 f4 04 08               	movl	%eax, 134542448
 804b73f: 5d                           	popl	%ebp
 804b740: c3                           	retl

0804b741 <do_garble>:
 804b741: 55                           	pushl	%ebp
 804b742: 89 e5                        	movl	%esp, %ebp
 804b744: 83 ec 18                     	subl	$24, %esp
 804b747: e8 44 d4 ff ff               	calll	0x8048b90 <.plt+0xe0>
 804b74c: 89 c1                        	movl	%eax, %ecx
 804b74e: b8 67 66 66 66               	movl	$1717986919, %eax
 804b753: f7 e9                        	imull	%ecx
 804b755: d1 fa                        	sarl	%edx
 804b757: 89 c8                        	movl	%ecx, %eax
 804b759: c1 f8 1f                     	sarl	$31, %eax
 804b75c: 29 c2                        	subl	%eax, %edx
 804b75e: 89 d0                        	movl	%edx, %eax
 804b760: c1 e0 02                     	shll	$2, %eax
 804b763: 01 d0                        	addl	%edx, %eax
 804b765: 29 c1                        	subl	%eax, %ecx
 804b767: 89 c8                        	movl	%ecx, %eax
 804b769: 83 c0 05                     	addl	$5, %eax
 804b76c: 89 45 fc                     	movl	%eax, -4(%ebp)
 804b76f: e8 1c d4 ff ff               	calll	0x8048b90 <.plt+0xe0>
 804b774: 89 c1                        	movl	%eax, %ecx
 804b776: b8 39 8e e3 38               	movl	$954437177, %eax
 804b77b: f7 e9                        	imull	%ecx
 804b77d: c1 fa 03                     	sarl	$3, %edx
 804b780: 89 c8                        	movl	%ecx, %eax
 804b782: c1 f8 1f                     	sarl	$31, %eax
 804b785: 29 c2                        	subl	%eax, %edx
 804b787: 89 d0                        	movl	%edx, %eax
 804b789: 89 45 f8                     	movl	%eax, -8(%ebp)
 804b78c: 8b 55 f8                     	movl	-8(%ebp), %edx
 804b78f: 89 d0                        	movl	%edx, %eax
 804b791: c1 e0 03                     	shll	$3, %eax
 804b794: 01 d0                        	addl	%edx, %eax
 804b796: c1 e0 02                     	shll	$2, %eax
 804b799: 29 c1                        	subl	%eax, %ecx
 804b79b: 89 c8                        	movl	%ecx, %eax
 804b79d: 89 45 f8                     	movl	%eax, -8(%ebp)
 804b7a0: 8b 45 08                     	movl	8(%ebp), %eax
 804b7a3: 83 c0 10                     	addl	$16, %eax
 804b7a6: 89 45 f4                     	movl	%eax, -12(%ebp)
 804b7a9: e8 e2 d3 ff ff               	calll	0x8048b90 <.plt+0xe0>
 804b7ae: 89 c2                        	movl	%eax, %edx
 804b7b0: b0 ff                        	movb	$-1, %al
 804b7b2: 20 d0                        	andb	%dl, %al
 804b7b4: 88 45 f3                     	movb	%al, -13(%ebp)
 804b7b7: 8d 45 0c                     	leal	12(%ebp), %eax
 804b7ba: 83 28 10                     	subl	$16, (%eax)
 804b7bd: 8d 45 fc                     	leal	-4(%ebp), %eax
 804b7c0: ff 08                        	decl	(%eax)
 804b7c2: 83 7d fc ff                  	cmpl	$-1, -4(%ebp)
 804b7c6: 74 32                        	je	0x804b7fa <do_garble+0xb9>
 804b7c8: 8b 45 f8                     	movl	-8(%ebp), %eax
 804b7cb: 8b 4d f4                     	movl	-12(%ebp), %ecx
 804b7ce: 01 c1                        	addl	%eax, %ecx
 804b7d0: 8b 45 f8                     	movl	-8(%ebp), %eax
 804b7d3: 8b 55 f4                     	movl	-12(%ebp), %edx
 804b7d6: 01 c2                        	addl	%eax, %edx
 804b7d8: 0f b6 45 f3                  	movzbl	-13(%ebp), %eax
 804b7dc: 32 02                        	xorb	(%edx), %al
 804b7de: 88 01                        	movb	%al, (%ecx)
 804b7e0: e8 ab d3 ff ff               	calll	0x8048b90 <.plt+0xe0>
 804b7e5: 89 c2                        	movl	%eax, %edx
 804b7e7: 8d 45 0c                     	leal	12(%ebp), %eax
 804b7ea: 89 45 ec                     	movl	%eax, -20(%ebp)
 804b7ed: 89 d0                        	movl	%edx, %eax
 804b7ef: 8b 4d ec                     	movl	-20(%ebp), %ecx
 804b7f2: 99                           	cltd
 804b7f3: f7 39                        	idivl	(%ecx)
 804b7f5: 89 55 f8                     	movl	%edx, -8(%ebp)
 804b7f8: eb c3                        	jmp	0x804b7bd <do_garble+0x7c>
 804b7fa: c9                           	leave
 804b7fb: c3                           	retl

0804b7fc <do_distrib>:
 804b7fc: 55                           	pushl	%ebp
 804b7fd: 89 e5                        	movl	%esp, %ebp
 804b7ff: 83 ec 28                     	subl	$40, %esp
 804b802: db 45 14                     	fildl	20(%ebp)
 804b805: dd 05 c8 cb 04 08            	fldl	134532040
 804b80b: de f1                        	fdivp	%st, %st(1)
 804b80d: dd 5d f8                     	fstpl	-8(%ebp)
 804b810: c7 45 ec 00 00 00 00         	movl	$0, -20(%ebp)
 804b817: c7 45 e8 00 00 00 00         	movl	$0, -24(%ebp)
 804b81e: c7 45 f4 00 00 00 00         	movl	$0, -12(%ebp)
 804b825: 8b 45 f4                     	movl	-12(%ebp), %eax
 804b828: 3b 45 0c                     	cmpl	12(%ebp), %eax
 804b82b: 0f 8d 80 00 00 00            	jge	0x804b8b1 <do_distrib+0xb5>
 804b831: 81 7d ec ff 03 00 00         	cmpl	$1023, -20(%ebp)
 804b838: 7f 77                        	jg	0x804b8b1 <do_distrib+0xb5>
 804b83a: 8b 45 f4                     	movl	-12(%ebp), %eax
 804b83d: 8d 14 85 00 00 00 00         	leal	(,%eax,4), %edx
 804b844: 8b 45 08                     	movl	8(%ebp), %eax
 804b847: 8b 14 02                     	movl	(%edx,%eax), %edx
 804b84a: 8d 45 e8                     	leal	-24(%ebp), %eax
 804b84d: 01 10                        	addl	%edx, (%eax)
 804b84f: db 45 e8                     	fildl	-24(%ebp)
 804b852: dc 4d f8                     	fmull	-8(%ebp)
 804b855: dd 1c 24                     	fstpl	(%esp)
 804b858: e8 73 d3 ff ff               	calll	0x8048bd0 <.plt+0x120>
 804b85d: d9 7d e6                     	fnstcw	-26(%ebp)
 804b860: 0f b7 45 e6                  	movzwl	-26(%ebp), %eax
 804b864: 66 0d 00 0c                  	orw	$3072, %ax
 804b868: 66 89 45 e4                  	movw	%ax, -28(%ebp)
 804b86c: d9 6d e4                     	fldcw	-28(%ebp)
 804b86f: db 5d f0                     	fistpl	-16(%ebp)
 804b872: d9 6d e6                     	fldcw	-26(%ebp)
 804b875: 81 7d f0 00 04 00 00         	cmpl	$1024, -16(%ebp)
 804b87c: 7e 07                        	jle	0x804b885 <do_distrib+0x89>
 804b87e: c7 45 f0 00 04 00 00         	movl	$1024, -16(%ebp)
 804b885: 8b 45 ec                     	movl	-20(%ebp), %eax
 804b888: 3b 45 f0                     	cmpl	-16(%ebp), %eax
 804b88b: 7d 1a                        	jge	0x804b8a7 <do_distrib+0xab>
 804b88d: 8b 45 ec                     	movl	-20(%ebp), %eax
 804b890: 89 c2                        	movl	%eax, %edx
 804b892: 8b 45 f4                     	movl	-12(%ebp), %eax
 804b895: 0f af 45 10                  	imull	16(%ebp), %eax
 804b899: 89 04 95 20 e4 04 08         	movl	%eax, 134538272(,%edx,4)
 804b8a0: 8d 45 ec                     	leal	-20(%ebp), %eax
 804b8a3: ff 00                        	incl	(%eax)
 804b8a5: eb de                        	jmp	0x804b885 <do_distrib+0x89>
 804b8a7: 8d 45 f4                     	leal	-12(%ebp), %eax
 804b8aa: ff 00                        	incl	(%eax)
 804b8ac: e9 74 ff ff ff               	jmp	0x804b825 <do_distrib+0x29>
 804b8b1: c9                           	leave
 804b8b2: c3                           	retl

0804b8b3 <ReadDistrib>:
 804b8b3: 55                           	pushl	%ebp
 804b8b4: 89 e5                        	movl	%esp, %ebp
 804b8b6: 81 ec e8 2f 00 00            	subl	$12264, %esp
 804b8bc: c7 44 24 08 a0 0f 00 00      	movl	$4000, 8(%esp)
 804b8c4: c7 44 24 04 00 00 00 00      	movl	$0, 4(%esp)
 804b8cc: 8d 85 48 d0 ff ff            	leal	-12216(%ebp), %eax
 804b8d2: 89 04 24                     	movl	%eax, (%esp)
 804b8d5: e8 46 d4 ff ff               	calll	0x8048d20 <.plt+0x270>
 804b8da: c7 85 3c d0 ff ff 00 00 00 00	movl	$0, -12228(%ebp)
 804b8e4: c7 44 24 04 94 c8 04 08      	movl	$134531220, 4(%esp)
 804b8ec: 8b 45 08                     	movl	8(%ebp), %eax
 804b8ef: 89 04 24                     	movl	%eax, (%esp)
 804b8f2: e8 39 d4 ff ff               	calll	0x8048d30 <.plt+0x280>
 804b8f7: 89 85 34 d0 ff ff            	movl	%eax, -12236(%ebp)
 804b8fd: 83 bd 34 d0 ff ff 00         	cmpl	$0, -12236(%ebp)
 804b904: 75 1a                        	jne	0x804b920 <ReadDistrib+0x6d>
 804b906: 8b 45 08                     	movl	8(%ebp), %eax
 804b909: 89 04 24                     	movl	%eax, (%esp)
 804b90c: e8 df d1 ff ff               	calll	0x8048af0 <.plt+0x40>
 804b911: c7 85 30 d0 ff ff 00 00 00 00	movl	$0, -12240(%ebp)
 804b91b: e9 91 01 00 00               	jmp	0x804bab1 <ReadDistrib+0x1fe>
 804b920: 8b 85 34 d0 ff ff            	movl	-12236(%ebp), %eax
 804b926: 89 44 24 08                  	movl	%eax, 8(%esp)
 804b92a: c7 44 24 04 00 20 00 00      	movl	$8192, 4(%esp)
 804b932: 8d 85 f8 df ff ff            	leal	-8200(%ebp), %eax
 804b938: 89 04 24                     	movl	%eax, (%esp)
 804b93b: e8 d0 d2 ff ff               	calll	0x8048c10 <.plt+0x160>
 804b940: 85 c0                        	testl	%eax, %eax
 804b942: 75 05                        	jne	0x804b949 <ReadDistrib+0x96>
 804b944: e9 4b 01 00 00               	jmp	0x804ba94 <ReadDistrib+0x1e1>
 804b949: 8d 85 f8 df ff ff            	leal	-8200(%ebp), %eax
 804b94f: 89 85 f4 df ff ff            	movl	%eax, -8204(%ebp)
 804b955: 8b 85 f4 df ff ff            	movl	-8204(%ebp), %eax
 804b95b: 80 38 00                     	cmpb	$0, (%eax)
 804b95e: 74 3d                        	je	0x804b99d <ReadDistrib+0xea>
 804b960: 8b 85 f4 df ff ff            	movl	-8204(%ebp), %eax
 804b966: 80 38 0a                     	cmpb	$10, (%eax)
 804b969: 74 32                        	je	0x804b99d <ReadDistrib+0xea>
 804b96b: e8 00 d4 ff ff               	calll	0x8048d70 <.plt+0x2c0>
 804b970: 89 c1                        	movl	%eax, %ecx
 804b972: 8b 85 f4 df ff ff            	movl	-8204(%ebp), %eax
 804b978: 0f be 00                     	movsbl	(%eax), %eax
 804b97b: 8d 14 00                     	leal	(%eax,%eax), %edx
 804b97e: 8b 01                        	movl	(%ecx), %eax
 804b980: 0f b7 04 02                  	movzwl	(%edx,%eax), %eax
 804b984: c1 e8 0b                     	shrl	$11, %eax
 804b987: 83 e0 01                     	andl	$1, %eax
 804b98a: 85 c0                        	testl	%eax, %eax
 804b98c: 75 05                        	jne	0x804b993 <ReadDistrib+0xe0>
 804b98e: e9 01 01 00 00               	jmp	0x804ba94 <ReadDistrib+0x1e1>
 804b993: 8d 85 f4 df ff ff            	leal	-8204(%ebp), %eax
 804b999: ff 00                        	incl	(%eax)
 804b99b: eb b8                        	jmp	0x804b955 <ReadDistrib+0xa2>
 804b99d: 8d 85 f8 df ff ff            	leal	-8200(%ebp), %eax
 804b9a3: 89 04 24                     	movl	%eax, (%esp)
 804b9a6: e8 45 d3 ff ff               	calll	0x8048cf0 <.plt+0x240>
 804b9ab: 89 85 38 d0 ff ff            	movl	%eax, -12232(%ebp)
 804b9b1: 83 bd 38 d0 ff ff 00         	cmpl	$0, -12232(%ebp)
 804b9b8: 0f 88 d6 00 00 00            	js	0x804ba94 <ReadDistrib+0x1e1>
 804b9be: 81 bd 38 d0 ff ff e8 03 00 00	cmpl	$1000, -12232(%ebp)
 804b9c8: 0f 8f c6 00 00 00            	jg	0x804ba94 <ReadDistrib+0x1e1>
 804b9ce: c7 85 40 d0 ff ff 00 00 00 00	movl	$0, -12224(%ebp)
 804b9d8: 81 bd 40 d0 ff ff e7 03 00 00	cmpl	$999, -12224(%ebp)
 804b9e2: 7f 6a                        	jg	0x804ba4e <ReadDistrib+0x19b>
 804b9e4: 8b 85 34 d0 ff ff            	movl	-12236(%ebp), %eax
 804b9ea: 89 44 24 08                  	movl	%eax, 8(%esp)
 804b9ee: c7 44 24 04 00 20 00 00      	movl	$8192, 4(%esp)
 804b9f6: 8d 85 f8 df ff ff            	leal	-8200(%ebp), %eax
 804b9fc: 89 04 24                     	movl	%eax, (%esp)
 804b9ff: e8 0c d2 ff ff               	calll	0x8048c10 <.plt+0x160>
 804ba04: 85 c0                        	testl	%eax, %eax
 804ba06: 75 02                        	jne	0x804ba0a <ReadDistrib+0x157>
 804ba08: eb 44                        	jmp	0x804ba4e <ReadDistrib+0x19b>
 804ba0a: c6 45 f7 00                  	movb	$0, -9(%ebp)
 804ba0e: 8d 85 f8 df ff ff            	leal	-8200(%ebp), %eax
 804ba14: 89 04 24                     	movl	%eax, (%esp)
 804ba17: e8 14 d2 ff ff               	calll	0x8048c30 <.plt+0x180>
 804ba1c: 48                           	decl	%eax
 804ba1d: 89 85 44 d0 ff ff            	movl	%eax, -12220(%ebp)
 804ba23: 8b 95 40 d0 ff ff            	movl	-12224(%ebp), %edx
 804ba29: 8b 85 44 d0 ff ff            	movl	-12220(%ebp), %eax
 804ba2f: 89 84 95 48 d0 ff ff         	movl	%eax, -12216(%ebp,%edx,4)
 804ba36: 8b 95 44 d0 ff ff            	movl	-12220(%ebp), %edx
 804ba3c: 8d 85 3c d0 ff ff            	leal	-12228(%ebp), %eax
 804ba42: 01 10                        	addl	%edx, (%eax)
 804ba44: 8d 85 40 d0 ff ff            	leal	-12224(%ebp), %eax
 804ba4a: ff 00                        	incl	(%eax)
 804ba4c: eb 8a                        	jmp	0x804b9d8 <ReadDistrib+0x125>
 804ba4e: 8b 85 3c d0 ff ff            	movl	-12228(%ebp), %eax
 804ba54: 89 44 24 0c                  	movl	%eax, 12(%esp)
 804ba58: 8b 85 38 d0 ff ff            	movl	-12232(%ebp), %eax
 804ba5e: 89 44 24 08                  	movl	%eax, 8(%esp)
 804ba62: 8b 85 40 d0 ff ff            	movl	-12224(%ebp), %eax
 804ba68: 89 44 24 04                  	movl	%eax, 4(%esp)
 804ba6c: 8d 85 48 d0 ff ff            	leal	-12216(%ebp), %eax
 804ba72: 89 04 24                     	movl	%eax, (%esp)
 804ba75: e8 82 fd ff ff               	calll	0x804b7fc <do_distrib>
 804ba7a: 8b 85 34 d0 ff ff            	movl	-12236(%ebp), %eax
 804ba80: 89 04 24                     	movl	%eax, (%esp)
 804ba83: e8 18 d2 ff ff               	calll	0x8048ca0 <.plt+0x1f0>
 804ba88: c7 85 30 d0 ff ff 01 00 00 00	movl	$1, -12240(%ebp)
 804ba92: eb 1d                        	jmp	0x804bab1 <ReadDistrib+0x1fe>
 804ba94: 8b 45 08                     	movl	8(%ebp), %eax
 804ba97: 89 44 24 04                  	movl	%eax, 4(%esp)
 804ba9b: c7 04 24 d0 cb 04 08         	movl	$134532048, (%esp)
 804baa2: e8 c9 d1 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804baa7: c7 85 30 d0 ff ff 00 00 00 00	movl	$0, -12240(%ebp)
 804bab1: 8b 85 30 d0 ff ff            	movl	-12240(%ebp), %eax
 804bab7: c9                           	leave
 804bab8: c3                           	retl

0804bab9 <BuildDistrib>:
 804bab9: 55                           	pushl	%ebp
 804baba: 89 e5                        	movl	%esp, %ebp
 804babc: 53                           	pushl	%ebx
 804babd: 81 ec e4 0f 00 00            	subl	$4068, %esp
 804bac3: 83 7d 0c 02                  	cmpl	$2, 12(%ebp)
 804bac7: 75 7d                        	jne	0x804bb46 <BuildDistrib+0x8d>
 804bac9: 81 7d 08 10 27 00 00         	cmpl	$10000, 8(%ebp)
 804bad0: 7e 2a                        	jle	0x804bafc <BuildDistrib+0x43>
 804bad2: c7 44 24 08 10 27 00 00      	movl	$10000, 8(%esp)
 804bada: 8b 45 08                     	movl	8(%ebp), %eax
 804badd: 89 44 24 04                  	movl	%eax, 4(%esp)
 804bae1: c7 04 24 f8 cb 04 08         	movl	$134532088, (%esp)
 804bae8: e8 83 d1 ff ff               	calll	0x8048c70 <.plt+0x1c0>
 804baed: c7 85 30 f0 ff ff 00 00 00 00	movl	$0, -4048(%ebp)
 804baf7: e9 36 01 00 00               	jmp	0x804bc32 <BuildDistrib+0x179>
 804bafc: 83 7d 08 00                  	cmpl	$0, 8(%ebp)
 804bb00: 75 10                        	jne	0x804bb12 <BuildDistrib+0x59>
 804bb02: c7 45 e0 01 00 00 00         	movl	$1, -32(%ebp)
 804bb09: c7 45 e4 00 00 00 00         	movl	$0, -28(%ebp)
 804bb10: eb 0d                        	jmp	0x804bb1f <BuildDistrib+0x66>
 804bb12: c7 45 e0 00 00 00 00         	movl	$0, -32(%ebp)
 804bb19: 8b 45 08                     	movl	8(%ebp), %eax
 804bb1c: 89 45 e4                     	movl	%eax, -28(%ebp)
 804bb1f: c7 44 24 0c 01 00 00 00      	movl	$1, 12(%esp)
 804bb27: 8b 45 08                     	movl	8(%ebp), %eax
 804bb2a: 89 44 24 08                  	movl	%eax, 8(%esp)
 804bb2e: c7 44 24 04 02 00 00 00      	movl	$2, 4(%esp)
 804bb36: 8d 45 e0                     	leal	-32(%ebp), %eax
 804bb39: 89 04 24                     	movl	%eax, (%esp)
 804bb3c: e8 bb fc ff ff               	calll	0x804b7fc <do_distrib>
 804bb41: e9 d2 00 00 00               	jmp	0x804bc18 <BuildDistrib+0x15f>
 804bb46: db 45 08                     	fildl	8(%ebp)
 804bb49: db 45 08                     	fildl	8(%ebp)
 804bb4c: d9 e8                        	fld1
 804bb4e: de c1                        	faddp	%st, %st(1)
 804bb50: de f9                        	fdivrp	%st, %st(1)
 804bb52: dd 1c 24                     	fstpl	(%esp)
 804bb55: e8 26 d2 ff ff               	calll	0x8048d80 <.plt+0x2d0>
 804bb5a: d9 e0                        	fchs
 804bb5c: dd 5d e8                     	fstpl	-24(%ebp)
 804bb5f: c7 45 f0 00 00 00 00         	movl	$0, -16(%ebp)
 804bb66: c7 45 f4 00 00 00 00         	movl	$0, -12(%ebp)
 804bb6d: 81 7d f4 e7 03 00 00         	cmpl	$999, -12(%ebp)
 804bb74: 7f 7d                        	jg	0x804bbf3 <BuildDistrib+0x13a>
 804bb76: 8b 5d f4                     	movl	-12(%ebp), %ebx
 804bb79: dd 45 e8                     	fldl	-24(%ebp)
 804bb7c: dd 05 20 cc 04 08            	fldl	134532128
 804bb82: de c9                        	fmulp	%st, %st(1)
 804bb84: dd 9d 28 f0 ff ff            	fstpl	-4056(%ebp)
 804bb8a: dd 45 e8                     	fldl	-24(%ebp)
 804bb8d: d9 e0                        	fchs
 804bb8f: db 45 f4                     	fildl	-12(%ebp)
 804bb92: de c9                        	fmulp	%st, %st(1)
 804bb94: dd 05 28 cc 04 08            	fldl	134532136
 804bb9a: de c9                        	fmulp	%st, %st(1)
 804bb9c: dd 1c 24                     	fstpl	(%esp)
 804bb9f: e8 bc d0 ff ff               	calll	0x8048c60 <.plt+0x1b0>
 804bba4: dc 8d 28 f0 ff ff            	fmull	-4056(%ebp)
 804bbaa: dd 1c 24                     	fstpl	(%esp)
 804bbad: e8 1e d0 ff ff               	calll	0x8048bd0 <.plt+0x120>
 804bbb2: d9 bd 36 f0 ff ff            	fnstcw	-4042(%ebp)
 804bbb8: 0f b7 85 36 f0 ff ff         	movzwl	-4042(%ebp), %eax
 804bbbf: 66 0d 00 0c                  	orw	$3072, %ax
 804bbc3: 66 89 85 34 f0 ff ff         	movw	%ax, -4044(%ebp)
 804bbca: d9 ad 34 f0 ff ff            	fldcw	-4044(%ebp)
 804bbd0: db 9c 9d 38 f0 ff ff         	fistpl	-4040(%ebp,%ebx,4)
 804bbd7: d9 ad 36 f0 ff ff            	fldcw	-4042(%ebp)
 804bbdd: 8b 94 9d 38 f0 ff ff         	movl	-4040(%ebp,%ebx,4), %edx
 804bbe4: 8d 45 f0                     	leal	-16(%ebp), %eax
 804bbe7: 01 10                        	addl	%edx, (%eax)
 804bbe9: 8d 45 f4                     	leal	-12(%ebp), %eax
 804bbec: ff 00                        	incl	(%eax)
 804bbee: e9 7a ff ff ff               	jmp	0x804bb6d <BuildDistrib+0xb4>
 804bbf3: 8b 45 f0                     	movl	-16(%ebp), %eax
 804bbf6: 89 44 24 0c                  	movl	%eax, 12(%esp)
 804bbfa: c7 44 24 08 0a 00 00 00      	movl	$10, 8(%esp)
 804bc02: c7 44 24 04 e8 03 00 00      	movl	$1000, 4(%esp)
 804bc0a: 8d 85 38 f0 ff ff            	leal	-4040(%ebp), %eax
 804bc10: 89 04 24                     	movl	%eax, (%esp)
 804bc13: e8 e4 fb ff ff               	calll	0x804b7fc <do_distrib>
 804bc18: 8b 45 0c                     	movl	12(%ebp), %eax
 804bc1b: a3 28 d0 04 08               	movl	%eax, 134533160
 804bc20: 8b 45 08                     	movl	8(%ebp), %eax
 804bc23: a3 2c d0 04 08               	movl	%eax, 134533164
 804bc28: c7 85 30 f0 ff ff 01 00 00 00	movl	$1, -4048(%ebp)
 804bc32: 8b 85 30 f0 ff ff            	movl	-4048(%ebp), %eax
 804bc38: 81 c4 e4 0f 00 00            	addl	$4068, %esp
 804bc3e: 5b                           	popl	%ebx
 804bc3f: 5d                           	popl	%ebp
 804bc40: c3                           	retl
 804bc41: 90                           	nop
 804bc42: 90                           	nop
 804bc43: 90                           	nop

0804bc44 <__libc_csu_init>:
 804bc44: 55                           	pushl	%ebp
 804bc45: 89 e5                        	movl	%esp, %ebp
 804bc47: 57                           	pushl	%edi
 804bc48: 56                           	pushl	%esi
 804bc49: 53                           	pushl	%ebx
 804bc4a: 83 ec 0c                     	subl	$12, %esp
 804bc4d: e8 00 00 00 00               	calll	0x804bc52 <__libc_csu_init+0xe>
 804bc52: 5b                           	popl	%ebx
 804bc53: 81 c3 fa 15 00 00            	addl	$5626, %ebx
 804bc59: e8 3a ce ff ff               	calll	0x8048a98 <_init>
 804bc5e: 8d 93 b4 fd ff ff            	leal	-588(%ebx), %edx
 804bc64: 8d 8b b4 fd ff ff            	leal	-588(%ebx), %ecx
 804bc6a: 29 ca                        	subl	%ecx, %edx
 804bc6c: c1 fa 02                     	sarl	$2, %edx
 804bc6f: 31 f6                        	xorl	%esi, %esi
 804bc71: 39 d6                        	cmpl	%edx, %esi
 804bc73: 73 0f                        	jae	0x804bc84 <__libc_csu_init+0x40>
 804bc75: 89 d7                        	movl	%edx, %edi
 804bc77: 90                           	nop
 804bc78: ff 94 b3 b4 fd ff ff         	calll	*-588(%ebx,%esi,4)
 804bc7f: 46                           	incl	%esi
 804bc80: 39 fe                        	cmpl	%edi, %esi
 804bc82: 72 f4                        	jb	0x804bc78 <__libc_csu_init+0x34>
 804bc84: 83 c4 0c                     	addl	$12, %esp
 804bc87: 5b                           	popl	%ebx
 804bc88: 5e                           	popl	%esi
 804bc89: 5f                           	popl	%edi
 804bc8a: c9                           	leave
 804bc8b: c3                           	retl

0804bc8c <__libc_csu_fini>:
 804bc8c: 55                           	pushl	%ebp
 804bc8d: 89 e5                        	movl	%esp, %ebp
 804bc8f: 56                           	pushl	%esi
 804bc90: 53                           	pushl	%ebx
 804bc91: e8 00 00 00 00               	calll	0x804bc96 <__libc_csu_fini+0xa>
 804bc96: 5b                           	popl	%ebx
 804bc97: 81 c3 b6 15 00 00            	addl	$5558, %ebx
 804bc9d: 8d 8b b4 fd ff ff            	leal	-588(%ebx), %ecx
 804bca3: 8d 83 b4 fd ff ff            	leal	-588(%ebx), %eax
 804bca9: 29 c1                        	subl	%eax, %ecx
 804bcab: c1 f9 02                     	sarl	$2, %ecx
 804bcae: 85 c9                        	testl	%ecx, %ecx
 804bcb0: 8d 71 ff                     	leal	-1(%ecx), %esi
 804bcb3: 75 0b                        	jne	0x804bcc0 <__libc_csu_fini+0x34>
 804bcb5: e8 3a 00 00 00               	calll	0x804bcf4 <_fini>
 804bcba: 5b                           	popl	%ebx
 804bcbb: 5e                           	popl	%esi
 804bcbc: c9                           	leave
 804bcbd: c3                           	retl
 804bcbe: 89 f6                        	movl	%esi, %esi
 804bcc0: ff 94 b3 b4 fd ff ff         	calll	*-588(%ebx,%esi,4)
 804bcc7: 89 f2                        	movl	%esi, %edx
 804bcc9: 4e                           	decl	%esi
 804bcca: 85 d2                        	testl	%edx, %edx
 804bccc: 75 f2                        	jne	0x804bcc0 <__libc_csu_fini+0x34>
 804bcce: eb e5                        	jmp	0x804bcb5 <__libc_csu_fini+0x29>

0804bcd0 <__do_global_ctors_aux>:
 804bcd0: 55                           	pushl	%ebp
 804bcd1: 89 e5                        	movl	%esp, %ebp
 804bcd3: 53                           	pushl	%ebx
 804bcd4: 83 ec 04                     	subl	$4, %esp
 804bcd7: bb 38 d2 04 08               	movl	$134533688, %ebx
 804bcdc: a1 38 d2 04 08               	movl	134533688, %eax
 804bce1: eb 07                        	jmp	0x804bcea <__do_global_ctors_aux+0x1a>
 804bce3: 83 eb 04                     	subl	$4, %ebx
 804bce6: ff d0                        	calll	*%eax
 804bce8: 8b 03                        	movl	(%ebx), %eax
 804bcea: 83 f8 ff                     	cmpl	$-1, %eax
 804bced: 75 f4                        	jne	0x804bce3 <__do_global_ctors_aux+0x13>
 804bcef: 58                           	popl	%eax
 804bcf0: 5b                           	popl	%ebx
 804bcf1: 5d                           	popl	%ebp
 804bcf2: c3                           	retl
 804bcf3: 90                           	nop

Disassembly of section .fini:

0804bcf4 <_fini>:
 804bcf4: 55                           	pushl	%ebp
 804bcf5: 89 e5                        	movl	%esp, %ebp
 804bcf7: 53                           	pushl	%ebx
 804bcf8: e8 00 00 00 00               	calll	0x804bcfd <_fini+0x9>
 804bcfd: 5b                           	popl	%ebx
 804bcfe: 81 c3 4f 15 00 00            	addl	$5455, %ebx
 804bd04: 52                           	pushl	%edx
 804bd05: e8 e6 d0 ff ff               	calll	0x8048df0 <__do_global_dtors_aux>
 804bd0a: 8b 5d fc                     	movl	-4(%ebp), %ebx
 804bd0d: c9                           	leave
 804bd0e: c3                           	retl
