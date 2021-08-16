;;; Paquete 2 de ejercicios

;;1
(defun ElemInPos (elem lista pos) 
	   (if (equal (nth pos lista) elem) T NIL))
(eleminpos 2 '(1 2 3) 1)
;;T

;;2
(defun Inicio-en (list elem)
	   (let ((res '()) (b NIL))
	     (dolist (i list res)
	       (if (equal elem i) (setq b T))
	       (if b (setq res (list res i))))))
(inicio-en '(a b c d e f) 'd)
()
;;3
(defun Termina-en (list elem)
	   (let ((res '()) (b T))
	     (dolist (i list res)
	       (if b (setq res (list res i)))
	       (if (equal elem i) (setq b NIL)))))
(termina-en '(a b c d e f) 'd)

;;4
(defun primer-impar (list)
	   (let ((res '()) (b T))
	     (dotimes (i (length list) res)
	       (if (AND (numberp (nth i list)) b)
		   (if (> (mod (nth i list) 2) 0)
		       (setq res (cons (nth i list) (+ i 1))))))))
(primer-impar '(2 a b 6 c 7))
;;(7 . 6)

;;5
(defun UltimoElem (list)
	   (let ((n 0) (con 1) (res '()))
	   (loop for x downfrom (- (length list) 1) to 0 do
	     (if (realp (nth x list))
		 (if (> (nth x list) 0)
		     (if (= n 0)
			 (setq n (nth x list)) 
			 (if (= (nth x list) n)
			     (setq con (+ con 1)))))))
	     (setq res (cons n con) )))
(ultimoelem '(a 2 2 3 r 8 2 4 2))
;;(2 . 4)

;;6
(defun Conteo (list) 
	   (let ((res '()) (conn 0) (conl 0))
	     (dolist (x list res)
	       (cond ((numberp x) (setq conn (+ conn 1)))
		     ((listp x) (setq conl (+ conl 1)))))
	     (setq res (cons conn conl))))
(conteo '((a b) 1 5 e '() 4 y 4))
;;(4 . 2)	     

;;7	     
(defun Aplana (lis)
	   (let ((res '()))
		(dolist (x lis res)
		  (if (listp x)
		  (setq res (append res x))
		  (setq res (append res (list x)))))))
(aplana '((b g) 4 8 (8 i) a ( 6 v)))
;;(B G 4 8 8 I A 6 V)		  	     

;;8	     
(defun Diagonal (lista)
	   (let ((res '()) (con 0))
	     (dolist (x lista res)
	       (setq res (append res (list (nth con x))))
	       (setq con (+ con 1)))))	     
(diagonal '((a b c) (1 2 3) (x y z)))
;;(A 2 Z)

;;9	     
(defun Tipos (lis)
	   (let ((res '()))
	   (dolist (x lis res)
	     (typecase x 
	       (atom (setq res (append res (list 'A))))
	       (list (if (= 0 (length x)) 
			 (setq res (append res (list 'N)))
			 (setq res (append res (list 'L)))))))))	     
(tipos '(a (1 2) '() '(1 3) 2))
;;(A L L L A)
	     
;;10	 
(defun Suma-numerica (lis)
	   (let ((res 0))
	     (dolist (x lis res)
	       (if (numberp x)
		   (setq res (+ res x))))))
(suma-numerica '(10 5 2 1))
;;18

;;11
;;No obtuve el resultado

;;12
(defun filtra-multiplos (lis num)
	   (let ((res '()))
	     (dolist (x lis res)
	       (if (numberp x)
		   (if (> (mod x num) 0) 
		       (setq res (append res (list x))))))))
(filtra-multiplos '(5 7 10 6 9 0 15 8 ) 5)
;;(7 6 9 8)

;;13
(defun Celdas (lis)
	   (let ((num 0))
	     (dolist (x lis num)
	       (if (consp x)
		   (setq num (+ 1 num))))))
(celdas '(2 3 6 (cons 5 8) a b (cons a c)))
;;2

;;14
(defun implica (&rest args)
	   (let ((ant NIL) (res T))
	   (dolist (x args res)
	     (if (AND ant (not x))
		 (setq res NIL))
	     (setq ant x))))
(implica T NIL)
;;NIL

;;15
;;No obtuve el resultado


