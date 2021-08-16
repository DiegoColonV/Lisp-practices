;;; Paquete 3 de ejercicios

;;1
(defun ElemInPosRec-aux (elem lis pos posact)
	   (cond ((null lis) NIL)
		 ((AND (equal (first lis) elem) (= pos posact)) T)
		 (T (ElemInPosRec-aux elem (rest lis) pos (+ 1 posact)))))
(defun ElemInPosRec (elem lis pos)
	   (ElemInPosRec-aux elem lis pos 0))
(ElemInPosRec 'a '(l o a m) 2)
;;T

;;2
(defun Inicio-enRec (lis elem)
	   (cond ((null lis) NIL)
		 ((equal (first lis) elem) lis)
		 (T (Inicio-enRec (rest lis) elem))))
(Inicio-enRec '(1 2 3 4 5 6 7) 3)
;;(3 4 5 6 7)

;;3
(defun Termina-enRec (lis elem)
	   (cond ((null lis) NIL)
		 ((equal (first (last lis)) elem) lis)
		 (T (Termina-enRec (butlast lis) elem))))
(Termina-enRec '(1 2 3 4 5 6 7) 3)
;;(1 2 3)		 

;;4		 
(defun Primer-imparRec-aux (lis posact)
			      (cond ((null lis) NIL)
				    ((AND (numberp (first lis)) (oddp (first lis))) (cons (first lis) (+ 1 posact)))
				    (T (Primer-imparRec-aux (rest lis) (+ 1 posact)))))	
(defun Primer-imparRec (lis)
	   (Primer-imparRec-aux lis 0))				    	 
(Primer-imparRec '(10 a 4 b 3 6))
;;(3 . 5)		 

;;5
(defun UltimoRealRec-aux (lis cont num)
	   (cond ((null lis) (cons num cont))
		 ((AND (numberp (first (last lis)))
		      (realp (first (last lis)))
		      (> (first (last lis) ) 0)
		      (= num 0))
		  (setq num (first (last lis)))
		  (setq cont (+ 1 cont))
		  (UltimoRealRec-aux (butlast lis) cont num))
		 ((AND (equal (first (last lis)) num) (> num 0))
		  (setq cont (+ 1 cont))
		  (UltimoRealRec-aux (butlast lis) cont num))
		 (T (UltimoRealRec-aux (butlast lis) cont num)))) 
(defun UltimoRealRec (lis)
	   (UltimoRealRec-aux lis 0 0))
(UltimoRealRec '(a 3 5 b b 8 5))
;;(5 . 2)

;;6
(defun AplanaRec-aux (lis res)
	   (cond ((null lis) NIL)
		 ((atom (first lis)) 
		  (setq res (append res (list (first lis))))
		  (print res)
		  (AplanaRec-aux (rest lis) res))
		 (T 
		  (AplanaRec-aux (first lis) res)
		  (AplanaRec-aux (rest lis) res))))
(defun AplanaRec (lis) (AplanaRec-aux lis '()))
(AplanaRec '(a b l (o (8 9) l)))
;;(A) 
;;(A B) 
;;(A B L) 
;;(A B L O) 
;;(A B L O 8) 
;;(A B L O 8 9) 
;;(A B L O L) 

;;8
(defun DiagonalRec-aux (lis res x)
	   (cond ((null lis) res)
		 (T (setq res (append res (list (nth x (first lis)))))
		    (setq x (+ 1 x))
		    (DiagonalRec-Aux (rest lis) res x))))
(defun DiagonalRec (lis)
	   (DiagonalRec-Aux lis '() 0))
(DiagonalRec '((a b c) (1 2 3) (x y z)))
;;(A 2 Z)

;;9
(defun TiposRec-aux (lis res)
	   (cond ((null lis) (setq res (append res (list 'N))))
		 ((atom (first lis))
		  (setq res (append res (list 'A)))
		  (TiposRec-aux (rest lis) res))
		 ((listp (first lis))
		  (setq res (append res (list 'L)))
		  (TiposRec-aux (rest lis) res))))
(defun TiposRec (lis) (TiposRec-aux lis '()))
(TiposRec '(1 (1 2) a '()))
;;(A L A L N)

;;10
(defun Suma-numericaRec-aux (lis sum)
	   (cond ((null lis) sum)
		 ((numberp (first lis))
		  (setq sum (+ sum (first lis)))
		  (Suma-numericaRec-aux (rest lis) sum))
		 (T (Suma-numericaRec-aux (rest lis) sum))))
(defun Suma-numericaRec (lis)
	   (Suma-numericaRec-aux lis 0))
(suma-numericarec '(10 5 y 2 1 e))
;;18

;;11
;;No obtuve el resultado

;;12
(defun FiltraMultiplosRec-aux (lis num res)
	   (cond ((null lis) res)
		 ((numberp (first lis))
		  (if (> (mod (first lis) num) 0) 
		       (setq res (append res (list (first lis)))))
		  (FiltraMultiplosRec-aux (rest lis) num res))
		 (T (FiltraMultiplosRec-aux (rest lis) num res))))
(defun FiltraMultiplosRec (lis num) (FiltraMultiplosRec-aux lis num '()))
(filtramultiplosrec '(5 7 10 6 9 0 15 8 ) 5)
;;(7 6 9 8)

;;13
(defun CeldasRec-aux (lis res)
	   (cond ((null lis) res)
		 ((consp (first lis))
		  (setq res (+ res 1))
		  (CeldasRec-aux (rest lis) res ))
		 (T (CeldasRec-aux (rest lis) res ))))
(defun CeldasRec (lis) (CeldasRec-aux lis 0))
(CeldasRec '(a g (cons 1 5) (cons 8 g) l)) 
;;2

;;14
(defun ImplicaRec-aux (lis ant)
	   (cond ((null lis) T)
		 ((AND ant (not (first lis)))
		  NIL)
		 (T (ImplicaRec-aux (rest lis) (first lis)))))
(defun ImplicaRec (&rest args)
	   (ImplicaRec-aux args NIL))
(ImplicaRec T NIL)
;;NIL	

;;15
;;No obtuve el resultado	 
		 
;;16
(defun CambioRec-aux (lis e1 e2 res)
	   (cond ((null lis) res)
		 ((equal e1 (first lis)) 
		  (setq res (append res (list e2)))
		  (CambioRec-aux (rest lis) e1 e2 res))
		 ((equal e2 (first lis)) 
		  (setq res (append res (list e1)))
		  (CambioRec-aux (rest lis) e1 e2 res))
		 (T 
		  (setq res (append res (list (first lis))))
		  (CambioRec-aux (rest lis) e1 e2 res))))
(defun CambioRec (lis e1 e2) (CambioRec-aux lis e1 e2 '()))
(CambioRec '(a a g h y b a b b l a) 'a 'b)
;(B B G H Y A B A A L B)


;;17 
;;"Naive recursive computation of the nth element of the Fibonacci sequence" 
;;(mi computadora solo soportó hasta 40)
;(time (fib 40))
;Evaluation took:
;  16.430 seconds of real time
;  16.366050 seconds of total run time (16.313892 user, 0.052158 system)
;  99.61% CPU
;  49,288,939,677 processor cycles
;  0 bytes consed 
;102334155

;; "Tail-recursive computation of the nth element of the Fibonacci sequence"
;(time (fib 50))
;Evaluation took:
;  0.000 seconds of real time
;  0.000008 seconds of total run time (0.000000 user, 0.000008 system)
;  100.00% CPU
;  10,354 processor cycles
;  0 bytes consed
;12586269025

;;"loop-based iterative computation of the nth element of the Fibonacci sequence"
;(time (fib 50))
;Evaluation took:
;  0.000 seconds of real time
;  0.000009 seconds of total run time (0.000000 user, 0.000009 system)
;  100.00% CPU
;  9,385 processor cycles
;  0 bytes consed  
;12586269025

;;"do-based iterative computation of the nth element of the Fibonacci sequence"
;(time (fib 50))
;Evaluation took:
;  0.000 seconds of real time
;  0.000008 seconds of total run time (0.000008 user, 0.000000 system)
;  100.00% CPU
;  8,317 processor cycles
;  0 bytes consed
;12586269025

;;"CPS computation of the nth element of the Fibonacci sequence"
;(time (fib 50))
;Evaluation took:
;  0.000 seconds of real time
;  0.000007 seconds of total run time (0.000007 user, 0.000000 system)
;  100.00% CPU
;  11,623 processor cycles
;  0 bytes consed
;12586269025

;;"Successive squaring method from SICP"
;(time (fib 50))
;Evaluation took:
;  0.000 seconds of real time
;  0.000006 seconds of total run time (0.000006 user, 0.000000 system)
;  100.00% CPU
;  7,863 processor cycles
;  0 bytes consed
;12586269025

;;
;(time (fib 50))
;Evaluation took:
;  0.000 seconds of real time
;  0.000011 seconds of total run time (0.000011 user, 0.000000 system)
;  100.00% CPU
;  22,171 processor cycles
;  0 bytes consed
;12586269025

;; Taken from Winston's Lisp, 3rd edition, this is a tail-recursive version, w/o an auxiliary function
;(time (fib 50))
;Evaluation took:
;  0.000 seconds of real time
;  0.000008 seconds of total run time (0.000008 user, 0.000000 system)
;  100.00% CPU
;  13,657 processor cycles
;  0 bytes consed
;12586269025


;;;Original code by Arnold Schoenhage, 
;;;translated to Scheme by Bradley J. Lucier (2004), 
;;;and adapted to Common Lisp by Nicolas Neuss.
;(time (fast-fib-pair 50))
;Evaluation took:
;  0.000 seconds of real time
;  0.000060 seconds of total run time (0.000060 user, 0.000000 system)
;  100.00% CPU
;  10,555 processor cycles
;  0 bytes consed
;12586269025
;20365011074

;; Fibonacci - Binet's Formula
;(time (fib 50))
;Evaluation took:
;  0.000 seconds of real time
;  0.000022 seconds of total run time (0.000022 user, 0.000000 system)
;  100.00% CPU
;  53,639 processor cycles
;  0 bytes consed
;1.2586275e10

;;19
;Se repite el ejercicio 7

;;20
(defun Elimina-aux (lis n res)
	   (cond ((null lis) res)
		 ((not (numberp (first lis)))
		  (Elimina-aux (rest lis) n res))
		 ((AND (numberp (first lis)) (<= (first lis) n))
		  (Elimina-aux (rest lis) n res))
		 (T 
		  (setq res (append res (list (first lis))))
		  (Elimina-aux (rest lis) n res))))
(defun Elimina (lis n) (Elimina-aux lis n '()))
(Elimina '(15 r 7 38 d 3 66) 10)
		 
;;21 (Se utilizó la CambioRec del ejercicio 16)
(defun PegaYCambia (l1 l2 e1 e2)
	   (CambioRec (append l1 l2) e1 e2))
(PegaYCambia '(5 6 5 5 7 2) '(7 4 5 2 2 7) 5 7)
;;(7 6 7 7 5 2 5 4 7 2 2 5)	   		 
		 
		 











		 
