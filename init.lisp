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
  (define-key lem-vi-mode:*insert-keymap* "(" 'lem-paredit-mode:paredit-insert-paren)
  (define-key lem-vi-mode:*insert-keymap* ")" 'lem-paredit-mode:paredit-close-parenthesis)
  (define-key lem-vi-mode:*insert-keymap* "[" 'lem-paredit-mode:paredit-insert-bracket)
  (define-key lem-vi-mode:*insert-keymap* "]" 'lem-paredit-mode:paredit-close-bracket)
  (define-key lem-vi-mode:*insert-keymap* "{" 'lem-paredit-mode:paredit-insert-brace)
  (define-key lem-vi-mode:*insert-keymap* "}" 'lem-paredit-mode:paredit-close-bracket)
  )
(add-hook lem-lisp-mode:*lisp-mode-hook* #'lem-paredit-hook)
;Unbreak "{" and "}" in lisp-mode

;Copy pasted from another config
(defun define-keys-in-maps (&rest keymap-pairs)
  (loop :for (keymap . new-key-list) :in keymap-pairs
        :do (loop :for (key . action) :in new-key-list
                  :do (loop :for (key . action) :in new-key-list
                            :do (define-key keymap key action)))))
(defparameter *new-paredit-keys*
  `(,lem-paredit-mode:*paredit-mode-keymap* . (("M-w" . lem-paredit-mode:paredit-wrap-round))))

(define-keys-in-maps *new-paredit-keys*)
(ql:quickload "lem-legit")
;Unbreak up and down in vi-mode
(define-key lem/legit:*peek-legit-keymap* "p" 'lem/legit:peek-legit-discard-file)
(define-key lem/legit:*peek-legit-keymap* "k" 'lem/legit:peek-legit-previous)
(define-key lem/legit:*peek-legit-keymap* "j" 'lem/legit:peek-legit-next)
