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

// prev stores KBD's value from prev iteration
@prev
M = 0

(LOOP)
  @KBD
  D = M

  @prev
  D = D - M
  @SAMECOLOR // If color doesn't need to be changed
  D; JEQ

  // If color needs to be changed
  @KBD
  D = M
  @prev // save KBD value to prev
  M = D
  @WHITEN
  D; JEQ

  // BLACKEN
  @pixelvalue
  M = -1
  @CHANGECOLOR
  0; JMP

  (WHITEN)
    @pixelvalue
    M = 0
    @CHANGECOLOR
    0; JMP

  (CHANGECOLOR)
    // for loop to set all pixels to pixelvalue

    // Set iterator i to zero
    @i
    M = 0

    // Total number of pixels numpix
    @8192
    D = A
    @numpix
    M = D

    (SETSCREEN)
      // Test if all pixels are done?
      @i
      D = M
      @numpix
      D = D - M
      @LOOP
      D; JEQ // All pixels done

      // selected pixel selpix
      @i
      D = M
      @SCREEN
      D = D + A
      @selpix
      M = D

      // change selected pixel's value
      @pixelvalue
      D = M
      @selpix
      A = M
      M = D

      // increment iterator i
      @i
      M = M + 1

      // Loop back for more pixels
      @SETSCREEN
      0; JMP

  (SAMECOLOR)
    @LOOP
    0; JMP
