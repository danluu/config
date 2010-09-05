(require 'browse-kill-ring+)
(require 'paren)


;;get rid of menus
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;;stuff from dadam's start.el
(when (> emacs-major-version 21) (require 'bindings+ nil t)) ; Minor-mode menus in mode line.

(when window-system
  (autoload 'paren-activate "mic-paren" "" t) ; Turns on alternative paren highlighting.
  (autoload 'paren-deactivate "mic-paren" "" t) ; Turns it off.
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