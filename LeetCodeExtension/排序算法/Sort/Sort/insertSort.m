//
//  insertSort.m
//  Sort
//
//  Created by 浮东凯 on 2021/9/9.
//  Copyright © 2021 FDK. All rights reserved.
//
/*
 一般来说，插入排序都采用in-place在数组上实现。具体算法描述如下：
 
 从第一个元素开始，该元素可以认为已经被排序；
 取出下一个元素，在已经排序的元素序列中从后向前扫描；
 如果该元素（已排序）大于新元素，将该元素移到下一位置；
 重复步骤3，直到找到已排序的元素小于或者等于新元素的位置；
 将新元素插入到该位置后；
 重复步骤2~5。
 
 插入排序在实现上，通常采用in-place排序（即只需用到O(1)的额外空间的排序），因而在从后向前扫描过程中，需要反复把已排序元素逐步向后挪位，为最新元素提供插入空间。
*/
#import "insertSort.h"

@implementation insertSort

-(void)sortArray:(NSArray *)dataSource{
    NSMutableArray *  mut = [NSMutableArray arrayWithArray:dataSource];
    // 0 当作已经排序好的数组
    for (int i = 1; i < mut.count; i++) {
        int preIndex = i - 1; // 为了在已排序的数组中 从后向前找自己的插入位置
        int current = [mut[i] intValue];
        // 一直在已排序的数据循环找自己的插入位置
        while (preIndex>=0&&[mut[preIndex] intValue]>current) {
             // 比自己大的就往后移
            [mut replaceObjectAtIndex:preIndex+1 withObject:mut[preIndex]];
            preIndex--;
        }
        // 走出循环说明找到了要插入的位置 但是preindex在循环的时候是先-- 然后再判断条件跳出循环
        // 相当于多减了 因此真正插入的位置是 pre +1
        [mut replaceObjectAtIndex:preIndex + 1 withObject:@(current)];
    }
    NSLog(@"%@",mut);
}
@end
