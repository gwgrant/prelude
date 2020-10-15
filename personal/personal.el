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

(when (memq window-system '(mac ns x))
  (setq exec-path-from-shell-variables '("PATH" "MANPATH" "VAGRANT_DEFAULT_PROVIDER"))
                                        ;					 "VAGRANT_VMWARE_CLONE_DIRECTORY"
                                        ;					 "PAGER"
                                        ;					 "PROMPT_COMMAND"))
  (exec-path-from-shell-initialize))
(require 'indent-tools)
(global-set-key (kbd "C-c >") 'indent-tools-hydra/body)
