;; Editor.
(defun donya/normal-mode ()
  (interactive)
  (if (not ryo-modal-mode) (ryo-modal-mode))
  (if (region-active-p) (deactivate-mark))
  (isearch-cancel))
  
;; File navigation.
(defun donya/open-init-file ()
  (interactive)
  (switch-to-buffer
    (find-file-noselect (expand-file-name "init.el" user-emacs-directory))))

;; Text navigation.
(defun donya/window-half-height ()
  (max 1 (/ (1- (window-height (selected-window))) 2)))

(defun donya/scroll-up-half ()
  (interactive)
  (scroll-up (donya/window-half-height)))

(defun donya/scroll-down-half ()         
  (interactive)                    
  (scroll-down (donya/window-half-height)))
