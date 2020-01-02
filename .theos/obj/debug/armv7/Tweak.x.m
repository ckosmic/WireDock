#line 1 "Tweak.x"
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

@class MTMaterialLayer; @class SBDockView; 
static void (*_logos_orig$_ungrouped$SBDockView$setBackgroundView$)(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL, UIView *); static void _logos_method$_ungrouped$SBDockView$setBackgroundView$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL, UIView *); static void (*_logos_orig$_ungrouped$MTMaterialLayer$setFilters$)(_LOGOS_SELF_TYPE_NORMAL MTMaterialLayer* _LOGOS_SELF_CONST, SEL, NSArray *); static void _logos_method$_ungrouped$MTMaterialLayer$setFilters$(_LOGOS_SELF_TYPE_NORMAL MTMaterialLayer* _LOGOS_SELF_CONST, SEL, NSArray *); 

#line 33 "Tweak.x"
 

static void _logos_method$_ungrouped$SBDockView$setBackgroundView$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIView * view) {
    dockBGView = view;
    
    
    
    applySettings();
    [view.layer setName:@"wiredock"];
    _logos_orig$_ungrouped$SBDockView$setBackgroundView$(self, _cmd, view);
}





static void _logos_method$_ungrouped$MTMaterialLayer$setFilters$(_LOGOS_SELF_TYPE_NORMAL MTMaterialLayer* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSArray * arg1) {
    if([[self name] isEqualToString:@"wiredock"]) 
        _logos_orig$_ungrouped$MTMaterialLayer$setFilters$(self, _cmd, nil);
    else
        _logos_orig$_ungrouped$MTMaterialLayer$setFilters$(self, _cmd, arg1);
}



static __attribute__((constructor)) void _logosLocalCtor_7c1b35e5(int __unused argc, char __unused **argv, char __unused **envp) {
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)refreshPrefs, CFSTR("com.ckosmic.wiredockprefs.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    wireWidth = 1;
	refreshPrefs();
}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBDockView = objc_getClass("SBDockView"); MSHookMessageEx(_logos_class$_ungrouped$SBDockView, @selector(setBackgroundView:), (IMP)&_logos_method$_ungrouped$SBDockView$setBackgroundView$, (IMP*)&_logos_orig$_ungrouped$SBDockView$setBackgroundView$);Class _logos_class$_ungrouped$MTMaterialLayer = objc_getClass("MTMaterialLayer"); MSHookMessageEx(_logos_class$_ungrouped$MTMaterialLayer, @selector(setFilters:), (IMP)&_logos_method$_ungrouped$MTMaterialLayer$setFilters$, (IMP*)&_logos_orig$_ungrouped$MTMaterialLayer$setFilters$);} }
#line 63 "Tweak.x"
