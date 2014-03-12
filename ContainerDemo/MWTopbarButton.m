//
//  MWTopbarButton.m
//  Resume
//
//  Created by Mohamed Mokhles Waly on 2/25/14.
//  Copyright (c) 2014 Mokh. All rights reserved.
//

#import "MWTopbarButton.h"
#import "MWContainerConstants.h"

@interface MWTopbarButton ()

//private
- (instancetype)initWithTitle:(NSString *)titleText fontColorActive:(UIColor *)fontColor fontColorInActive:(UIColor *)fontColorInActive backgroundInactive:(UIColor *)backgroundColorInactive backgroundColorActive:(UIColor *)backgroundColorActive width:(CGFloat)width height:(CGFloat)height;
- (void)didTap;
- (void)changeMode:(BOOL)selected;
@property (nonatomic, readwrite) UIColor *backgroundColorInActive;
@property (nonatomic, readwrite) UIColor *backgroundColorActive;
@property (nonatomic, readwrite, assign) NSInteger width;
@property (nonatomic, readwrite, assign) NSInteger height;
@property (readwrite, nonatomic) UIColor *fontColorActive;
@property (readwrite, nonatomic) UIColor *fontColorInActive;
@property (readwrite, nonatomic) UIButton *backgroundButton;
@property (readwrite, nonatomic) UILabel *textLabel;
@end


@implementation MWTopbarButton


#pragma mark - Initiliazers -

// designated
- (instancetype)initWithTitle:(NSString *)titleText fontColorActive:(UIColor *)fontColor fontColorInActive:(UIColor *)fontColorInActive backgroundInactive:(UIColor *)backgroundColorInactive backgroundColorActive:(UIColor *)backgroundColorActive width:(CGFloat)width height:(CGFloat)height {
	self = [super initWithFrame:CGRectMake(0, 0, width, height)];
	if (self) {
		self.titleText = titleText;
		self.width = width;
		self.height = height;
		self.fontColorActive = fontColor;
		self.fontColorInActive = fontColorInActive;
		self.backgroundColorActive = backgroundColorActive;
		self.backgroundColorInActive = backgroundColorInactive;
		self.itemIdentfier = self.tag;
		[self setBackgroundColor:self.backgroundColorInActive];
        
		self.backgroundButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
		[self.backgroundButton setFrame:self.frame];
		self.textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.width, 30)];
		[self.textLabel setTextColor:self.fontColorInActive];
        
		self.textLabel.text = titleText;
		self.textLabel.textAlignment = NSTextAlignmentCenter;
		self.textLabel.center = self.center;
		[self addSubview:self.textLabel];
		[self.backgroundButton addTarget:self action:@selector(didTap) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:self.backgroundButton];
		[self addObserver:self forKeyPath:@"isSelected" options:0 context:nil];
	}
	return self;
}

// custom and public
- (instancetype)initWithTitle:(NSString *)titleText fontColorActive:(UIColor *)fontColor fontColorInActive:(UIColor *)fontColorInActive backgroundInactive:(UIColor *)backgroundColorInactive backgroundColorActive:(UIColor *)backgroundColorActive {
	return [self initWithTitle:titleText fontColorActive:fontColor fontColorInActive:fontColorInActive backgroundInactive:backgroundColorInactive backgroundColorActive:backgroundColorInactive width:buttonWidth height:buttonHeight];
}

- (instancetype)initWithTitle:(NSString *)titleText fontColorActive:(UIColor *)fontColor fontColorInActive:(UIColor *)fontColorInActive backgroundColor:(UIColor *)backgroundColor {
	return [self initWithTitle:titleText fontColorActive:fontColor fontColorInActive:fontColorInActive backgroundInactive:backgroundColor backgroundColorActive:backgroundColor width:buttonWidth height:buttonHeight];
}

- (instancetype)initWithTitle:(NSString *)titleText fontColor:(UIColor *)fontColor backgroundColor:(UIColor *)backgroundColor {
	return [self initWithTitle:titleText fontColorActive:fontColor fontColorInActive:fontColor backgroundInactive:backgroundColor backgroundColorActive:backgroundColor width:buttonWidth height:buttonHeight];
}

- (instancetype)initWithTitle:(NSString *)titleText {
	return [self initWithTitle:titleText fontColorActive:buttonFontColorActive fontColorInActive:buttonFontColorInActive backgroundInactive:buttonBackgroundInActive backgroundColorActive:buttonBackgroundActive width:buttonWidth height:buttonHeight];
}

#pragma mark- Debugging Purposes -

- (NSString *)description {
	return [NSString stringWithFormat:@"<%@: %p, \" %li\">",
	        [self class], self.titleText, (long)self.itemIdentfier];
}

// For object identfier uniqeniess
- (NSUInteger)hash {
	NSString *stringToHash =
    [NSString stringWithFormat:@"%@:%li",
     self.titleText, (long)self.itemIdentfier];
	return [stringToHash hash];
}

- (BOOL)isEqual:(id)object {
	if ([object isKindOfClass:[MWTopbarButton class]]) {
		if ([(MWTopbarButton *)object hash] == [self hash]) {
			return true;
		}
		else
			return false;
	}
	else
		return false;
}

#pragma mark - Gesture Recgonizer -

- (void)didTap {
	// Notifying the delegate with the selection
	[_topBarDelegate didSelectItem:self];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	if ([keyPath isEqualToString:@"isSelected"]) {
		[self changeMode:self.isSelected];
	}
}

- (void)changeMode:(BOOL)selected {
	if (selected) {
		[self.textLabel setTextColor:self.fontColorActive];
		[self setBackgroundColor:self.backgroundColorActive];
	}
	else {
		[self.textLabel setTextColor:self.fontColorInActive];
		[self setBackgroundColor:self.backgroundColorInActive];
	}
}

@end
