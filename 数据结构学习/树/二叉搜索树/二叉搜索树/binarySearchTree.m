//
//  binarySearchTree.m
//  二叉搜索树
//
//  Created by MacHD on 2021/4/15.
//  Copyright © 2021 FDK. All rights reserved.
//
// 二叉树的遍历
// 前序遍历 中序遍历 后序  层序遍历
#import "binarySearchTree.h"
#import "Queue.h"
@implementation binarySearchTree
- (instancetype)initWithCompare:(Compare*)compage {
  self = [super init];
  if (self) {
    _compare = compage;
  }
  return self;
}
- (int)treeSize {
  return self.size;
}

- (BOOL)isEmpty {
  return self.size == 0;
}

- (void)clear {
    self.rootNode  = nil;
    self.size = 0;
}

- (void)add:(id)element {
  if (!element) {
    NSLog(@"add：%@ Error", element);
    return;
  }
  // 如果为空说明添加的第一个根节点
  if (!self.rootNode) {
    self.rootNode = [[TreeNode alloc] initWithObj:element parent:nil];
    self.size++;
    return;
  }
  //找到父节点
  TreeNode* node = self.rootNode;
  TreeNode* temParentNode = self.rootNode;
  int num = 0;
  while (node != NULL) {
    temParentNode = node;
    if (self.compare) {
      num = [self.compare compare:element element2:node.obj];
    } else {
      num = [self compare:element element2:node.obj];
    }
    if (num > 0) {
      node = node.right;
    } else if (num < 0) {
      node = node.left;
    } else {
      node.obj = element;
      return;
    }
  }
  // 看插入到父节点的哪个位置
  TreeNode* tem = [[TreeNode alloc] initWithObj:element parent:temParentNode];
  if (num > 0) {
    temParentNode.right = tem;
  } else if (num < 0) {
    temParentNode.left = tem;
  } else {
    return;
  }
  // 数量
  self.size++;
}
// 删除节点
/*
 1.删除叶子节点  直接删除就好  node.parent.left = null 或者 node.parent.right = null
 如果要删除的叶子节点的parent是null 那就是要删除根节点直接 root = null
 2.删除度为1的节点  用子节点替代原节点的位置 child 是 要删除节点的left或者right
 如果是被删除的node 是 左子节点 child.parent = node.parent  node.parent.left =child
 如果被删除的node是右子节点 child.parent = node.parent  node.parent.right = child;
 如果是根节点 那 root = child  child.parent = null
 3.删除度为2的节点：
 如果删除的是 根结点 那么就要找从树中找一个节点替代跟节点。 先用前驱或者后继节点的值覆盖原节点的值
 然后 删除响应的前驱或者后继的节点。
  如果一个节点的度为2 那么 它的前驱 后继的节点的度 之可能是 1 和 0
 */
- (void)remove:(id)element {
    [self remove:[self getNode:element]];
}
-(void)removeElement:(TreeNode *) node{
    if (!node) {
        return;
    }
    self.size -- ;
    // 处理度为2的节点
    if(node.hasTwoChildren){
        TreeNode * s = [self getSucessor:node];
        // 用后继节点的值覆盖度为2的值
        node.obj = s.obj;
        // 删除后继节点
        node = s;
    }
    // 删除node 节点 （必然是度为0 或者 1）
    TreeNode * replaceNode = node.left?node.left:node.right;
    if (replaceNode) {
    // 度为1的节点
    // 更改parent
        replaceNode.parent = node.parent;
        if (!node.parent) {// 度为1的节点 同时还是跟节点
         self.rootNode = replaceNode;
        }
        if (node == node.parent.left) {
            node.parent.left = replaceNode;
        }else if (node == node.parent.right){
            node.parent.right = replaceNode;
        }
    }else if (!replaceNode.parent){
      // node是叶子节点并且是根结点
        self.rootNode = nil;
    }else{
    // 度为0 的节点。叶子节点
        if (node == node.parent.left) {
            node.parent.left = nil;
        }else{
            node.parent.right = nil;
        }
    }
}
-(TreeNode*)getNode:(id)element{
    TreeNode * node = self.rootNode;
    while (!node) {
        int num = [element intValue]  - [node.obj intValue];
        if (num == 0) {
            return node;
        }else if (num>0){
            node = node.right;
        }else if (num<0){
            node = node.left;
        }
    }
    return nil;
}
// 二叉树是否包含某个元素
- (BOOL)isContain:(id)element {
  if (!self.rootNode) {
    return NO;
  }
  Queue* queue = [[Queue alloc] init];
  [queue enQueue:self.rootNode];
  while (!queue.isEmpty) {
    TreeNode* node = [queue deQueue];
    if (node.obj == element) {
      return YES;
    }
    if (node.left) {
      [queue enQueue:node.left];
    }
    if (node.right) {
      [queue enQueue:node.right];
    }
  }
  return NO;
}
- (int)compare:(id)element1 element2:(id)element2 {
  return [element1 intValue] - [element2 intValue];
}
#pragma mark - 前序遍历
// 前序遍历  先根节点 前序遍历左子树 再遍历右子树
- (void)preOrderTraversal {
  [self preOrderTraversal:self.rootNode];
}
- (void)preOrderTraversal:(TreeNode*)node {
  if (node == nil) {
    return;
  }
  NSLog(@"%@", node.obj);
  [self preOrderTraversal:node.left];
  [self preOrderTraversal:node.right];
}
#pragma mark - 中序遍历
// 中序遍历 先左子树 根节点  再右子树
// 二叉搜索树的中序遍历结果 是升序或者降序
- (void)inOrderTraversal {
  [self inOrderTraversal:self.rootNode];
}
- (void)inOrderTraversal:(TreeNode*)node {
  if (node == nil) {
    return;
  }
  [self inOrderTraversal:node.left];
  NSLog(@"%@", node.obj);
  [self inOrderTraversal:node.right];
}
#pragma mark - 后序遍历
// 中序遍历 先左子树 根节点  再右子树
// 二叉搜索树的中序遍历结果 是升序或者降序
- (void)lastOrderTraversal:(Visitor*)visitor {
  [self lastOrderTraversal:self.rootNode visitor:visitor];
}
- (void)lastOrderTraversal:(TreeNode*)node visitor:(Visitor*)visitor {
  if (node == nil || (visitor.stop)) {
    return;
  }
  [self inOrderTraversal:node.left];
  [self inOrderTraversal:node.right];

  if (visitor.stop) {
    return;
  }
  BOOL isStop = [visitor visit:node.obj];
  visitor.stop = isStop;
}
#pragma mark - 层序遍历
//从上到下 从左到右依次访问每一个节点
/*
 实现的思路
 1/将根节点入队
 2.循环执行以下的操作 直到队列为空
  2.1将对头的节点A出队 访问
  2.2将A的左子节点入队
  2.3将A的右子节点入队
 */
- (void)levelOrderTraversal {
  if (!self.rootNode) {
    return;
  }
  Queue* queue = [[Queue alloc] init];
  [queue enQueue:self.rootNode];
  while (!queue.isEmpty) {
    TreeNode* node = [queue deQueue];
    NSLog(@"%@", [node toString]);
    if (!node.left) {
      [queue enQueue:node.left];
    }
    if (!node.right) {
      [queue enQueue:node.right];
    }
  }
}
// 设计这种模式 对比上面的写法 是一种抽调代码的思路 前序中序后序都可以按照这种来
- (void)visitorManage:(Visitor*)visitor {
  if (!self.rootNode || !visitor) {
    return;
  }
  Queue* queue = [[Queue alloc] init];
  [queue enQueue:self.rootNode];
  while (!queue.isEmpty) {
    TreeNode* node = [queue deQueue];
    //这种设计的模式跟上面的 levelOrderTraversal这种的对比 你想要打印这个节点还是操作任何 都是可以
    //这种设计的模式可以把东西抛出去
    // 遍历增强，可以控制在哪个位置停止遍历
    BOOL isStop = [visitor visit:node.obj];
    if (isStop) {
      return;
    }
    visitor.stop = isStop;
    if (node.left) {
      [queue enQueue:node.left];
    }
    if (node.right) {
      [queue enQueue:node.right];
    }
  }
}
#pragma mark - 获取树的高度
// 从当前节点到最远节点的高度
#pragma mark - 递归的方式
- (int)treeHeght {
  return [self nodeHeight:self.rootNode];
}
- (int)nodeHeight:(TreeNode*)node {
  if (!node) {
    return 0;
  }
  return 1 + MAX([self nodeHeight:node.left], [self nodeHeight:node.right]);
}
#pragma mark - 迭代的方式
// 发现当要访问下一层的时候 当前队列放着的元素就是下一层的所有元素
// 那么只要标志下每一层结束的点
- (int)treeHeght1 {
  if (!self.rootNode) {
    return 0;
  }
  Queue* queue = [[Queue alloc] init];
  [queue enQueue:self.rootNode];
  int height = 0;  // 树的高度
  int levelSize = 1;  // 存放每一层的元素数量
  while (!queue.isEmpty) {
    TreeNode* node = [queue deQueue];
    levelSize--;
    if (node.left) {
      [queue enQueue:node.left];
    }
    if (node.right) {
      [queue enQueue:node.right];
    }
    if (levelSize == 0) {  // 意味着即将要访问下一层
      levelSize = [queue size];
      height++;  // 访问下一层了 那么高度就增加下
    }
  }
  return 0;
}
#pragma mark - 是否为完全二叉树
//是否为完全二叉树 特点是 叶子节点 只会在 倒数两个层
//而且最后一层的叶子节点都靠左对齐
//我们开始寻找规律：
//1：如果当前访问的节点的左右孩子是左空右存在，说明不是完全二叉树，直接返回false。
//2：如果当前访问的节点的左右孩子是情况左右存在，继续访问其他节点
//3：如果当前访问的节点的左右孩子是左存在右空或者左右都为空，那么我们定义一个状态（接下来访问的所有节点必须全部是叶子节点）。只要遇到左存在右空或者左右都为空，这个状态就开启了。
- (BOOL)isComplete {
  if (!self.rootNode) return NO;

  Queue* queue = [[Queue alloc] init];
  [queue enQueue:self.rootNode];
  // 定义这个对应上面第三条
  BOOL isLeaf = NO;
  while (!queue.isEmpty) {
    TreeNode* node = [queue deQueue];
    if (isLeaf && !node.isLeaf) {
      return NO;
    }
    // 完全二叉树必须从左到右 最后一层是左对齐
    // 如果出现了左空右存在 那么就必定不是完全二叉树
    if (node.left) {
      [queue enQueue:node.left];
    } else if (node.right) {
      return NO;
    }

    if (node.right) {
      [queue enQueue:node.right];
    } else {
      // node.left==null&&node.right==null || node.left!=null&&node.right==null
      isLeaf = YES;
    }
  }
  return YES;
}
// 用前序遍历打印二叉树
- (void)toString {
  NSMutableString* mut = [[NSMutableString alloc] init];
  [self privateToString:self.rootNode mutString:mut prefix:@"Root"];
}
- (void)privateToString:(TreeNode*)node
              mutString:(NSMutableString*)sb
                 prefix:(NSString*)prefix {
  if (!node) {
    return;
  }
  [sb appendString:[NSString
                       stringWithFormat:@"%@%@%@", prefix, node.obj, @"\n"]];
  [self privateToString:node.left mutString:sb prefix:@"Left"];
  [self privateToString:node.right mutString:sb prefix:@"Right"];
}
#pragma mark - 前驱节点
// 前驱节点
// 中序遍历中的前一个节点
// 如果是二叉树，前驱节点就是前一个比他小的节点
// 分析可以得结论 找到左子树中最大数的那个结点
// node.left !=null   needNode = node.left.right.right.......
// node.left == null &&node.right!=null   needNode = node.parent.parent...
//  终止条件:node在parent的右子树中

// node.left == null &&node.rig ht=null 没有前驱
- (TreeNode*)getPredecessor:(TreeNode*)node {
  if (!node) {
    return NULL;
  }
  if (node.left) {
    // 前驱节点在左子树中 needNode = node.left.right.right.......
    TreeNode* p = node.left;
    while (p.right) {
      p = p.right;
    }
    return p;
  }

  while (node.parent && node == node.parent.left) {
    node = node.parent;
  }
  // 能退出上面的循环
  // 1,node.parent == null
  // 2.node == node.parent.right

  return node.parent;
}
#pragma mark - 后继节点
- (TreeNode*)getSucessor:(TreeNode*)node {
  if (!node) {
    return NULL;
  }
  if (node.right) {
    // 前驱节点在左子树中 needNode = node.left.right.right.......
    TreeNode* p = node.left;
    while (p.left) {
      p = p.left;
    }
    return p;
  }

  while (node.parent && node == node.parent.right) {
    node = node.parent;
  }
  // 能退出上面的循环
  // 1,node.parent == null
  // 2.node == node.parent.left

  return node.parent;
}
@end
