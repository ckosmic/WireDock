#import <libcolorpicker.h>

@interface SBDockView : UIView
    @property (nonatomic,retain) UIView * backgroundView;
@end

@interface MTMaterialLayer : CALayer
    @property (copy) NSString * name;
    -(void)setFilters:(NSArray *)arg1;
@end

static NSString *const prefsBundlePath = @"/var/mobile/Library/Preferences/com.ckosmic.wiredockprefs.plist";
static NSString *wireColor;
static double wireWidth;
// Reference to the dock's background view
static UIView *dockBGView;

static void applySettings() {
    if(dockBGView != nil) {
        dockBGView.layer.borderColor = LCPParseColorString(wireColor, @"#ffffff").CGColor;
        dockBGView.layer.borderWidth = wireWidth;
    }
}

static void refreshPrefs() {
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:prefsBundlePath];
    wireColor = [prefs objectForKey:@"wireColor"];
    wireWidth = [[prefs objectForKey:@"wireWidth"] doubleValue];
    
    applySettings();
}

%hook SBDockView 
-(void)setBackgroundView:(UIView *)view {
    dockBGView = view;
    
    applySettings();
    [view.layer setName:@"wiredock"];
    %orig;
}
%end

%hook MTMaterialLayer
// This override removes the default gray dock by removing its image filters
-(void)setFilters:(NSArray *)arg1 {
    if([[self name] isEqualToString:@"wiredock"]) 
        %orig(nil);
    else
        %orig;
}
%end

%ctor {
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)refreshPrefs, CFSTR("com.ckosmic.wiredockprefs.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    wireWidth = 1;
	refreshPrefs();
}
