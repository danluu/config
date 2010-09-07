(require 'browse-kill-ring+)
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
(setq tramp-default-method "rsync")

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