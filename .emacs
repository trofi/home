(load-file "~/elisp/config")
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(c-echo-syntactic-information-p t)
 '(c-strict-syntax-p t)
 '(case-fold-search t)
 '(current-language-environment "UTF-8")
 '(default-input-method "cyrillic-jcuken")
 '(desktop-enable t nil (desktop))
 '(face-font-family-alternatives (quote (("terminus" "fixed") ("helv" "helvetica" "arial" "fixed"))))
 '(global-font-lock-mode t nil (font-lock))
 '(menu-bar-mode nil)
 '(save-place t nil (saveplace))
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t nil (paren))
 '(tool-bar-mode nil nil (tool-bar))
 '(transient-mark-mode t)
 '(visible-bell t)
 '(window-min-height 4)
 '(window-min-width 40))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "black" :foreground "gray90" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :family "xos4-terminus"))))
 '(cursor ((t (:background "white"))))
 '(show-paren-match ((((class color)) (:foreground "green" :background "darkgray" :family "terminus"))))
 '(show-paren-mismatch ((((class color)) (:foreground "red" :background "darkgray" :family "terminus"))))
 '(variable-pitch ((t (:family "terminus")))))

(setq
    x-select-enable-clipboard t
    x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)
    interprogram-paste-function 'x-cut-buffer-or-selection-value)
