A coffeescript implementation of a [binary
heap](http://en.wikipedia.org/wiki/Binary_heap) for node.js.

```javascript
var {BinaryHeap} = require('binary-heap')
var heap = new BinaryHeap
heap.push(5, 4, 1, 3, 2)

heap.pop() // 1
heap.pop() // 2
heap.pop() // 3
heap.pop() // 4
heap.pop() // 5
```

#### new BinaryHeap()
Allocates a new binary heap with the default comparison function. Items
added to the heap will be sorted from min-to-max.

    var heap = new BinaryHeap
    heap.push(3, 2, 1)
    heap.pop() // 1
    heap.pop() // 2
    heap.pop() // 3

#### new BinaryHeap(compareFn)
Allocates a new binary heap with the provided custom comparison function. The
comparison function should accept two arguments, and return true or false.

    var heap = new BinaryHeap(function(x, y) { return x > y })
    heap.push(1, 2, 3)
    heap.pop() // 3
    heap.pop() // 2
    heap.pop() // 1

#### heap.push(item, [...])
Inserts an item into its proper position on the heap. Also accepts
multiple arguments like Array.push().

    var heap = new BinaryHeap
    heap.push(2)
    heap.push(1, 3, 4)
    heap.pop() // 1
    heap.pop() // 2
    heap.pop() // 3
    heap.pop() // 4

#### heap.pop()
Removes the next item from the heap and returns it.

    var heap = new BinaryHeap
    heap.push(1, 2)
    heap.pop() // 1
    heap.pop() // 2
    heap.pop() // null

#### heap.peek()
Returns the next item from the heap, but doesn't remove it.

    var heap = new BinaryHeap
    heap.push(1, 2)
    heap.peek() // 1
    heap.peek() // 1

#### heap.remove(item)
Removes the given item from the heap.

    var heap = new BinaryHeap
    heap.push(1, 2, 3)
    heap.remove(2)
    heap.pop() // 1
    heap.pop() // 3
