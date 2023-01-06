import UIKit




class Node {
    var val: Int
    var prev: Node?
    var next: Node?
    init(_ value: Int){
        val = value
        
    }
}


class DLL {
    var head: Node?
    var tail: Node?
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(newNode:Node,dll:DLL){
       
        var lasNode = dll.tail
        
        dll.tail?.next = newNode
        newNode.prev = lasNode
        dll.tail = newNode
       
    }// append()
    
    func traverse() -> Self {                     // Return the same type as the object that calls the method
           var traversal:String = ""
           if var runner = head {                    // Safely unwrap the head and call it runner
               traversal += String(runner.val)
               while runner.next != nil {            // Check that there is something coming next
                   runner = runner.next!             // Since we checked that next exists, it's ok to force unwrap it
                   traversal += ", " + String(runner.val)
               }
           }
           else {
               traversal = "Empty list"
           }
           print(traversal)
           return self
       }
    
    func traverseBackwards(){
        
        if var tail = dll.tail {
            var traversal:String = ""
            traversal += String(tail.val)
            while tail.prev != nil {
                tail = tail.prev!
                traversal += "," + String(tail.val)
            }
            print(traversal)
        } else {
            print("Empty List!!")
        }
    }// traverseBackwards()
    
   
    func pop(){
        if var lastNode = dll.tail {
            dll.tail = lastNode.prev
            dll.tail?.next = nil
            print("The List after the pop()")
            dll.traverse()
        } else {
            print("no nodes in the list. ")
        }
    }
    
    func shift() {
        
        if dll.head != nil {
            
            dll.head = dll.head?.next
            dll.head?.prev = nil
           print("The List after the shift()")
            dll.traverse()
            
        } else {
            print("no nodes in the list. ")
        }
       
    } // Shift 
    
    func contains(value:Node){
        var contains = 0
        var head = dll.head
          
            while head != nil {
            
                if head?.val == value.val {
                print("the DLL contains \(value.val) ?? Yes")
                contains = 1
                break
            }
                head = head?.next
        }
        
        if contains == 0 {
            print("the DLL contains \(value.val) ?? No")
        }
   
        
    } // contains()
    
    
    func size() {
        
        var dllSize = 0
        var head = dll.head
        
            while head != nil {
                head = head?.next
                dllSize+=1
            }
        
        print("the size is \(dllSize)")
    } // size()
    
    
}//DLL




var dll = DLL()
var node1 = Node(5)
var node2 = Node(7)
var node3 = Node(10)


dll.head = node1
node1.next = node2
node2.prev = node1
node2.next = node3
node3.prev = node2
dll.tail = node3

dll.traverse()
var node4 = Node(12)
var node5 = Node(14)

dll.append(newNode: node4,dll: dll)
dll.append(newNode: node5, dll: dll)
dll.traverse()
dll.pop()

dll.shift()
dll.contains(value: node5)
dll.size()
dll.traverseBackwards()
