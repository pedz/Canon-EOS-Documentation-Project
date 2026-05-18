(find-file (car argv))
(setq org-babel-inline-result-wrap "%s"
      org-confirm-babel-evaluate nil
      org-export-with-author nil
      org-html-validation-link nil)
(org-html-export-to-html)
