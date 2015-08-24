//
//  LeftViewController.h
//  SidesLip_Demo
//
//  Created by 沈红榜 on 15/8/24.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickedNum)(NSInteger num);

@interface LeftViewController : UIViewController

@property (nonatomic, strong) NSArray    *titles;
@property (nonatomic, assign) CGFloat    width;
@property (nonatomic, copy)   ClickedNum    clickedNum;


@end
