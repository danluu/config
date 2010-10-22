;; edk-mode.el --- major mode for editing Xilinx EDK files (MHS, MPD, etc)
;; in Emacs

;; $Id: edk-mode.el 4 2009-11-02 20:28:45Z ywu $

;; Copyright (C) 2007 Jim Wu

;; Author: Jim Wu (jimwu88 at yahoo dot com)

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;; USAGE
;; =====
;; A major mode for editing Xilinx EDK files (MHS, MPD, etc)

;; Installation for setting up automatic EDK  mode:
;; Save this file in your load path, and add the following lines in your
;; .emacs (uncomment them first)
;; (setq auto-mode-alist (cons  '("\\.mhs\\'" . edk-mode) auto-mode-alist))
;; (setq auto-mode-alist (cons  '("\\.mpd\\'" . edk-mode) auto-mode-alist))
;; (add-hook 'edk-mode-hook '(lambda () (font-lock-mode 1)))
;; (autoload 'edk-mode "edk-mode")

(defvar edk-mode-map()
  "Keymap used in edk mode.")

;; syntax table for edk-mode
(defvar edk-mode-syntax-table nil
  "Syntax table for edk-mode")
  
(if edk-mode-syntax-table
    ()
  (setq edk-mode-syntax-table (make-syntax-table (standard-syntax-table)))
  (modify-syntax-entry ?_ "w" edk-mode-syntax-table)
  ;; comments (// or #)
  (modify-syntax-entry ?/ ". 12" edk-mode-syntax-table)
  (modify-syntax-entry ?# "<"    edk-mode-syntax-table)
  (modify-syntax-entry ?\n ">"   edk-mode-syntax-table)
)

(defvar edk-mode-menu (make-sparse-keymap "EDK-Mode")
  "Keymap for EDK-mode's menu.")

(defconst edk-font-lock-keywords-1
  (list 
   '("\\<\\(parameter\\|version\\|port\\|three_state\\|dir\\|sigis\\|begin\\|end\\)\\>" . font-lock-keyword-face)
   '("\\<\\(bus_interface\\|bus\\|bus_std\\|bus_type\\|dt\\|type\\|endian\\|range\\)\\>" . font-lock-keyword-face)
   '("\\<\\(address\\|pair\\|initialval\\|vec\\|sensitivity\\|option\\|iob_state\\)\\>" . font-lock-keyword-face)
   '("\\<\\(iptype\\|hdl\\|style\\|arch_support\\|sim_models\\)\\>" . font-lock-keyword-face)
   '("\\<\\(platgen_syslevel_update_proc\\|run_ngcbuild\\|pay_core\\|core_state\\|imp_netlist\\)\\>" . font-lock-keyword-face)

   '("\\<\\(true\\|false\\|vcc\\|gnd\\|mix\\|development\\|peripheral\\|mixed\\)\\>" . font-lock-constant-face)
   '("\\<\\(interrupt\\|level_high\\|level_low\\)\\>" . font-lock-constant-face)

   '("\\<\\(phase_shift\\|deskew_adjust\\|clkout_phase_shift\\)\\>" . font-lock-variable-name-face)

   )
  "Minimal highlighting expressions for edk mode.")

(defvar edk-font-lock-keywords edk-font-lock-keywords-1
  "Default highlighting expressions for EDK mode.")

;; begin of menu commands

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun edk-setup-keymap ()
  "Set up keymap for EDK mode."
  (setq edk-mode-map (make-sparse-keymap))
  (define-key edk-mode-map [menu-bar edk-mode]
    (cons "EDK-Mode" edk-mode-menu))
  (let ((map edk-mode-map))
  ;;(define-key map "\M-p" 'edk-insert-period)
  ;;(define-key map "\M-a" 'edk-insert-inst-area-group)
  ;;(define-key map "\M-t" 'edk-insert-timegrp-area-group)
  ))

;; menu items
(define-key edk-mode-menu [separator1]
  '("----" .  separator1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun edk-mode()
  "Major mode for editing EDK code."
  (interactive)
  (kill-all-local-variables)
  (setq major-mode 'edk-mode)
  (setq mode-name "EDK Mode")

  (set (make-local-variable 'font-lock-keywords-case-fold-search) t)
  (set-syntax-table edk-mode-syntax-table)
  (set (make-local-variable 'font-lock-defaults) '((edk-font-lock-keywords) nil (font-lock-keywords-case-fold-search)))

  (or edk-mode-map
      (edk-setup-keymap))
  (use-local-map edk-mode-map)

  (run-hooks 'edk-mode-hook)
)

(provide 'edk-mode)

