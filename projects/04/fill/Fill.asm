// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(MAIN)
    @KBD
    D=M
    @WHITE
    D;JEQ
    @BLACK
    0;JMP

(BLACK)
    @bw
    M=-1
    @DO
    0;JMP

(WHITE)
    @bw
    M=0
    @DO
    0;JMP

(DO)
    @8191
    D=A
    @i
    M=D

(SCREENLOOP)
    @i
    D=M
    @MAIN
    D;JLT

    @i
    D=M
    @SCREEN

    D=A+D
    @addrs
    M=D

    @bw
    D=M
    @addrs
    A=M
    M=D

    @i
    M=M-1
    @SCREENLOOP
    0;JMP


(END)
    @END
    0;JMP
