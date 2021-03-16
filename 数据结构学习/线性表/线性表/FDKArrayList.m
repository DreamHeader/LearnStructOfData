//
//  FDKArrayList.m
//  数据结构01- 线性表 --- 数组
//
//  Created by 浮东凯 on 2021/3/8.
//  Copyright © 2021 FDK. All rights reserved.
//

// 重点是理解这里的对于 数组的理解思想

//复杂度分析
/*
 最好
 最坏
 平均
 */

//  泛型。- 》 oc的 id
#import "FDKArrayList.h"

@implementation FDKArrayList

// 数组的动态扩容
-(void)autoSetArraySize:(int)size{
    size = (size <DEFAULT_SIZE)?size:DEFAULT_SIZE;
    self.elements = [[NSMutableArray alloc]initWithCapacity:size];
    // 申请一个更大内存的数组
    // 当数组中的东西变成id 类型 那么要考虑对象数组的内存问题
    // 如果方的对象 那么 数组存的是 对象的地址 
}
// 添加
-(void)addObject:(id)object{
    if (object == NULL) {
        return;
    }
    [self ensureCapacity:self.size];
    self.elements[self.size] = object;   //这个也是java可以这样搞 没办法 oc封装死了
    self.size++;
}
// 确保容量的拓展
-(void)ensureCapacity:(int)size{
    
    NSInteger oldCapacity = self.elements.count;
    if (oldCapacity > size) {
        return;
    }
    // 这里其实苹果是 扩容 1.6左右倍 但是写成浮点型计算很豪内存
    // 所以使用位运算 右移1 其实考验 二进制和十进制间的转换
    // 1。正数 十进制转二进制。 初二求余 倒叙排列。 负数  转二进制取反加一
    // 2. 二进制转十进制    2^n +... 2^2 +2^1+2^0    从个位到更高位数是这样的
    // 那么分析下来就可以认为是 左溢是乘以 2  右翼 是除以2 就相当于 0.5  也就得到1.5 oldCapacity
    NSInteger newCapacity = oldCapacity + (oldCapacity >> 1);// 位运算
    NSMutableArray * mutArray = [[NSMutableArray alloc]initWithCapacity:newCapacity];
    for (int i = 0; i<size; i++) {
        [mutArray addObject:self.elements[i]];
    }
    self.elements = [mutArray copy];
}
// 获取大小
-(int)size{
    return self.size;
}
// 是否为空
-(BOOL)isEmpty{
    return self.size == 0;
}
// 是否包含

-(BOOL)isContainObject:(id)object{
    return [self indexOfObj:object] != -1;
}
// 获取index坐标下的obj
-(id)getObjectWithIndex:(int)index{
    if (index>self.size) {
        return @(-1);
    }
    return self.elements[index];   // O(1)
}
// 设置inde下的obj的值为obj
-(void)addElement:(int)index obj:(id)obj{
    if (obj == NULL) {
        return;
    }
    // 最好 在尾部插入 不需要移动 和数据规模size没关系 复杂度为O(1)
    // 最坏在头部插入 o(n)
    // 平均复杂度：o(n/2) = o(n)
    // 还需要考虑size大小 进行扩容
    for (int i = self.size -1; i >= index; i--) {
        self.elements[i+1] = self.elements[i];
    }
    self.elements[index] = obj;
    self.size ++;
}
// 移除   index   的obj
-(void)removeObjWithIndex:(int)index{
    if (index>self.size) {
        return ;
    }
    // 时间复杂度
    // 最好 删除尾部 不需要移动 和数据规模size没关系 复杂度为O(1)
    // 最坏删除头部 o(n)
    // 平均复杂度：o(n/2) = o(n)
    // 还需要考虑size大小 进行扩容
    // 删除的位置 后面向前移动
    // 移动的范围为 index +1  到 size -1
    for (int i = (index +1); index<self.size-1; i++) {
        self.elements[i - 1 ] = self.elements[i];
    }
    self.size --;
    self.elements[self.size] = NULL;
}
// 清除所有
-(void)clearAllObj{
    // 当数据是常量型
    // size为0 和 真正的 把array 清掉 哪个好 这里
    // 其实处理好 size 为0 让别的地方读不到数据 比。把内存真正释放了 再向堆申请 好的
    // 其实 也可以最优化的根据自己的需求 比如100以下 用size为0  大于的 考虑内存问题 就清除掉也可以
    
    // 当是对象的时候需要管理对象的内存
    for (int i = 0; i < self.size; i++) {
        self.elements[i] = NULL;  // 实际应该 [self.element removeObject:obj];
        // 上面的 虽然不对 但是思想是说 clear是让存储的地址都清空 那么没有指向保存对象的指针 成为回收的垃圾
    }
    self.size = 0;
}
// 获取obj的index
-(int)indexOfObj:(id)obj{
    if (obj == NULL) {
        for (int i = 0; i<self.size; i++) {
            // 如果用isEqual 取判断null会闪退
            if (self.elements[i] == NULL) {
                return i;
            }
        }
    }else{
        for (int i = 0; i<self.size; i++) {
            if ([self.elements[i] isEqual:obj]) {
                return i;
            }
        }
    }
    return -1;
}
@end
