#import "TCSlideView.h"
#import "TCChatViewController.h"

@implementation TCSlideView

@synthesize adjustY;
@synthesize adjustX;
@synthesize imageSize;
@synthesize type;


//实例化视图并设置其下面的层的contents属性指向UIImage。视图的位置设置为屏幕之外
+ (id)viewWithImage:(UIImage *)SlideInImage {
	
   TCSlideView *SlideIn = [[TCSlideView alloc] init];
   SlideIn.imageSize = SlideInImage.size;
   SlideIn.layer.bounds = CGRectMake(0, 0, SlideIn.imageSize.width,
                                           SlideIn.imageSize.height);
   SlideIn.layer.anchorPoint = CGPointMake(0, 0);
   SlideIn.layer.position = CGPointMake(-SlideIn.imageSize.width, 0);	
   SlideIn.layer.contents = (id)SlideInImage.CGImage;	
   return SlideIn;
}

- (void)showWithTimer:(CGFloat)timer inView:(UIView *)view 
				 from:(SlideInViewSide)side bounce:(BOOL)bounce {
	
    self.adjustX = 0;
    self.adjustY = 0;
    CGPoint fromPos;
    switch (side) {              
      case SlideInViewTop:
        self.adjustY = self.imageSize.height + 50;
        fromPos = CGPointMake(view.frame.size.width/2-self.imageSize.width/2,
                               -self.imageSize.height);
        break;
      case SlideInViewBot:
         self.adjustY = -self.imageSize.height - 50;
         fromPos = CGPointMake(view.frame.size.width/2-self.imageSize.width/2,
                               view.bounds.size.height);
         break;
      case SlideInViewLeft:
         self.adjustX = self.imageSize.width;
         fromPos = CGPointMake(-self.imageSize.width, 
                            view.frame.size.height/2-self.imageSize.height/2);
			break;
      case SlideInViewRight:
         self.adjustX = -self.imageSize.width;
         fromPos = CGPointMake(view.bounds.size.width, 
                            view.frame.size.height/2-self.imageSize.height/2);
      break;
      default:
         return;
	}
    
    self.type = side;
	
    if (bounce) {
        
        CGPoint toPos = fromPos;
        CGPoint bouncePos = fromPos;
        bouncePos.x += (adjustX*1.2);
        bouncePos.y += (adjustY*1.2);
        toPos.x += adjustX;
        toPos.y	+= adjustY;
		
        
        //bounce选项导致使用关键帧动画,添加必要的附加values与keyTimes,在适当方向上产生 轻微反弹的效果。
        CAKeyframeAnimation *keyFrame = [CAKeyframeAnimation 
                                         animationWithKeyPath:@"position"];
        keyFrame.values  =  [NSArray arrayWithObjects:
                            [NSValue valueWithCGPoint:fromPos],
                            [NSValue valueWithCGPoint:bouncePos],
                            [NSValue valueWithCGPoint:toPos],
                            [NSValue valueWithCGPoint:bouncePos],
                            [NSValue valueWithCGPoint:toPos],
                            nil];
        keyFrame.keyTimes = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:0],
                            [NSNumber numberWithFloat:.18],
                            [NSNumber numberWithFloat:.5],
                            [NSNumber numberWithFloat:.75],
                            [NSNumber numberWithFloat:1],
                            nil];
		
        keyFrame.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        keyFrame.duration = .75;          
        self.layer.position = toPos;      //设置模型层，确保最终位置正确
        
        [self.layer addAnimation:keyFrame forKey:@"keyFrame"];
        
    } else {                              
        
        CGPoint toPos = fromPos;
        toPos.x += adjustX;
        toPos.y	+= adjustY;
        
        //如果bounce选项设为NO,我们对层应用较简单的CABasicAnimation,实现到指定位置的滑动。
        CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"position"];
        basic.fromValue = [NSValue valueWithCGPoint:fromPos];
        basic.toValue = [NSValue valueWithCGPoint:toPos];
        self.layer.position = toPos;
        [self.layer addAnimation:basic forKey:@"basic"];		
	}

	
    [view addSubview:self];
}


-(void)popIn {
	[UIView beginAnimations:@"slideIn" context:nil];
	self.frame = CGRectOffset(self.frame, -adjustX, -adjustY);
	[UIView commitAnimations];
		
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.type != SlideInViewRight) {
        //点击后移除
        [self popIn];
    }
    
    [self.delegate shiftTo:self.tvc];
}



@end




