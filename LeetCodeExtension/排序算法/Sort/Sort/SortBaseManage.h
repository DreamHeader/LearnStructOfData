//
//  SortBaseManage.h
//  Sort
//
//  Created by 浮东凯 on 2021/9/7.
//  Copyright © 2021 FDK. All rights reserved.
// https://www.jianshu.com/p/1458abf81adf

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SortBaseManage : NSObject

-(void)sortArray:(NSArray*)dataSource;


-(void)swap:(NSMutableArray*)dataSource oldIndex:(int)oldIndex newIndex:(int)newIndex;
@end

NS_ASSUME_NONNULL_END
