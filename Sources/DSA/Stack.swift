class Stack<T> : Sequence {
    
    var head: Node<T>?
    var size: Int = 0
    
    func push(_ value: T) {
        let newNode = Node(value)
        newNode.next = head
        head = newNode
        size += 1
    }
    
    func pop() -> T? {
        guard let poppedValue = head?.value else {
            return nil
        }
        head = head?.next
        size -= 1
        return poppedValue
    }
    
    func peek() -> T? {
        let peekedValue = head?.value
        return peekedValue
    }
    
    func printSize() {
        print("Stack Size: \(size)")
    }
    
    func isEmpty() -> Bool {
        return head == nil
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

    func makeIterator() -> AnyIterator<T> {
        var current = head
        return AnyIterator {
            let value = current?.value
            current = current?.next
            return value
        }
    }
}



//class Stack<T> : Sequence {
//
//    var head : Node<T>?
//    var size: Int = 0
//
//    func push(_ value: T) {
//        let newNode = Node(value)
//        newNode.next = head
//        head = newNode
//    }
//
//    func printList() {
//        var current = head
//        while current != nil {
//            print(current!.value, terminator: "")
//            current = current?.next
//            if current != nil {
//                print("->", terminator: "")
//            }
//        }
//        print()
//    }
//
//    func pop() -> T? {
//        let poppedValue = head?.value
//        head = head?.next
//        return poppedValue
//    }
//
//    func peek() -> T? {
//        let peekedValue = head?.value
//        return peekedValue
//    }
//
//    func printSize() {
//        var count = 0
//        if head == nil {
//            print("Stack is Empty")
//            return
//        }
//        var current = head
//        while current != nil {
//            count += 1
//            current = current!.next
//        }
//        print("Given Stack Size is : \(count)")
//    }
//
//    func isEmpty() -> Bool {
//        if (head == nil) {
//            return true
//        }
//        return false
//    }
//
//    func makeIterator() -> AnyIterator<T> {
//        var current = head
//        return AnyIterator {
//            let value = current?.value
//            current = current?.next
//            return value
//        }
//    }
//}
