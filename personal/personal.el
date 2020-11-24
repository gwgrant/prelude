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

(defun xah-copy-file-path (&optional @dir-path-only-p)
  "Copy the current buffer's file path or dired path to `kill-ring'.
Result is full path.
If `universal-argument' is called first, copy only the dir path.

If in dired, copy the file/dir cursor is on, or marked files.

If a buffer is not file and not dired, copy value of `default-directory' (which is usually the “current” dir when that buffer was created)

URL `http://ergoemacs.org/emacs/emacs_copy_file_path.html'
Version 2017-09-01"
  (interactive "P")
  (let (($fpath
         (if (string-equal major-mode 'dired-mode)
             (progn
               (let (($result (mapconcat 'identity (dired-get-marked-files) "\n")))
                 (if (equal (length $result) 0)
                     (progn default-directory )
                   (progn $result))))
           (if (buffer-file-name)
               (buffer-file-name)
             (expand-file-name default-directory)))))
    (kill-new
     (if @dir-path-only-p
         (progn
           (message "Directory path copied: 「%s」" (file-name-directory $fpath))
           (file-name-directory $fpath))
       (progn
         (message "File path copied: 「%s」" $fpath)
         $fpath )))))
