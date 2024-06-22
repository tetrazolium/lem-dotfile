(in-package :lem-user)
(lem-vi-mode:vi-mode)
(add-hook lem-lisp-mode:*lisp-repl-mode-hook* 'lem-vi-mode/commands:vi-insert)
(defun lem-paredit-hook ()
  (lem-paredit-mode:paredit-mode t))
(add-hook lem-lisp-mode:*lisp-mode-hook* #'lem-paredit-hook)


(defun define-keys-in-maps (&rest keymap-pairs)
  (loop :for (keymap . new-key-list) :in keymap-pairs
        :do (loop :for (key . action) :in new-key-list
                  :do (loop :for (key . action) :in new-key-list
                            :do (define-key keymap key action)))))
(defparameter *new-paredit-keys*
  `(,lem-paredit-mode:*paredit-mode-keymap* . (("M-w" . lem-paredit-mode:paredit-wrap-round))))

(define-keys-in-maps *new-paredit-keys*)
(ql:quickload "lem/legit")