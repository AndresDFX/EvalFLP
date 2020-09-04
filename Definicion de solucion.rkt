#lang racket

(define xsublista-aux
  (lambda (L acc i j)
    (if (= i j) (list (car L))
        (if (= acc i)
            (cons (car L) (xsublista-aux (cdr L) (+ acc 1) (+ i 1) j))
            (xsublista-aux (cdr L) (+ acc 1) i j)))))

(define xsublista
  (lambda (L i j)
    (xsublista-aux L 0 i j)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define xxxcounterxxx 0)

(define xxxnotaxxx
  (make-vector 40))

(define (boolean->integer b)
  (case b
    ((#f) 0)
    ((#t) 1)))

(define pruebaG
  (lambda (P1 P2)
    (if (equal? P1 P2)
        (begin
          (vector-set! xxxnotaxxx xxxcounterxxx #t)
          (set! xxxcounterxxx (+ xxxcounterxxx 1))
          (display "\nPasó prueba...")
           )
        (begin
          (vector-set! xxxnotaxxx xxxcounterxxx #f)
          (set! xxxcounterxxx (+ xxxcounterxxx 1))
          (display "\nNo Pasó Prueba..")
          ))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(display "Pruebas Ejercicio 1")
  (pruebaG
 (xsublista l1 0 4)
 (sublista l1 0 4))
(pruebaG
 (xsublista l2 2 5)
 (sublista l2 2 5))


(define xxxpesonotaxxx
  (vector 5 5 ))

(define xxxvaloresnotaxxx
  (vector 0 0))

(define calcularNota
  (lambda (i j)
    (if (< i j)
        (begin
          (vector-set! xxxvaloresnotaxxx i
                     (*
                      (vector-ref xxxpesonotaxxx i)
                      (boolean->integer (vector-ref xxxnotaxxx i))))
          (calcularNota (+ i 1) j)
          )
        (void))))

(display "\n\nResultados de las pruebas: ")
         
(calcularNota 0  xxxcounterxxx)

(define mensajeEjercicios
  (lambda (i j)
    (if (< i j)
        (begin
          (display (string-append "\nEjercicio " (number->string i) ":"
                         (number->string (+  (vector-ref xxxvaloresnotaxxx (- (* i 2) 1))
                             (vector-ref xxxvaloresnotaxxx (- (* i 2) 2))))
                         ))
          (mensajeEjercicios (+ i 1) j))
        (void))))

(mensajeEjercicios 1 xxxcounterxxx)