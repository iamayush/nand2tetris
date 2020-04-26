// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// Init R2 to zero
@R2
M = 0

// iterator starts at zero
@iter
M = 0 // iter = 0

// loop to add R1 R0 times
(LOOP)
  @R0
  D = M
  @iter
  D = M - D
  @STOP
  D; JEQ

  // Add
  @R1
  D = M
  @R2
  M = D + M

  // Increment iter
  @iter
  M = M + 1

  // Loop again
  @LOOP
  0; JMP

// Stop
(STOP)
  @STOP
  0; JMP
