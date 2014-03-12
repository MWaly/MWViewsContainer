//
//  MWVcsContainer.h
//  Resume
//
//  Created by Mohamed Mokhles Waly on 2/25/14.
//  Copyright (c) 2014 Mokh. All rights reserved.
//

@import UIKit;
#import "MWContainerProtocol.h"


@class MWContainerTopbar;

typedef enum {
	MWContainerFixedVariables = 0, //  Default Style where width and height are defined from the constants file
	MWContainerFitAllSpace = 1, // The VC will fill all the space and won't be scrollable
} MWVCContainerStyle;




@interface MWVcsContainer : UIViewController <MWContainerProtocol, UINavigationControllerDelegate>


/**
 *  Simple Initiliazer with all values derived from the constants file
 *
 *  @param arrayOfVCs input VCs
 *
 *  @return Navigation Controller with root view controller of the first element in the array
 */

- (instancetype)initWithObjects:(NSArray *)arrayOfVCs;

/**
 *  Initiliazer with custom values for button sizes
 *
 *  @param arrayOfVCs   input VCs
 *  @param buttonSubsize other button size than that of the defined constants
 *
 *  @return Navigation Controller with root view controller of the first element in the array
 */
- (instancetype)initWithObjects:(NSArray *)arrayOfVCs withButtonSize:(CGSize)buttonSubsize;


/**
 *  Initiliazer with custom values for embedded viewcontroller sizes
 *
 *  @param arrayOfVCs input VCs
 *  @param vcSubsize  other viewcontroller size than that of the defined constants
 *
 *  @return Navigation Controller with root view controller of the first element in the array
 */
- (instancetype)initWithObjects:(NSArray *)arrayOfVCs withVCSize:(CGSize)vcSubsize;

/**
 *  Initiliazer with custom values for embedded viewcontroller sizes , different colors for buttons in different states
 *
 *  @param arrayOfVCs    input VCs
 *  @param vcSubsize     other viewcontroller size than that of the defined constants
 *  @param color         Button BackgroundActiveColor
 *  @param inactiveColor Button BackgroundInActiveColor
 *
 *  @return Navigation Controller with root view controller of the first element in the array
 */
- (instancetype)initWithObjects:(NSArray *)arrayOfVCs withVCSize:(CGSize)vcSubsize backgroundActiveColor:(UIColor *)color backgroundInactivecolor:(UIColor *)inactiveColor;


/**
 *  Initiliazer with all values derived from the constants file if not fond in the dictionary of attributes , this is the preferred one
 *
 *  @param arrayOfVCs input VCs
 *  @param attributes attributesDictionary with keys defined from constants file
 *  @param style is the VC style to be of variable size or to fit all available space
 *
 *  @return Navigation Controller with root view controller of the first element in the array
 */

- (instancetype)initWithObjects:(NSArray *)arrayOfVCs andAttributes:(NSDictionary *)attributes style:(MWVCContainerStyle)style;

// read only property for top bar in case inspection of a certain attribute is needed
@property (nonatomic, strong) MWContainerTopbar *topbar;

@end
