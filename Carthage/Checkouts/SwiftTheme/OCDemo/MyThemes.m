//
//  MyThemes.m
//  SwiftTheme
//
//  Created by Gesen on 16/5/26.
//  Copyright © 2016年 Gesen. All rights reserved.
//

#import "MyThemes.h"
#import "OCDemo-Swift.h"

#define lastThemeIndexKey @"lastedThemeIndex"

@implementation MyThemes

+ (void)switchTo:(MyThemesType)type {
    [ThemeManager setThemeWithIndex:type];
}

+ (void)switchToNext {
    int next = (int)ThemeManager.currentThemeIndex + 1;
    if (next > 2) { // cycle and without Night
        next = 0;
    }
    [self switchTo:next];
}

+ (void)switchNight:(BOOL)isToNight {
    [self switchTo:isToNight ? MyThemesTypeNight : MyThemesTypeRed];
}

+ (BOOL)isNight {
    return (int)ThemeManager.currentThemeIndex == MyThemesTypeNight;
}

+ (void)restoreLastTheme {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    MyThemesType type = (int)[defaults integerForKey:lastThemeIndexKey];
    [self switchTo:type];
}

+ (void)saveLastTheme {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:ThemeManager.currentThemeIndex forKey:lastThemeIndexKey];
}

@end
