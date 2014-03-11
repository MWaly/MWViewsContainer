//
//  MWTopbarIndicator.m
//  Resume
//
//  Created by Mohamed Mokhles Waly on 2/26/14.
//  Copyright (c) 2014 Mokh. All rights reserved.
//

#import "MWTopbarIndicator.h"
#import "MWContainerConstants.h"

@interface MWTopbarIndicator ()

// private properties
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIImage *image;

// set yes to indicate if it is of image property
@property (nonatomic, assign) BOOL isImage;
@end

@implementation MWTopbarIndicator

#pragma mark - Initilaztion -
// designated initalizer
- (instancetype)initWithFrame:(CGRect)frame withColor:(UIColor*)color orImage:(UIImage*)image
{
    self = [super initWithFrame:frame];
    if (self)
    {
        if (color!=nil)
        {
            _isImage=FALSE;
            self.color=color;
        }
        else
        {
            _isImage=YES;
            self.image=image;
        }
    }
    return self;
}

- (instancetype) initWithImage:(UIImage*)indicatorImage
{
    return [self initWithFrame:CGRectMake(0, 0, vcWidth, indicatorHeight) withColor:nil orImage:indicatorImage];
}
- (instancetype) initWithImage:(UIImage*)indicatorImage andHeight:(CGFloat)height
{
    return [self initWithFrame:CGRectMake(0, 0, vcWidth, height) withColor:nil orImage:indicatorImage];
}
- (instancetype) initWithColor:(UIColor*)indicatorColor
{
    return [self initWithFrame:CGRectMake(0, 0, vcWidth, indicatorHeight) withColor:indicatorColor orImage:nil];
}
- (instancetype) initWithColor:(UIColor*)indicatorColor andHeight:(CGFloat)height
{
    return [self initWithFrame:CGRectMake(0, 0, vcWidth, height) withColor:indicatorColor orImage:nil];
}

#pragma mark - Filling the indicator - 

- (void)drawRect:(CGRect)rect
{
    
    
    // checking if image type or of color type
    if (_isImage)
    {
        UIImageView *imageview=[[UIImageView alloc]initWithFrame:rect];
        imageview.image=self.image;
        [self addSubview:imageview];
        
    }
    else
    {
    CGContextRef context = UIGraphicsGetCurrentContext ();
    CGContextSetFillColorWithColor(context, _color.CGColor);
    CGContextFillRect (context, self.bounds);
    }
    
}
#pragma mark - Debugging purposes -


- (NSString *)description
{
return [NSString stringWithFormat:@"Top bar indicator with color %@ and image %@",self.color , self.image];
}

@end
