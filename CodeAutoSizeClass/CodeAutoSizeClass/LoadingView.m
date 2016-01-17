//
//  LoadingView.m
//  GroupDeal
//
//  Created by lewang on 14-7-9.
//  Copyright (c) 2014年 groupdeal. All rights reserved.
//

#import "LoadingView.h"
//#import "commonText.h"

#define ANIMATION_DURATION 1
#define VIEW_ALPHA 0.6


static LoadingView *_loadingView;




@implementation LoadingView

#pragma life cycle
+(LoadingView *)shareLoadingView
{
    @synchronized(self){  //为了确保多线程情况下，仍然确保实体的唯一性
        
        if (!_loadingView)
        {
            //该方法会调用 allocWithZone
            _loadingView = [[LoadingView alloc] init];
        }
    }
    return  _loadingView;
}


+(id)allocWithZone:(NSZone *)zone
{
    @synchronized(self)
    {
        if (!_loadingView)
        {
            _loadingView = [super allocWithZone:zone]; //确保使用同一块内存地址
            return _loadingView;
        }
    }
    
    return nil;
}


- (id)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.alpha = 0;
        self.userInteractionEnabled = YES;
        spinning_ = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//        [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [self addSubview:spinning_];
        
        
        isAnimating_ = NO;
        //设置动画帧
        spinning_.animationImages=[NSArray arrayWithObjects:
                                   [UIImage imageNamed:@"loading1.png"],
                                   [UIImage imageNamed:@"loading2.png"],
                                   [UIImage imageNamed:@"loading3.png"],
                                   [UIImage imageNamed:@"loading4.png"],
                                   nil ];
        
        
        [spinning_ setAnimationRepeatCount:10];


        [spinning_ setAnimationDuration:ANIMATION_DURATION];

    }
    return self;
}


-(void)show:(NSString *)strStatus
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [_lalStatus setText:strStatus];
    [self showInView:window animated:YES];
    
    
}
#pragma  mark - methods
- (void)show {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [self showInView:window animated:YES];
}

- (void)showAnimated:(BOOL)animated {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [self showInView:window animated:animated];
}

- (void)showInView:(UIView *)view animated:(BOOL)animated
{

    CGFloat width = view.frame.size.width;
    CGFloat height = view.frame.size.height;
    self.frame = CGRectMake(0, 0, width, height);
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [view addSubview:self];
    
    if (animated)
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:ANIMATION_DURATION];
        
        isAnimating_ = YES;
        [spinning_ startAnimating];
    }
    
    self.alpha = VIEW_ALPHA;
    
    if (animated) {
        [UIView commitAnimations];
    }
}

- (void)dismissAnimated:(BOOL)animated
{
    if (animated) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:ANIMATION_DURATION];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(didFinishLoadingAnimation)];
    }
    
    self.alpha = 0;
    if (!animated) {
        [self removeFromSuperview];
    }
    
    if (animated) {
        [UIView commitAnimations];
    }
    
    [spinning_ stopAnimating];
    isAnimating_ = NO;
}

- (void)dismiss {
    [self dismissAnimated:YES];
}

- (void)didFinishLoadingAnimation {
    [self removeFromSuperview];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    CGFloat yCenter = (self.frame.size.height -  (20.0/400 * self.frame.size.width)) * (1 - 0.58);
    spinning_.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height-60);
}




    //检测是否是手机号码
- (BOOL)ValidateMobileNumber:(NSString *)mobileNum
{
    
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     * 虚拟：170
     */
//    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9]|70)\\d{8}$";
    NSString *MOBILE = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";

    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    if ([regextestmobile evaluateWithObject:mobileNum] == YES)
        {
        return YES;
        }
    else
        {
        return NO;
        }
}

    //邮箱验证
-(BOOL)ValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
//身份证号
-(BOOL)validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}
//密码
-(BOOL)validatePassword:(NSString *)passWord
{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}


- (float)heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width
//根据字符串的的长度来计算UITextView的高度
{
    
    float height = 0.0f;
    CGSize size=CGSizeMake(width, 200000);//可以限制宽 高度可以任意

     //下面方法中需要的参数 注意:字体的大小要和上面设置字体大小的一直
    NSDictionary * dic=@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};

      //同上面的字典一样也是下面方法需要的参数
       // NSStringDrawingUsesLineFragmentOrigin 表示矩形区域的高度被忽略
      // NSStringDrawingUsesFontLeading     表示计算之后的矩形区域包括行间距
    //计算高度
     CGRect  rect=      [ value  boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading  attributes:dic context:nil];
    height = rect.size.height;
        return height;
//
    
                
}
//                一般情况下常见的需求这个方法都能够满足


/**
 @method 获取指定宽度width,字体大小fontSize,字符串value的高度
 @param value 待计算的字符串
 @param fontSize 字体的大小
 @param Width 限制字符串显示区域的宽度
 @result float 返回的高度
 */
- (float)heightForString:(NSString *)value andWidth:(float)width
{
    //获取当前文本的属性
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:value];
//    _text.attributedText = attrStr;
    NSRange range = NSMakeRange(0, attrStr.length);
    // 获取该段attributedString的属性字典
    NSDictionary *dic = [attrStr attributesAtIndex:0 effectiveRange:&range];
    // 计算文本的大小
    CGSize sizeToFit = [value boundingRectWithSize:CGSizeMake(width - 16.0, MAXFLOAT) // 用于计算文本绘制时占据的矩形块
                                           options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading // 文本绘制时的附加选项
                                        attributes:dic        // 文字的属性
                                           context:nil].size; // context上下文。包括一些信息，例如如何调整字间距以及缩放。该对象包含的信息将用于文本绘制。该参数可为nil
    return sizeToFit.height;
}
/**
 @method 获取指定宽度width的字符串在UITextView上的高度
 @param textView 待计算的UITextView
 @param Width 限制字符串显示区域的宽度
 @result float 返回的高度
 */
- (float) AnayheightForString:(id )textView andWidth:(float)width
{
    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    
    return sizeToFit.height+20;
}

/**
 @method 获取指定宽度情况ixa，字符串value的高度
 @param value 待计算的字符串
 @param fontSize 字体的大小
 @param andWidth 限制字符串显示区域的宽度
 @result float 返回的高度
 */
- (float) AnanyUIheightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width
{
    CGSize sizeToFit = [value sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];//此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    return sizeToFit.height;
}


- (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize
{
    UIImage *newimage;
    if (nil == image) {
        newimage = nil;
    }
    else{
        CGSize oldsize = image.size;
        CGRect rect;
        if (asize.width/asize.height > oldsize.width/oldsize.height) {
            rect.size.width = asize.height*oldsize.width/oldsize.height;
            rect.size.height = asize.height;
            rect.origin.x = (asize.width - rect.size.width)/2;
            rect.origin.y = 0;
        }
        else{
            rect.size.width = asize.width;
            rect.size.height = asize.width*oldsize.height/oldsize.width;
            rect.origin.x = 0;
            rect.origin.y = (asize.height - rect.size.height)/2;
        }
        UIGraphicsBeginImageContext(asize);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        UIRectFill(CGRectMake(0, 0, asize.width, asize.height));//clear background
        [image drawInRect:rect];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newimage;
}


#pragma mark - retunCircleImage 返回圆形截图
-(UIImage *)retunCircleImage:(UIImage *)oldImage
{
    
    
    //1.加载原图
    //    UIImage *oldImage = [UIImage imageNamed:@"image"];
    
    //2.开启上下文
    UIGraphicsBeginImageContextWithOptions(oldImage.size, NO, 0.0);
    
    //3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //4.画圆
    CGRect circleRect = CGRectMake(0, 0, oldImage.size.width, oldImage.size.height);
    CGContextAddEllipseInRect(ctx, circleRect);
    
    //5.裁剪(按照当前的路径形状裁剪)
    CGContextClip(ctx);
    
    //6.画图
    [oldImage drawInRect:circleRect];
    
    //7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //8.结束
    UIGraphicsEndImageContext();
    
    
    return newImage;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
