//
//  ViewController.m
//  LLpopoverDemo
//
//  Created by liushaohua on 16/11/16.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "ViewController.h"


// 遵守popover 的协议
@interface ViewController ()<UIPopoverPresentationControllerDelegate>

@end

@implementation ViewController


/**
 1 添加加号按钮
 2 点击加号按钮以 popover 的方式展现一个视图控制器
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.center = self.view.center;
    
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(popover:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)popover:(UIButton *)sender {

    UIViewController *vc = [[UIViewController alloc]init];
    
    
    // 1 在 iphone 上默认是模态展现  需要设置展现类型为 popover
    vc.modalPresentationStyle = UIModalPresentationPopover;
    
    // 设置弹窗视图控制器的大小
    vc.preferredContentSize = CGSizeMake(0, 120);
    
    // 2 设置展现的代理
    vc.popoverPresentationController.delegate = self;
    
    // 3 指定弹窗的定位控件 - 使用代码创建 必须设置定位控件
    vc.popoverPresentationController.sourceView = sender;
    
    // 4 设置箭头方向朝上
    vc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    
    // 5 设置箭头的位置 原点可以参照某一个控件的尺寸设置 宽高通常用于设置附加的偏移量通常传入0 就可以了
    CGSize size = sender.bounds.size;
    vc.popoverPresentationController.sourceRect = CGRectMake(size.width * 0.5, size.height, 0, 0);
    // 6 设置绕开控件 注意 同一时间 只能允许模态展现一个控制器 这是一个数组 如果需要 将控件添加进数组即可
    vc.popoverPresentationController.passthroughViews = @[];
    
    // 展现控制器
    [self presentViewController:vc animated:YES completion:nil];

}
#warning  一定要在此代理方法中设置 否则效果和模态效果是一样的
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    // 不使用系统默认的展现样式
    return UIModalPresentationNone;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
