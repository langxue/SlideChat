#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@class TCChatViewController;

typedef enum {	
	SlideInViewTop,
	SlideInViewBot, 
	SlideInViewLeft, 
	SlideInViewRight, 
} SlideInViewSide;

@protocol TCNavigateDelegate <NSObject>
@optional
- (void)ShiftTo:(UIViewController *)vc;
@end


@interface TCSlideView : UIView 

@property CGFloat adjustY;
@property CGFloat adjustX;
@property CGSize imageSize;
@property (nonatomic, weak) id<TCNavigateDelegate> delegate;
@property (nonatomic, strong) TCChatViewController *tvc;

+ (id)viewWithImage:(UIImage *)SlideInImage;

- (void)showWithTimer:(CGFloat)timer inView:(UIView *)view from:(SlideInViewSide)side bounce:(BOOL)bounce;



@end





