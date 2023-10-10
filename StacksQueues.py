
# ####STACK################################

# class Stack:
#     def __init__(self):
#         self.items = []

#     def is_empty(self):
#         return len(self.items) == 0

#     def push(self, item):
#         self.items.append(item)

#     def pop(self):
#         if not self.is_empty():
#             return self.items.pop()
#         else:
#             raise IndexError("Pop from an empty stack")

#     def peek(self):
#         if not self.is_empty():
#             return self.items[-1]
#         else:
#             raise IndexError("Peek into an empty stack")

#     def length(self):
#         return len(self.items)





# # Example usage:
# if __name__ == "__main__":
#     stack = Stack()

#     # Push elements onto the stack
#     stack.push(10)
#     stack.push(20)
#     stack.push(30)

#     # Peek at the top element
#     print("Top element:", stack.peek())

#     # Pop elements from the stack
#     print("Popped:", stack.pop())
#     print("Popped:", stack.pop())

#     # Check if the stack is empty
#     print("Is the stack empty?", stack.is_empty())

#     # Get the current size of the stack
#     print("Stack size:", stack.length())


# ###QUEUE################################


# class Queue:
#     def __init__(self):
#         self.items = []

#     def is_empty(self):
#         return len(self.items) == 0

#     def enqueue(self, item):
#         self.items.append(item)

#     def dequeue(self):
#         if not self.is_empty():
#             return self.items.pop(0)
#         else:
#             raise IndexError("Dequeue from an empty queue")

#     def Peek(self):
#         if not self.is_empty():
#             return self.items[0]
#         else:
#             raise IndexError("Front of an empty queue")

#     def length(self):
#         return len(self.items)
    
#     def Reverse(Queue):

#         stack = []
        
#         # Pop elements from the queue and push them onto the stack
#         while not Queue.is_empty():
#             stack.append(Queue.dequeue())
        
#         # Pop elements from the stack and enqueue them back into the queue
#         while stack:
#             Queue.enqueue(stack.pop())
        
#         return Queue
    

# # Example usage:
# if __name__ == "__main__":
#     queue = Queue()

#     # Enqueue elements into the queue
#     queue.enqueue(10)
#     queue.enqueue(20)
#     queue.enqueue(30)

#     # Get the front element
#     print("Front element:", queue.Peek())

#     # Dequeue elements from the queue
#     print("Dequeued:", queue.dequeue())
#     print("Dequeued:", queue.dequeue())

#     # Check if the queue is empty
#     print("Is the queue empty?", queue.is_empty())

#     # Get the current size of the queue
#     print("Queue size:", queue.length())

#     # Reverse current queue:
#     q = Queue()
#     q.enqueue(1)
#     q.enqueue(2)
#     q.enqueue(3)
#     q.enqueue(4)

#     print("Original Queue:", q.items)

#     q.Reverse()

#     print("Reversed Queue:", q.items)

class CircularQueue:
    def __init__(self, size):
        self.size = size
        self.queue = [None] * size
        self.front = self.rear = -1

    def is_empty(self):
        return self.front == self.rear == -1

    def is_full(self):
        return (self.rear + 1) % self.size == self.front

    def enqueue(self, item):
        if self.is_full():
            print("Queue is full. Cannot enqueue.")
        else:
            if self.is_empty():
                self.front = self.rear = 0
            else:
                self.rear = (self.rear + 1) % self.size
            self.queue[self.rear] = item

    def dequeue(self):
        if self.is_empty():
            print("Queue is empty. Cannot dequeue.")
            return None
        else:
            item = self.queue[self.front]
            if self.front == self.rear:
                self.front = self.rear = -1
            else:
                self.front = (self.front + 1) % self.size
            return item

    def display(self):
        if self.is_empty():
            print("Queue is empty.")
        else:
            i = self.front
            while True:
                print(self.queue[i], end=" ")
                if i == self.rear:
                    break
                i = (i + 1) % self.size
            print()


# Example usage:
cq = CircularQueue(5)
cq.enqueue(1678)
cq.enqueue(2)
cq.enqueue(3)
cq.enqueue(4)
cq.enqueue(5)

print("Queue elements:")
cq.display()

print("Dequeue operation:")
print(cq.dequeue())

print("Queue elements after dequeue:")
cq.display()

cq.enqueue(6)
cq.enqueue(7)

print("Queue elements after enqueue:")
cq.display()
