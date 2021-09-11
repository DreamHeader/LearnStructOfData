//
//  SortBaseManage.m
//  Sort
//
//  Created by 浮东凯 on 2021/9/7.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "SortBaseManage.h"

@implementation SortBaseManage
-(void)sortArray:(NSArray*)dataSource{
    
}
-(void)swap:(NSMutableArray*)dataSource oldIndex:(int)oldIndex newIndex:(int)newIndex{
    id temp = dataSource[oldIndex];
    [dataSource replaceObjectAtIndex:oldIndex withObject:dataSource[newIndex]];
    [dataSource replaceObjectAtIndex:newIndex withObject:temp]; 
}
@end
