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
        (add-path "emacs/site-lisp/rust")
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
        (add-path "emacs/site-lisp/rust")
			(add-path "emacs/site-lisp/apel")
			(add-path "emacs/site-lisp/llvm")
			(add-path "emacs/site-lisp/w3m")
			(add-path "emacs/site-lisp/bluespec")
			(add-path "emacs/site-lisp/ensime/elisp"))
)		

;    (let ((default-directory "~/emacs/lisp"))
;      (normal-top-level-add-subdirs-to-load-path))

    (let ((default-directory "~/emacs/site-lisp"))
      (normal-top-level-add-subdirs-to-load-path))

;(require 'package)
;(add-to-list 'package-archives
;             '("melpa" . "http://melpa.milkbox.net/packages/") t)


(load "misc")

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
;(autoload 'bsv-mode "bsv-mode" "BSV mode" t )
;(setq auto-mode-alist (cons  '("\\.bsv\\'" . bsv-mode) auto-mode-alist))

;;org mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)


;scala mode
(load "~/emacs/site-lisp/scala/scala-mode-auto.el")
(require 'scala-mode-auto)
(add-hook 'scala-mode-hook
					'(lambda ()
						 (scala-mode-feature-electric-mode)))


;(require 'scala-mode2)

;;ensime for scala
;(require 'scala-mode)
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(setq ensime-sem-high-faces
  '(
   (var . (:foreground "#ff2222"))
   (val . (:foreground "#dddddd"))
   (varField . (:foreground "#ff3333"))
   (valField . (:foreground "#dddddd"))
   (functionCall . (:foreground "#84BEE3"))
   (param . (:foreground "#ffffff"))
   (class . font-lock-type-face)
   (trait . (:foreground "#084EA8"))
   (object . (:foreground "#026DF7"))
   (package . font-lock-preprocessor-face)
   ))

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
;(setq tramp-verbose 10) 

;go mode
(load "~/emacs/site-lisp/go/go-mode.el")
(load "~/emacs/site-lisp/go/go-mode-load.el")

;;octave
;(autoload 'octave-mode "octave-mod" nil t)
;(setq auto-mode-alist
;      (cons '("\\.m$" . octave-mode) auto-mode-alist))

;(add-hook 'octave-mode-hook
;          (lambda ()
;            (abbrev-mode 1)
;            (auto-fill-mode 1)
;            (if (eq window-system 'x)
;                (font-lock-mode 1))))


;;misc.el doesn't seem to load correctly, so I'm moving it here
;(require 'browse-kill-ring+)
(require 'paren)

;;get rid of menus
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;;stuff from dadam's start.el
(when (> emacs-major-version 21) (require 'bindings+ nil t)) ; Minor-mode menus in mode line.

(when window-system
  (load-library "mic-paren")
  (paren-activate)
  (autoload 'paren-toggle-matching-paired-delimiter "mic-paren" "" t) ; For LaTeX etc: $...$
  (autoload 'paren-toggle-matching-quoted-paren "mic-paren" "" t) ; Toggle highlighting escaped parens.
  (autoload 'paren-toggle-open-paren-context "mic-paren" "" t)
  (defvar paren-sexp-mode t)
  (defvar paren-message-linefeed-display "^J")) ; Toggle in/out context for open paren.

(fset 'yes-or-no-p 'y-or-n-p)
;; Highlight regions and add special behaviors to regions.
;; "C-h d transient" for more info

(setq transient-mark-mode t)
(global-set-key "\M-g" 'goto-line)

;;tramp setup
;;(setq tramp-default-method "rsync")

 ;; Don't display the 'Welcome to GNU Emacs' buffer on startup
(setq inhibit-startup-message t)

;; Don't insert instructions in the *scratch* buffer
(setq initial-scratch-message nil)

 ;; C-x b buffer switching
(iswitchb-mode 1)
(icomplete-mode 1)

;;backups files
(setq make-backup-files nil)
(setq auto-save-default nil)


(setq backup-directory-alist
			`((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
			`((".*" ,temporary-file-directory t)))

;;enable generic stuff like fstab mode
(setq generic-define-unix-modes t)

;;??
(setq file-name-shadow-mode 1)

;;highlight regexes
(setq hi-lock-mode 1)

;;When activated, it allows to “undo” (and “redo”) changes in the window configuration with the key commands ‘C-x left’ and ‘C-x right’. In Emacs 22, these keybindings have been changed to ‘C-c left’ and ‘C-c right’.
(winner-mode)

;;stretch cursor to match character size (tabs!)
(setq x-stretch-cursor)

;;like iswitchb, but crazier
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching

;;mousewheel support
(if (load "mwheel" t)
    (mwheel-install))

;;some of our ucode tools blow up if we don't end in a newline
(setq require-final-newline 't)

;;complain if we search/replace on a read-only buffer
(defadvice query-replace-read-args (before barf-if-buffer-read-only activate)
  "Signal a `buffer-read-only' error if the current buffer is read-only."
  (barf-if-buffer-read-only))

;;f#
(setq auto-mode-alist (cons '("\\.fs[iylx]?$" . fsharp-mode) auto-mode-alist))
(autoload 'fsharp-mode "fsharp" "Major mode for editing F# code." t)
(autoload 'run-fsharp "inf-fsharp" "Run an inferior F# process." t)

(setq inferior-fsharp-program "fsi")
(setq fsharp-compiler "fsc")

;; If you are no Emacs-Lisp addict, and would like to use Tuareg NOW, append (or copy) `append-tuareg.el' file to your `.emacs' configuration file. It tells Emacs to load Tuareg and Sym-Lock (for XEmacs) automatically.
(load-library "append-tuareg")

;; load microcode files in assembler mode
;(setq auto-mode-alist (cons '("\\.nh" . asm-mode) auto-mode-alist))
;(setq auto-mode-alist (cons '("\\.nmc" . asm-mode) auto-mode-alist))

;; ucf and ncf modes for emacs
(setq auto-mode-alist (cons  '("\\.ucf\\'" . ucf-mode) auto-mode-alist))
(setq auto-mode-alist (cons  '("\\.ncf\\'" . ucf-mode) auto-mode-alist))
(add-hook 'ucf-mode-hook '(lambda () (font-lock-mode 1)))
(autoload 'ucf-mode "ucf-mode")

;; tab size
;(setq default-tab-width 2)

;; don't make underscore a word boundary
(modify-syntax-entry ?_ "w" text-mode-syntax-table) 

;;multi-term
;(require 'multi-term)
;(setq multi-term-program "/bin/bash")

; rust mode
(require 'rust-mode)

; julia mode
(load "~/emacs/site-lisp/julia-mode.el")
(require 'julia-mode)

; matlab / octave mode
(add-to-list
  'auto-mode-alist
  '("\\.m$" . octave-mode))
