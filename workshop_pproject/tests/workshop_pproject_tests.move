#[test_only]
module workshop_pproject::todo_list_tests{
    use workshop_pproject::todo_list{TodoList, self};
}


// uncomment this line to import the module
// use workshop_pproject::workshop_pproject;

const ENotImplemented: u64 = 0;

#[test]
fun test_workshop_pproject() {
    // pass
}

#[test, expected_failure(abort_code = ::workshop_pproject::workshop_pproject_tests::ENotImplemented)]
fun test_workshop_pproject_fail() {
    abort ENotImplemented
}
*/
