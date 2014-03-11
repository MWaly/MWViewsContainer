//
//  MWContainerConstants.m
//  Resume
//
//  Created by Mohamed Mokhles Waly on 2/25/14.
//  Copyright (c) 2014 Mokh. All rights reserved.
//

#import "MWContainerConstants.h"

@implementation MWContainerConstants

#pragma mark - Button Related Defaults

CGFloat buttonWidth=90;
CGFloat buttonHeight=60;
CGFloat buttonMargin=2;
CGFloat buttonFontSize=20;

// To be set in runtime
UIColor*  buttonBackgroundActive=nil ;
UIColor*  buttonBackgroundInActive=nil;

UIColor*  buttonFontColorActive=nil;
UIColor*  buttonFontColorInActive=nil;

#pragma mark - Button Keys
NSString* const kButtonWidth = @"kButtonWidth";
NSString* const kButtonHeight= @"kButtonHeight";
NSString* const kButtonMargin= @"kButtonMargin";
NSString* const kButtonBackgroundActiveColor= @"kButtonBackgroundActiveColor";
NSString* const kButtonBackgroundInactiveColor= @"kButtonBackgroundInactiveColor";
NSString* const kButtonFontColorActive=@"kButtonFontColorActive";
NSString* const kButtonFontColorInActive=@"kButtonFontColorInActive";
NSString* const kButtonFontSize=@"kButtonFontSize";

#pragma mark - Indicator Related Defaults

CGFloat const indicatorHeight=7;
CGFloat const indicatorAnimationDuration=0.4;

#pragma mark - VC Related Defaults

// Change this defaults here 
CGFloat  vcWidth=900;  // Default values in case not changed in attribute dictionary during initilisation
CGFloat  vcHeight=500;

CGFloat  vcWidthMargin=5;
CGFloat  vcHeightMargin=5;

#pragma mark - VC Related Keys

NSString* const kVcWidth =@"kVcWidth";
NSString* const kVcHeight =@"kVcHeight";
NSString* const kVcWidthMargin =@"kVcWidthMargin";
NSString* const kVcHeightMargin =@"kVcHeightMargin";

#pragma mark - Topbar keys

// Top bar keys
NSString* const kTopbarStyle=@"kTopbarStyle";
@end
