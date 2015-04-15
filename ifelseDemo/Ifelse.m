//
//  Ifelse.m
//  ifelseDemo
//
//  Created by ShaoTianchi on 14/12/26.
//  Copyright (c) 2014年 rainbow. All rights reserved.
//

#import "Ifelse.h"
#import "RBIfOperate.h"
#import "RBElseOperate.h"
#import "RBThenOperate.h"

#pragma mark - Operate

@interface RBIfelse ()
@property (strong, nonatomic) NSDictionary *info;
@property (strong, nonatomic) RBRootOperate *rootOperate;
@property (strong, nonatomic) RBRootOperate *currentIfOperate;
@property (strong, nonatomic) NSMutableArray *cachedOperates;
@end


@implementation RBIfelse

- (instancetype)init {
    self = [super init];
    if (self) {
        self.cachedOperates = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (instancetype)create:(NSString *)key {
    RBIfelse *rbIfelse = [[RBIfelse alloc] init];
    rbIfelse.uniqueName = key;
    return rbIfelse;
}

- (instancetype)__if:(IFBlock)ifBlock {
    if (!_rootOperate) {
        _rootOperate = [[RBIfOperate alloc] init];
        _rootOperate.ifBlock = [ifBlock copy];
        self.currentIfOperate = _rootOperate;
    } else {
        RBIfOperate *ifOperate = [[RBIfOperate alloc] init];
        ifOperate.ifBlock = [ifBlock copy];
        _currentIfOperate.inlineOperate = ifOperate;
        ifOperate.lastOperate = _currentIfOperate;
        _currentIfOperate = ifOperate;
    }
    return self;
}

- (instancetype)__else:(IFBlock)elseBlock {
    NSAssert(_currentIfOperate && [_currentIfOperate isKindOfClass:[RBIfOperate class]], @"语法错误");
    RBElseOperate *elseOperate = [[RBElseOperate alloc] init];
    elseOperate.ifBlock = elseBlock;
    ((RBIfOperate *)_currentIfOperate).elseOperate = elseOperate;
    elseOperate.lastOperate = _currentIfOperate;
    _currentIfOperate = elseOperate;
    return self;
}

- (instancetype)__then:(ThenBlock)thenBlock {
    NSAssert(_currentIfOperate, @"语法错误");
    RBThenOperate *thenOpereate = [[RBThenOperate alloc] init];
    thenOpereate.thenBlock = [thenBlock copy];
    _currentIfOperate.thenOperate = thenOpereate;
    return self;
}

- (instancetype)__endIf {
    RBRootOperate *lastOperate = _currentIfOperate.lastOperate;
    if (lastOperate) {
        _currentIfOperate = lastOperate;
    }
    return self;
}

- (void)execute {
    if (!_currentIfOperate) {
        return;
    }
    [self executeOperate:_rootOperate];
}

- (void)executeOperate:(RBRootOperate *)operate {
    if (operate.ifBlock(_info)) {
        if (operate.thenOperate) {
            operate.thenOperate.thenBlock(_info);
        }
        if (operate.inlineOperate) {
            [self executeOperate:operate.inlineOperate];
        }
    } else {
        if ([operate isKindOfClass:[RBIfOperate class]] && ((RBIfOperate *)operate).elseOperate) {
            [self executeOperate:((RBIfOperate *)operate).elseOperate];
        }
    }
}

@end
