//
//  MWContainerTopbar.m
//  Resume
//
//  Created by Mohamed Mokhles Waly on 2/25/14.
//  Copyright (c) 2014 Mokh. All rights reserved.
//

#import "MWContainerTopbar.h"
#import "MWTopbarButton.h"
#import "MWTopbarIndicator.h"
#import "MWContainerConstants.h"



@interface MWContainerTopbar ()

@property (nonatomic, strong) NSMutableArray *arrayOfButtons;
@property (nonatomic, strong) NSMutableArray *arrayOfTitles;
@property (nonatomic, strong) MWTopbarIndicator *indicatorLine;
@property (nonatomic, strong) UIScrollView *containerScrollView;
@property (nonatomic, strong) MWTopbarButton *selectedButton;
@end

@implementation MWContainerTopbar

// Designated Initiliazer
- (MWContainerTopbar *)initTopbarWithTitles:(NSArray *)titlesInput andAttributes:(NSDictionary *)dictionaryOfAttributes style:(MWContainerTopbarStyle)style {
	self = [super init];
	if (self) {
		_arrayOfTitles = [NSMutableArray arrayWithArray:titlesInput];
		_arrayOfButtons =  [@[] mutableCopy];
		NSMutableDictionary *dictionaryOfKeys = [@{}
		                                         mutableCopy];
		self.frame = CGRectMake(0, 0, vcWidth, buttonHeight + indicatorHeight);
		[dictionaryOfKeys setValuesForKeysWithDictionary:dictionaryOfAttributes];
        
		if (style == MWContainerTopbarFitAllWidth)
			[dictionaryOfKeys setValue:@(vcWidth / [_arrayOfTitles count]) forKey:kButtonWidth];
        
		else
			[dictionaryOfKeys setValue:@(buttonWidth) forKey:kButtonWidth];
		[self initTopBar:dictionaryOfKeys];
	}
	return self;
}

// Setup methods
- (void)initTopBar:(NSDictionary *)dict {
	self.containerScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, vcWidth, buttonHeight + indicatorHeight)];
    buttonWidth=[dict[kButtonWidth] floatValue];
    
	_indicatorLine = [[MWTopbarIndicator alloc]initWithColor:dict[kIndicatorColor]];
    
	int i = 0;
	[self addSubview:self.containerScrollView];
    
    
	for (NSString *title in _arrayOfTitles) {
		MWTopbarButton *topBarButton = [[MWTopbarButton alloc]initWithTitle:title];
		// as an ID
		topBarButton.tag = i;
        
		topBarButton.frame = CGRectMake((i * topBarButton.frame.size.width) + (buttonMargin * i), 0,buttonWidth, topBarButton.frame.size.height);
		i++;
		[topBarButton setTopBarDelegate:self];
        
		// for easier referencing
		[_arrayOfButtons addObject:topBarButton];
		[self.containerScrollView addSubview:topBarButton];
	}
	// Now set the first button to be selected
	[[_arrayOfButtons firstObject] setIsSelected:YES];
	self.selectedButton = [_arrayOfButtons firstObject];
    
	_indicatorLine.frame = CGRectMake(0, buttonHeight, buttonWidth, indicatorHeight);
    
	[self.containerScrollView addSubview:_indicatorLine];
	[self.containerScrollView setUserInteractionEnabled:YES];
	[self.containerScrollView setContentSize:CGSizeMake([_arrayOfTitles count] * (buttonWidth + buttonMargin), (buttonHeight + indicatorHeight))];
	self.containerScrollView.showsHorizontalScrollIndicator = NO;
	[self setUserInteractionEnabled:YES];
}

#pragma mark - Delegate Methods -

// In the topbar delegate methods the buttoon changes is handled here and passed to the parent view controller , override here if there is a need to handle each button differently
- (void)didSelectItem:(MWTopbarButton *)buttonPressed {
	// Check if it is the current one or not
    
	if ([buttonPressed isEqual:self.selectedButton]) {
		return;
	}
	[self.selectedButton setIsSelected:FALSE];
	self.selectedButton = buttonPressed;
	// find the index
	// done through this method in order to adapt to future changes after adding drag and drop functionalities
	NSInteger indexToMoveTo = [_arrayOfButtons indexOfObjectIdenticalTo:buttonPressed];
    
	[buttonPressed setIsSelected:YES];
	[self.containerDelegate didSelectVCAtIndex:indexToMoveTo];
	[self moveIndicatorToPoint:[[_arrayOfButtons objectAtIndex:indexToMoveTo] center]];
}

- (void)moveIndicatorToPoint:(CGPoint)centerPoint {
    // moving the indicator with the selected animation to its new position
	[UIView animateWithDuration:indicatorAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:
	 ^{
         _indicatorLine.center = CGPointMake(centerPoint.x, _indicatorLine.center.y);
     }
     
	                 completion:nil];
}

@end
