;; -------------------------
;; Package system
;; -------------------------
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)
(setq evil-undo-system 'undo-tree)

;; -------------------------
;; UI cleanup
;; -------------------------

(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq display-line-numbers-type 'relative)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)
(global-display-line-numbers-mode 1)
(global-hl-line-mode 1)
(set-face-attribute 'line-number-current-line nil 
                    :foreground "yellow")

;; -------------------------
;; Theme (single source of truth)
;; -------------------------
(load-theme 'dracula t)

;; -------------------------
;; Font (GUI only)
;; -------------------------
(set-face-attribute 'default nil
                    :family "Caskaydia Cove Nerd Font"
                    :height 160)

;; -------------------------
;; Evil mode
;; -------------------------
(require 'evil)
(setq evil-want-keybinding nil)
(evil-mode 1)

;; -------------------------
;; Window navigation (Vim-style)
;; -------------------------
(require 'windmove)
(windmove-default-keybindings)

(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-l") 'windmove-right)
(global-set-key (kbd "C-k") 'windmove-up)
(global-set-key (kbd "C-j") 'windmove-down)

;; -------------------------
;; Undo tree (Vim-like undo)
;; -------------------------
(require 'undo-tree)
(global-undo-tree-mode 1)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist
      '(("." . "~/.emacs.d/undo")))

;; -------------------------
;; Ligatures (real ones)
;; -------------------------
(when (require 'ligature nil t)
  (ligature-set-ligatures 't
    '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\"
      "{-" ":::" "::" ":=" "!!" "!=" "!==" "-}" "--" "---"
      "-->" "->" "->>" "-<" "-<<" "-~" "#{" "#[" "##"
      "###" "####" "#(" "#?" "#_" "#_(" ".-" ".=" "..<"
      "..." "..=" "..-" "..?" "::=" ":>" ":<" ":?" ":?>"
      ";;" "/*" "/**" "/=" "/==" "/>" "//" "///" "&&"
      "||" "||=" "|=" "|>" "^=" "$>" "++" "+++" "+>"
      "==" "===" "==>" "=>" "=>>" "=<<" "=/=" ">-" ">="
      ">=>" ">>" ">>-" ">>=" ">>>" "<*" "<*>" "<|" "<|>"
      "<$" "<$>" "<!--" "<-" "<--" "<->" "<+" "<+>"
      "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<="
      "<<<" "<~" "<~~" "</" "</>" "~@" "~-" "~=" "~>"
      "~~" "~~>" "%%"))
  (global-ligature-mode t))

(global-ligature-mode t)

;; -------------------------
;; Custom (leave this alone)
;; -------------------------
(custom-set-variables
 '(custom-enabled-themes '(dracula))
 '(package-selected-packages
   '(dracula-theme evil undo-tree ligature)))

(custom-set-faces)
