
;;--------------------------------------------------------------------
;;--------------------------------------------------------------------
;; LINE NUMBERS    
(global-linum-mode t)
;;--------------------------------------------------------------------
;;--------------------------------------------------------------------
;; ATTEMPTING TO SET FRAME SIZE
(add-to-list 'default-frame-alist '(height . 63))
(add-to-list 'default-frame-alist '(width . 114))
;;--------------------------------------------------------------------
;;--------------------------------------------------------------------




;; Set up my LaTeX-mode keybindings:

(add-hook 'LaTeX-mode-hook 'add-my-latex-keybindings)
(defun add-my-latex-keybindings ()
  (progn
    (local-set-key "[" 'bracket-pair)
    (local-set-key "^" 'superscript-braces)
    (local-set-key "_" 'subscript-braces)))

;;--------------------------------------------------------------------
;;--------------------------------------------------------------------

;; This begins the definitions of our own functions:
;;--------------------------------------------------------------------
;;--------------------------------------------------------------------
(defun implication ()
  "We insert a pair of dollar signs and position
    point in between them."
  (interactive)
  (progn
    (insert "\Rightarrow  ")
    (backward-char )))

;;--------------------------------------------------------------------
;;--------------------------------------------------------------------
(defun partiall ()
  "We insert a pair of dollar signs and position
    point in between them."
  (interactive)
  (progn
    (insert "\\partial  ")
    (backward-char )))
;;--------------------------------------------------------------------
;;--------------------------------------------------------------------
(defun fracktion ()
  "We insert a pair of dollar signs and position
    point in between them."
  (interactive)
  (progn
    (insert "\\frac{}{}")
    (backward-char 3)))
;;--------------------------------------------------------------------
;;--------------------------------------------------------------------
(defun intertext ()
  "We insert a pair of dollar signs and position
    point in between them."
  (interactive)
  (progn
    (insert "\\shortintertext{}")
    (backward-char)))
;;--------------------------------------------------------------------
;;--------------------------------------------------------------------
(defun escape-parentheses ()
  "We insert a pair of dollar signs and position
    point in between them."
  (interactive)
  (progn
    (insert "\\(   \\)")
    (backward-char 4)))

;;---------------------------------------------------------------
;;---------------------------------------------------------------
(defun paren-pair ()
 "We insert a pair of parentheses and position point in between them.
  If called with an argument, then we insert \"\\bigl(\\bigr)\"
  and position point inside of that."
  (interactive)
  (progn
    (insert "\\left( \\right)")
    (backward-char 7)))
;;---------------------------------------------------------------
;;---------------------------------------------------------------
(defun brace-pair ()
  "We insert a pair of braces and position
    point in between them."
  (interactive)
  (progn
    (insert "{}")
    (backward-char)))
;;---------------------------------------------------------------
;;---------------------------------------------------------------
(defun bracket-pair ()
  "We insert a pair of brackets and position
    point in between them."
  (interactive)
  (progn
    (insert "[]")
    (backward-char)))
;;--------------------------------------------------------------------
;;--------------------------------------------------------------------
(defun superscript-braces ()
  "We insert a superscript symbol followed by a pair of braces
    and position point in between the braces."
  (interactive)
  (progn
    (insert "^")
    (brace-pair)))
;;--------------------------------------------------------------------
;;--------------------------------------------------------------------
(defun subscript-braces ()
  "We insert a subscript symbol followed by a pair of braces
    and position point in between the braces."
  (interactive)
  (progn
    (insert "_")
    (brace-pair)))
;;--------------------------------------------------------------------
;;--------------------------------------------------------------------
(defun insert-verbatim ()
  "We insert  \\verb\"\" and position point in between the quotes."
  (interactive)
  (progn
    (insert "\\verb\"\"")
    (backward-char)))
;;--------------------------------------------------------------------
;;--------------------------------------------------------------------
(defun jump-out ()
  "We first expand the abbrev before point (if there is an abbrev
    before point), and then we move point forward in the file until we
    pass the first dollar sign, right paren, right bracket, right brace
    or double quote."
  (interactive)
  (progn
    (expand-abbrev)
    (re-search-forward "[])}$\"]")))
;;--------------------------------------------------------------------
;;--------------------------------------------------------------------
(defun fontchange-em ()
  "We insert  \\emph{} and position point before the right brace."
  (interactive)
  (progn
    (insert "\\emph{}")
    (backward-char)))
;;---------------------------------------------------------------
;;---------------------------------------------------------------
;; Key bindings:

(global-set-key "\R"      'implication)
(global-set-key "\M-q"    'partiall)
(global-set-key "\C-q"    'fracktion)
(global-set-key "\C-t"    'intertext)
(global-set-key "\ej"     'jump-out)
(global-set-key "\C-cj"   'jump-out)
(global-set-key "\em"     'escape-parentheses)
(global-set-key "\C-cm"   'dollar-pair)
(global-set-key "\ep"     'paren-pair)
(global-set-key "\C-cp"   'paren-pair)
(global-set-key "\eo"     'brace-pair)
(global-set-key "\C-co"   'brace-pair)
(global-set-key "\en"     'insert-verbatim)
(global-set-key "\C-cn"   'insert-verbatim)
(global-set-key "\ee"     'LaTeX-environment)
(global-set-key "\C-ce"   'LaTeX-environment)
(global-set-key "\ek"     'fontchange-em)
(global-set-key "\C-ck"   'fontchange-em)

(setenv "PATH" "/usr/local/bin:/Library/TeX/texbin/:$PATH" t)
(set-cursor-color "#8a0f00")   

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(package-selected-packages (quote (auctex)))
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "gray98" :foreground "gray0" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 190 :width normal :foundry "nil" :family "Courier"))))
 '(minibuffer-prompt ((t (:foreground "dark blue"))))
 '(shadow ((t (:foreground "dark cyan")))))

(setq exec-path (append exec-path '("/Library/TeX/texbin")))
