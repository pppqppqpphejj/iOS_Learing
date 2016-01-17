//
//  LoadingView.h
//  GroupDeal
//
//  Created by lewang on 14-7-9.
//  Copyright (c) 2014年 groupdeal. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface LoadingView : UIView<UIAlertViewDelegate>
{
//    UIActivityIndicatorView *_spinning;
    UIImageView *spinning_;
    BOOL        isAnimating_;
    UILabel * _lalStatus;
}

+(LoadingView *)shareLoadingView;
- (void)show:(NSString *)strStatus;

- (void)show;
- (void)showAnimated:(BOOL)animated;
- (void)showInView:(UIView *)view animated:(BOOL)animated;
- (void)dismissAnimated:(BOOL)animated;
- (void)dismiss;
    /***弹出警告提示信息1.5秒后自动消失***/
- (void)alertViewMessage:(NSString *)message;
    /***检测是否是手机号码***/
- (BOOL)ValidateMobileNumber:(NSString *)mobileNum;
/***检测是否是邮箱***/

-(BOOL)ValidateEmail:(NSString *)email;
/**身份证验证**/
-(BOOL) validateIdentityCard: (NSString *)identityCard;
/***密码验证含大写 小写字母和数字验证***/
-(BOOL)validatePassword:(NSString *)passWord;

/***分享应用默认图片**/
-(NSString *)shareDefaultImage;
//根据内容来确定控件高度
- (float)heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width;
/**
 @method 获取指定宽度width,字体大小fontSize,字符串value的高度
 @param value 待计算的字符串
 @param fontSize 字体的大小
 @param Width 限制字符串显示区域的宽度
 @result float 返回的高度
 */
- (float) heightForString:(NSString *)value andWidth:(float)width;

/**
 @通用的
 @method 获取指定宽度width的字符串在UITextView上的高度
 @param textView 待计算的UITextView
 @param Width 限制字符串显示区域的宽度
 @result float 返回的高度
 */
- (float) AnayheightForString:(id)textView andWidth:(float)width;
/**
 @method 获取指定宽度情况ixa，字符串value的高度
 @param value 待计算的字符串
 @param fontSize 字体的大小
 @param andWidth 限制字符串显示区域的宽度
 @result float 返回的高度
 */
- (float) AnanyUIheightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width;
- (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize;
-(UIImage *)retunCircleImage:(UIImage *)oldImage;

@end
