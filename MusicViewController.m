#import "MusicViewController.h"

@implementation MusicViewController

- (id)init {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;

    self = [super initWithFrame:CGRectMake(10, 10, width - 20, 80)];

    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.windowLevel = UIWindowLevelStatusBar + 1000;
        self.layer.cornerRadius = 10;
        [self makeKeyAndVisible];

        songLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, width - 70, 20)];
        songLabel.textColor = [UIColor blackColor];
        songLabel.text = @"Song Title";
        songLabel.font = [UIFont fontWithName:@"San Francisco" size:(20.0)];
        songLabel.clipsToBounds = YES;
        [self addSubview:songLabel];
    }

    return self;
}

@end
