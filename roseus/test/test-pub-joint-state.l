#!/usr/bin/env roseus
;;;
;;;
(ros::load-ros-manifest "roseus")
(ros::load-ros-manifest "sensor_msgs")

(ros::roseus "pub_joint_state")
(ros::advertise "joint_state" sensor_msgs::JointState 1)
(ros::rate 10)
(setq msg (instance sensor_msgs::JointState :init))
(send msg :name (list "1" "2" "3"))
(send msg :position (list 1.0 4.0 5.0))
(send msg :velocity (list 1.0 4.0 5.0))
(send msg :effort (list 1.0 4.0 5.0))

(while (ros::ok)
  (ros::publish "joint_state" msg)
  (ros::sleep))
(ros::roseus "shutdown")
(exit)
