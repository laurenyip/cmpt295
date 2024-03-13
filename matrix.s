    .globl    copy
# ***** Version 2 *****
copy:
# A in %rdi, C in %rsi, N in %edx

# Using A and C as pointers

# This function is not a "caller", i.e., it does not call functions. 
# It is a leaf function (a callee). 
# Hence it does not have the responsibility of saving "caller-saved" registers 
# such as %rax, %rdi, %rsi, %rdx, %rcx, %r8 and %r9.
# This signifies that it can use these registers without 
# first saving their content if it needs to use registers.

# Set up registers
    xorl %eax, %eax            # set %eax to 0
    xorl %ecx, %ecx            # i = 0 (row index i is in %ecx)

# For each row
rowLoop:
    xorl %r8d, %r8d            # j = 0 (column index j in %r8d)
    cmpl %edx, %ecx            # while i < N (i - N < 0)
    jge doneWithRows

# For each cell of this row
colLoop:
    cmpl %edx, %r8d            # while j < N (j - N < 0)
    jge doneWithCells

# Copy the element A points to (%rdi) to the cell C points to (%rsi)
    movb (%rdi), %r9b          # temp = element A points to
    movb %r9b, (%rsi)          # cell C points to = temp

# Update A and C so they now point to their next element 
    incq %rdi
    incq %rsi

    incl %r8d                  # j++ (column index in %r8d)
    jmp colLoop                # go to next cell

# Go to next row
doneWithCells:
    incl %ecx                  # i++ (row index in %ecx)
    jmp rowLoop                # go to next row

doneWithRows:                  # bye! bye!
    ret


#####################
	.globl	transpose
transpose:
    xorl %eax, %eax            # Clear %eax (i = 0)
    movl %edx, %ecx            # Copy N to %ecx (N is used as a loop counter)
outerLoop:
    movl %eax, %r8d            # Copy i to %r8d (i is the row index)
    leaq (%rdi,%rax), %r9      # Calculate the address of A[i][i] (diagonal element)
innerLoop:
    movb (%r9), %cl            # Load A[i][i] into %cl
    movb (%rdi,%r8), %al       # Load A[i][j] into %al
    movb %al, (%r9)            # Store A[i][i] at A[j][i]
    movb %cl, (%rdi,%r8)       # Store A[i][j] at A[i][i] (transposing)
    incq %r9                   # Move to the next element in the same column
    addq $1, %r8               # Move to the next element in the same row
    loop innerLoop             # Loop until N times for each row
    incq %rax                  # Increment i
    loop outerLoop             # Loop until i reaches N
    ret                         # Return


#####################
	.globl	reverseColumns
reverseColumns:
    xorl %eax, %eax            # Clear %eax (i = 0)
    movl %edx, %ecx            # Copy N to %ecx (N is used as a loop counter)
outLoop:
    movl %eax, %r8d            # Copy i to %r8d (i is the row index)
    movl $0, %r9d              # Initialize %r9d (j is the column index)
inLoop:
    movb (%rdi,%r9), %al       # Load A[i][j] into %al
    movb (%rdi,%rcx), %cl      # Load A[i][N-j-1] into %cl
    movb %cl, (%rdi,%r9)       # Store A[i][j] with A[i][N-j-1] (reversing)
    movb %al, (%rdi,%rcx)      # Store A[i][N-j-1] with A[i][j]
    incq %r9                   # Increment j
    decl %ecx                  # Decrement N-j-1
    cmpl %eax, %ecx            # Compare i and N-j-1
    jg inLoop                  # Repeat if i < N-j-1
    incq %rax                  # Increment i
    loop outLoop               # Loop until i reaches N
    ret                        # Return
    