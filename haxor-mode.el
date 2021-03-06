;;; haxor-mode.el --- Major mode for exiting .hax files

;; Copyright (c) 2015 Krzysztof Magosa

;; Author: Krzysztof Magosa <krzysztof@magosa.pl>
;; URL: https://github.com/krzysztof-magosa/haxor-mode
;; Package-Requires: ((emacs "24.0"))
;; Created: 09 January 2015
;; Version: 0.1.0
;; Keywords: haxor

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be included in all
;; copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

;;; Commentary:
;;

;;; Code:

(defvar haxor-events
  '("$zero"
    "$at"

    "$a0"
    "$a1"
    "$a2"
    "$a3"
    "$a4"
    "$a5"
    "$a6"
    "$a7"
    "$a8"
    "$a9"

    "$t0"
    "$t1"
    "$t2"
    "$t3"
    "$t4"
    "$t5"
    "$t6"
    "$t7"
    "$t8"
    "$t9"

    "$fp"
    "$sp"
    "$ra"
    "$sc"))

(defvar haxor-keywords
  '(;; pseudo instructions
    "section"
    "dw"
    "resw"
    "push"
    "pushi"
    "pushm"
    "pop"
    "popm"
    "move"
    "clear"
    "not"
    "ret"
    "prol"
    "epil"
    "b"
    "bal"
    "bgt"
    "blt"
    "bge"
    "ble"
    "blez"
    "bgtz"
    "beqz"

    ;; instructions
    "nop"
    "add"
    "addi"
    "sub"
    "mult"
    "div"
    "mod"
    "lw"
    "sw"
    "lui"
    "and"
    "andi"
    "or"
    "ori"
    "xor"
    "nor"
    "slt"
    "slti"
    "slli"
    "srli"
    "sll"
    "srl"
    "beq"
    "beql"
    "bne"
    "j"
    "jr"
    "jal"
    "exiti"
    "syscall"))

(defvar haxor-font-lock-defaults
  `((
     ;; stuff enclosed in "
     ("\"\\.\\*\\?" . font-lock-string-face)
     ;; labels
     (".*:" . font-lock-function-name-face)
     ;; special characters
     (":\\|,\\|;\\|{\\|}\\|=>\\|@\\|$\\|=" . font-lock-keyword-face)
     ( ,(regexp-opt haxor-keywords 'words) . font-lock-builtin-face)
     ( ,(regexp-opt haxor-events 'words) . font-lock-constant-face)
     ;; registers
     ("$[0-9]+" . font-lock-constant-face))))

(defvar haxor-tab-width 2 "Width of tab for Haxor Mode")

;;;###autoload
(define-derived-mode haxor-mode fundamental-mode "Haxor Assembly"
  "Haxor Mode for editing Haxor Assembly Files"

  (setq font-lock-defaults haxor-font-lock-defaults)
  (when haxor-tab-width
    (setq tab-width haxor-tab-width))

  (setq comment-start "#")
  (setq comment-end ""))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.hax\\'" . haxor-mode))

(provide 'haxor-mode)
