;;---------------------------------------------------- MATHEMATICA MODE--------------------------------------

;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/wolfram-mode/")

;; load the packaged named xyz.
;;(load "wolfram-mode") ;; best not to include the ending “.el” or “.elc”
(autoload 'wolfram-mode "wolfram-mode" nil t)

;;  (autoload 'wolfram-mode "wolfram-mode" nil t)
(autoload 'run-wolfram "wolfram-mode" nil t)
(setq wolfram-program "/Applications/Mathematica.app/Contents/MacOS/MathKernel")
(add-to-list 'auto-mode-alist '("\\.m$" . wolfram-mode))
(setq wolfram-path "directory-in-Mathematica-$Path") ;; e.g. on Linux ~/.Mathematica/Applications
;;---------------------------------------------------- MATHEMATICA MODE--------------------------------------



;;----------------------------------------------------STUFF
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
;(setq TeX-PDF-mode t)

;; Key bindings:
(global-set-key "\C-c3"   'hash4)
(global-set-key "\C-ci"   'pmatrix4)
(global-set-key "\C-cl"   'aline)
(global-set-key "\R"     'implication)
(global-set-key "\M-q"    'partiall)
(global-set-key "\C-q"    'fracktion)
(global-set-key "\C-t"    'intertext)
(global-set-key "\ej"     'jump-out)
(global-set-key "\C-cj"   'jump-out)
(global-set-key "\em"     'escape-parentheses)
(global-set-key "\C-cm"   'two-dollar-pair)
(global-set-key "\C-c4"   'dollar-pair)
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

(defun aline ()
    "We insert a pair of dollar signs and position
     point in between them."
    (interactive)
        (progn
        (insert "\\begin{align*}\n\\ \n\\end{align*}")

n        (backward-char 14)
    )
	)




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
(defun dollar-pair ()
  "We insert a pair of dollar signs and position
    point in between them."
  (interactive)
  (progn
    (insert "$\\color{#C00}{ }$")
    (backward-char 3)))

;;--------------------------------------------------------------------
;;--------------------------------------------------------------------
(defun  pmatrix4 ()
  "We insert a pair of dollar signs and position
    point in between them."
  (interactive)
  (progn
    (insert "\\begin{pmatrix} a & b &\\\\ c& d \\end{pmatrix}")
    (backward-char 9)))

;;--------------------------------------------------------------------
;;--------------------------------------------------------------------
(defun two-dollar-pair ()
  "We insert a pair of dollar signs and position
    point in between them."
  (interactive)
  (progn
    (insert "$$\\color{#C00}{ }$$")
    (backward-char 3)))


;;--------------------------------------------------------------------
;;--------------------------------------------------------------------
(defun hash4 ()
  "We insert a pair of dollar signs and position
    point in between them."
  (interactive)
  (progn
    (insert "#")
    (backward-char 0)))


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
    (insert "\$\\color{green}{ \\text{}}$")
    (backward-char 3)))
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
;;--------------------------------------------------------------------
;;--------------------------------------------------------------------
;; LINE NUMBERS    
(global-linum-mode t)
;;--------------------------------------------------------------------
;;--------------------------------------------------------------------
;; ATTEMPTING TO SET FRAME SIZE
;;(add-to-list 'default-frame-alist '(height . 63))
;;(add-to-list 'default-frame-alist '(width . 114))
(add-to-list 'default-frame-alist '(height . 63))
(add-to-list 'default-frame-alist '(width . 114))
;;--------------------------------------------------------------------
;;--------------------------------------------------------------------


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
 '(inhibit-startup-screen t)
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
 '(default ((t (:inherit nil :stipple nil :background "gray98" :foreground "gray0" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "nil" :family "DejaVu Sans Mono"))))
 '(minibuffer-prompt ((t (:foreground "dark blue"))))
 '(shadow ((t (:foreground "dark cyan")))))

(setq exec-path (append exec-path '("/Library/TeX/texbin")))
