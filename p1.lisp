;;; Primer paquete

;; 1
;; 1 a)
(nth 4 '(((1 2) 3) 4 (5 (6)) A (B C) D (E (F G))))
;;(B C)

;; 1 b
(* 60 60 24 366)
;;31622400

;; 1 c
;;(AND (/= x 0) (<= x y))

;;1 d
(cons (/ (+ -7 (sqrt (- (expt 7 2) (* 4 2 5)))) (* 2 2)) (/ (- -7 (sqrt (- (expt 7 2) (* 4 2 5)))) (* 2 2)))
;;(-1.0 . -2.5)

;;2
;;2 a
(+ (* 2 4) (- 6 8))
;;6

;;2 b 
(/ (+ 5 (+ -3 4)) (+ 6 (/ 2 5)))
;;15/16

;; 2c
(sqrt (/ (+ (* (- -4 (/ 3 8)) -1) 1.4502) (expt -1 (expt (- 3 5) (/ 1 3)))))
;;#C(7.355944 -11.196843)

;; 2d
;;(sqrt (/ (sqrt (/ 65.402 (sqrt -1)) 5) 0.17) 7)
;;No enocntré como hacer una raíz séptima

;;3
;;3 a
(cdar '((one two) three four))
;;(TWO)

;;3 b
(append (cons '(eva lisa) '(karl sven)) '(eva lisa) '(karl sven))
;;((EVA LISA) KARL SVEN EVA LISA KARL SVEN)

;;3 c
(subst 'gitan 'birgitta '(eva birgitta lisa birgitta karin))
;; (EVA GITAN LISA GITAN KARIN)

;;3 d
(remove 'sven '(eva sven lisa sven anna))
;;(EVA LISA ANNA)

;;3 e
(butlast '(karl adam nilsson gregg alisson vilma) 3)
;;(KARL ADAM NILSSON)

;;3 f
(nth 2 '(a b c d e))
;;C

;;3 g
(nthcdr 2 '(a b c d e))
;;(C D E)

;;3 h
(intersection '(a b c) '(x b z c))
;;(C B)

;;3 i
(cadar '(((((1 2 3) z ) y) (x 4)) 7 8 (a b c (5 (6 7 8)))));faltaba un paréntesis
;;(X 4)

;; 4
;; No pude obtener el resultado

;;5
(defun RealNoCero? (X) (AND (realp X) (/= X 0)))
(RealNoCero? 5)
;;T

;;6
(defun Analiza (X) (list (atom X) (numberp X) (listp X) (consp X) (null X)))
(Analiza '())
;;(T NIL T NIL T)

;;7
;;No pude obtener el resultado

;;8
(defun MismoTipo (lx ly) (let ((result T)) (dotimes (n (length lx) result) (setq result (AND result (OR (AND (numberp (nth n lx)) (numberp (nth n ly))) (AND (symbolp (nth n lx)) (symbolp (nth n ly))) (AND (listp (nth n lx)) (listp (nth n ly)))))))))
(MismoTipo '(4 2 4) '(2 b 3))
;;NIL
(MismoTipo '(4 2 4) '(2 2 3))
;;T

;;9
(defun APalindromo (cadena)
	   (let ((res '()))
	     (loop for c across cadena do
	       (setq res (cons c res))) (concatenate 'string cadena res)))
(APalindromo "Hola")
;;"HolaaloH"

;;10
(defun Bisiesto (num)
	   (let ((b NIL)) 
	     (if (OR (AND (= (mod num 4) 0) (/= (mod num 100) 0)) 
		     (AND (= (mod num 100) 0) (= (mod num 100) 0)))
		 (setq b T))))
(Bisiesto 2001)
;;NIL
(Bisiesto 2004);
;T
