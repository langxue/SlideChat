#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum {	
	SlideInViewTop,
	SlideInViewBot, 
	SlideInViewLeft, 
	SlideInViewRight, 
} SlideInViewSide;

@interface TCSlideView : UIView 

@property CGFloat adjustY;
@property CGFloat adjustX;
@property CGSize imageSize;

+ (id)viewWithImage:(UIImage *)SlideInImage;

- (void)showWithTimer:(CGFloat)timer inView:(UIView *)view from:(SlideInViewSide)side bounce:(BOOL)bounce;

@end





