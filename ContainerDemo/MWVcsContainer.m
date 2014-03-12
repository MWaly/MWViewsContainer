//
//  MWVcsContainer.m
//  Resume
//
//  Created by Mohamed Mokhles Waly on 2/25/14.
//  Copyright (c) 2014 Mokh. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "MWVcsContainer.h"
#import "MWContainerTopbar.h"
#import "MWContainerConstants.h"


@interface MWVcsContainer ()

@property (nonatomic, strong) UIViewController *selectedViewController;
@property (nonatomic, strong) NSArray *arrayOfVCs;
@property (nonatomic, strong) UINavigationController *navController;

@property (nonatomic, assign) MWContainerTopbarStyle topBarStyle;
@property (nonatomic, assign) MWVCContainerStyle vcStyle;

@end

@implementation MWVcsContainer

#pragma mark - Initaliaztion Methods -
- (instancetype)initWithObjects:(NSArray *)arrayOfVCs {
	return [self initWithObjects:arrayOfVCs andAttributes:@{}
	                       style:MWContainerFitAllSpace];
}

- (instancetype)initWithObjects:(NSArray *)arrayOfVCs withButtonSize:(CGSize)buttonSubsize {
	return [self initWithObjects:arrayOfVCs andAttributes:@{ kButtonWidth:@(buttonSubsize.width), kButtonHeight:@(buttonSubsize.height) }
                           style:MWContainerFitAllSpace];
}

- (instancetype)initWithObjects:(NSArray *)arrayOfVCs withVCSize:(CGSize)vcSubsize {
	return [self initWithObjects:arrayOfVCs andAttributes:@{ kVcWidth:@(vcSubsize.width), kVcHeight:@(vcSubsize.height) }
                           style:MWContainerFitAllSpace];
}

- (instancetype)initWithObjects:(NSArray *)arrayOfVCs withVCSize:(CGSize)vcSubsize backgroundActiveColor:(UIColor *)color backgroundInactivecolor:(UIColor *)inactiveColor {
	return [self initWithObjects:arrayOfVCs andAttributes:@{ kButtonBackgroundActiveColor:color, kButtonBackgroundInactiveColor:inactiveColor, kVcWidth:@(vcSubsize.width), kVcHeight:@(vcSubsize.height) }
                           style:MWContainerFitAllSpace];
}

/**
 *  designated initalizer
 *
 *  @return instance type of the class
 */

- (instancetype)initWithObjects:(NSArray *)arrayOfVCs andAttributes:(NSDictionary *)dict style:(MWVCContainerStyle)style {
	self = [super init];
	if (self) {
		self.arrayOfVCs = arrayOfVCs;
		self.vcStyle = style;
        
		if (dict[kButtonBackgroundActiveColor] != nil)
            
			buttonBackgroundActive =  dict[kButtonBackgroundActiveColor];
		else
			buttonBackgroundActive = [UIColor lightGrayColor];
        
        
		if (dict[kButtonBackgroundInactiveColor] != nil)
			buttonBackgroundInActive = dict[kButtonBackgroundInactiveColor];
		else
			buttonBackgroundInActive = [UIColor whiteColor];
        
		if (dict[kButtonFontColorActive] != nil)
			buttonFontColorActive = dict[kButtonFontColorActive];
		else //As a default color
			buttonFontColorActive = [UIColor blueColor];
        
		if (dict[kButtonFontColorInActive] != nil)
			buttonFontColorInActive = dict[kButtonFontColorInActive];
		else //As a default color
			buttonFontColorInActive = [UIColor grayColor];
        
        
		if (dict[kButtonFontSize] != nil)
			buttonFontSize = [dict[kButtonFontSize] floatValue];
        
        
		// These values won't be valid if topbarStyle was MWContainerTopbarFitAllWidth
		if (dict[kButtonHeight] != nil)
			buttonHeight = [dict[kButtonHeight] floatValue];
        
		if (dict[kButtonWidth] != nil)
			buttonWidth = [dict[kButtonWidth] floatValue];
        
		if (dict[kButtonMargin] != nil)
			buttonMargin = [dict[kButtonMargin] floatValue];
        
		if (dict[kIndicatorColor] != nil)
			indicatorColor = dict[kIndicatorColor];
		else
			indicatorColor = [UIColor yellowColor];
	}
	return self;
}

#pragma mark - View life cycle -

- (void)viewDidLoad {
	[super viewDidLoad];
    
    
	for (UIViewController *vc in self.arrayOfVCs) {
		vc.view.bounds = self.view.bounds;
		vc.view.layer.borderColor = [UIColor blackColor].CGColor;
		vc.view.layer.borderWidth = 5;
		vcWidth = vc.view.frame.size.width;
		// for the status bar height
		vcHeight = self.view.frame.size.height - buttonHeight - indicatorHeight - 20;
	}
	self.navController = [[UINavigationController alloc]initWithRootViewController:[self.arrayOfVCs objectAtIndex:0]];
	[self.view addSubview:self.navController.view];
    
	// initialise the top bar here and insert it as a subview , if you need to change the topbar style , you should change it from here
    
	self.topbar = [[MWContainerTopbar alloc]initTopbarWithTitles:[self.arrayOfVCs valueForKey:@"title"] andAttributes:@{ kButtonMargin:@(buttonMargin), kButtonBackgroundActiveColor:buttonBackgroundActive, kButtonBackgroundInactiveColor:buttonBackgroundInActive, kButtonFontColorActive:buttonFontColorActive, kButtonFontColorInActive:buttonFontColorInActive, kIndicatorColor:indicatorColor }
                                                           style:MWContainerTopbarFitAllWidth];
    
	[self.view addSubview:self.topbar];
    
	[self.topbar setUserInteractionEnabled:YES];
	self.navController.view.frame = CGRectMake(0, indicatorHeight + buttonHeight, vcWidth, vcHeight);
	self.navController.navigationBarHidden = YES;
    
	self.selectedViewController = [self.arrayOfVCs firstObject];
	[self.view setUserInteractionEnabled:YES];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	self.topbar.containerDelegate = self;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma mark - Transition of Views -



- (void)didSelectVCAtIndex:(NSInteger)index {
	// balanced calls should be taken into consideration if animation is to be done here
    
	if ([self.navController.viewControllers containsObject:self.arrayOfVCs[index]]) {
		[self.navController popToViewController:(UIViewController *)self.arrayOfVCs[index] animated:NO];
        [self.selectedViewController removeFromParentViewController];
        [(UIViewController *)self.arrayOfVCs[index]  didMoveToParentViewController:self];
	}
	else
    {
		[self.navController pushViewController:self.arrayOfVCs[index] animated:NO];
        [self.selectedViewController removeFromParentViewController];
        [(UIViewController *)self.arrayOfVCs[index]  didMoveToParentViewController:self];
    }
	NSLog(@"the vc background color now is %@", [self.navController visibleViewController]);
	self.selectedViewController = _arrayOfVCs[index];
}


@end
