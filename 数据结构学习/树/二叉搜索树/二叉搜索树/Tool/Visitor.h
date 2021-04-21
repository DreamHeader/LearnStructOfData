//
//  Visitor.h
//  二叉搜索树
//
//  Created by MacHD on 2021/4/16.
//  Copyright © 2021 FDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"
NS_ASSUME_NONNULL_BEGIN

@interface Visitor : NSObject
@property (nonatomic,assign) BOOL stop;
//-(void)visit:(id)node;
// 遍历器的增强，可控制遍历到那一位置停止遍历
-(BOOL)visit:(id)node;
@end

NS_ASSUME_NONNULL_END
