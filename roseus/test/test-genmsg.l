#!/usr/bin/env roseus
(require :unittest "lib/llib/unittest.l")

(init-unit-test)

(ros::roseus "test_roseus_genmsg")

(deftest test-msg-instance
  (assert (ros::load-ros-manifest "test_roseus_genmsg")
          "load-ros-manifest")
  use string to avoid 
  (assert (eval (read-from-string "(instance test_roseus_genmsg::String :init)"))
          "instantiating msg message")
  )

(run-all-tests)

(exit)
