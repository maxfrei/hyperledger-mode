;;; hyperledger-mode.el --- major mode for editing Hyperledger files

;; Copyright (c) 2018
;; Author: Sviridov Alex <sviridov84@gmail.com>
;; URL:  https://github.com/maxfrei/hyperledger-mode/
;; Version: 0.1
;; Keywords: emacs, hyperledger

;; This file is not part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;; Installation:
;;
;; To install it as your major mode for JavaScript editing:

;; (require 'hyperledger-mode)
;; (add-to-list 'auto-mode-alist '("\\.cto\\'" . hyperledger-mode))
;; (add-to-list 'auto-mode-alist '("\\.acl\\'" . hyperledger-mode))

;;; Code:

(setq hyperledger-font-lock-keywords
      (let* (
            (x-general '("namespace" "identified by" "o"))
            (x-keywords '("asset" "transaction" "participant" "enum" "concept" "event"))
            (x-keywords-acl '("description" "operation" "action" "participant" "resource" "condition" "transaction"))
            (x-types '("String" "Double" "Integer" "Long" "DateTime" "Boolean"))
            (x-constants-acl '("ALL" "ALLOW" "DENY" "CREATE" "READ" "UPDATE" "DELETE"))
            (x-fields '("default" "optional" "regex" "range"))

            (x-general-regexp (regexp-opt x-general 'words))
            (x-keywords-regexp (regexp-opt x-keywords 'words))
            (x-keywords-acl-regexp (regexp-opt x-keywords-acl 'words))
            (x-types-regexp (regexp-opt x-types 'words))
            (x-constants-acl-regexp (regexp-opt x-constants-acl 'words))
            (x-fields-regexp (regexp-opt x-fields 'words)))

        `(
          (,x-general-regexp . font-lock-constant-face)
          (,x-keywords-regexp . font-lock-keyword-face)
          (,x-keywords-acl-regexp . font-lock-keyword-face)
          (,x-types-regexp . font-lock-type-face)
          (,x-constants-acl-regexp . font-lock-constant-face)
          (,x-fields-regexp . font-lock-builtin-face)
          )))

;;;###autoload
(define-derived-mode hyperledger-mode c-mode "Hyperledger"
  "Major mode for editing hyperledger files"

  ;; code for syntax highlighting
  (setq font-lock-defaults '((hyperledger-font-lock-keywords))))

(provide 'hyperledger-mode)

;;; hyperledger-mode.el ends here
