//
//  MaoPaoSort.m
//  Sort
//
//  Created by 浮东凯 on 2021/9/7.
//  Copyright © 2021 FDK. All rights reserved.
//冒泡排序思想
//
//基本思想: 冒泡排序，类似于水中冒泡，较大的数沉下去，较小的数慢慢冒起来，假设从小到大，即为较大的数慢慢往后排，较小的数慢慢往前排。
//直观表达，每一趟遍历，将一个最大的数移到序列末尾。
//算法描述
//
//比较相邻的元素，如果前一个比后一个大，交换之。
//第一趟排序第1个和第2个一对，比较与交换，随后第2个和第3个一对比较交换，这样直到倒数第2个和最后1个，将最大的数移动到最后一位。
//第二趟将第二大的数移动至倒数第二位
//......
//因此需要n-1趟；
// 统一用数字类型
#import "MaoPaoSort.h"

@implementation MaoPaoSort

-(void)sortArray:(NSArray *)dataSource{
    NSMutableArray * sortArr = [NSMutableArray arrayWithArray:dataSource];
    
    for (int i = 0; i<sortArr.count; i++) {
        for (int j = 0; j<sortArr.count-i-1; j++) {
            if ([sortArr[j] intValue]>[sortArr[j+1] intValue]) {
                int temp = [sortArr[j] intValue];
                sortArr[j] = sortArr[j+1];
                sortArr[j+1] = @(temp);
            }
        }
    }
    NSLog(@"%@",sortArr);
}
@end
