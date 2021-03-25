//
//  Node.h
//  LeetCode
//
//  Created by MacHD on 2021/3/15.
//  Copyright © 2021 FDK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject
@property(nonatomic, strong, nullable) Node* next;
@property(nonatomic, strong, nullable) id object;
- (instancetype)initWithNext:(Node* _Nullable)next object:(id _Nullable)object;
@end

NS_ASSUME_NONNULL_END
