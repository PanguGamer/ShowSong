#import <UIKit/UIKit.h>

@interface MusicViewController: UIWindow <UIApplicationDelegate> {

}

@property UILabel *songLabel;
@property UILabel *artistLabel;
@property UILabel *albumLabel;
@property UIImageView *albumImage;

@property NSLayoutConstraint *yPosConstraint;

@end
