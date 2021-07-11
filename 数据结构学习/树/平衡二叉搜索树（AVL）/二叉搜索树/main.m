//
//  main.m
//  二叉搜索树
//
//  Created by MacHD on 2021/4/15.
//  Copyright © 2021 FDK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

/*
 在N个动态的整数中搜索某个整数?
 1。使用动态数组来存放元素
 2.数组是有序的话可以用二分法来搞 但是 动态的顺序就不会顺序的 所以这个不行
 
 二叉搜索树 添加 删除 搜索的最坏时间复杂度 可优化至:logn
 
 二叉搜索树-？binary search tree 二叉查找树 二叉排序树
 任意一个结点的值都大于其左子树所有节点的值
 任意一个结点的值都小于右子树所有节点的值
 他的左右子树也是一个二叉搜索树
 
 儿茶搜索树可以大大提高搜索数据效率
 
 儿茶搜索树存储的元素必须具备可比较性
 比如int double
 如果是对象 需要指定比较的具体方式
 其实就是 小我的去左边 大我的去右边
 
 设计二叉搜索树 没有索引的概念
 */




int main(int argc, char * argv[]) {
  NSString * appDelegateClassName;
  @autoreleasepool {
      // Setup code that might create autoreleased objects goes here.
      appDelegateClassName = NSStringFromClass([AppDelegate class]);
  }
  return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
