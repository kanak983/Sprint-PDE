Using username "ubuntu".
Authenticating with public key "ubuntu@ip-172-16-102-29"
ubuntu@4e03d27bffce:~$ curl -L -o opa https://openpolicyagent.org/downloads/v0.4
7.3/opa_linux_amd64_static
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    87  100    87    0     0   1035      0 --:--:-- --:--:-- --:--:--  1035
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 35.9M  100 35.9M    0     0  36.4M      0 --:--:-- --:--:-- --:--:--  154M
ubuntu@4e03d27bffce:~$ chmod 755 opa                                                                                                                                    
ubuntu@4e03d27bffce:~$ sudo mv opa /usr/local/bin                                                                                                                       
ubuntu@4e03d27bffce:~$ cd /var/www/policy                                                                                                                               
ubuntu@4e03d27bffce:/var/www/policy$ cd /usr/local/bin                                                                                                                  
ubuntu@4e03d27bffce:/usr/local/bin$ cd /var/www/policy
ubuntu@4e03d27bffce:/var/www/policy$ /usr/local/bin/opa test . -v policy_test.rego
policy_test.rego:
data.example.basic.test_distadmin_delete_allowed: PASS (474.303µs)
data.example.basic.test_schadmin_profile_modify_allowed: PASS (289.022µs)
data.example.basic.test_schadmin_profile_delete_allowed: PASS (547.459µs)
data.example.basic.test_schadmin_profile_read_not_allowed: PASS (411.197µs)
data.example.basic.test_teacher1_profile_read_allowed: PASS (789.706µs)
data.example.basic.test_teacher1_profile_modify_not_allowed: PASS (314.794µs)
data.example.basic.test_teacher1_profile_delete_not_allowed: PASS (510.599µs)
data.example.basic.test_teacher2_profile_read_not_allowed: PASS (261.201µs)
data.example.basic.test_teacher2_profile_read_allowed: PASS (753.413µs)
data.example.basic.test_teacher2_profile_modify_not_allowed: PASS (657.077µs)
data.example.basic.test_teacher2_profile_delete_not_allowed: PASS (1.221296ms)
--------------------------------------------------------------------------------
PASS: 11/11
ubuntu@4e03d27bffce:/var/www/policy$ /usr/local/bin/opa run policy.rego data.json
OPA 0.47.3 (commit 764b042dee706e4c29775b2b8c44baab375bbebc, built at 2022-12-12 T16:31:20Z)

Run 'help' to see a list of commands and check for updates.

> trace


> input := {"user":{"role":"DISTADMIN","user":"2345","id":"schadmin"},"api":{"collectiveNounId" : "1111", "collectiveNounType" : "Class", "resource" : "http://benchmarkuniverse.com/library/X12345","uri":"/user/{user_id}/profile","method":"DELETE"}}


Rule 'input' defined in package repl. Type 'show' to see rules.
> data.example.basic.allowed





query:1           Enter data.example.basic.allowed = _
query:1           | Eval data.example.basic.allowed = _
query:1           | Index data.example.basic.allowed (matched 1 rule, early exit)
policy.rego:6     | Enter data.example.basic.allowed
policy.rego:8     | | Eval input.user.role = "DISTADMIN"
policy.rego:6     | | Exit data.example.basic.allowed early
query:1           | Exit data.example.basic.allowed = _
query:1           Redo data.example.basic.allowed = _
query:1           | Redo data.example.basic.allowed = _
policy.rego:6     | Redo data.example.basic.allowed
policy.rego:8     | | Redo input.user.role = "DISTADMIN"
true
> input := {"user":{"role":"DISTADMIN","user":"2345","id":"schadmin"},"api":{"collectiveNounId" : "1111", "collectiveNounType" : "Class", "resource" : "http://benchmarkuniverse.com/library/X12345","uri":"/user/{user_id}/profile","method":"MODIFY"}}


Rule 'input' re-defined in package repl. Type 'show' to see rules.
> data.example.basic.allowed



query:1           Enter data.example.basic.allowed = _
query:1           | Eval data.example.basic.allowed = _
query:1           | Index data.example.basic.allowed (matched 1 rule, early exit)
policy.rego:6     | Enter data.example.basic.allowed
policy.rego:8     | | Eval input.user.role = "DISTADMIN"
policy.rego:6     | | Exit data.example.basic.allowed early
query:1           | Exit data.example.basic.allowed = _
query:1           Redo data.example.basic.allowed = _
query:1           | Redo data.example.basic.allowed = _
policy.rego:6     | Redo data.example.basic.allowed
policy.rego:8     | | Redo input.user.role = "DISTADMIN"
true
> input := {"user":{"role":"DISTADMIN","user":"2345","id":"schadmin"},"api":{"collectiveNounId" : "1111", "collectiveNounType" : "Class", "resource" : "http://benchmarkuniverse.com/library/X12345","uri":"/user/{user_id}/profile","method":"READ"}}
Rule 'input' re-defined in package repl. Type 'show' to see rules.
> data.example.basic.allowed



query:1           Enter data.example.basic.allowed = _
query:1           | Eval data.example.basic.allowed = _
query:1           | Index data.example.basic.allowed (matched 1 rule, early exit)
policy.rego:6     | Enter data.example.basic.allowed
policy.rego:8     | | Eval input.user.role = "DISTADMIN"
policy.rego:6     | | Exit data.example.basic.allowed early
query:1           | Exit data.example.basic.allowed = _
query:1           Redo data.example.basic.allowed = _
query:1           | Redo data.example.basic.allowed = _
policy.rego:6     | Redo data.example.basic.allowed
policy.rego:8     | | Redo input.user.role = "DISTADMIN"
true
> input := {"user":{"role":"SCHOOLADMIN","id":"teacher1","user":"2345","target_user_id" : "schadmin"},"api":{"collectiveNounId" : "1111", "collectiveNounType" : "Class", "resource" : "http://benchmarkuniverse.com/library/X12345","uri":"/user/{user_id}/profile","method":"READ"}}


Rule 'input' re-defined in package repl. Type 'show' to see rules.
> data.example.basic.allowed



query:1            Enter data.example.basic.allowed = _
query:1            | Eval data.example.basic.allowed = _
query:1            | Index data.example.basic.allowed (matched 1 rule, early exit)
policy.rego:12     | Enter data.example.basic.allowed
policy.rego:14     | | Eval input.user.role = "SCHOOLADMIN"
policy.rego:15     | | Eval __local0__ = input.user.target_user_id
policy.rego:15     | | Eval neq(__local0__, "")
policy.rego:16     | | Eval input.user.target_user_id = input.user.id
policy.rego:16     | | Fail input.user.target_user_id = input.user.id
policy.rego:15     | | Redo neq(__local0__, "")
policy.rego:15     | | Redo __local0__ = input.user.target_user_id
policy.rego:14     | | Redo input.user.role = "SCHOOLADMIN"
policy.rego:3      | Enter data.example.basic.allowed
policy.rego:3      | | Eval true
policy.rego:3      | | Exit data.example.basic.allowed early
query:1            | Exit data.example.basic.allowed = _
query:1            Redo data.example.basic.allowed = _
query:1            | Redo data.example.basic.allowed = _
policy.rego:3      | Redo data.example.basic.allowed
policy.rego:3      | | Redo true
false
> input := {"user":{"role":"SCHOOLADMIN","id":"schadmin","user":"2345","target_user_id" : "schadmin"},"api":{"collectiveNounId" : "1111", "collectiveNounType" : "Class", "resource" : "http://benchmarkuniverse.com/library/X12345","uri":"/user/{user_id}/profile","method":"DELETE"}}


Rule 'input' re-defined in package repl. Type 'show' to see rules.
> data.example.basic.allowed



query:1            Enter data.example.basic.allowed = _
query:1            | Eval data.example.basic.allowed = _
query:1            | Index data.example.basic.allowed (matched 1 rule, early exit)
policy.rego:12     | Enter data.example.basic.allowed
policy.rego:14     | | Eval input.user.role = "SCHOOLADMIN"
policy.rego:15     | | Eval __local0__ = input.user.target_user_id
policy.rego:15     | | Eval neq(__local0__, "")
policy.rego:16     | | Eval input.user.target_user_id = input.user.id
policy.rego:12     | | Exit data.example.basic.allowed early
query:1            | Exit data.example.basic.allowed = _
query:1            Redo data.example.basic.allowed = _
query:1            | Redo data.example.basic.allowed = _
policy.rego:12     | Redo data.example.basic.allowed
policy.rego:16     | | Redo input.user.target_user_id = input.user.id
policy.rego:15     | | Redo neq(__local0__, "")
policy.rego:15     | | Redo __local0__ = input.user.target_user_id
policy.rego:14     | | Redo input.user.role = "SCHOOLADMIN"
true
> input := {"user":{"role":"SCHOOLADMIN","id":"schadmin","user":"2345","target_user_id" : "schadmin"},"api":{"collectiveNounId" : "1111", "collectiveNounType" : "Class", "resource" : "http://benchmarkuniverse.com/library/X12345","uri":"/user/{user_id}/profile","method":"MODIFY"}}
Rule 'input' re-defined in package repl. Type 'show' to see rules.
> data.example.basic.allowed



query:1            Enter data.example.basic.allowed = _
query:1            | Eval data.example.basic.allowed = _
query:1            | Index data.example.basic.allowed (matched 1 rule, early exit)
policy.rego:12     | Enter data.example.basic.allowed
policy.rego:14     | | Eval input.user.role = "SCHOOLADMIN"
policy.rego:15     | | Eval __local0__ = input.user.target_user_id
policy.rego:15     | | Eval neq(__local0__, "")
policy.rego:16     | | Eval input.user.target_user_id = input.user.id
policy.rego:12     | | Exit data.example.basic.allowed early
query:1            | Exit data.example.basic.allowed = _
query:1            Redo data.example.basic.allowed = _
query:1            | Redo data.example.basic.allowed = _
policy.rego:12     | Redo data.example.basic.allowed
policy.rego:16     | | Redo input.user.target_user_id = input.user.id
policy.rego:15     | | Redo neq(__local0__, "")
policy.rego:15     | | Redo __local0__ = input.user.target_user_id
policy.rego:14     | | Redo input.user.role = "SCHOOLADMIN"
true
> input := {"user":{"role":"TEACHER1","id":"teacher1","user" : "1234","target_user_id" : "teacher1"},"api":{"collectiveNounId" : "1111", "collectiveNounType" : "Class", "resource" : "http://benchmarkuniverse.com/library/X12345","uri":"/user/{user_id}/profile","method":"READ"}}


Rule 'input' re-defined in package repl. Type 'show' to see rules.
> data.example.basic.allowed



query:1            Enter data.example.basic.allowed = _
query:1            | Eval data.example.basic.allowed = _
query:1            | Index data.example.basic.allowed (matched 1 rule, early exit)
policy.rego:19     | Enter data.example.basic.allowed
policy.rego:21     | | Eval input.user.role = "TEACHER1"
policy.rego:22     | | Eval __local1__ = input.user.target_user_id
policy.rego:22     | | Eval neq(__local1__, "")
policy.rego:23     | | Eval input.user.target_user_id = input.user.id
policy.rego:19     | | Exit data.example.basic.allowed early
query:1            | Exit data.example.basic.allowed = _
query:1            Redo data.example.basic.allowed = _
query:1            | Redo data.example.basic.allowed = _
policy.rego:19     | Redo data.example.basic.allowed
policy.rego:23     | | Redo input.user.target_user_id = input.user.id
policy.rego:22     | | Redo neq(__local1__, "")
policy.rego:22     | | Redo __local1__ = input.user.target_user_id
policy.rego:21     | | Redo input.user.role = "TEACHER1"
true
> input := {"user":{"role":"TEACHER1","id":"teacher1","user" : "1234","target_user_id" : "teacher2"},"api":{"collectiveNounId" : "1111", "collectiveNounType" : "Class", "resource" : "http://benchmarkuniverse.com/library/X12345","uri":"/user/{user_id}/profile","method":"READ"}}
Rule 'input' re-defined in package repl. Type 'show' to see rules.
> data.example.basic.allowed



query:1            Enter data.example.basic.allowed = _
query:1            | Eval data.example.basic.allowed = _
query:1            | Index data.example.basic.allowed (matched 1 rule, early exit)
policy.rego:19     | Enter data.example.basic.allowed
policy.rego:21     | | Eval input.user.role = "TEACHER1"
policy.rego:22     | | Eval __local1__ = input.user.target_user_id
policy.rego:22     | | Eval neq(__local1__, "")
policy.rego:23     | | Eval input.user.target_user_id = input.user.id
policy.rego:23     | | Fail input.user.target_user_id = input.user.id
policy.rego:22     | | Redo neq(__local1__, "")
policy.rego:22     | | Redo __local1__ = input.user.target_user_id
policy.rego:21     | | Redo input.user.role = "TEACHER1"
policy.rego:3      | Enter data.example.basic.allowed
policy.rego:3      | | Eval true
policy.rego:3      | | Exit data.example.basic.allowed early
query:1            | Exit data.example.basic.allowed = _
query:1            Redo data.example.basic.allowed = _
query:1            | Redo data.example.basic.allowed = _
policy.rego:3      | Redo data.example.basic.allowed
policy.rego:3      | | Redo true
false
> input := {"user":{"role":"TEACHER1","id":"teacher1","user" : "1234","target_user_id" : "schadmin"},"api":{"collectiveNounId" : "1111", "collectiveNounType" : "Class", "resource" : "http://benchmarkuniverse.com/library/X12345","uri":"/user/{user_id}/profile","method":"MODIFY"}}


Rule 'input' re-defined in package repl. Type 'show' to see rules.
> data.example.basic.allowed



query:1            Enter data.example.basic.allowed = _
query:1            | Eval data.example.basic.allowed = _
query:1            | Index data.example.basic.allowed (matched 1 rule, early exit)
policy.rego:19     | Enter data.example.basic.allowed
policy.rego:21     | | Eval input.user.role = "TEACHER1"
policy.rego:22     | | Eval __local1__ = input.user.target_user_id
policy.rego:22     | | Eval neq(__local1__, "")
policy.rego:23     | | Eval input.user.target_user_id = input.user.id
policy.rego:23     | | Fail input.user.target_user_id = input.user.id
policy.rego:22     | | Redo neq(__local1__, "")
policy.rego:22     | | Redo __local1__ = input.user.target_user_id
policy.rego:21     | | Redo input.user.role = "TEACHER1"
policy.rego:3      | Enter data.example.basic.allowed
policy.rego:3      | | Eval true
policy.rego:3      | | Exit data.example.basic.allowed early
query:1            | Exit data.example.basic.allowed = _
query:1            Redo data.example.basic.allowed = _
query:1            | Redo data.example.basic.allowed = _
policy.rego:3      | Redo data.example.basic.allowed
policy.rego:3      | | Redo true
false
> input := {"user":{"role":"TEACHER1","id":"teacher1","user" : "1234","target_user_id" : "distadmin"},"api":{"collectiveNounId" : "1111", "collectiveNounType" : "Class", "resource" : "http://benchmarkuniverse.com/library/X12345","uri":"/user/{user_id}/profile","method":"DELETE"}}
Rule 'input' re-defined in package repl. Type 'show' to see rules.
> data.example.basic.allowed



query:1            Enter data.example.basic.allowed = _
query:1            | Eval data.example.basic.allowed = _
query:1            | Index data.example.basic.allowed (matched 1 rule, early exit)
policy.rego:19     | Enter data.example.basic.allowed
policy.rego:21     | | Eval input.user.role = "TEACHER1"
policy.rego:22     | | Eval __local1__ = input.user.target_user_id
policy.rego:22     | | Eval neq(__local1__, "")
policy.rego:23     | | Eval input.user.target_user_id = input.user.id
policy.rego:23     | | Fail input.user.target_user_id = input.user.id
policy.rego:22     | | Redo neq(__local1__, "")
policy.rego:22     | | Redo __local1__ = input.user.target_user_id
policy.rego:21     | | Redo input.user.role = "TEACHER1"
policy.rego:3      | Enter data.example.basic.allowed
policy.rego:3      | | Eval true
policy.rego:3      | | Exit data.example.basic.allowed early
query:1            | Exit data.example.basic.allowed = _
query:1            Redo data.example.basic.allowed = _
query:1            | Redo data.example.basic.allowed = _
policy.rego:3      | Redo data.example.basic.allowed
policy.rego:3      | | Redo true
false
> input := {"user":{"role":"TEACHER2","id":"teacher2","user" : "1234","target_user_id" : "teacher2"},"api":{"collectiveNounId" : "1111", "collectiveNounType" : "Class", "resource" : "http://benchmarkuniverse.com/library/X12345","uri":"/user/{user_id}/profile","method":"READ"}}
Rule 'input' re-defined in package repl. Type 'show' to see rules.
> data.example.basic.allowed



query:1            Enter data.example.basic.allowed = _
query:1            | Eval data.example.basic.allowed = _
query:1            | Index data.example.basic.allowed (matched 1 rule, early exit)
policy.rego:27     | Enter data.example.basic.allowed
policy.rego:28     | | Eval input.user.role = "TEACHER2"
policy.rego:29     | | Eval __local2__ = input.user.target_user_id
policy.rego:29     | | Eval neq(__local2__, "")
policy.rego:30     | | Eval input.user.target_user_id = input.user.id
policy.rego:27     | | Exit data.example.basic.allowed early
query:1            | Exit data.example.basic.allowed = _
query:1            Redo data.example.basic.allowed = _
query:1            | Redo data.example.basic.allowed = _
policy.rego:27     | Redo data.example.basic.allowed
policy.rego:30     | | Redo input.user.target_user_id = input.user.id
policy.rego:29     | | Redo neq(__local2__, "")
policy.rego:29     | | Redo __local2__ = input.user.target_user_id
policy.rego:28     | | Redo input.user.role = "TEACHER2"
true
> input := {"user":{"role":"TEACHER2","id":"teacher2","user" : "1234","target_user_id" : "teacher1"},"api":{"collectiveNounId" : "1111", "collectiveNounType" : "Class", "resource" : "http://benchmarkuniverse.com/library/X12345","uri":"/user/{user_id}/profile","method":"READ"}}
Rule 'input' re-defined in package repl. Type 'show' to see rules.
> data.example.basic.allowed



query:1            Enter data.example.basic.allowed = _
query:1            | Eval data.example.basic.allowed = _
query:1            | Index data.example.basic.allowed (matched 1 rule, early exit)
policy.rego:27     | Enter data.example.basic.allowed
policy.rego:28     | | Eval input.user.role = "TEACHER2"
policy.rego:29     | | Eval __local2__ = input.user.target_user_id
policy.rego:29     | | Eval neq(__local2__, "")
policy.rego:30     | | Eval input.user.target_user_id = input.user.id
policy.rego:30     | | Fail input.user.target_user_id = input.user.id
policy.rego:29     | | Redo neq(__local2__, "")
policy.rego:29     | | Redo __local2__ = input.user.target_user_id
policy.rego:28     | | Redo input.user.role = "TEACHER2"
policy.rego:3      | Enter data.example.basic.allowed
policy.rego:3      | | Eval true
policy.rego:3      | | Exit data.example.basic.allowed early
query:1            | Exit data.example.basic.allowed = _
query:1            Redo data.example.basic.allowed = _
query:1            | Redo data.example.basic.allowed = _
policy.rego:3      | Redo data.example.basic.allowed
policy.rego:3      | | Redo true
false
> input := {"user":{"role":"TEACHER2","id":"teacher2","user" : "1234","target_user_id" : "schadmin"},"api":{"collectiveNounId" : "1111", "collectiveNounType" : "Class", "resource" : "http://benchmarkuniverse.com/library/X12345","uri":"/user/{user_id}/profile","method":"MODIFY"}}
Rule 'input' re-defined in package repl. Type 'show' to see rules.
> data.example.basic.allowed



query:1            Enter data.example.basic.allowed = _
query:1            | Eval data.example.basic.allowed = _
query:1            | Index data.example.basic.allowed (matched 1 rule, early exit)
policy.rego:27     | Enter data.example.basic.allowed
policy.rego:28     | | Eval input.user.role = "TEACHER2"
policy.rego:29     | | Eval __local2__ = input.user.target_user_id
policy.rego:29     | | Eval neq(__local2__, "")
policy.rego:30     | | Eval input.user.target_user_id = input.user.id
policy.rego:30     | | Fail input.user.target_user_id = input.user.id
policy.rego:29     | | Redo neq(__local2__, "")
policy.rego:29     | | Redo __local2__ = input.user.target_user_id
policy.rego:28     | | Redo input.user.role = "TEACHER2"
policy.rego:3      | Enter data.example.basic.allowed
policy.rego:3      | | Eval true
policy.rego:3      | | Exit data.example.basic.allowed early
query:1            | Exit data.example.basic.allowed = _
query:1            Redo data.example.basic.allowed = _
query:1            | Redo data.example.basic.allowed = _
policy.rego:3      | Redo data.example.basic.allowed
policy.rego:3      | | Redo true
false
> input := {"user":{"role":"TEACHER2","id":"teacher2","user" : "1234","target_user_id" : "distadmin"},"api":{"collectiveNounId" : "1111", "collectiveNounType" : "Class", "resource" : "http://benchmarkuniverse.com/library/X12345","uri":"/user/{user_id}/profile","method":"DELETE"}}
Rule 'input' re-defined in package repl. Type 'show' to see rules.
> data.example.basic.allowed



query:1            Enter data.example.basic.allowed = _
query:1            | Eval data.example.basic.allowed = _
query:1            | Index data.example.basic.allowed (matched 1 rule, early exit)
policy.rego:27     | Enter data.example.basic.allowed
policy.rego:28     | | Eval input.user.role = "TEACHER2"
policy.rego:29     | | Eval __local2__ = input.user.target_user_id
policy.rego:29     | | Eval neq(__local2__, "")
policy.rego:30     | | Eval input.user.target_user_id = input.user.id
policy.rego:30     | | Fail input.user.target_user_id = input.user.id
policy.rego:29     | | Redo neq(__local2__, "")
policy.rego:29     | | Redo __local2__ = input.user.target_user_id
policy.rego:28     | | Redo input.user.role = "TEACHER2"
policy.rego:3      | Enter data.example.basic.allowed
policy.rego:3      | | Eval true
policy.rego:3      | | Exit data.example.basic.allowed early
query:1            | Exit data.example.basic.allowed = _
query:1            Redo data.example.basic.allowed = _
query:1            | Redo data.example.basic.allowed = _
policy.rego:3      | Redo data.example.basic.allowed
policy.rego:3      | | Redo true
false
> ^C
>
> exit
ubuntu@4e03d27bffce:/var/www/policy$
