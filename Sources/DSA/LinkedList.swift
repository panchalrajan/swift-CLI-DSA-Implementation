class LinkedList<T> : Sequence {
    var head : Node<T>?

    func addNodeAtLast(_ value: T) {
        if head == nil {
            head = Node(value)
        } else {
            var current = head
            while current?.next != nil {
                current = current?.next
            }
            current?.next = Node(value)
        }
    }
    
    func addNodeAtFirst(_ value: T) {
        let newNode = Node(value)
        if head == nil {
            head = newNode
        } else {
            newNode.next = head
            head = newNode
        }
    }
    
    func printSize() {
        var current = head
        var length = 0
        while current != nil {
            current = current?.next
            length += 1
        }
        print("Size of LinkedList is : \(length)")
    }
    
    func printList() {
        var current = head
        while current != nil {
            print(current!.value, terminator: "")
            current = current?.next
            if current != nil {
                print("->", terminator: "")
            }
        }
        print()
    }
    
    func printMiddle() {
        if (head == nil || head?.next == nil) {
            print("Given Value itself is Middle Value : \(head?.value as Any)")
            return
        }
        var slow = head
        var fast = head
        while (fast?.next != nil || fast?.next?.next != nil) {
            slow = slow?.next
            fast = fast?.next?.next
        }
        print("Middle Value of Linked List is : \(slow?.value as Any)")
    }
    
    func makeIterator() -> AnyIterator<T> {
        var current = head
        return AnyIterator {
            let value = current?.value
            current = current?.next
            return value
        }
    }
}
