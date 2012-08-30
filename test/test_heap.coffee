{BinaryHeap} = require("..")

module.exports =
  "default comparison":
    setUp: (callback) ->
      @heap = new BinaryHeap
      callback()

    "insert in order, pop in order": (test) ->
      @heap.push 1
      @heap.push 2
      @heap.push 3
      @heap.push 4

      test.equal(1, @heap.pop())
      test.equal(2, @heap.pop())
      test.equal(3, @heap.pop())
      test.equal(4, @heap.pop())
      test.done()

    "push multiple, heap preserves correct order": (test) ->
      @heap.push 4, 2, 3, 1
      test.equal(1, @heap.pop())
      test.equal(2, @heap.pop())
      test.equal(3, @heap.pop())
      test.equal(4, @heap.pop())
      test.done()

    "insert in reverse order, pop in order": (test) ->
      @heap.push 20, 10, 5, 1
      test.equal(1, @heap.pop())
      test.equal(5, @heap.pop())
      test.equal(10, @heap.pop())
      test.equal(20, @heap.pop())
      test.equal(null, @heap.pop())
      test.done()

    "insert out of order, pop in order": (test) ->
      @heap.push 10, 20, 1, 5, 20, 10, 5, 1
      test.equal(1, @heap.pop())
      test.equal(1, @heap.pop())
      test.equal(5, @heap.pop())
      test.equal(5, @heap.pop())
      test.equal(10, @heap.pop())
      test.equal(10, @heap.pop())
      test.equal(20, @heap.pop())
      test.equal(20, @heap.pop())
      test.equal(null, @heap.pop())
      test.done()

    "remove preserves order": (test) ->
      @heap.push 1, 10, 10, 2, 3, 4, 5

      @heap.remove 2
      test.equal 1, @heap.pop()
      test.equal 3, @heap.pop()
      test.equal 4, @heap.pop()
      test.equal 5, @heap.pop()
      test.equal 10, @heap.pop()
      test.equal 10, @heap.pop()
      test.done()

    "peek returns next item": (test) ->
      @heap.push 3, 1, 2, 4, 5
      test.equal(1, @heap.peek())
      test.equal(1, @heap.pop())
      test.done()

  "custom comparison":
    setUp: (callback) ->
      @heap = new BinaryHeap (x, y) -> x > y
      callback()

    "insert in order, pop in order": (test) ->
      @heap.push 4, 3, 2, 1

      test.equal(4, @heap.pop())
      test.equal(3, @heap.pop())
      test.equal(2, @heap.pop())
      test.equal(1, @heap.pop())
      test.done()

    "insert in reverse order, pop in order": (test) ->
      @heap.push 1, 5, 10, 20
      test.equal(20, @heap.pop())
      test.equal(10, @heap.pop())
      test.equal(5, @heap.pop())
      test.equal(1, @heap.pop())
      test.equal(null, @heap.pop())
      test.done()

    "insert out of order, pop in order": (test) ->
      @heap.push 10, 20, 1, 5, 20, 10, 5, 1
      test.equal(20, @heap.pop())
      test.equal(20, @heap.pop())
      test.equal(10, @heap.pop())
      test.equal(10, @heap.pop())
      test.equal(5, @heap.pop())
      test.equal(5, @heap.pop())
      test.equal(1, @heap.pop())
      test.equal(1, @heap.pop())
      test.equal(null, @heap.pop())
      test.done()

    "remove preserves order": (test) ->
      @heap.push 1, 10, 10, 2, 3, 4, 5

      @heap.remove 2
      test.equal 10, @heap.pop()
      test.equal 10, @heap.pop()
      test.equal 5, @heap.pop()
      test.equal 4, @heap.pop()
      test.equal 3, @heap.pop()
      test.equal 1, @heap.pop()
      test.done()

    "peek returns next item": (test) ->
      @heap.push 3, 1, 2, 4, 5
      test.equal(5, @heap.peek())
      test.equal(5, @heap.pop())
      test.done()
