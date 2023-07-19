(defsystem "pi-estimator"
  :version "0.1.0"
  :author "VOID404"
  :license "MPL-2.0"
  :depends-on (:iterate)
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "pi-estimator/tests"))))

(defsystem "pi-estimator/tests"
  :author "VOID404"
  :license "MPL-2.0"
  :depends-on ("pi-estimator"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for pi-estimator"
  :perform (test-op (op c) (symbol-call :rove :run c)))
