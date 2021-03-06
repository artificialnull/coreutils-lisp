(defun print-help () (format t
"Usage: /bin/false [ignored command line arguments]
  or:  /bin/false OPTION
Exit with a status code indicating success.

      --help     display this help and exit
      --version  output version information and exit

NOTE: your shell may have its own version of false, which usually supersedes
the version described here.  Please refer to your shell's documentation
for details about the options it supports.

GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
Full documentation at: <http://www.gnu.org/software/coreutils/false>
or available locally via: info '(coreutils) false invocation'
"))
(defun print-vers () (format t
"false (GABDEG coreutils) 0.01
Copyright (C) 2017 GABDEG Studios.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Ishan Kamat.
"))

(defun main ()
  (if (string= (nth 1 *posix-argv*) "--help")
    (print-help)
    (if (string= (nth 1 *posix-argv*) "--version")
      (print-vers)))
  0)

(sb-ext:save-lisp-and-die "false" :executable t :toplevel #'main :save-runtime-options t)
