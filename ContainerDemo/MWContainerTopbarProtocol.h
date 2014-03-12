//
//  MWContainerTopbarProtocol.h
//  Resume
//
//  Created by Mohamed Mokhles Waly on 2/25/14.
//  Copyright (c) 2014 Mokh. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MWTopbarButton;

@protocol MWContainerTopbarProtocol <NSObject>
@required
- (void)didSelectItem:(MWTopbarButton *)button;

@end
