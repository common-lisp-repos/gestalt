(in-package :gestalt)

(defcomponent counters-showcase ()
  ())

(defmethod initialize-instance :after ((counters counters-showcase) &rest initargs)
  (add-component counters 'counter-1 (make-instance 'counter :value 1))
  (add-component counters 'counter-2 (make-instance 'counter :value 2))
  (add-component counters 'counter-3 (make-instance 'counter :value 3)))

(defmethod render ((counters counters-showcase))
  (loop for counter in (child-components counters)
       do (render counter)))