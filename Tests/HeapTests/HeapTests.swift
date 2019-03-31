import XCTest
@testable import Heap

final class HeapTests: XCTestCase {

	func testHeapSimple() {
		var heap = Heap([9, 1, 2, 3, 5, 6, 8], priorityFunction: <)
		XCTAssertTrue(heap.isHeap())
		heap.insert(0)
		XCTAssertTrue(heap.isHeap())

		XCTAssertEqual(heap.remove(), 0)
		XCTAssertTrue(heap.isHeap())
		XCTAssertEqual(heap.remove(), 1)
		XCTAssertTrue(heap.isHeap())
		XCTAssertEqual(heap.remove(), 2)

		XCTAssertTrue(heap.isHeap())
		XCTAssertEqual(heap.remove(), 3)
		XCTAssertTrue(heap.isHeap())
	}

	func testHeapLarger() {
		var array = [Int]()

		for number in 0...1000 {
			array.append(number * 2)
		}

		var heap = Heap(array, priorityFunction: >)
		XCTAssertTrue(heap.isHeap())

		heap.insert(1)
		XCTAssertTrue(heap.isHeap())

		XCTAssertEqual(heap.remove(), 2000)
		XCTAssertTrue(heap.isHeap())
		XCTAssertEqual(heap.remove(), 1998)
		XCTAssertTrue(heap.isHeap())
		XCTAssertEqual(heap.remove(), 1996)
		XCTAssertTrue(heap.isHeap())
		XCTAssertEqual(heap.remove(), 1994)
		XCTAssertTrue(heap.isHeap())

		heap.insert(2001)
		XCTAssertTrue(heap.isHeap())
		XCTAssertEqual(heap.examine(), 2001)
	}

	static var allTests = [
		("testHeapSimple", testHeapSimple)
	]
}
