class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(_ value: T) {
        self.value = value
    }
}
