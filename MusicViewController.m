#import "MusicViewController.h"

@implementation MusicViewController

- (id)init {
    self = [super initWithFrame:CGRectMake(10, 10, 200, 50)];

    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.windowLevel = UIWindowLevelStatusBar + 10000;
        self.hidden = NO;
        self.layer.cornerRadius = 10;

        songLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 30, 10)];
        songLabel.backgroundColor = [UIColor whiteColor];
        songLabel.textColor = [UIColor blackColor];
        songLabel.textColor = [UIColor whiteColor];
        songLabel.text = [NSString stringWithFormat: @"SONG TEST TEST"];
        songLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(36.0)];
        songLabel.clipsToBounds = YES;
        [self addSubview:songLabel];
    }

    return self;
}

@end
