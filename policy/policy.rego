package example.basic

default allowed = false


allowed {

  input.user.role == "DISTADMIN"
  
}

allowed {

  input.user.role == "SCHOOLADMIN"
  input.user.target_user_id != ""
  input.user.target_user_id == input.user.id
}

allowed {

  input.user.role == "TEACHER1"
  input.user.target_user_id != ""
  input.user.target_user_id == input.user.id
  
}

allowed {
  input.user.role == "TEACHER2"
  input.user.target_user_id != ""
  input.user.target_user_id == input.user.id
  }

