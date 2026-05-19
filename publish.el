;;; publish.el --- code to publish this project -*- lexical-binding:t -*-

;; This is code so that I can execute one command and the project will
;; get "published".  Currently that will be to export index.org, Canon
;; EOS R1 Suppliment.org, and Canon EOS R5 Mark II Suppliment.org to
;; HTML.  I have hopes of also publishing epub files.
;;
;; When the repo is pushed to GitHub, the GitHub Pages will trigger a
;; build which results in the three html files being made available
;; publicly on the net.

(defun pedz/publish-canon-project ()
  "Publish the Canon-EOS-Documentation-Project"
  (interactive)
  (setq org-babel-inline-result-wrap "%s"
        org-confirm-babel-evaluate nil
        org-publish-use-timestamps-flag nil
        org-export-with-author nil
        org-html-validation-link nil
        org-publish-project-alist
        '(("Canon-EOS-Documentation-Project"
           :base-directory "~/Source/Canon-EOS-Documentation-Project"
           :publishing-function org-html-publish-to-html
           :publishing-directory "~/Source/Canon-EOS-Documentation-Project"
           :exclude ".*"
           :include ("Canon EOS R1 Supplement.org"
                     "Canon EOS R5 Mark II Supplement.org"
                     "index.org"))))
  (org-publish-all))
