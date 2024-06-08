# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def deleteDuplicates(self, head: Optional[ListNode]) -> Optional[ListNode]:
        nodes = head # Keep track of list nodes

        while head and head.next: # Runs while head and head.next are not none
            if head.val == head.next.val: # Because the list is sorted, duplicates follow each other, so if the node in the list is equal to the next node
                head.next = head.next.next # Remove the node, by setting it to be the note after that
            else:
                head = head.next # Otherwise, move the head one node
        
        return nodes # return the list without duplicates