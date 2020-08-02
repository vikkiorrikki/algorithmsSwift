import UIKit

class ListNode {
    var value: Int
    var next: ListNode?
    
    init(value: Int, next: ListNode?) {
        self.value = value
        self.next = next
    }
}

let fourthNode = ListNode(value: 12, next: nil)
let thirdNode = ListNode(value: 9, next: fourthNode)
let secondNode = ListNode(value: 6, next: thirdNode)
let firstNode = ListNode(value: 1, next: secondNode)

let fourthNode2 = ListNode(value: 14, next: nil)
let thirdNode2 = ListNode(value: 13, next: fourthNode2)
let secondNode2 = ListNode(value: 10, next: thirdNode2)
let firstNode2 = ListNode(value: 2, next: secondNode2)

func printLinkedList(head: ListNode?) {
    var currentNode = head
    
    while currentNode != nil {
        print(currentNode!.value ?? -1)
        currentNode = currentNode?.next
    }
}

//printLinkedList(head: firstNode)
//printLinkedList(head: firstNode2)

func unionTwoSortedLinkedLists(head: ListNode?, head2: ListNode?) -> ListNode? {
    var returnValue: ListNode?
    var currentNode: ListNode?
    var currentNode2: ListNode?
    var temp: ListNode?
    var prev: ListNode?
    
    guard head != nil else { return head2 }
    guard head2 != nil else { return head }
    
    if head!.value < head2!.value {
        currentNode = head
        currentNode2 = head2
        returnValue = head
    } else {
        currentNode = head2
        currentNode2 = head
        returnValue = head2
    }
    
    while currentNode != nil {
        if currentNode2 == nil {
            prev?.next = currentNode
            break
        }
        
        if currentNode?.value == head?.value || currentNode?.value == head2?.value {
            temp = currentNode?.next
            currentNode?.next = currentNode2
            currentNode = temp
            prev = currentNode2
        } else if currentNode!.value < currentNode2!.value {
            temp = currentNode?.next
            currentNode?.next = currentNode2
            prev?.next = currentNode
            prev = currentNode
            currentNode = temp
        } else {
            prev = currentNode2
            currentNode2 = currentNode2?.next
        }
    }
    
    return returnValue
}

//printLinkedList(head: unionTwoSortedLinkedLists(head: firstNode, head2: firstNode2))

func goodSolution(head: ListNode?, head2: ListNode?) -> ListNode? {
    guard head != nil else { return head2 }
    guard head2 != nil else { return head }
    
    let startOfList = ListNode(value: 0, next: nil)
    var currentNode = head
    var currentNode2 = head2
    var endOfSortedList = startOfList
    
    while currentNode != nil && currentNode2 != nil {
        if currentNode!.value <= currentNode2!.value {
            endOfSortedList.next = currentNode
            currentNode = currentNode?.next
        } else {
            endOfSortedList.next = currentNode2
            currentNode2 = currentNode2?.next
        }
        endOfSortedList = endOfSortedList.next!
    }
    endOfSortedList.next = currentNode == nil ? currentNode2 : currentNode
    
    return startOfList.next
}

printLinkedList(head: goodSolution(head: firstNode, head2: firstNode2))
