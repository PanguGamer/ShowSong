#import "MediaRemote/MediaRemote.h"
#import "UIKit/UIKit.h"
#import "MusicViewController.h"

static MusicViewController *musicWindow = nil;

%hook SpringBoard

    UILabel *songLabel;

    - (void)applicationDidFinishLaunching:(id)arg1 {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(trackDidChange) name:(__bridge NSString *)kMRMediaRemoteNowPlayingInfoDidChangeNotification object:nil];

        %orig;
    }

    %new

    - (void)trackDidChange {
        MRMediaRemoteGetNowPlayingInfo(dispatch_get_main_queue(), ^(CFDictionaryRef information) {
            NSDictionary *infoDict = (__bridge NSDictionary*)information;
            NSString *name = [infoDict objectForKey:@"kMRMediaRemoteNowPlayingInfoTitle"];
            NSLog(@"Song: %@",name);

        });
    }

%end

%hook SBUIController
    -(void)finishLaunching{
        musicWindow = [[MusicViewController alloc] init];
        
        %orig;
    }
%end
