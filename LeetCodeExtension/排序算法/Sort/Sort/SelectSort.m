//
//  SelectSort.m
//  Sort
//
//  Created by 浮东凯 on 2021/9/7.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "SelectSort.h"

@implementation SelectSort

-(void)sortArray:(NSArray *)dataSource{
   NSMutableArray * mut = [NSMutableArray arrayWithArray:dataSource];
   
    for (int i = 0 ; i<mut.count; i++) {
        int minIndex = i;
        for (int j = i+1; j<mut.count; j++) {
            if ([mut[minIndex] intValue]>[mut[j] intValue]) {
                minIndex = j;
            }
        }
        if (i!=minIndex) {
            int temp = [mut[i] intValue];
            [mut replaceObjectAtIndex:i withObject:mut[minIndex]];
            [mut replaceObjectAtIndex:minIndex withObject:@(temp)];
        } 
    }
    NSLog(@"%@",mut);
}
@end
