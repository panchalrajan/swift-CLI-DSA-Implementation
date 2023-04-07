class Queue<T> : Sequence {

    var head : Node<T>?
    var tail : Node<T>?
    var size: Int = 0
    
    func add(_ value: T) {
        let newNode = Node(value)
        if isEmpty() {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
        size += 1
    }

    func poll() -> T? {
        if isEmpty() {
            return nil
        } else {
            let poppedValue = head?.value
            head = head?.next
            size -= 1
            if isEmpty() {
                tail = nil
            }
            return poppedValue
        }
    }

    func peek() -> T? {
        if isEmpty() {
            return nil
        } else {
            return head?.value
        }
    }

    func printSize() {
        print("Given Queue Size is : \(size)")
    }

    func isEmpty() -> Bool {
        return head == nil && tail == nil
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
