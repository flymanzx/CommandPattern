//
//  ViewController.m
//  commandPattern
//
//  Created by 张鑫 on 2019/5/23.
//  Copyright © 2019 张鑫. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/** 接受者，执行任务者 */
@property (nonatomic,strong)Receiver *receiver;

/** 命令的调用者或者容器，好比遥控器 */
@property (nonatomic,strong)Invoker *invoker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *addBtn = [self addButtonWithTitle:@"+"
                                          frame:CGRectMake(30, kScreenHeight/2, 30, 30)
                                         action:@selector(buttonEvents:)
                                            tag:kCommandPatternButtonTypeAddBtn];
    [self.view addSubview:addBtn];
    
    UIButton *delBtn = [self addButtonWithTitle:@"-"
                                          frame:CGRectMake(100, kScreenHeight/2, 30, 30)
                                         action:@selector(buttonEvents:)
                                            tag:kCommandPatternButtonTypeDelBtn];
    [self.view addSubview:delBtn];
    
    
    UIButton *rolBtn = [self addButtonWithTitle:@"roolBack"
                                          frame:CGRectMake(170, kScreenHeight/2, 130, 30)
                                         action:@selector(buttonEvents:)
                                            tag:kCommandPatternButtonTypeRolBtn];
    [self.view addSubview:rolBtn];
    self.receiver = [[Receiver alloc] init];
    [self.receiver setClientView:self.view];
    
}

// 点击方式
- (void)buttonEvents:(UIButton *)sender {
    if (sender.tag == kCommandPatternButtonTypeAddBtn) {
        
        LighterCommand *lightCom = [[LighterCommand alloc] initWithReceiver:self.receiver withParamter:0.1f];
        self.invoker = [[Invoker alloc] init];
        [self.invoker  addExcute:lightCom];
        
    } else if(sender.tag == kCommandPatternButtonTypeDelBtn) {
        
        DarkerCommand *darktCom = [[DarkerCommand alloc] initWithReceiver:self.receiver withParamter:0.1f];
        self.invoker = [[Invoker alloc] init];
        [self.invoker  addExcute:darktCom];
        
    } else if(sender.tag == kCommandPatternButtonTypeRolBtn) {
        
        [self.invoker rollBack];

    } else {
        // ignore
    }
}

// 添加button
- (UIButton *)addButtonWithTitle:(NSString *)titleString frame:(CGRect)frame action:(SEL)sel tag:(kCommandPatternButtonType)tag {
    UIButton* btn = [[UIButton alloc] initWithFrame:frame];
    [btn setTitle:titleString forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitle:titleString forState:UIControlStateHighlighted];
    btn.layer.borderWidth = 1.0f;
    [btn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    [btn setTag:tag];
    return btn;
}

@end
