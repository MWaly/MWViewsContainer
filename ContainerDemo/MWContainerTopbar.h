//
//  MWContainerTopbar.h
//  Resume
//
//  Created by Mohamed Mokhles Waly on 2/25/14.
//  Copyright (c) 2014 Mokh. All rights reserved.
//

@import UIKit;




#import "MWContainerProtocol.h"
#import "MWContainerTopbarProtocol.h"


typedef enum {
    MWContainerTopbarFixedWidth =0, //  Default Style where buttons have equal widths and scrollable if needed
    MWContainerTopbarFitAllWidth =1, // The top bar will fill all the width and won't be scrollable
    MWContainerTopbarVariableWidth =2 // The top bar buttons will have variable width defined when initiated and scrollable if needed
} MWContainerTopbarStyle;




@interface MWContainerTopbar : UIView <MWContainerTopbarProtocol>

/**
 *  Initilisation Options
 */
- (MWContainerTopbar*)initTopbarWithTitles:(NSArray*)titlesInput andAttributes:(NSDictionary*)dictionaryOfAttributes;
- (MWContainerTopbar*)initTopbarWithTitles:(NSArray*)titlesInput andAttributes:(NSDictionary*)dictionaryOfAttributes  style:(MWContainerTopbarStyle)style;
@property (nonatomic, strong) id <MWContainerProtocol> containerDelegate;

@end
