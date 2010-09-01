(require 'cl)

(defvar emacs-root (if (eq system-type 'cygwin) "/home/d"
		       (if (or
			    (eq system-type 'gnu/linux)
			    (eq system-type 'linux))
			   "/home/dluu/" "c:/home/d/")))
		     
(labels ((add-path (p)
	 (add-to-list 'load-path
			(concat emacs-root p))))
	(add-path "emacs/lisp")
	(add-path "emacs/site-lisp")
	(add-path "emacs/site-lisp/bluespec"))


(if (eq system-type 'cygwin)
    (load-library "cygwin-shell")) ;;conflicts with tramp?

;;tramp setup
(setq tramp-default-method "rsync")
;;(require 'tramp)

(require 'browse-kill-ring+)

;;get rid of menus
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;;stuff from dadam's start.el
(when (> emacs-major-version 21) (require 'bindings+ nil t)) ; Minor-mode menus in mode line.

(require 'paren)

(when window-system
  (autoload 'paren-activate "mic-paren" "" t) ; Turns on alternative paren highlighting.
  (autoload 'paren-deactivate "mic-paren" "" t) ; Turns it off.
  (autoload 'paren-toggle-matching-paired-delimiter "mic-paren" "" t) ; For LaTeX etc: $...$
  (autoload 'paren-toggle-matching-quoted-paren "mic-paren" "" t) ; Toggle highlighting escaped parens.
  (autoload 'paren-toggle-open-paren-context "mic-paren" "" t)
  (defvar paren-sexp-mode t)
  (defvar paren-message-linefeed-display "^J")) ; Toggle in/out context for open paren.

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

;;goto-line
(global-set-key "\M-g" 'goto-line)
