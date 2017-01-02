(defun kill (c h)
  (sb-ext:quit))

(defun print-help () (format t
"Usage: yes [STRING]...
  or:  yes OPTION
Repeatedly output a line with all specified STRING(s), or 'y'.

      --help     display this help and exit
      --version  output version information and exit

GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
Full documentation at: <http://www.gnu.org/software/coreutils/yes>
or available locally via: info '(coreutils) yes invocation'
"))

(defun print-vers () (format t
"yes (GABDEG coreutils) 0.01
Copyright (C) 2017 GABDEG Studios.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Ishan Kamat.
"))

(defun main ()
  (setf *debugger-hook* #'kill)
  (let ((args
          (remove-if (constantly t) *posix-argv* :start 0 :count 1)))
    (if (= (length args) 0)
      (setf args (list "y")))
    (when (string= (nth 0 args) "--help")
      (print-help)
      (sb-ext:quit))
    (when (string= (nth 0 args) "--version")
      (print-vers)
      (sb-ext:quit))
    (loop
      (loop for arg in args do
            (format t "~a " arg))
      (format t "~%"))))

(sb-ext:save-lisp-and-die "eyes" :executable t :toplevel #'main :save-runtime-options t)
