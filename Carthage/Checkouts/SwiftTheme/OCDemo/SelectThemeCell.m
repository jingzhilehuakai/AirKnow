//
//  SelectThemeCell.m
//  SwiftTheme
//
//  Created by Gesen on 16/5/27.
//  Copyright © 2016年 Gesen. All rights reserved.
//

#import "SelectThemeCell.h"
#import "Global.h"
#import "OCDemo-Swift.h"

@implementation SelectThemeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.title.theme_textColor = globalTextColorPicker;
    self.themeIcon.theme_image = [ThemeImagePicker pickerWithNames:@[@"icon_theme_red", @"icon_theme_yellow", @"icon_theme_blue", @"icon_theme_light"]];
}

@end
