;STUDENT FILE TEMPLATE
;IMPORTANTE: NO incluir la cabecera #lang

(define sublista-aux
  (lambda (L acc i j)
    (if (= i j) (list (car L))
        (if (= acc i)
            (cons (car L) (sublista-aux (cdr L) (+ acc 1) (+ i 1) j))
            (sublista-aux (cdr L) (+ acc 1) i j)))))

(define sublista
  (lambda (L i j)
    (sublista-aux L 0 i j)))


(define x1 2)






