> 用 go 刷题

## 1. 两数之和

最基础的用 map 来解决。时间复杂度 O(n)

```
func twoSum(nums []int, target int) []int {
	m := map[int]int{}

	for index, num := range nums {
		if v, ok := m[num]; ok {
			return []int{v, index}
		} else {
			m[target-num] = index
		}
	}
	return nil
}
```

## 2. 两数相加

> 一杯茶，一包烟，一道链表干一天。

- 结束条件
- 加法运算怎么执行的
- 递归
- 补 0 对齐

```
func addTwoNumbers(l1 *ListNode, l2 *ListNode) *ListNode {
	var r *ListNode
	var next *ListNode
	var temp int
	for l1 != nil || l2 != nil {
		var v, v1, v2 int
if l1 != nil {
			v1 = l1.Val
			l1 = l1.Next
		}
    if l2 != nil {
			v2 = l2.Val
			l2 = l2.Next
		}
		v = v1 + v2 + temp
		v, temp = v%10, v/10
        if r == nil {
			r = &ListNode{
            Val: v,
			}
			next = r
		} else {
			next.Next = &ListNode{
Val: v,
			}
			next = next.Next
		}
	}

	// 最后补最后一个进位的
if temp > 0 {
		next.Next = &ListNode{Val: temp}
	}
return r
    }
```

## 3. 无重复字符的最长字串

### 解1

> 回退 index

```
func lengthOfLongestSubstring(s string) int {
	var r int

	//存储元素 & 对应的 index
	m := make(map[uint8]int)
	for i := 0; i < len(s); i++ {
		index, ok := m[s[i]]
		// if exists, skip to index, update max length
		if ok {
			if len(m) > r {
				r = len(m)
			}
			m = make(map[uint8]int)
			i = index
		} else {
			m[s[i]] = i
		}
	}
	if len(m) > r {
		r = len(m)
	}
	return r
}
```

### 解2

> 滑动窗口, right 不会往回退

```

func exists(m map[uint8]bool, item uint8) bool {
	_, ok := m[item]
	return ok
}

// 滑动窗口
// left right
// 滑动 left, right 不会往前退
func lengthOfLongestSubstring2(s string) int {
	var left, right, r int
	m := make(map[uint8]bool)
	for right < len(s) {
		if exists(m, s[right]) { // 重复
			//滑动 left
			for left < right {
				if exists(m, s[right]) {
					delete(m, s[left])
					left = left + 1
				} else {
					break
				}
			}
		} else {
			m[s[right]] = true //放入元素
			right = right + 1
		}
		// update max
		temp := right - left
		if temp > r {
			r = temp
		}
	}
	return r
}
```