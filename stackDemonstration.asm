;--------------------------------------------------------------------------------------
; Description: Demonstates the behaviors of stack, push and pop instructions
; Author name: Koichi Nakata
; Author email: kanakta595@insite.4cd.edu
; Last modified date: March 7, 2024
; Creation date: March 7, 2024
;--------------------------------------------------------------------------------------


INCLUDE Irvine32.inc

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: dword

.data
aVal dword 121212h
bVal dword 343434h

.code
main PROC
	mov eax, aVal
	mov ebx, bVal
	call DumpRegs

	call exchangeEaxAndEbx
	call DumpRegs

	INVOKE ExitProcess, 0
main ENDP

;--------------------------------------------------------------------------------------
; exchangeEaxAndEbx
; Exchanges values in EAX and EBX registers, only using push and pop instructions
; Receives: EAX = some 8-byte value
;			EBX = some 8-byte value
; Returns: void
;--------------------------------------------------------------------------------------
exchangeEaxAndEbx PROC
	push eax	; stack = {eaxVal} -> top
	push ebx	; stack = {eaxVal, ebxVal} -> top

	pop	 eax	; stack = {eaxVal}, ebxVal popped to eax	
	pop  ebx	; stack = {}, eaxVal popped to ebx
	ret			; Pops return address to eip 
exchangeEaxAndEbx ENDP

END main