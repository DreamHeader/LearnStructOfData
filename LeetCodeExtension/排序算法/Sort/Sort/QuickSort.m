//
//  QuickSort.m
//  Sort
//
//  Created by MacHD on 2021/9/10.
//  Copyright © 2021 FDK. All rights reserved.
// 快排的思路是  挖坑填数 +  分治思想

#import "QuickSort.h"

@implementation QuickSort
-(void)sortArray:(NSArray*)dataSource{
  NSMutableArray * mut = [NSMutableArray arrayWithArray:dataSource];
  [self quickSort:mut left:0 right:(int)(mut.count-1)];
    NSLog(@"%@",mut);
}
-(void)quickSort:(NSMutableArray*)dataSource left:(int)left right:(int)right{
  if (left>=right) {
    return;
  }
  // 挖坑填数的思想进行块内 以基数为准 进行位置调换
    int X = [dataSource[left] intValue];  // 挖坑思想那么这个第一个当作坑
    int i = left;
    int j = right;
    while (i<j) {
      // 先从后向前找一个小于基准值的 填坑
        while (i<j&&[dataSource[j] intValue]>X) {
            j--;  // 一直减去找一个符合的
        }
        // 找到后 填坑去
        if (i<j) {
            [self swap:dataSource oldIndex:j newIndex:i];
            // 因为换过以后说明i这个位置的数值肯定是小于 基准数的所以进行下一步从前到后查找大于X的时候
            // 就没必要从这i当前值算了 应该后移一位 所以 i++
            // 现在是基准右边有了坑
            i++;
        }
        // 然后从前向后找一个大于基准数的 去填坑
        while (i<j&&[dataSource[i] intValue]<X) {
            i++;
        }
        if (i<j) {
            // 去填右边的坑
            [self swap:dataSource oldIndex:i newIndex:j];
            j--;
        }
    }
    // 走到这一步 肯定是 i==j 最后剩下了一个坑 那么久把基准数放进去 这样实现了 左侧放小的 右侧放大的思路
    [dataSource replaceObjectAtIndex:i withObject:@(X)];
    
    // 接下来分治思想堆 分成两块的部分继续用同样的思路一指处理 直到每块都只剩一个元素
    // 递归
    [self quickSort:dataSource left:left right:i-1];
    [self quickSort:dataSource left:i+1 right:right];
}
@end
