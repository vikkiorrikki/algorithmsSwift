import UIKit

class ListNode {
    var value: Int
    var next: ListNode?
    
    init(value: Int, next: ListNode?) {
        self.value = value
        self.next = next
    }
}
let thirdNode = ListNode(value: 3, next: nil)
let secondNode = ListNode(value: 2, next: thirdNode)
let firstNode = ListNode(value: 1, next: secondNode)

func printLinkedList(head: ListNode?) {
    var currentNode = head
    
    while currentNode != nil {
        print(currentNode?.value ?? -1)
        currentNode = currentNode?.next
    }
}

printLinkedList(head: firstNode)

func reverseLinkedList(head: ListNode?) -> ListNode? {
    var currentNode = head
    var next: ListNode?
    var prev: ListNode?
    
    while currentNode != nil {
        next = currentNode?.next
        currentNode?.next = prev
        prev = currentNode
        currentNode = next
    }
    
    return prev
}

let reversedHead = reverseLinkedList(head: firstNode)
printLinkedList(head: reversedHead)
