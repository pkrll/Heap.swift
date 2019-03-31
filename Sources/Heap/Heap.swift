//
//  Heap.swift
//  Heap
//
//  Created by Ardalan Samimi on 2019-03-31.
//
struct Heap<T: Comparable> {

	private var heap: [T]
	private var priorityFunction: (T, T) -> Bool

	init(_ heap: [T], priorityFunction: @escaping (T, T) -> Bool) {
		self.heap = heap
		self.priorityFunction = priorityFunction
		self.heap.sort(by: priorityFunction)
	}

	mutating func insert(_ element: T) {
		self.heap.append(element)
		self.heapify()
	}

	mutating func remove() -> T? {
		if self.heap.count == 0 { return nil }

		let element = self.heap.first
		self.heap[0] = self.heap.removeLast()

		self.adjust(from: 0)

		return element
	}

	func examine() -> T? {
		return self.heap.first
	}

	func isHeap() -> Bool {
		return self.isHeap(0)
	}

	// MARK: Private

	private func compare(_ index: Int, with: Int) -> Bool {
		let lhs = self.heap[index]
		let rhs = self.heap[with]

		return self.priorityFunction(lhs, rhs)
	}

	mutating private func swap(_ index: Int, with parent: Int) {
		let currentElement = self.heap[index]
		let parentElement  = self.heap[parent]

		self.heap[index]  = parentElement
		self.heap[parent] = currentElement
	}

	mutating private func heapify() {
		var index  = self.heap.count - 1
		var parent = self.parentIndex(for: index)

		while index > 0 && self.compare(index, with: parent) {
			self.swap(index, with: parent)

			index  = parent
			parent = self.parentIndex(for: index)
		}
	}

	mutating private func adjust(from index: Int) {
		if self.isLeaf(index) { return }

		let childIndices = [self.leftChildIndex(for: index),
		self.rightChildIndex(for: index)]

		for childIndex in childIndices {
			if self.compare(childIndex, with: index) {
				self.swap(childIndex, with: index)
				self.adjust(from: childIndex)
			}
		}
	}

	private func parentIndex(for index: Int) -> Int {
		return (index - 1) / 2
	}

	private func leftChildIndex(for index: Int) -> Int {
		return (2 * index) + 1
	}

	private func rightChildIndex(for index: Int) -> Int {
		return (2 * index) + 2
	}

	private func isLeaf(_ index: Int) -> Bool {
		return index > (self.heap.count - 3) / 2
	}

	private func isHeap(_ index: Int) -> Bool {
		if self.isLeaf(index) { return true }

		let leftIndex  = self.leftChildIndex(for: index)
		let rightIndex = self.rightChildIndex(for: index)

		let leftChild  = self.priorityFunction(self.heap[index],
		self.heap[leftIndex])
		let rightChild = self.priorityFunction(self.heap[index],
		self.heap[rightIndex])

		return leftChild && rightChild && self.isHeap(leftIndex) && self.isHeap(rightIndex)
	}

}
