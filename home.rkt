#lang racket

(require xml)

(define (page content)
  `(html ([lang "en"])
         (head (meta ([charset "utf-8"]))
               (title "Felix's Website")
               (link ([rel "stylesheet"] [href "/static/style.css"]))
               (script ([src "/static/index.js"])))
         (body ,content)))

(define items 
  `(ul ,@(map (lambda (n) `(li "this is a  file")) (range 10))))

(define index (page items))

(define (save-to-file)
  (call-with-output-file "out.html"
                         (curry displayln (xexpr->string index))
                         #:exists 'replace))


(display-xml/content (xexpr->xml index))

(save-to-file)
