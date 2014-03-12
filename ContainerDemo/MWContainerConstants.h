//
//  MWContainerConstants.h
//  Resume
//
//  Created by Mohamed Mokhles Waly on 2/25/14.
//  Copyright (c) 2014 Mokh. All rights reserved.
//
/**
 *  The class contains constants to be used as a default for container view
 */

#import <Foundation/Foundation.h>

@interface MWContainerConstants : NSObject


// Buttons
extern CGFloat buttonWidth;
extern CGFloat buttonHeight;
extern CGFloat buttonMargin;
extern CGFloat buttonFontSize;

extern UIColor *buttonBackgroundActive;
extern UIColor *buttonBackgroundInActive;

extern UIColor *buttonFontColorActive;
extern UIColor *buttonFontColorInActive;

// indicator
extern CGFloat const indicatorHeight;
extern CGFloat const indicatorAnimationDuration;
extern UIColor *indicatorColor;
extern NSString *const kIndicatorColor;

// VC's
extern CGFloat vcWidth;   // Not constants as they can be changed
extern CGFloat vcHeight;
extern CGFloat vcWidthMargin;
extern CGFloat vcHeightMargin;
// VC's keys

extern NSString *const kVcWidth;
extern NSString *const kVcHeight;
extern NSString *const kVcWidthMargin;
extern NSString *const kVcHeightMargin;

// Button Keys

extern NSString *const kButtonWidth;
extern NSString *const kButtonHeight;
extern NSString *const kButtonMargin;
extern NSString *const kButtonBackgroundActiveColor;
extern NSString *const kButtonBackgroundInactiveColor;
extern NSString *const kButtonFontColorActive;
extern NSString *const kButtonFontColorInActive;
extern NSString *const kButtonFontSize;

// Top bar keys
extern NSString *const kTopbarStyle;


@end
