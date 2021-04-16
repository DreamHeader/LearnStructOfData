//
//  Compare.m
//  二叉搜索树
//
//  Created by MacHD on 2021/4/15.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "Compare.h"

@implementation Compare
-(int)compare:(Person*)element1 element2:(Person*)element2{ 
  return element1.age - element2.age;
}
@end
