//
//  ViewController.m
//  MBProgressHUD_RF
//
//  Created by rocky on 2017/3/21.
//  Copyright © 2017年 RockyFung. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+Add.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *titles = @[@"window加载弹窗",@"view加载弹窗",@"window展示信息",@"view展示信息",@"成功展示弹窗",@"警告展示弹窗",@"错误展示弹窗",@"信息展示弹窗"];
    
    [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *title = obj;
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100 + idx * 45, 100, 40)];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitle:title forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        btn.backgroundColor = [UIColor cyanColor];
        btn.tag = idx;
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }];
}
- (void)btnAction:(UIButton *)btn{
    switch (btn.tag) {
        case 0:
            [MBProgressHUD showActivityMessageInWindow:nil];
            break;
        case 1:
            [MBProgressHUD showActivityMessageInView:nil];
            
            break;
        case 2:
            [MBProgressHUD showTipMessageInWindow:@"在window"];
            break;
        case 3:
            [MBProgressHUD showTipMessageInView:@"在View"];
            
            break;
        case 4:
            [MBProgressHUD showSuccessMessage:@"加载成功"];
            break;
        case 5:
            [MBProgressHUD showWarnMessage:@"显示警告"];
            break;
        case 6:
            [MBProgressHUD showErrorMessage:@"显示错误"];
            break;
        case 7:
            [MBProgressHUD showInfoMessage:@"显示信息"];
            break;
            
            
        default:
            break;
    }
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:2];
}

-(void)dismiss
{
    
    [MBProgressHUD hideHUD];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
