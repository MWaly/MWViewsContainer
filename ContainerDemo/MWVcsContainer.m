//
//  MWVcsContainer.m
//  Resume
//
//  Created by Mohamed Mokhles Waly on 2/25/14.
//  Copyright (c) 2014 Mokh. All rights reserved.
//

#import "MWVcsContainer.h"
#import "MWContainerTopbar.h"
#import "MWContainerConstants.h"




@interface MWVcsContainer ()




@property (nonatomic, strong) UIViewController *selectedViewController;
@property (nonatomic, strong) NSArray *arrayOfVCs;
@property (nonatomic, strong) UINavigationController *navController;

@property (nonatomic, assign) MWContainerTopbarStyle topBarStyle;

@end

@implementation MWVcsContainer

#pragma mark - Initaliaztion Methods -
- (instancetype)initWithObjects:(NSArray *)arrayOfVCs {

    return [self initWithObjects:arrayOfVCs andAttributes:@{} style:MWContainerFixedVariables];
}

- (instancetype)initWithObjects:(NSArray *)arrayOfVCs withButtonSize:(CGSize)buttonSubsize {
	
    return [self initWithObjects:arrayOfVCs andAttributes:@{kButtonWidth:@(buttonSubsize.width),kButtonHeight:@(buttonSubsize.height)} style:MWContainerFixedVariables];
}

- (instancetype)initWithObjects:(NSArray *)arrayOfVCs withVCSize:(CGSize)vcSubsize {

    return [self initWithObjects:arrayOfVCs andAttributes:@{kVcWidth:@(vcSubsize.width),kVcHeight:@(vcSubsize.height)} style:MWContainerFixedVariables];
}

- (instancetype)initWithObjects:(NSArray *)arrayOfVCs withVCSize:(CGSize)vcSubsize backgroundActiveColor:(UIColor *)color backgroundInactivecolor:(UIColor *)inactiveColor {
    return [self initWithObjects:arrayOfVCs andAttributes:@{kButtonBackgroundActiveColor:color,kButtonBackgroundInactiveColor:inactiveColor,kVcWidth:@(vcSubsize.width),kVcHeight:@(vcSubsize.height)} style:MWContainerFixedVariables];
}




/**
 *  designated initalizer
 *
 *  @return instance type of the class
 */

- (instancetype)initWithObjects:(NSArray *)arrayOfVCs andAttributes:(NSDictionary *)dict style:(MWVCContainerStyle)style{
	self = [super init];
	if (self) {
    
		self.arrayOfVCs = arrayOfVCs;
		self.topBarStyle=style;
        
		if (dict[kButtonBackgroundActiveColor] != nil)
            
			buttonBackgroundActive =  dict[kButtonBackgroundActiveColor];
        else
            buttonBackgroundActive= [UIColor lightGrayColor];
        
        
		if (dict[kButtonBackgroundInactiveColor] != nil)
			buttonBackgroundInActive = dict[kButtonBackgroundInactiveColor];
        else
            buttonBackgroundInActive= [UIColor whiteColor];
        
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
    
		
	}
	return self;
}

#pragma mark - View life cycle -

- (void)viewDidLoad {
	[super viewDidLoad];
    
	int i = 0;
	// create the subview controllers
    

    
    
	for (UIViewController *vc in self.arrayOfVCs) {
		if (i % 2 == 0)
            
			vc.view.backgroundColor = [UIColor greenColor];
        
		else
			vc.view.backgroundColor = [UIColor yellowColor];
		vc.title = [NSString stringWithFormat:@"View %i", i + 1];
        vc.view.bounds=self.view.bounds;
		i++;
	}
    self.navController = [[UINavigationController alloc]initWithRootViewController:[self.arrayOfVCs objectAtIndex:0]];
	// initialise the top bar here and insert it as a subview
	self.topbar = [[MWContainerTopbar alloc]initTopbarWithTitles:[self.arrayOfVCs valueForKey:@"title"] andAttributes:@{ kButtonMargin:@(buttonMargin), kButtonBackgroundActiveColor:buttonBackgroundActive , kButtonBackgroundInactiveColor:buttonBackgroundInActive ,kButtonFontColorActive:buttonFontColorActive ,kButtonFontColorInActive:buttonFontColorInActive  }
                                                           style:MWContainerTopbarFitAllWidth];
	self.topbar.frame = CGRectMake(0, 0, vcWidth, indicatorHeight + buttonHeight);
	
	[self.view addSubview:self.topbar];

	[self.topbar setUserInteractionEnabled:YES];
	self.navController.view.frame = CGRectMake(0, indicatorHeight + buttonHeight, vcWidth, self.view.frame.size.height - (indicatorHeight + buttonHeight));
	self.navController.navigationBarHidden = YES;
    
	[self.view addSubview:self.navController.view];
    self.selectedViewController =[self.arrayOfVCs firstObject];
	[self.view setUserInteractionEnabled:YES];
    self.topbar.containerDelegate=self;

}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma mark - Transition of Views -



- (void) didSelectVCAtIndex:(NSInteger)index{
	// balanced calls should be taken into consideration if animation is to be done here
    
	if ([self.navController.viewControllers containsObject:self.arrayOfVCs[index]]) {
		[self.navController popToViewController:(UIViewController *)self.arrayOfVCs[index] animated:NO];
	}
	else
		[self.navController pushViewController:self.arrayOfVCs[index] animated:NO];
    NSLog(@"the vc background color now is %@",[self.navController visibleViewController]);
      self.selectedViewController=_arrayOfVCs[index];
}

- (void)transitionFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL))completion
{



}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"I am here");
}

@end
