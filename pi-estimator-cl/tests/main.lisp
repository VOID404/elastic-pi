(defpackage pi-estimator/tests/main
  (:use :cl
        :pi-estimator
        :rove))
(in-package :pi-estimator/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :pi-estimator)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
