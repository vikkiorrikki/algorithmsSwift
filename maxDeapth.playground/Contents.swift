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
    
    func count() -> Int {
        var currentElement = self.head
        var amount = 0
        
        while currentElement != nil {
            amount += 1
            currentElement = currentElement?.next
        }
        
        return amount
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
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
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
    
    func count() -> Int {
        list.count()
    }
    
    var description: String {
        return list.description
    }
}

class Node {
    var value: Int
    let leftChild: Node?
    let rightChild: Node?
    
    init(value: Int, leftChild: Node?, rightChild: Node?) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

//left branch
let secondNode = Node(value: 2, leftChild: nil, rightChild: nil)
let sixNode = Node(value: 6, leftChild: secondNode, rightChild: nil)

//right branch
let twentyNode = Node(value: 20, leftChild: nil, rightChild: nil)
let thirteenNode = Node(value: 13, leftChild: nil, rightChild: nil)
let fifteenNode = Node(value: 15, leftChild: thirteenNode, rightChild: twentyNode)

let headNode = Node(value: 12, leftChild: sixNode, rightChild: fifteenNode)

func maxDepth(head: Node?) -> Int {
    guard let head = head else { return 0 }
    var maxLevel = 0
    
    var queue = Queue<Node>()
    queue.enqueue(element: head)
    
    while !queue.isEmpty {
        maxLevel += 1
        let count = queue.count()
        
        for _ in 0..<count {
            let current = queue.dequeue()
            if let left = current?.leftChild {
                queue.enqueue(element: left)
            }
            if let right = current?.rightChild {
                queue.enqueue(element: right)
            }
        }
    }
    
    
    return maxLevel
}

print(maxDepth(head: headNode))
