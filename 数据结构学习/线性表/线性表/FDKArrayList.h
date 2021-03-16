//
//  FDKArrayList.h
//  数据结构01- 线性表
//
//  Created by 浮东凯 on 2021/3/8.
//  Copyright © 2021 FDK. All rights reserved.
//

#import <Foundation/Foundation.h>
static int DEFAULT_SIZE = 10;
NS_ASSUME_NONNULL_BEGIN

@interface FDKArrayList : NSObject
@property (nonatomic,assign)int  size; // 他可不是记录这个数组有多少空间 从add 开始记录多少元素
//  这里提示 因为小码哥 是用的java java 初始化数组可以 array =  int[capaticy]
//  不可变数组他可以这些申请固定的内存 但是oc这里呗苹果给搞了 所以就模拟一下 理解就好
@property (nonatomic,strong)NSMutableArray * elements; // 这里是为啥不用NSArray 因为java可以申请动态内存的不可变数组 但是oc不行 所以就模拟找个类型的对象来 不影响理解动态扩容就好
-(void)autoSetArraySize:(int)size;

-(void)addObject:(id)object;

-(int)size;

-(BOOL)isEmpty;

-(BOOL)isContainObject:(id)object;

-(id)getObjectWithIndex:(int)index;

-(void)addElement:(int)index obj:(id)obj;

-(void)removeObjWithIndex:(int)index;

-(void)clearAllObj;

-(int)indexOfObj:(id)obj;

@end

NS_ASSUME_NONNULL_END
