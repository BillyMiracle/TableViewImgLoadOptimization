//
//  ViewController.m
//  TableViewImgLoadOptimization
//
//  Created by 张博添 on 2022/9/17.
//

#import "ViewController.h"
#import "Demo1ViewController.h"
#import "RunloopViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *demo1Button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    demo1Button.frame = CGRectMake(100, 100, 100, 100);
    [demo1Button setTitle:@"跳转第一界面" forState:UIControlStateNormal];
    [demo1Button addTarget:self action:@selector(pressDemo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:demo1Button];
    
    UIButton *runloopButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    runloopButton.frame = CGRectMake(100, 200, 200, 100);
    [runloopButton setTitle:@"跳转第二界面（Runloop）" forState:UIControlStateNormal];
    [runloopButton addTarget:self action:@selector(pressRunloop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:runloopButton];
}

- (void)pressDemo {
    
    Demo1ViewController *controller = [[Demo1ViewController alloc] init];
    controller.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)pressRunloop {
    RunloopViewController *controller = [[RunloopViewController alloc] init];
    controller.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:controller animated:YES completion:nil];
}

@end
