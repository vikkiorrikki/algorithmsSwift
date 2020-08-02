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

var list = LinkedList<Int>()
list.append(value: 0)
list.append(value: 1)
list.append(value: 2)
list.remove(node: list.last!)
list.description

var list2 = LinkedList<String>()
list2.isEmpty
list2.append(value: "abc")
list2.append(value: "abc")
list2.append(value: "abc")
list2.description
list2.isEmpty
