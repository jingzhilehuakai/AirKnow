//
//  SwitchNightCell.h
//  SwiftTheme
//
//  Created by Gesen on 16/5/27.
//  Copyright © 2016年 Gesen. All rights reserved.
//

#import "BaseCell.h"

@interface SwitchNightCell : BaseCell

@property (nonatomic, weak) IBOutlet UILabel *title;
@property (nonatomic, weak) IBOutlet UIImageView *nightIcon;
@property (nonatomic, weak) IBOutlet UISwitch *nightSwitch;

@end
