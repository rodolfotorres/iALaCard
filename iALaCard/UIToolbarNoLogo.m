//
//  UIToolbarNoLogo.m
//  iALaCard
//
//  Created by Rodolfo Torres on 4/9/13.
//  Copyright (c) 2013 Rodolfo Torres. All rights reserved.
//

#import "UIToolbarNoLogo.h"

@implementation UIToolbarNoLogo

#define BACKGROUND_IMAGE @"barra_verde.png"

- (void)drawRect:(CGRect)rect
{
    UIImage *image = [UIImage imageNamed: BACKGROUND_IMAGE];
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}

@end
