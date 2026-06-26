#open "eq";;
#open "int";;
#open "string";;

let current_dir_name = ".";;

let concat dir file =
  let len = string_length dir in
  if len = 0 then file
  else if nth_char dir (len - 1) = `/` then dir ^ file
  else dir ^ "/" ^ file;;

let is_absolute s =
  let len = string_length s in
  if len = 0 then false
  else if nth_char s 0 = `/` then true
  else if len >= 2 then
    if sub_string s 0 2 = "./" then true
    else if len >= 3 then
      if sub_string s 0 3 = "../" then true
      else false
    else false
  else false;;

let check_suffix name suff =
  let len_name = string_length name in
  let len_suff = string_length suff in
  if len_name < len_suff then false
  else sub_string name (len_name - len_suff) len_suff = suff;;

let chop_suffix name suff =
  let len_name = string_length name in
  let len_suff = string_length suff in
  sub_string name 0 (len_name - len_suff);;

let basename name =
  let len = string_length name in
  let rec find_last i =
    if i < 0 then 0
    else if nth_char name i = `/` then i + 1
    else find_last (i - 1)
  in
  let pos = find_last (len - 1) in
  sub_string name pos (len - pos);;

let dirname name =
  let len = string_length name in
  let rec find_last i =
    if i < 0 then -1
    else if nth_char name i = `/` then i
    else find_last (i - 1)
  in
  let pos = find_last (len - 1) in
  if pos = -1 then "."
  else if pos = 0 then "/"
  else sub_string name 0 pos;;

