#import "MusicViewController.h"

@implementation MusicViewController

    - (id)init {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;

        self = [super initWithFrame:CGRectMake(10, 10, width - 20, 110)];

        if (self) {
            self.backgroundColor = [UIColor whiteColor];
            self.windowLevel = UIWindowLevelStatusBar + 1000;
            self.clipsToBounds = YES;
            self.translatesAutoresizingMaskIntoConstraints = NO;
            self.layer.cornerRadius = 10;
            [self makeKeyAndVisible];

            _songLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 10, width - 110, 20)];
            _songLabel.textColor = [UIColor blackColor];
            _songLabel.font = [UIFont fontWithName:@"San Francisco" size:(20.0)];
            _songLabel.clipsToBounds = YES;
            [self addSubview: _songLabel];

            _artistLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 45, width - 110, 20)];
            _artistLabel.textColor = [UIColor blackColor];
            _artistLabel.font = [UIFont fontWithName:@"San Francisco" size:(15.0)];
            _artistLabel.clipsToBounds = YES;
            [self addSubview: _artistLabel];

            _albumLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 80, width - 110, 20)];
            _albumLabel.textColor = [UIColor blackColor];
            _albumLabel.font = [UIFont fontWithName:@"San Francisco" size:(15.0)];
            _albumLabel.clipsToBounds = YES;
            [self addSubview: _albumLabel];

            _albumImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 90, 90)];
            _albumImage.clipsToBounds = YES;
            _albumImage.layer.cornerRadius = 10;
            [self addSubview: _albumImage];
        }

        return self;
    }

@end
