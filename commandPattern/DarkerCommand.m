//
//  DarkerCommand.m
//  commandPattern
//
//  Created by 张鑫 on 2019/5/23.
//  Copyright © 2019 张鑫. All rights reserved.
//

#import "DarkerCommand.h"

@interface DarkerCommand ()

/** 接受者 */
@property (nonatomic,strong)Receiver *receiver;

/** 数值 */
@property (nonatomic,assign)CGFloat paramter;

@end

@implementation DarkerCommand


- (instancetype)initWithReceiver:(Receiver*)receiver withParamter:(CGFloat)paramter {
    self = [super init];
    if (self) {
        self.receiver = receiver;
        self.paramter = paramter;
    }
    return self;
}

/**
 *  命令的执行 思考一下，命令怎么执行让任务实现？
 *
 */
- (void)excute {
    [self.receiver makeViewDarker:self.paramter];
}

/**
 *  撤销命令
 */
- (void)rollBackExcute {
    [self.receiver makeViewLighter:self.paramter];
}

@end
