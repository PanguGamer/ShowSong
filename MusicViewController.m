#import "MusicViewController.h"

@implementation MusicViewController

- (id)init {
    self = [super initWithFrame:CGRectMake(10, 10, 200, 50)];

    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.windowLevel = UIWindowLevelStatusBar + 10000;
        self.hidden = NO;
        self.layer.cornerRadius = 10;

        songLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 30, 10)];

    }

    return self;
}

@end
