#[test_only]
module todo_list::simple_todo_test {
    use std::string::{Self, String};
    use std::vector;

    
    struct TodoList has key {
        items: vector<String>,
    }

    public fun create_todo_list(account: &signer) {
        let todo_list = TodoList {
            items: vector::empty<String>(),
        };

        vector::push_back(&mut todo_list.items, string::utf8(b"Build on SUI"));
        vector::push_back(&mut todo_list.items, string::utf8(b"Teach others to build on SUI"));
        vector::push_back(&mut todo_list.items, string::utf8(b"Explore more opportunities on SUI for developers"));

        move_to(account, todo_list);
    }

    public fun add(list: &mut TodoList, item: String) {
        vector::push_back(&mut list.items, item);
    }

    public fun remove(list: &mut TodoList, index: u64): String {
        vector::remove(&mut list.items, index)
    }

    public fun get_item_count(account_addr: address): u64 acquires TodoList {
        let todo_list = borrow_global<TodoList>(account_addr);
        vector::length(&todo_list.items)
    }

    public fun get_items(account_addr: address): &vector<String> acquires TodoList {
        let todo_list = borrow_global<TodoList>(account_addr);
        &todo_list.items
    }

    #[test(account = @0x1)]
    public fun test_create_todo_list(account: signer) {
        create_todo_list(&account);
    }
}