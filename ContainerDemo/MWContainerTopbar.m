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

@property (nonatomic,strong)NSMutableArray* arrayOfButtons;
@property (nonatomic,strong)NSMutableArray* arrayOfTitles;
@property (nonatomic,strong)MWTopbarIndicator* indicatorLine;
@property (nonatomic,strong)UIScrollView *containerScrollView;
@property (nonatomic,strong)MWTopbarButton *selectedButton;
@end

@implementation MWContainerTopbar

- (MWContainerTopbar*)initTopbarWithTitles:(NSArray*)titlesInput andAttributes:(NSDictionary*)dictionaryOfAttributes
{
    self = [super init];
    if (self) {
        _arrayOfTitles=[NSMutableArray arrayWithArray:titlesInput];
        _arrayOfButtons=  [@[] mutableCopy];
        [self initTopBar:dictionaryOfAttributes];
    
    }
    return self;
}

- (MWContainerTopbar*)initTopbarWithTitles:(NSArray*)titlesInput andAttributes:(NSDictionary*)dictionaryOfAttributes  style:(MWContainerTopbarStyle)style
{
    self = [super init];
    if (self) {
        _arrayOfTitles=[NSMutableArray arrayWithArray:titlesInput];
        _arrayOfButtons=  [@[] mutableCopy];
        NSMutableDictionary *dictionaryOfKeys=[@{} mutableCopy];
        [dictionaryOfKeys setValuesForKeysWithDictionary:dictionaryOfAttributes];
        
        if (style==MWContainerTopbarFitAllWidth)
           [dictionaryOfKeys setValue:@(vcWidth/[_arrayOfTitles count]) forKey:kButtonWidth];
        
        else
            [dictionaryOfKeys setValue:@(buttonWidth) forKey:kButtonWidth];
        [self initTopBar:dictionaryOfKeys];
        
    }
    return self;
}

- (void)initTopBar:(NSDictionary*)dict
{

    NSLog(@"The topbar delegate is %@",self.containerDelegate);
    self.containerScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, vcWidth, buttonHeight+indicatorHeight)];
    _indicatorLine=[[MWTopbarIndicator alloc]initWithColor:[UIColor yellowColor]];
    
    int i=0;
    [self addSubview:self.containerScrollView];
    
       
    for (NSString* title in _arrayOfTitles)
    {
   
        MWTopbarButton* topBarButton=[[MWTopbarButton alloc]initWithTitle:title];
        // as an ID
        topBarButton.tag=i;
      
        topBarButton.frame=CGRectMake((i*topBarButton.frame.size.width)+(buttonMargin*i), 0, topBarButton.frame.size.width, topBarButton.frame.size.height);
          i++;
        [topBarButton setTopBarDelegate:self];
        
        // for easier referencing
        [_arrayOfButtons addObject:topBarButton];
        [self.containerScrollView addSubview:topBarButton];
    
    }
    // Now set the first button to be selected
    [[_arrayOfButtons firstObject] setIsSelected:YES];
    self.selectedButton=[_arrayOfButtons firstObject] ;
    
    _indicatorLine.frame=CGRectMake(0, buttonHeight, buttonWidth, indicatorHeight);
    
    [self.containerScrollView addSubview:_indicatorLine];
    [self.containerScrollView setUserInteractionEnabled:YES];
    [self.containerScrollView setContentSize:CGSizeMake([_arrayOfTitles count]*(buttonWidth+buttonMargin), (buttonHeight+indicatorHeight))];
    self.containerScrollView.showsHorizontalScrollIndicator=NO;
    [self setUserInteractionEnabled:YES];
   
  
}

#pragma mark - Delegate Methods - 

- (void)didSelectItem:(MWTopbarButton*)buttonPressed
{
    // Check if it is the current one or not
    
    if ([buttonPressed isEqual:self.selectedButton]) {
        return;
    }
    [self.selectedButton setIsSelected:FALSE];
    self.selectedButton=buttonPressed;
    // find the index
    // done through this method in order to adapt to future changes after adding drag and drop functionalities
    NSInteger indexToMoveTo=[_arrayOfButtons indexOfObjectIdenticalTo:buttonPressed];
    ;
 
    [buttonPressed  setIsSelected:YES];
    [self.containerDelegate didSelectVCAtIndex:indexToMoveTo];
    [self moveIndicatorToPoint:[[_arrayOfButtons objectAtIndex:indexToMoveTo] center]];

    
}

- (void) moveIndicatorToPoint:(CGPoint)centerPoint
{

// moving the indicator with the selected animation to its new position
    [UIView animateWithDuration:indicatorAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:
     ^{
         _indicatorLine.center=CGPointMake(centerPoint.x,_indicatorLine.center.y);
         
       
    }
    completion:^(BOOL finished)
     {
        // calling the delegate here to inform of finishing the move
        
    }];
   
}



@end
