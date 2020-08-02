import UIKit

class ListNode<T> {
    var value: T
    var next: ListNode?
    var prev: ListNode?
    
    init(_ value: T) {
        self.value = value
    }
}

struct LinkedList<T>: CustomStringConvertible {
    private var head: ListNode<T>?
    private var tail: ListNode<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: ListNode<T>? {
        return head
    }
    
    var last: ListNode<T>? {
        return tail
    }
    
    mutating func append(value: T) {
        let newElement = ListNode(value)
        
        if tail == nil {
            head = newElement
        } else {
            tail?.next = newElement
            newElement.prev = tail
        }
        tail = newElement
    }
    
    mutating func remove(node: ListNode<T>) -> T {
        let prev = node.prev
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.prev = prev
        
        if next == nil {
            tail = prev
        }
        
        node.prev = nil
        node.next = nil
        
        return node.value
    }
    
    var description: String {
        var text = "["
        var element = head
        
        while element != nil {
            text += "\(element!.value)"
            element = element?.next
            if element != nil { text += ", "}
        }
        
        return text + "]"
    }
}

struct Queue<T> : CustomStringConvertible {
    private var list = LinkedList<T>()
    
    mutating func enqueue(element: T) {
        list.append(value: element)
    }
    
    mutating func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else { return nil }
        
        list.remove(node: element)
        return element.value
    }
    
    mutating func peek() -> T {
        return list.first!.value
    }
    
    var description: String {
        return list.description
    }
}

var queue = Queue<Int>()
queue.enqueue(element: 0)
queue.enqueue(element: 1)
queue.enqueue(element: 2)
queue.description

queue.dequeue()
queue.description

