module workshop_pproject::todo_list{
    use std::string::string;

    transfer::public_transfer()
    /// List of todos. Can be managed by the owner and shared with others.
    public struct TodoList has key, store {
        id: UID,
        items: vector<String>
    }
    /// Create a new todo list.
public fun new(ctx: &mut TxContext): TodoList {
    let list = TodoList {
        id: object::new(ctx),
        items: vector[]
    };

    (list)
}

/// Add a new todo item to the list.
public fun add(list: &mut TodoList, item: String) {
    list.items.push_back(item);
}

/// Remove a todo item from the list by index.
public fun remove(list: &mut TodoList, index: u64): String {
    list.items.remove(index)
}




}
