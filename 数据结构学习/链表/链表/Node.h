//
//  Node.h
//  数据结构 - 链表 1
//
//  Created by 浮东凯 on 2021/3/10.
//  Copyright © 2021 FDK. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Node;
NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject
@property (nonatomic,strong)id obj;
@property (nonatomic,strong,nullable) Node *  next;
-(instancetype)initWithObj:(id)obj next:(Node*)next;
@end

NS_ASSUME_NONNULL_END
