#import "MediaRemote/MediaRemote.h"
#import "UIKit/UIKit.h"
#import "MusicViewController.h"

static MusicViewController *musicWindow = nil;

%hook SpringBoard
    - (void)applicationDidFinishLaunching:(id)arg1 {
        musicWindow = [[MusicViewController alloc] init];

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(trackDidChange) name:(__bridge NSString *)kMRMediaRemoteNowPlayingInfoDidChangeNotification object:nil];

        %orig;
    }

    %new

    - (void)trackDidChange {
        MRMediaRemoteGetNowPlayingInfo(dispatch_get_main_queue(), ^(CFDictionaryRef information) {
            NSDictionary *infoDict = (__bridge NSDictionary*)information;
            NSString *song = [infoDict objectForKey:@"kMRMediaRemoteNowPlayingInfoTitle"];
            NSLog(@"Song: %@", song);
        });
    }

%end
