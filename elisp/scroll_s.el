;;
;; __ Original author is
;
;; Hsueh-Li Lu. English name is Vincent.
;
;; __ Downloaded from:
;
;; <http://www.cs.utexas.edu/users/hllu/EmacsSmoothScrolling.html>
;
;;  __ Feature of "Y constant cursor position" added by olecom.
;;
;; usage:
;(global-set-key (kbd "<down>") 'next-one-line)
;(global-set-key (kbd "<up>") 'previous-one-line)
(global-set-key (kbd "C-<down>") 'next-one-line-cc)
(global-set-key (kbd "C-<up>") 'previous-one-line-cc)

(defun point-of-beginning-of-bottom-line ()
  (save-excursion
    (move-to-window-line -1)
    (point)))

(defun point-of-beginning-of-line ()
  (save-excursion
    (beginning-of-line)
    (point)))

(defun next-one-line () (interactive)
  (if (= (point-of-beginning-of-bottom-line) (point-of-beginning-of-line))
      (progn (scroll-up 1)
             (next-line 1))
    (next-line 1)))

(defun next-one-line-cc () (interactive)
  (if (= (point-of-beginning-of-bottom-line) (point-of-beginning-of-line))
      (progn (scroll-up 1)
             (next-line 1))
    (next-line 1)
    (scroll-up 1)))

(defun point-of-beginning-of-top-line ()
  (save-excursion
    (move-to-window-line 0)
    (point)))

(defun previous-one-line () (interactive)
  (if (= (point-of-beginning-of-top-line) (point-of-beginning-of-line))
      (progn (scroll-down 1)
             (previous-line 1))
    (previous-line 1)))

(defun previous-one-line-cc () (interactive)
  (if (= (point-of-beginning-of-top-line) (point-of-beginning-of-line))
      (progn (scroll-down 1)
             (previous-line 1))
    (previous-line 1)
    (scroll-down 1)))

(provide 'scroll_s)
