;;; sql-indent-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "sql-indent" "sql-indent.el" (0 0 0 0))
;;; Generated autoloads from sql-indent.el

(autoload 'sqlind-minor-mode "sql-indent" "\
Toggle SQL syntactic indentation on or off.
With syntactic indentation, hitting TAB on a line in a SQL buffer
will indent the line according to the syntactic context of the
SQL statement being edited.

A set of alignment rules are also enabled with this minor mode.
Selecting a region of text and typing `M-x align RET` will align
the statements.  This can be used, for example, to align the 'as'
column aliases in select statements.

\(fn &optional ARG)" t nil)

(autoload 'sqlind-setup "sql-indent" "\
Enable SQL syntactic indentation unconditionally.
This function is deprecated, consider using the function
`sqlind-minor-mode' instead.

\(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sql-indent" '("sqlind-")))

;;;***

;;;### (autoloads nil "sql-indent-left" "sql-indent-left.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from sql-indent-left.el

(autoload 'sqlind-setup-style-left "sql-indent-left" "\
Define an sql-indentation style where keywords are left aligned.

\(fn)" t nil)

(autoload 'sqlind-setup-style-right "sql-indent-left" "\
Define an sql-indentation style where keywords are right aligned.

\(fn)" t nil)

(autoload 'sqlind-setup-style-default "sql-indent-left" "\
Define an sql-indentation style where keywords are right aligned.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sql-indent-left" '("sqlind-indent" "indent-case-statement-items")))

;;;***

;;;### (autoloads nil nil ("sql-indent-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; sql-indent-autoloads.el ends here
