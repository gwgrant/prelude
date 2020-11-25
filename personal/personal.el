;; add some required packages
(prelude-require-packages '(indent-tools desktop+ org multi-vterm company-terraform terraform-mode terraform-doc use-package treemacs treemacs-projectile treemacs-magit))

;; set cmd/opt as meta/super
(when (string= system-type "darwin")
  (setq mac-option-key-is-meta nil)
  (setq mac-option-key-is-super t)
  (setq mac-command-key-is-super nil)
  (setq mac-command-key-is-meta t)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super))

(when (string= system-type "darwin")
  ;;
  ;; on mac use GNU ls from coreutils
  ;;
  (setq dired-use-ls-dired t
        insert-directory-program "/usr/local/bin/gls"
        dired-listing-switches "-aBhl --group-directories-first"))

(when (memq window-system '(ns x))
  (setq exec-path-from-shell-variables '("MANPATH" "VAGRANT_DEFAULT_PROVIDER" "PAGER"))
        (exec-path-from-shell-initialize))

(require 'indent-tools)
(global-set-key (kbd "C-c >") 'indent-tools-hydra/body)

;; add org-mode contrib to emacs lisp load-path
(add-to-list 'load-path "~/.emacs.d/personal/org/9.4/contrib/lisp" t)

;; enable confluence exporter
(require 'ox-confluence)

;; view mode
(setq view-read-only t)
(define-key ctl-x-map "\C-q" 'view-mode)

;; posframe / helm-posframe

(setq helm-posframe-parameters
      '((left-fringe . 10)
        (right-fringe . 10)
        (undecorated . nil)
        (internal-border-width . 5)
        (min-height . 50)))
(setq helm-posframe-poshandler #'posframe-poshandler-window-top-center)
(setq posframe-mouse-banish nil)
(helm-posframe-enable)

;; mini-frame-mode
(mini-frame-mode)

;; blink the cursor
(blink-cursor-mode)
