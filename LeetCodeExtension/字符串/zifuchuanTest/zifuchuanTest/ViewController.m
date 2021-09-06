//
//  ViewController.m
//  zifuchuanTest
//
//  Created by 浮东凯 on 2021/9/4.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",[self removeDuplicates:[NSMutableArray arrayWithArray:@[@"1",@"1",@"2",@"2",@"3",@"4"]]]);
    // Do any additional setup after loading the view, typically from a nib.
}
// 查找最长字串的长度 不重复
/*
 @RJJ 用这个举例：a b c d e f c g h，重复字符是 c。
 
 官网答案：左指针指向 a，右指针指向 f 时，f 后面字符就是 c，即重复字符，这时开始收缩窗口，依次移动左指针，直到 d ，然后移动 右指针，即，左指针是依次移动。但 [a,f] 区间内已不可能有比该区间更长的字符串，左指针从 a 依次 移动到 d，中间的循环都无意义，可直接把左指针移动到 d，然后继续移动 右指针。
 
 结论：缓存下每个字符及其位置，当出现重复字符时，直接左指针移动到重复字符的后一个位置，可理解为跳跃式收缩窗口，即可减少循环。
 
 针对 abcdefagh 的情况，由于重复字符是 a，所以当右指针指向 a 时，左指针会移动到 b，没有发生跳跃，还是正常收缩窗口。
 
 这里还有一点需要说明，官网答案在收缩窗口移动左指针时，会依次移除左边的字符。但如果跳跃式移动串口，不会移除左边的字符。 比如： a b c d e f c a e f g h，当窗口移动为 [ a b c d e f ] 时，下一位字符为重复字符 c ，然后窗口收缩为 [ d e f c ]，但此时因为是跳跃式收缩，哈希缓存表 并不能 移除 a b ，即缓存表是 { a:0 , b:1 ,d:3 ,e: 4 ,f :5 ,c: 6 } ，即 最左边 [ a ,b ] 还在缓存表内。 此时，右指针再移动一次，指向 a ，注意当前左指针是 指向 d 索引为 3， 缓存表判断出有重复字符 a ，这是需要判断索引大小，只有大于 3 时，才移动左指针，否则忽略。即，虽然[ a, b]还在缓存表内，但是已经变为无效缓存，会忽略掉。
 
 */
-(int)lengthOfLongestSubstring:(NSString*)string{
    NSMutableDictionary * map = [[NSMutableDictionary alloc]init];
    int max  = 0; int start = 0;
    for (int end = 0; end<string.length; end++) {
        NSString * per = [string substringWithRange:NSMakeRange(end, 1)];
//        NSLog(@"%@--end:%@",per,@(end));
        if ([map.allKeys containsObject:per]) {
            start = MAX([map[per] intValue]+1, start);
        }
//        NSLog(@"start-:%@",@(start));
        max = MAX(max, (end - start +1));
        [map setObject:@(end) forKey:per];
//        NSLog(@"%@",map);
    }
    return max;
}
// 反转字符串
-(NSString*)resverseNsstring:(NSString*)string{
    if (!string) {
        return string;
    }
    NSMutableString * mutStr = [[NSMutableString alloc]initWithString:string];
    int left = 0;
    int right = (int)(mutStr.length -1) ;
    while (left<right) {
        NSString * leftStr = [mutStr substringWithRange:NSMakeRange(left, 1)];
        NSString * rightStr = [mutStr substringWithRange:NSMakeRange(right, 1)];
        [mutStr replaceCharactersInRange:NSMakeRange(left, 1) withString:rightStr];
        [mutStr replaceCharactersInRange:NSMakeRange(right, 1) withString:leftStr];
        left ++ ;
        right--;
    }
    return [mutStr copy];
}
// 最长回文串
/*
 如果对英文字母的Unicode编码熟悉的话，可以知道，字母A的Unicode编码是65（十进制），字母Z的Unicode编码是90（十进制），字母a的Unicode编码是97（十进制）,字母z的Unicode编码是122（十进制）。
 */
-(int)longestPalindrome:(NSString*)str{
    /*
     A-Z,a-z字母出现次数的存放数组，默认每个字母出现0次
     122-65=57，还需加1来存放最后的小写字母z，故数组长度为58
     */
    NSMutableArray * mutArr = [[NSMutableArray alloc]init];
    for (int Num = 0; Num<58; Num++) {
        [mutArr addObject:@(0)];
    }
    for (int i = 0; i<str.length; i++) {
      unichar per = [str characterAtIndex:i];
      int index = per - 65;
      int num =mutArr.count> index?[[mutArr objectAtIndex:index] intValue]:0;
      num++;
      [mutArr replaceObjectAtIndex:index withObject:@(num)];
    }
    int maxSize = 0;
    
    for (int j = 0 ; j < mutArr.count; j++) {
        int num = [mutArr[j] intValue];
        /*
         关键点，计算长度
         如果字符出现次数是偶数，则说明可以组成回文（对称），故该偶数的次数需计入到最大长度中
         例如，字母A出现3次，则其中的偶数次可以构造回文的一部份，即可以用 3/2 来获取有几个偶数部分。
         得出偶数部分的个数后，再乘以2，获取字母可构成回文的次数，即 (3 / 2) * 2
         */
        maxSize+= (num/2)*2;
        
    }
    // 如果计算出的长度小于字符串长度，则说明必然是奇数长度的回文，故长度需再加一
    maxSize = maxSize<str.length?maxSize+1:maxSize;
    
    return maxSize;
}
// 26. 删除有序数组中的重复项(双指针概念)
-(NSArray*)removeDuplicates:(NSMutableArray*)dataSource{
    if (!dataSource||dataSource.count==1) {
        return [dataSource copy];
    }
    int p = 0;
    int q = 1;
    
    while (q<dataSource.count) {
        if (dataSource[p]!=dataSource[q]) {
            int temp = [dataSource[p+1] intValue];
            [dataSource replaceObjectAtIndex:(p+1) withObject:dataSource[q]];
            [dataSource replaceObjectAtIndex:(q) withObject:@(temp)];
            p++;
        }
        q++;
    }
    return [dataSource copy];
}
// 面试题11. 旋转数组的最小数字（二分法）
//int minArray(vector<int>& numbers) {
//    int i = 0, j = numbers.size() - 1;
//    while (i < j) {
//        int m = (i + j) / 2;
//        if (numbers[m] > numbers[j]) i = m + 1;
//        else if (numbers[m] < numbers[j]) j = m;
//        else {
//            int x = i;
//            for(int k = i + 1; k < j; k++) {
//                if(numbers[k] < numbers[x]) x = k;
//            }
//            return numbers[x];
//        }
//    }
//    return numbers[i];
//}
// 剑指 Offer 06. 从尾到头打印链表
//先获取链表长度，创建对应长度数组
//ListNode currNode = head;
//int len = 0;
//while(currNode != null){
//    len ++;
//    currNode = currNode.next;
//}
//int[] result = new int[len];
//
////再次遍历链表，将值倒序填充至结果数组
//currNode = head;
//while(currNode != null){
//    result[len - 1] = currNode.val;
//    len --;
//    currNode = currNode.next;
//}

// 两个链表的第一个公共节点
//if (headA == null || headB == null) {
//    return null;
//}
//ListNode pA = headA, pB = headB;
//while (pA != pB) {
//    pA = pA == null ? headB : pA.next;
//    pB = pB == null ? headA : pB.next;
//}
//return pA;

// 二叉搜索树的最近公共祖先
//public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
//    while(root != null) {
//        if(root.val < p.val && root.val < q.val) // p,q 都在 root 的右子树中
//            root = root.right; // 遍历至右子节点
//        else if(root.val > p.val && root.val > q.val) // p,q 都在 root 的左子树中
//            root = root.left; // 遍历至左子节点
//        else break;
//    }
//    return root;
//}
 


@end
