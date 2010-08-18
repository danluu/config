(defconst CYGWIN-BASE "c:/cygwin")
(defconst CYGWIN-BIN (concat CYGWIN-BASE "/bin"))
(setenv "PATH" (concat CYGWIN-BIN ";" (getenv "PATH")))
(setq exec-path (cons CYGWIN-BIN exec-path))
(require 'cygwin-mount) ;; get from http://www.emacswiki.org/elisp/cygwin-mount.el
(cygwin-mount-activate)

(setq shell-mode-hook 'bash-shell-setup)

;; For the interactive shell
(add-hook 'comint-output-filter-functions
 'shell-strip-ctrl-m nil t)
(add-hook 'comint-output-filter-functions
 'comint-watch-for-password-prompt nil t)
(add-hook 'shell-mode-hook 'bash-shell-setup)

(setq explicit-shell-file-name "bash")
;; For subprocesses invoked via the shell
;; (e.g., "shell -c command")
(setq shell-file-name explicit-shell-file-name)

;; Sets the line-sending convention to \n, instead of \n\r
(defun bash-shell-setup ()
 "Sets up BASH shell processes to use Unix coding system" (set-process-coding-system (get-buffer-process (current-buffer)) 'unix 'unix))
