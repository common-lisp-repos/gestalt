(in-package :gestalt)

(defvar *webapps* (make-hash-table :test #'equalp) "The web apps")

;; Web application metaclass
(defclass webapp-class (standard-class)
  ((home-package
    :accessor webapp-class-home-package :initform *package*
    :documentation "The current package when I was defined."))
  (:documentation "The class of all webapp classes."))

(defmethod validate-superclass ((self webapp-class) (super standard-class))
  (typep (class-name (class-of super))
	 '(member standard-class webapp-class)))

(defmethod shared-initialize :after
    ((self webapp-class) slots &key autostart &allow-other-keys)
  (declare (ignore slots))
  (let ((name (class-name self)))
    (pushnew name (symbol-value '*webapps*))))