package app1.abac

import future.keywords.if

default allow := false

allow if user_is_distadmin

allow if {

	user_is_teacher
	action_is_read
}
allow if {
	user_is_schooladmin
	user_is_senior
	action_is_modify
}
allow if {
	user_is_distadmin
	action_is_delete
	not REGOPolicy_is_adopted
}

user_is_distadmin if data.user_attributes[input.user].title == "distadmin"

user_is_teacher if data.user_attributes[input.user].title == "teacher"

user_is_schooladmin if data.user_attributes[input.user].title == "schooladmin"

user_is_senior if data.user_attributes[input.user].experience > 8

action_is_read if input.action == "read"

action_is_modify if input.action == "modify"

action_is_delete if input.action == "delete"

REGOPolicy_is_adopted if data.REGOPolicy_attributes[input.resource].adopted == true
