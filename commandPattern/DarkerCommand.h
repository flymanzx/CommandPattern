//
//  DarkerCommand.h
//  commandPattern
//
//  Created by 张鑫 on 2019/5/23.
//  Copyright © 2019 张鑫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DarkerCommand : NSObject <InvokerProtocol>

- (instancetype)initWithReceiver:(Receiver*)receiver withParamter:(CGFloat)paramter;

@end


