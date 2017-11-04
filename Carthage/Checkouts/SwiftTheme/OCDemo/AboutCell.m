//
//  AboutCell.m
//  SwiftTheme
//
//  Created by Gesen on 16/5/26.
//  Copyright © 2016年 Gesen. All rights reserved.
//

#import "AboutCell.h"
#import "Global.h"
#import "OCDemo-Swift.h"

@implementation AboutCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.content.theme_textColor = globalTextColorPicker;
}

@end
