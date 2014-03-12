//
//  MWTopbarIndicator.h
//  Resume
//
//  Created by Mohamed Mokhles Waly on 2/26/14.
//  Copyright (c) 2014 Mokh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MWTopbarIndicator : UIView

- (instancetype)initWithImage:(UIImage *)indicatorImage;
- (instancetype)initWithImage:(UIImage *)indicatorImage andHeight:(CGFloat)height;
- (instancetype)initWithColor:(UIColor *)indicatorColor;
- (instancetype)initWithColor:(UIColor *)indicatorColor andHeight:(CGFloat)height;

@end
