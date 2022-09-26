;;; elsa-lambda-calculus-mode.el --- Major Mode for Elsa

;; Copyright (C) 2022 Kabir Kwatra
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU Affero General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU Affero General Public License for more details.
;;
;; You should have received a copy of the GNU Affero General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;; Author: Kabir Kwatra <kabir@kwatra.me>
;; Keywords: languages, lambda, calculus, elsa
;; License: agpl-3.0
;; Version: 1.0
;; URL: https://github.com/Kab1r/elsa-lambda-calculus-mode
;;; Commentary:

;; This is a major mode implements syntax highlighting for Elsa:
;; a lambda calculus evaluator.
;;; Code:
(setq elsa-keywords  '("let" "eval" ":" "\\"))
(setq elsa-operators '("\=" "-\>"))

(setq elsa-keywords-regexp  (regexp-opt elsa-keywords))
(setq elsa-comments-regexp  "--.*$")
(setq elsa-step-regexp "=[abd*~]\>")
(setq elsa-operators-regexp (regexp-opt elsa-operators))
(setq elsa-variables-regexp "[a-z]?[0-9]*?_?[a-z]?[0-9]*")
(setq elsa-constants-regexp "[A-Z0-9]+")

(setq elsa-font-lock-keywords
      `((,elsa-keywords-regexp  . font-lock-keyword-face)
        (,elsa-comments-regexp  . font-lock-comment-face)
        (,elsa-step-regexp      . font-lock-keyword-face)
        (,elsa-variables-regexp . font-lock-variable-name-face)
        (,elsa-constants-regexp . font-lock-constant-face)
        (,elsa-operators-regexp . font-lock-keyword-face)))
;;;###autoload
(define-derived-mode elsa-lambda-calculus-mode
  prog-mode
  "Elsa"
  "Major Mode for the tiny lambda calculus evaluator."

  (setq font-lock-defaults '((elsa-font-lock-keywords))))

(provide 'elsa-lambda-calculus-mode)
;;;###autoload
(add-to-list 'auto-mode-alist '("\\.lc\\'" . elsa-lambda-calculus-mode))
;; Local Variables:
;; coding: utf-8
;; End

;;; elsa-lambda-calculus-mode.el ends here
