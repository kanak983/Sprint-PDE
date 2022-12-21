package example.basic

test_distadmin_delete_allowed {
  allowed with input as {
    "user":  {
      "role" : "DISTADMIN",
      "id" : "distadmin",
      "user" : "2345"
    },
    "api": {
    "collectiveNounId" : "1111",
    "collectiveNounType" : "Class",
    "resource" : "http://benchmarkuniverse.com/library/X12345",
      "url" : "/users/{user_id}/profile",
      "method" : "DELETE"
    }
  }
}

test_schadmin_profile_modify_allowed {
  allowed with input as {
    "user": {
      "role" : "SCHOOLADMIN",
      "id" : "schadmin",
      "user" : "2345",
      "target_user_id" : "schadmin"
      
    },
    "api": {
     "collectiveNounId" : "1111",
    "collectiveNounType" : "Class",
    "resource" : "http://benchmarkuniverse.com/library/X12345",
      "url" : "/users/{user_id}/profile",
      "method" : "MODIFY"
    }
  }
}


test_schadmin_profile_delete_allowed {
  allowed with input as {
    "user": {
      "role" : "SCHOOLADMIN",
      "id" : "schadmin",
      "user" : "2345",
      "target_user_id" : "schadmin"
    },
    "api": {
     "collectiveNounId" : "1111",
    "collectiveNounType" : "Class",
    "resource" : "http://benchmarkuniverse.com/library/X12345",
      "url" : "/users/{user_id}/profile",
      "method" : "DELETE"
    }
  }
}


test_schadmin_profile_read_not_allowed {
  not allowed with input as {
    "user": {
      "role" : "SCHOOLADMIN",
      "id" : "schadmin",
      "user" : "2345",
      "target_user_id" : "teacher1"
    },
    "api": {
     "collectiveNounId" : "1111",
    "collectiveNounType" : "Class",
    "resource" : "http://benchmarkuniverse.com/library/X12345",
      "url" : "/users/{user_id}/profile",
      "method" : "READ"
    }
  }
}




test_teacher1_profile_read_allowed {
  allowed with input as {
    "user": {
      "role" : "TEACHER1",
      "id" : "teacher1",
      "user" : "1234",
      "target_user_id" : "teacher1"
    },
    "api": {
     "collectiveNounId" : "1111",
    "collectiveNounType" : "Class",
    "resource" : "http://benchmarkuniverse.com/library/X12345",
      "url" : "/users/{user_id}/profile",
      "method" : "READ"
    }
  }
}


test_teacher1_profile_modify_not_allowed {
  not allowed with input as {
    "user": {
      "role" : "TEACHER1",
      "id" : "teacher1",
      "user" : "1234",
      "target_user_id" : "schadmin"
    },
    "api": {
     "collectiveNounId" : "1111",
    "collectiveNounType" : "Class",
    "resource" : "http://benchmarkuniverse.com/library/X12345",
      "url" : "/users/{user_id}/profile",
      "method" : "MODIFY"
    }
  }
}

test_teacher1_profile_delete_not_allowed {
  not allowed with input as {
    "user": {
      "role" : "TEACHER1",
      "id" : "teacher1",
      "user" : "1234",
      "target_user_id" : "distadmin"
    },
    "api": {
     "collectiveNounId" : "1111",
    "collectiveNounType" : "Class",
    "resource" : "http://benchmarkuniverse.com/library/X12345",
      "url" : "/users/{user_id}/profile",
      "method" : "DELETE"
    }
  }
}


test_teacher2_profile_read_not_allowed {
  not allowed with input as {
    "user": {
      "role" : "TEACHER1",
      "id" : "teacher1",
      "user" : "1234",
      "target_user_id" : "teacher2"
    },
    "api": {
     "collectiveNounId" : "1111",
    "collectiveNounType" : "Class",
    "resource" : "http://benchmarkuniverse.com/library/X12345",
      "url" : "/users/{user_id}/profile",
      "method" : "READ"
    }
  }
}

test_teacher2_profile_read_allowed {
  allowed with input as {
    "user": {
      "role" : "TEACHER2",
      "id" : "teacher2",
      "user" : "1234",
      "target_user_id" : "teacher2"
    },
    "api": {
     "collectiveNounId" : "1111",
    "collectiveNounType" : "Class",
    "resource" : "http://benchmarkuniverse.com/library/X12345",
      "url" : "/users/{user_id}/profile",
      "method" : "READ"
    }
  }
}

test_teacher2_profile_modify_not_allowed {
  not allowed with input as {
    "user": {
      "role" : "TEACHER2",
      "id" : "teacher2",
      "user" : "1234",
      "target_user_id" : "schadmin"
    },
    "api": {
     "collectiveNounId" : "1111",
    "collectiveNounType" : "Class",
    "resource" : "http://benchmarkuniverse.com/library/X12345",
      "url" : "/users/{user_id}/profile",
      "method" : "MODIFY"
    }
  }
}

test_teacher2_profile_delete_not_allowed {
  not allowed with input as {
    "user": {
      "role" : "TEACHER2",
      "id" : "teacher2",
      "user" : "1234",
      "target_user_id" : "distadmin"
    },
    "api": {
     "collectiveNounId" : "1111",
    "collectiveNounType" : "Class",
    "resource" : "http://benchmarkuniverse.com/library/X12345",
      "url" : "/users/{user_id}/profile",
      "method" : "DELETE"
    }
  }
}
