;;;; rman.asd

(asdf:defsystem #:rman
  :serial t
  :description "Describe rman here"
  :author "Jeremiah LaRocco <jeremiah.larocco@gmail.com>"
  :license "Specify license here"
  :depends-on (#:cffi)
  :components ((:file "package")
               (:file "rman")))

