//
//  Node.h
//  LeetCode
//
//  Created by MacHD on 2021/3/15.
//  Copyright © 2021 FDK. All rights reserved.
//

#import <Foundation/Foundation.h>
@class;
NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject
@property(nonatomic, strong,nullable) Node* next;
@property(nonatomic, strong) id object;
- (instancetype)initWithNext:(Node*)next object:(id)object;
@end

NS_ASSUME_NONNULL_END
