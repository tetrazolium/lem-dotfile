(in-package :lem-user)
(lem-vi-mode:vi-mode)
(add-hook lem-lisp-mode:*lisp-repl-mode-hook* 'lem-vi-mode/commands:vi-insert)
(defun lem-paredit-hook ()
  (lem-paredit-mode:paredit-mode t)
  (define-key lem-paredit-mode:*paredit-mode-keymap* "(" nil)
  (define-key lem-paredit-mode:*paredit-mode-keymap* ")" nil)
  (define-key lem-paredit-mode:*paredit-mode-keymap* "[" nil)
  (define-key lem-paredit-mode:*paredit-mode-keymap* "]" nil)
  (define-key lem-paredit-mode:*paredit-mode-keymap* "{" nil)
  (define-key lem-paredit-mode:*paredit-mode-keymap* "}" nil)
  (define-key lem-vi-mode:*insert-keymap* "(" 'paredit-insert-paren)
  (define-key lem-vi-mode:*insert-keymap* ")" 'paredit-close-parenthesis)
  (define-key lem-vi-mode:*insert-keymap* "[" 'paredit-insert-bracket)
  (define-key lem-vi-mode:*insert-keymap* "]" 'paredit-close-bracket)
  (define-key lem-vi-mode:*insert-keymap* "{" 'paredit-insert-brace)
  (define-key lem-vi-mode:*insert-keymap* "}" 'paredit-close-bracke)
  )
(add-hook lem-lisp-mode:*lisp-mode-hook* #'lem-paredit-hook)
;Unbreak "{" and "}" in lisp-mode


(defun define-keys-in-maps (&rest keymap-pairs)
  (loop :for (keymap . new-key-list) :in keymap-pairs
        :do (loop :for (key . action) :in new-key-list
                  :do (loop :for (key . action) :in new-key-list
                            :do (define-key keymap key action)))))
(defparameter *new-paredit-keys*
  `(,lem-paredit-mode:*paredit-mode-keymap* . (("M-w" . lem-paredit-mode:paredit-wrap-round))))

(define-keys-in-maps *new-paredit-keys*)
(ql:quickload "lem/legit")
;Unbreak up and down in vi-mode
;(define-key lem/peek-legit:*peek-legit-keymap* "d" 'lem/peek-legit:peek-legit-discard-file)
;(define-key lem/peek-legit:*peek-legit-keymap* "k" nil)
