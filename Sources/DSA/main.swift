import ArgumentParser
import Foundation

struct DSATool: ParsableCommand {

    @Flag(name : .long, help: "Use linked list") var linkedList = false
    @Flag(name : .long, help: "Use stack") var stack = false
    @Flag(name : .long, help: "Use queue") var queue = false
    
    @Argument(help: "Values to be added to the data structure") var values: [Int] = []
    
    @Flag(name : .long, help: "Normal Order") var normalOrder = false
    @Flag(name : .long, help: "Reverse Order") var reverseOrder = false
    @Flag(name : .long, help: "Size of LinkedList, Stack or Queue") var size = false
    @Flag(name : .long, help: "Middle of LinkedList") var middle = false
    @Flag(name : .long, help: "Push Element to Stack") var push = false
    @Flag(name : .long, help: "Remove Element from Stack") var pop = false
    @Flag(name : .long, help: "Peek Element of Stack or Queue") var peek = false
    @Flag(name : .long, help: "Check is Stack or Queue is Empty") var isEmpty = false
    @Flag(name : .long, help: "Add Element to Queue") var add = false
    @Flag(name : .long, help: "Remove Element to Queue") var poll = false

    
    let linkedListDB = Database(fileName: "linkedlist.txt")
    let stackDB = Database(fileName: "stack.txt")
    let queueDB = Database(fileName: "queue.txt")
    
    mutating func run() throws {
        if (linkedList) {
            let list = LinkedList<Int>()
            //Add values from Text File to LinkedList
            if let previousData = linkedListDB.readTXT() {
                if (previousData.count != 0) {
                    for data in previousData {
                        list.addNodeAtLast(data)
                    }
                }
            }
            if (normalOrder) {
                for value in values {
                    list.addNodeAtLast(value)
                }
                linkedListDB.reWriteTXT(list)
                list.printList()
            } else if (reverseOrder) {
                for value in values {
                    list.addNodeAtFirst(value)
                }
                linkedListDB.reWriteTXT(list)
                list.printList()
            } else if (size) {
                list.printSize()
            } else if (middle) {
                list.printMiddle()
            } else {
                throw ValidationError("Please specify a valid Method (size, middle etc)")
            }
        }
        
        else if (stack) {
            let list = Stack<Int>()
            //Add values from Text File to Stack
            if let previousData = stackDB.readTXT() {
                if (previousData.count != 0) {
                    for data in previousData {
                        list.push(data)
                    }
                }
            }
            if (push) {
                for value in values {
                    list.push(value)
                }
                stackDB.reWriteReverseTXT(list)
                list.printList()
            } else if (pop) {
                if let poppedValue = list.pop() {
                    print("Popped Value :  \(poppedValue)")
                    stackDB.reWriteReverseTXT(list)
                    list.printList()
                } else {
                    print("Stack is Already Empty")
                }
            } else if (peek) {
                if let peekedValue = list.peek() {
                    print("Last Added Value :  \(peekedValue)")
                    list.printList()
                } else {
                    print("Stack is Empty")
                }
            } else if (size) {
                list.printSize()
            } else if (isEmpty) {
                print(list.isEmpty())
            } else {
                throw ValidationError("Please specify a valid Method (push, pop or peek)")
            }
        }
        
        else if (queue) {
            let list = Queue<Int>()
            //Add values from Text File to Queue
            if let previousData = queueDB.readTXT() {
                if (previousData.count != 0) {
                    for data in previousData {
                        list.add(data)
                    }
                }
            }
            if (add) {
                for value in values {
                    list.add(value)
                }
                queueDB.reWriteTXT(list)
                list.printList()
            } else if (poll) {
                if let poppedValue = list.poll() {
                    print("Popped Value :  \(poppedValue)")
                    queueDB.reWriteTXT(list)
                    list.printList()
                } else {
                    print("Queue is Already Empty")
                }
            } else if (peek) {
                if let peekedValue = list.peek() {
                    print("Last Added Value :  \(peekedValue)")
                    list.printList()
                } else {
                    print("Stack is Empty")
                }
            } else if (size) {
                list.printSize()
            } else if (isEmpty) {
                print(list.isEmpty())
            } else {
                throw ValidationError("Please specify a valid Method (add, poll or peek)")
            }
        } else {
            throw ValidationError("Please specify a data structure to use (linked list, stack, or queue)")
        }
    }
}

DSATool.main()
