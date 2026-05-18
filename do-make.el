(find-file (car argv))
;; (require 'org)
(setq org-babel-inline-result-wrap "%s"
      org-confirm-babel-evaluate nil)
(org-html-export-to-html)
