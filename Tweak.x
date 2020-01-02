@interface SBDockView : UIView
    @property (nonatomic,retain) UIView * backgroundView;
@end

@interface MTMaterialLayer : CALayer
    @property (copy) NSString * name;
    -(void)setFilters:(NSArray *)arg1;
@end

%hook SBDockView 

-(void)setBackgroundView:(UIView *)view {
    view.backgroundColor = [UIColor colorWithRed: 0.0 green: 0.0 blue: 0.0 alpha: 0.0];
    view.layer.borderColor = [UIColor colorWithRed: 1.0 green: 1.0 blue: 1.0 alpha: 1.0].CGColor;
    view.layer.borderWidth = 2;
    [view.layer setName:@"wiredock"];
    %orig;
}

%end

%hook MTMaterialLayer

-(void)setFilters:(NSArray *)arg1 {
    if([[self name] isEqualToString:@"wiredock"]) 
        %orig(nil);
    else
        %orig;
}

%end