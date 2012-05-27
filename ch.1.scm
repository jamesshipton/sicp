  (define (+ a b)
    (if (= a 0)
        b
        (inc (+ (dec a) b))))

  (+ 4 5)
  (inc (+ 3 5))
  (inc (inc (+ 2 5)))
  (inc (inc (inc (+ 1 5))))
  (inc (inc (inc (inc (+ 0 5)))))
  (inc (inc (inc 6)))
  (inc (inc 7))
  (inc 8)
  9


  (define (+ a b)
    (if (= a 0)
        b
        (+ (dec a) (inc b))))

  (+ 4 5)
  (+ (dec 4) (inc 5))
  (+ 3 6)
  (+ (dec 3) (inc 6))
  (+ 2 7)
  (+ (dec 2) (inc 7))
  (+ 1 8)
  (+ (dec 1) (inc 8))
  (+ 0 9)
  9

  (define (A x y)
    (cond ((= y 0) 0)
          ((= x 0) (* 2 y))
          ((= y 1) 2)
          (else (A (- x 1)
                   (A x (- y 1))))))

  (A 1 10)
  (A 0 (A 1 9))
  (A 0 (A 0 (A 1 8)))
  (A 0 (A 0 (A 0 (A 1 7))))
  (A 0 (A 0 (A 0 (A 0 (A 1 6)))))
  (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))
  (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))
  (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))
  (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))
  (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))
  (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))
  (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))
  (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))
  (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))
  (A 0 (A 0 (A 0 (A 0 (A 0 32)))))
  (A 0 (A 0 (A 0 (A 0 64))))
  (A 0 (A 0 (A 0 128)))
  (A 0 (A 0 256))
  (A 0 512)
  1024

  (A 2 4)
  (A 1 (A 2 3))
  (A 1 (A 1 (A 2 2)))
  (A 1 (A 1 (A 1 (A 2 1))))
  (A 1 (A 1 (A 1 2)))
  (A 1 (A 1 (A 0 (A 1 1))))
  (A 1 (A 1 (A 0 2)))
  (A 1 (A 1 4))
  (A 1 (A 0 (A 1 3)))
  (A 1 (A 0 (A 0 (A 1 2))))
  (A 1 (A 0 (A 0 (A 0 (A 1 1)))))
  (A 1 (A 0 (A 0 (A 0 2))))
  (A 1 (A 0 (A 0 4)))
  (A 1 (A 0 8))
  (A 1 16)
  (A 0 (A 1 15))
  ...as above...
  (A 0 32768)
  65536


  def fib_tree n
    case n
    when 0 then 0
    when 1 then 1
    else (fib_tree(n-1) + fib_tree(n-2))
    end
  end

  def fib_linear n
    fibiter 1, 0 n
  end

  def fibiter a, b, count
    puts "calling fibiter with #{a} #{b} #{count}"
    count.zero? ? b : fibiter((a + b), a, (count - 1))
  end

  (0..35).each { |n| puts fib_tree n }



  (define (fib n)
    (fibiter 1 0 n))

  (define (fibiter a b count)
    (if (= count 0)
        b
        (fibiter (+ a b) a (- count 1))))

  (fib 4)
  (fibiter 1 0 4)
  (fibiter 1 1 3)
  (fibiter 2 1 2)
  (fibiter 3 2 1)
  (fibiter 5 3 0)
  3

  (define (f g)
    (g 2))

  (f f)
  (f 2)
  (2 2)

