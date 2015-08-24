//
//  UIView+SHB.m
//  SidesLip_Demo
//
//  Created by 沈红榜 on 15/8/24.
//  Copyright (c) 2015年 沈红榜. All rights reserved.
//

#import "UIView+SHB.h"

@implementation UIView (SHB)

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

@end
