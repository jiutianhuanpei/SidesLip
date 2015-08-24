//
//  ViewController.m
//  SidesLip_Demo
//
//  Created by 沈红榜 on 15/8/24.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "ViewController.h"
#import "LeftViewController.h"
#import "MainViewController.h"
#import "UIView+SHB.h"

static CGFloat leftWidth = 200;

typedef NS_ENUM(NSUInteger, LeftVCState) {
    LeftVCIsClose,
    LeftVCIsOpen,
};

@interface ViewController ()

@end

@implementation ViewController {
//    MainViewController *_mainVC;
    UINavigationController *_mainNA;
    LeftVCState         _state;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    LeftViewController *leftVC = [[LeftViewController alloc] init];
    leftVC.width = leftWidth;
    leftVC.view.width = leftWidth;
    NSArray *titles = @[@"User Center", @"My Photo", @"My Firends", @"Setting"];
    leftVC.titles = titles;
    [self.view addSubview:leftVC.view];
    [self addChildViewController:leftVC];
    
    
    MainViewController *mainVC = [[MainViewController alloc] init];
    _mainNA = [[UINavigationController alloc] initWithRootViewController:mainVC];
    mainVC.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Left" style:UIBarButtonItemStylePlain target:self action:@selector(leftLip:)];
    
    [self.view addSubview:_mainNA.view];
    [self addChildViewController:_mainNA];
    
    _state = LeftVCIsClose;
    
    leftVC.clickedNum = ^(NSInteger num) {
        NSLog(@"点击了： %@", titles[num]);
    };
    
    
    
    
    
}

- (void)leftLip:(UIBarButtonItem *)item {
    __weak typeof(self) SHB = self;
    switch (_state) {
        case LeftVCIsClose: {
            [UIView animateWithDuration:0.4 animations:^{
                [SHB openSidesLip];
            }];
            break;
        }
        case LeftVCIsOpen: {
            [UIView animateWithDuration:0.4 animations:^{
                [SHB closeSidesLip];
            }];
            break;
        }
        default: {
            break;
        }
    }
}

- (void)openSidesLip {
    _state = LeftVCIsOpen;
    _mainNA.view.transform = CGAffineTransformMakeTranslation(leftWidth, 0);
}

- (void)closeSidesLip {
    _state = LeftVCIsClose;
    _mainNA.view.transform = CGAffineTransformIdentity;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
