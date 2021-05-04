start:
    MOVI R1, 3		; R1 <- 3                                                       (0)
    MOVI R2, 1		; R2 <- 1                                                       (1)
    NEG R2          ; R2 <- -R2 [-1]                                                (2)    
    ADD R7, R1		; R7 <- R7 + R1                                                 (3)
    ADD R1, R2		; R1 <- R1 + R2                                                 (4)
    JZR R1,7		; If R1 = 0 jump to line 7                                      (5)
    JZR R0,3		; If R0 = 0 (this condition is true by default)jump to line 3   (6)
    JZR R0,7		; if R0 =0 jump to line 7                                       (7)