#!/usr/bin/env roseus
;;;
;;;
(ros::load-ros-manifest "roseus")
(ros::load-ros-manifest "sensor_msgs")
(require :unittest "lib/llib/unittest.l")

(init-unit-test)


(ros::roseus "sub_joint_state")
;; method call
(defclass joint-state-cb-class
    :super propertied-object
  :slots (count prev-msg))
(defmethod joint-state-cb-class
    (:init
     ()
     (setq count 0)
     (setq prev-msg nil)
     (ros::subscribe "joint_state" sensor_msgs::JointState #'send self :joint-state-cb))
  (:joint-state-cb
   (msg)
   (incf count)
   (setq prev-msg msg)
   )
  (:count () count)
  )

(deftest test-sub-joint-state ()
  (setq m (instance joint-state-cb-class :init))

  (while (< (send m :count) 10)
    (ros::spin-once)
    ))

(run-all-tests)
(exit)
