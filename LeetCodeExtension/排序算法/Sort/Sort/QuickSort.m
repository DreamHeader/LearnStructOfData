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
}
-(void)quickSort:(NSMutableArray*)dataSource left:(int)left right:(int)right{
  if (left>=right) {
    return;
  }
  // 挖坑填数的思想进行块内 以基数为准 进行位置调换
  
  
  
  
  
   
}
@end
