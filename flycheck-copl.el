;;; flycheck-copl.el --- CoPL support for Flycheck

;; Copyright (C) 2018 igjit

;; Author: igjit <igjit1@gmail.com>
;; URL: https://github.com/igjit/flycheck-copl
;; Version: 0.0.1
;; Package-Requires: ((emacs "24.3") (flycheck "31") (copl-mode "0.0.1"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(require 'flycheck)

(defconst flycheck-copl-default-game "Nat")

(defvar-local copl-game nil)

(defun flycheck-copl--current-game ()
  (or copl-game
      flycheck-copl-default-game))

(flycheck-define-checker copl-checker
  "A CoPL derivation checker using copl-tools."
  :command ("checker" "-game" (eval (flycheck-copl--current-game)) source)
  :error-patterns
  ((error line-start (+ not-newline) " -- " "line " line ", character " column "\n" (message) line-end))
  :modes copl-mode)

;;;###autoload
(defun flycheck-copl-setup ()
  "Setup Flycheck CoPL."
  (add-to-list 'flycheck-checkers 'copl-checker)
  (put 'copl-game 'safe-local-variable 'stringp))

(provide 'flycheck-copl)

;;; flycheck-copl.el ends here
