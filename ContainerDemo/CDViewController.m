//
//  CDViewController.m
//  ContainerDemo
//
//  Created by Mohamed Mokhles Waly on 3/11/14.
//  Copyright (c) 2014 Mokhles. All rights reserved.
//

#import "CDViewController.h"
#import "MWVcsContainer.h"
#import "MWContainerConstants.h"

@interface CDViewController ()

@end

@implementation CDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    // Create a uiview to embed on it
    
    UIView *containerView=[[UIView alloc]initWithFrame:CGRectMake(0,20, self.view.frame.size.width, self.view.frame.size.height-20)];
    [self.view addSubview:containerView];
    
    // Create three dummy view controllers for demo purposes , make sure to have titles set for them
    
    UIViewController *vc=[[UIViewController alloc]init];
    vc.view.backgroundColor=[UIColor grayColor];\
    vc.title=@"VC 1";
    UIViewController *vc2=[[UIViewController alloc]init];
     vc2.view.backgroundColor=[UIColor greenColor];
    vc2.title=@"VC 2";
    UIViewController *vc3=[[UIViewController alloc]init];
     vc3.view.backgroundColor=[UIColor blueColor];
    vc3.title=@"VC 3";
        
    MWVcsContainer *containerViews=[[MWVcsContainer alloc]initWithObjects:@[vc,vc2,vc3] andAttributes:@{kVcWidth:@(MWContainerFitAllSpace)} style:MWContainerFitAllSpace];
    [self addChildViewController:containerViews];

    [containerView addSubview:containerViews.view];
    [containerViews didMoveToParentViewController:self];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
