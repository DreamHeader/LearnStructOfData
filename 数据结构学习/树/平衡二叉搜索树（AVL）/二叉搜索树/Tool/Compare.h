//
//  Compare.h
//  二叉搜索树
//  为了解决树里面如果插入对象元素创建这样一个类来指定必须实现方法
//  Created by MacHD on 2021/4/15.
//  Copyright © 2021 FDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
NS_ASSUME_NONNULL_BEGIN

@interface Compare : NSObject
 
-(int)compare:(Person*)element1 element2:(Person*)element2;
@end

NS_ASSUME_NONNULL_END
