//
//  MWContainerProtocol.h
//  Resume
//
//  Created by Mohamed Mokhles Waly on 2/25/14.
//  Copyright (c) 2014 Mokh. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MWContainerProtocol <NSObject>


@required

/**
 *  <#Description#>
 *
 *  @param index <#index description#>
 */
- (void)didSelectVCAtIndex:(NSInteger)index;

@optional
/**
 *  Sorting the VC's manually through drag and drop
 */
- (void)didMoveItemAtIndex:(NSInteger)source toIndex:(NSInteger)destination;
@end
