//
//  PensionIssueAlertDateView.m
//  ShanDongHumanSociety
//
//  Created by ZouXu on 16/4/24.
//  Copyright © 2016年 wondergroup. All rights reserved.
//

#import "AlertThreeChooseDatePicker.h"
#import "LoadingView.h"

@interface AlertThreeChooseDatePicker()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong,nonatomic) NSMutableArray *myArray1; /** 月份 */
@property (strong,nonatomic) NSMutableArray *myArray; /** 年份 */
@property (strong,nonatomic) NSString  *timeSelectedString; /** 选中的开始时间（默认为当前时间） */
@property(strong,nonatomic)NSString *endselectedString; /** 选中的结束时间（默认为当前时间） */
@property (strong,nonatomic)NSString  *str10;
@property (strong,nonatomic)NSString  *str11;

@end

@implementation AlertThreeChooseDatePicker

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self awakeFromNib];
        self.userInteractionEnabled = YES;
        [self initWithLOG];
    }
    return self;
}

-(void)initWithLOG{
    
    /** ------ 设置pciker的代理 */
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    //初始时间选择文字
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM"];
    self.str10 = [formatter stringFromDate:[NSDate date]];
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateFormat:@"yyyy"];
    self.str11 = [formatter1 stringFromDate:[NSDate date]];
    self.timeSelectedString = [NSString stringWithFormat:@"%@%@",self.str11,self.str10];
    //设置pickerview初始默认
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:@"MM"];
    NSString *str111 = [formatter2 stringFromDate:[NSDate date]];
    NSDateFormatter *formatter3 = [[NSDateFormatter alloc] init];
    [formatter3 setDateFormat:@"yyyy"];
    NSString *str222 = [formatter3 stringFromDate:[NSDate date]];
    int a = [str111 intValue];
    int b = [str222 intValue];
    [self.pickerView selectRow:a-1 inComponent:1 animated:NO];
    [self.pickerView selectRow:b-1900 inComponent:0 animated:NO];
    
    /** ------ 给取消确定按钮添加事件 */
    [self.cancelButton addTarget:self action:@selector(respondsToCancelButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.determineButton addTarget:self action:@selector(respondsDetermineToButton:) forControlEvents:UIControlEventTouchUpInside];
    
    /** ------ 取消按钮添加边框 */
    [[LoadingView shareLoadingView] setCornerRadius:self.cancelButton width:1.0 radius:0 color:[UIColor grayColor]];
    //确定按钮添加边框
    [[LoadingView shareLoadingView] setCornerRadius:self.determineButton width:1.0 radius:0 color:[UIColor grayColor]];
}

// 点击取消按钮
-(void)respondsToCancelButton :(UIButton*)sender{

}

// 点击确定按钮
-(void)respondsDetermineToButton :(UIButton*)sender{

}

#pragma mark 实现picker的协议方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if (component == 0) {
        self.str11 = self.myArray[row];
    }else{
        self.str10 = self.myArray1[row];
    }
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:@"MM"];
    NSString *str111 = [formatter2 stringFromDate:[NSDate date]];
    NSDateFormatter *formatter3 = [[NSDateFormatter alloc] init];
    [formatter3 setDateFormat:@"yyyy"];
    NSString *str222 = [formatter3 stringFromDate:[NSDate date]];
    int a = [str111 intValue];
    int b = [str222 intValue];
    int c = [self.str10 intValue];
    int d = [self.str11 intValue];
    if (d>b||(d==b&&c>a)) {
            [self.pickerView selectRow:a-1 inComponent:1 animated:YES];
            [self.pickerView selectRow:b-1900 inComponent:0 animated:YES];
    }
    self.timeSelectedString = [NSString stringWithFormat:@"%@%@",self.str11,self.str10];
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return 200;
    }else {
        return 12;
    }
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return  self.myArray[row];
    }else {
        return  self.myArray1[row];
    }
}


-(NSMutableArray *)myArray1{
    if (!_myArray1) {
        self.myArray1 = [[NSMutableArray alloc]init];
        for (int i = 1; i<13; i++) {
            NSString *str = [NSString stringWithFormat:@"%d",i];
            [self.myArray1 addObject:str];
        }
    }
    return _myArray1;
}
-(NSMutableArray *)myArray{
    if (!_myArray) {
        self.myArray = [[NSMutableArray alloc]init];
        for (int i = 1900; i<2100; i++) {
            NSString *str = [NSString stringWithFormat:@"%d",i];
            [self.myArray addObject:str];
        }
    }
    return _myArray;
}












-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    [self awakeFromNib];
    return self;
}

-(void)awakeFromNib
{
    NSArray *nibArray = [[NSBundle mainBundle]loadNibNamed:@"AlertThreeChooseDatePicker" owner:self options:nil];
    _contentView = [nibArray objectAtIndex:0];
    _contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_contentView];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_contentView);
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_contentView]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_contentView]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:views]];
    
    _contentView.userInteractionEnabled = YES;
    
}

@end
