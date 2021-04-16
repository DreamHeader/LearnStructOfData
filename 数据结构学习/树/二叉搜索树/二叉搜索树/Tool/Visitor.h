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
-(void)visit:(id)node;
@end

NS_ASSUME_NONNULL_END
