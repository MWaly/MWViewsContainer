MWViewsContainer
================

Lightweight Views container with top bar options 


To create 

import #"MWVCContainers"

Then init an instance of it with an array Of View controllers passed with custom attributes dictionary and desired style (Fixed size or to fit to the embedded view area)

e.g. 
 
MWVcsContainer *containerController=[[MWVcsContainer alloc]initWithObjects:@[vc,vc2,vc3] andAttributes:@{kVcWidth:@(MWContainerFitAllSpace)} style:MWContainerFitAllSpace];
 [self addChildViewController:containerController];

[containerView addSubview:containerController.view];
[containerController didMoveToParentViewController:self];



you can edit many attributes for top bar buttons , colors , indicators in the MWContainerConstants file or just pass the new values when initializing through the attributes dicionary , keys can be found in the ocnstants file.

N.B. This is the alpha version , stay tuned for more features soon.

