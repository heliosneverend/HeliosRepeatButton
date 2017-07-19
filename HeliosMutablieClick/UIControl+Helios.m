//
//  UIControl+Helios.m
//  HeliosMutablieClick
//
//  Created by beyo-zhaoyf on 2017/7/14.
//  Copyright © 2017年 beyo-zhaoyf. All rights reserved.
//

#import "UIControl+Helios.h"
#import <objc/runtime.h>
@implementation UIControl (Helios)
static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";
static const char *UIcontrol_ignoreEvent = "UIcontrol_ignoreEvent";
- (NSTimeInterval )Helios_acceptEventInterval {
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}
- (void)setHelios_acceptEventInterval:(NSTimeInterval)Helios_acceptEventInterval {
     objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(Helios_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)Helios_ignoreEvent {
    return [objc_getAssociatedObject(self, UIcontrol_ignoreEvent)doubleValue];
}
- (void)setHelios_ignoreEvent:(BOOL)Helios_ignoreEvent {
    objc_setAssociatedObject(self, UIcontrol_ignoreEvent, @(Helios_ignoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
+ (void)load {
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    
    Method b = class_getInstanceMethod(self, @selector(__Helios_sendAction:to:forEvent:));
    
    method_exchangeImplementations(a, b);
}
- (void)__Helios_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if(self.Helios_ignoreEvent)return;
    
    if(self.Helios_acceptEventInterval > 0){
        self.Helios_ignoreEvent = YES;
        
        [self performSelector:@selector(setHelios_ignoreEvent:) withObject:@(NO) afterDelay:self.Helios_acceptEventInterval];
    }
    
    [self __Helios_sendAction:action to:target forEvent:event];
}
@end
