#line 1 "Tweak.x"
#import "MediaRemote/MediaRemote.h"
#import "UIKit/UIKit.h"
#import "MusicViewController.h"


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SpringBoard; 
static void (*_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$trackDidChange(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL); 

#line 5 "Tweak.x"


    static MusicViewController *musicWindow = nil;

    static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

        musicWindow = [[MusicViewController alloc] init];

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(trackDidChange) name:(__bridge NSString *)kMRMediaRemoteNowPlayingInfoDidChangeNotification object:nil];

        _logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$(self, _cmd, arg1);
    }

    

    static void _logos_method$_ungrouped$SpringBoard$trackDidChange(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        dispatch_time_t notifDone = dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC);

        MRMediaRemoteGetNowPlayingInfo(dispatch_get_main_queue(), ^(CFDictionaryRef information) {
            NSDictionary *infoDict = (__bridge NSDictionary*)information;

            NSString *song = [infoDict objectForKey:@"kMRMediaRemoteNowPlayingInfoTitle"];
            NSString *artist = [infoDict objectForKey:@"kMRMediaRemoteNowPlayingInfoArtist"];
            NSString *album = [infoDict objectForKey:@"kMRMediaRemoteNowPlayingInfoAlbum"];

            musicWindow.songLabel.text = song;
            musicWindow.artistLabel.text = artist;
            musicWindow.albumLabel.text = album;
        });

        [UIView animateWithDuration:1 animations:^{
            musicWindow.frame = CGRectMake(10, 10, width - 20, 110);
        }];
        dispatch_after(notifDone, dispatch_get_main_queue(), ^(void){
            [UIView animateWithDuration:1 animations:^{
                musicWindow.frame = CGRectMake(10, -120, width - 20, 110);
            }];
        });

    }


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$_ungrouped$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(trackDidChange), (IMP)&_logos_method$_ungrouped$SpringBoard$trackDidChange, _typeEncoding); }} }
#line 48 "Tweak.x"
