;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)
(require 'org)

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

;; Enabled Agenda Mode
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Enable Caputre Templates
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)

;; Custom Caputre Templates
(setq org-capture-templates
      '(
        ("m" "Meeting" entry (file+headline "~/org/inbox.org" "Meetings")
        "** WITH:  %?\n %U\n  %i\n *** Agenda \n *** Questions \n  %a")
        ("t" "Todo" entry (file+headline "~/org/inbox.org" "Tasks")
        "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+olp+datetree "~/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")))

;; Update Agenda Buffer every X seconds.

(defun renewOrgBuffer ()
  (interactive)
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
      (when (derived-mode-p 'org-agenda-mode)
    (org-agenda-maybe-redo))))
  )

(run-with-idle-timer 3 1000 #'renewOrgBuffer)

;; org ellipsis options, other than the default Go to Node...
;; not supported in common font, but supported in Symbola (my fall-back font) ⬎, ⤷, ⤵
(setq org-ellipsis "⚡⚡⚡");; ⤵ ≫

(setq org-todo-keywords '((sequence "☛ TODO(t)" "|" "✔ DONE(d)")
(sequence "⚑ WAITING(w)" "|")
(sequence "|" "✘ CANCELED(c)")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/dropbox/org-mode/todo.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
