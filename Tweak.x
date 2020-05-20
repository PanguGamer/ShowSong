#import "MediaRemote/MediaRemote.h"
#import "UIKit/UIKit.h"
#import "MusicViewController.h"

%hook SpringBoard

    static MusicViewController *musicWindow = nil;

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
            NSString *artist = [infoDict objectForKey:@"kMRMediaRemoteNowPlayingInfoArtist"];
            NSString *album = [infoDict objectForKey:@"kMRMediaRemoteNowPlayingInfoAlbum"];
            NSData *imageData = [infoDict objectForKey:@"kMRMediaRemoteNowPlayingInfoArtworkData"];
            UIImage *image = [UIImage imageWithData:imageData];

            musicWindow.songLabel.text = song;
            musicWindow.artistLabel.text = artist;
            musicWindow.albumLabel.text = album;
            musicWindow.albumImage.image = image;
        });
    }

%end
