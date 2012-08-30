class BinaryHeap
  constructor: (@compare = (x, y) -> x < y) ->
    @list = []

  push: (items...) ->
    for item in items
      @list.push(item)
      @swim(@list.length - 1)

  peek: () ->
    @list[0]

  pop: () ->
    item = @peek()
    @removeAt 0
    item

  remove: (item) ->
    unless (index = @list.indexOf(item)) < 0
      @removeAt index

  removeAt: (index) ->
    last = @list.pop()

    if @list.length > 0
      @list[index] = last
      @sink(index)

  swap: (a, b) ->
    [@list[a], @list[b]] = [@list[b], @list[a]]

  sink: (index) ->
    length = @list.length
    [left, right] = [index*2+1, index*2+2]

    return if left >= length

    swap_index = left

    if right < length and @compare(@list[right], @list[left])
      swap_index = right

    if @compare(@list[swap_index], @list[index])
      @swap(index, swap_index)
      @sink(swap_index)

  swim: (index) ->
    return if index == 0
    parent = Math.floor (index - 1) / 2

    if @compare(@list[index], @list[parent])
      @swap(parent, index)
      @swim(parent)

exports.BinaryHeap = BinaryHeap
