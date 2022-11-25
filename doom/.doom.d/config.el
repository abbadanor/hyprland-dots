;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Adam Nord"
      user-mail-address "adam.nord04@gmail.com")

(beacon-mode 1)

(setq projectile-enable-caching nil)

;; Move to trash instead of rm:ing
(setq delete-by-moving-to-trash t)

(run-at-time nil (* 5 60) 'recentf-save-list)

;; Don't ask to delete buffer after deleting file in dired
(defun my--dired-kill-before-delete (file &rest rest)
                (when-let ((buf (get-file-buffer file)))
                  (kill-buffer buf)))

(advice-add 'dired-delete-file :before 'my--dired-kill-before-delete)

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!
(setq doom-font (font-spec :family "JetBrains Mono" :size 15)
      doom-variable-pitch-font (font-spec :family "Roboto" :size 15)
      doom-big-font (font-spec :family "JetBrains Mono" :size 24))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(load-theme 'doom-gruvbox t)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; TODO: global-goto-address mode och fixa buggen när man klickar länkar
(setq browse-url-browser-function 'browse-url-xdg-open)

;; TODO: hsdfh dsf
(defun open-terminal ()
  (interactive)
  (call-process "wezterm" nil 0 nil))

;; TODO: Make it run super+shift+return
(map! :leader :desc "Run wezterm" "t t" #'open-terminal)


(map! :leader :desc "Comment line" "TAB TAB" #'comment-line)

(evil-define-key '(normal visual visual-line) web-mode-map (kbd "g%") 'web-mode-navigate)

;; (defun my/ranger-go (path)
;;   "Go subroutine"
;;   (interactive
;;    (list
;;     (read-char-choice
;;         "h   : ~
;;         c   : ~/.config
;;         d   : ~/dev
;;         f   : ~/.dotfiles
;;         D   : ~/downloads
;;         o   : ~/org
;;         p   : ~/pictures
;;         v   : ~/videos
;;         m   : ~/music
;;         s   : ~/.local/src
;;         S   : ~/.local/share
;;         b,/ : ~/.local/bin
;;         M   : /mnt
;;         r   : /
;;         > "
;;      '(?q ?h ?c ?d ?D ?o ?p ?v ?m ?s ?S ?b ?M ?r ?g ?j ?k ?T ?t ?n))))
;;   (message nil)
;;   (let* ((c (char-to-string path))
;;          (new-path
;;           (cl-case (intern c)
;;             ('h "~/")
;;             ('c "~/.config")
;;             ('d "~/dev")
;;             ('f "~/.dotfiles")
;;             ('D "~/downloads")
;;             ('o "~/org")
;;             ('p "~/pictures")
;;             ('v "~/videos")
;;             ('m "~/music")
;;             ('s "~/.local/src")
;;             ('S "~/.local/share")
;;             ('b "~/.local/bin")
;;             ('M "/mnt")
;;             ('r "/")))
;;          (alt-option
;;           (cl-case (intern c)
;;             ;; Subdir Handlng
;;             ('j 'ranger-next-subdir)
;;             ('k 'ranger-prev-subdir)
;;             ;; Tab Handling
;;             ('n 'ranger-new-tab)
;;             ('T 'ranger-prev-tab)
;;             ('t 'ranger-next-tab)
;;             ('C 'ranger-close-tab)
;;             ('g 'ranger-goto-top))))
;;     (when (string-equal c "q")
;;       (keyboard-quit))
;;     (when (and new-path (file-directory-p new-path))
;;       (ranger-find-file new-path))
;;     (when (eq system-type 'windows-nt)
;;       (when (string-equal c "D")
;;         (ranger-show-drives)))
;;     (when alt-option
;;       (call-interactively alt-option))))

;; (evil-define-key 'normal ranger-mode-map (kbd "g") 'my/ranger-go)
