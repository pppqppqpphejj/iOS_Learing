//
//  PensionIssueAlertDateView.h
//  ShanDongHumanSociety
//
//  Created by ZouXu on 16/4/24.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertThreeChooseDatePicker : UIView

@property(weak,nonatomic)IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@property (weak, nonatomic) IBOutlet UIButton *determineButton;

@end
