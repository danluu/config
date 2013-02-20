(require 'cl)


(defvar emacs-root (if (eq system-type 'cygwin) "/home/d/"
		       (if (or
			    (eq system-type 'gnu/linux)
			    (eq system-type 'linux))
			   "/home/dluu" "c:/home/d/")))

(defvar emacs-root "/Users/danluu/")
		     
(labels ((add-path (p)
	 (add-to-list 'load-path
			(concat emacs-root p))))
	(add-path "emacs/lisp")
	(add-path "emacs/site-lisp")
	(add-path "emacs/site-lisp/scala")
	(add-path "emacs/site-lisp/go")
	(add-path "emacs/site-lisp/fsharp")
	(add-path "emacs/site-lisp/tuareg")
	(add-path "emacs/site-lisp/haskell-mode")
	(add-path "emacs/site-lisp/bluespec")
        (add-path "emacs/site-lisp/scala-emacs")
        (add-path "emacs/site-lisp/scala-mode2")
	(add-path "emacs/site-lisp/ensime/elisp"))

(if (eq system-type 'gnu/linux)
		(labels ((add-path (p)
											 (add-to-list 'load-path
																		(concat "/usr/share/" p))))
	(add-path "emacs/lisp")
	(add-path "emacs/site-lisp")
	(add-path "emacs/site-lisp/scala")
	(add-path "emacs/site-lisp/go")
	(add-path "emacs/site-lisp/fsharp")
	(add-path "emacs/site-lisp/tuareg")
	(add-path "emacs/site-lisp/haskell-mode")
	(add-path "emacs/site-lisp/bluespec")
        (add-path "emacs/site-lisp/scala-emacs")
        (add-path "emacs/site-lisp/scala-mode2")
			(add-path "emacs/site-lisp/apel")
			(add-path "emacs/site-lisp/llvm")
			(add-path "emacs/site-lisp/w3m")
			(add-path "emacs/site-lisp/bluespec")
			(add-path "emacs/site-lisp/ensime/elisp"))
)		

    (let ((default-directory "~/emacs/lisp"))
      (normal-top-level-add-subdirs-to-load-path))

    (let ((default-directory "~/emacs/site-lisp"))
      (normal-top-level-add-subdirs-to-load-path))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(require 'scala-mode2)



(load-library "misc")

;;(if (eq system-type 'cygwin)
;;    (load-library "cygwin-shell")) ;;conflicts with tramp?

;;(require 'tramp)


;;hack to get swiss-move to work with GNU emacs
(unless (featurep 'xemacs)
   (defun line-number (&optional position)
     (save-excursion
	(when position (goto-char position))
	(1+ (count-lines 1 (point-at-bol))))))

(require 'swiss-move nil t)  

(when (fboundp 'swiss-move-line-up)     ; Defined in `swiss-move.el'.
  (global-set-key [S-prior] 'swiss-move-line-up)
  (global-set-key [S-next]  'swiss-move-line-down))

;;bluespec
(autoload 'bsv-mode "bsv-mode" "BSV mode" t )
(setq auto-mode-alist (cons  '("\\.bsv\\'" . bsv-mode) auto-mode-alist))

;;org mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)


;;scala mode
;(load "~/emacs/site-lisp/scala/scala-mode-auto.el")
;(require 'scala-mode-auto)
;(add-hook 'scala-mode-hook
;					'(lambda ()
;						 (scala-mode-feature-electric-mode)
;						 ))

;;ensime for scala
;(require 'scala-mode)
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;;haskell mode. Need to fix for multi-site support
(load "~/emacs/site-lisp/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'font-lock-mode)

;;verilog mode
;; Load verilog mode only when needed
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
;; Any files that end in .v, .dv or .sv should be in verilog mode
(add-to-list 'auto-mode-alist '("\\.[ds]?v\\'" . verilog-mode))
;; Any files in verilog mode should have their keywords colorized
(add-hook 'verilog-mode-hook '(lambda () (font-lock-mode 1)))

;;debug
(setq tramp-verbose 10) 

;;go mode
(load "~/emacs/site-lisp/go/go-mode.el")
(load "~/emacs/site-lisp/go/go-mode-load.el")

;;octave
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))
