//
//  RBRootOperate.h
//  ifelseDemo
//
//  Created by ShaoTianchi on 14/12/26.
//  Copyright (c) 2014年 rainbow. All rights reserved.
//

#import "RBOperate.h"
#import "RBLeafOperate.h"

@interface RBRootOperate : RBOperate
@property (strong, nonatomic) RBRootOperate *inlineOperate;
@property (strong, nonatomic) RBLeafOperate *thenOperate;
@property (copy, nonatomic)   IFBlock ifBlock;
@property (weak, nonatomic)   RBRootOperate *lastOperate;
@end
