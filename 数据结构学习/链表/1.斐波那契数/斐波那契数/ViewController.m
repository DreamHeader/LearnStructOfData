//
//  ViewController.m
//  01-复杂度 斐波那契数
//
//  Created by 浮东凯 on 2021/3/7.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%d",[self goodfib:5]);
    // 如何评判一个算法的好坏？
    // A和B你觉得哪个好
    // 评判好坏。 可读性。正确幸福 健壮性
    // 最重要的评判。时间复杂度：估算程序指令的执行次数（执行时间）
    // 最重要的评判 ：空间复杂度 ：估算所需占用的存储空间
}
#pragma mark - 时间复杂度
/*
 时间复杂度
 空间复杂度
 */
-(void)functionTime{
    for (int i = 0; i< 100; i++) {
        NSLog(@"functionTime%@",@(i));
    }
    // 时间复杂度 n
    // 空间复杂度 o(1)
}
-(void)functionTime1with:(int)n{
    for (int i = 0; i< n; i++) {
        for (int j = 0; i<n; j++) {
            NSLog(@"functionTime%@",@(i));
        }     }
    // 时间复杂度 n^2
}
-(void)functionTime2with:(int)n{
    // 满足
    // 8 = 2 ^ 3
    // 16  = 2^4    log2(16) = 4;

    
    while ((n=n/2)>0) {
       NSLog(@"functionTime");
    }
    // log2(n)
}
-(void)functionTime3with:(int)n{
    // n = 1 * 2 * 2 * 2  所以里面执行了log2n * （1 + 3n） 次
    //  外面执行了 1 + 2log2(n)
    for (int i = 1; i< n; i=+i) {
        
        // 1+3n
        for (int j = 0; i<n; j++) {
            NSLog(@"functionTime%@",@(i));
        }
    }
    // 时间复杂度 log2(n) * (1+3n)
    //  大O表示法 忽略无效后变为nlogn 次
}
/*
 大o表示法
 1.忽略场数。系数。低阶
  9  = o（1）
  2n+3 = o(n)
  n^2 + 2n + 6= o(n^2)
 对数的阶的细节。log2 n = log 2 9 * log 9 n; 所以统称为log n
 */
#pragma mark - 斐波那契数
/*
 斐波那契数。 0 1 1 2 3 5 8 13.。。。。
 */
// 最垃圾写法 A
// 时间复杂度 o(2^n)
// 比如传入 5 按照树的排列 会发现 每一层执行的次数 1 2 4 8  = 2^ 0+ 2^ 1+.... 这种
-(int)fib:(int)index{
    if(index<=1) return index;
    return  [self fib:index-1]+[self fib:index-2];
}
// B
// 优化后的斐波那契数
// 思路是 计算index前计算几次 然后处理每次的两个相加值
//  时间复杂度 O(n)
-(int)goodfib:(int)index{
    if (index<=1) {
        return index;
    }
    int firstFlag = 0;
    int secondFlag =1;
    // index - 1 次 大o法 省略 常数项
    for (int i = 0; i< index -1; i++) {
        int sum = firstFlag + secondFlag;
        firstFlag = secondFlag;
        secondFlag = sum ;
        
    }
    return secondFlag;
}
/*
 算法的优化方向
 1。尽量少的存储空间
 2.用尽量少的执行时间
 3.时间和空间的互相转化
 
 最好复杂度
 最坏复杂度
 均摊复杂度
 复杂度震荡
 平均复杂度
 。。。。。。。。
 */
@end
