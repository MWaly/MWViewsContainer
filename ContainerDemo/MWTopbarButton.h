//
//  MWTopbarButton.h
//  Resume
//
//  Created by Mohamed Mokhles Waly on 2/25/14.
//  Copyright (c) 2014 Mokh. All rights reserved.
//


@import UIKit;

#import "MWContainerTopbarProtocol.h"

@interface MWTopbarButton : UIView

- (instancetype)initWithTitle:(NSString *)titleText fontColorActive:(UIColor *)fontColor fontColorInActive:(UIColor *)fontColorInActive backgroundInactive:(UIColor *)backgroundColorInactive backgroundColorActive:(UIColor *)backgroundColorActive;
- (instancetype)initWithTitle:(NSString *)titleText fontColorActive:(UIColor *)fontColor fontColorInActive:(UIColor *)fontColorInActive backgroundColor:(UIColor *)backgroundColor;
- (instancetype)initWithTitle:(NSString *)titleText fontColor:(UIColor *)fontColor backgroundColor:(UIColor *)backgroundColor;
- (instancetype)initWithTitle:(NSString *)titleText;




@property (readonly, nonatomic) UIColor *fontColorActive;
@property (readonly, nonatomic) UIColor *fontColorInActive;
@property (nonatomic, readonly) UIColor *backgroundColorInActive;
@property (nonatomic, readonly) UIColor *backgroundColorActive;
@property (nonatomic, readwrite, copy) NSString *titleText;
@property (nonatomic, readwrite) UIFont *titleFont;

@property (nonatomic, readonly, assign) NSInteger width;
@property (nonatomic, readonly, assign) NSInteger height;
@property (nonatomic, assign) NSInteger itemIdentfier;
@property (nonatomic, assign) BOOL isSelected;

@property (nonatomic, weak) id <MWContainerTopbarProtocol> topBarDelegate;

@end
