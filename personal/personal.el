;; add some required packages
(prelude-require-packages '(indent-tools desktop+ org multi-vterm company-terraform terraform-mode terraform-doc))

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
