//
//  Invoker.h
//  commandPattern
//
//  Created by 张鑫 on 2019/5/23.
//  Copyright © 2019 张鑫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Invoker : NSObject

interfaceSingleton(Invoker*);

/**
 *  添加指令操作
 *
 *  @param command 指令
 */
- (void)addExcute:(id<InvokerProtocol>)command;

/**
 *  回退操作
 */
- (void)rollBack;

@end

