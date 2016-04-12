//
//  ItemButtion.m
//  BorderDemo
//
//  Created by 邵瑞 on 16/4/12.
//  Copyright © 2016年 YaoYu. All rights reserved.
//

#import "ItemButtion.h"




    //SKBounceAnimationStiffness SKBounceAnimationStiffnessLight  = 5.f;
    //SKBounceAnimationStiffness SKBounceAnimationStiffnessMedium = .1f;
    //SKBounceAnimationStiffness SKBounceAnimationStiffnessHeavy  = .001f;
@interface ItemButtion ()
{
    BOOL isFrstShow_;
}

@end
@implementation ItemButtion



-(void)awakeFromNib
{
    
    [self setBackgroundColor:[UIColor clearColor]];
    isFrstShow_ = YES;
    
    NSArray *nibArray = [[NSBundle mainBundle]loadNibNamed:@"ItemButtion" owner:self options:nil];
    _view = [nibArray objectAtIndex:0];
    _view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_view];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_view);
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_view]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_view]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:views]];
    
    _view.userInteractionEnabled = NO;
    
    
    
    
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
    if (isFrstShow_ ) {
        isFrstShow_ = NO;
        [_lalTitle sizeToFit];
        CGFloat fontSize = self.frame.size.width/216.0 * 34;
        [_lalTitle setFont:[UIFont systemFontOfSize:fontSize]];
    }
}


-(void)PlayAnimation
{
    NSString *keyPath = @"transform";
    CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    
    
    CATransform3D transform = _imvMain.layer.transform;
    id finalValue = [NSValue valueWithCATransform3D:
                     CATransform3DScale(transform, 1.0, 1.0, 1.0)
                     ];
    id FromValue = [NSValue valueWithCATransform3D:
                    CATransform3DScale(transform, 1.8, 1.8, 1.8)
                    ];
    
    
        //    [self arrValues:bounceAnimation FromValue:FromValue ToValue:finalValue];
    [_imvMain.layer addAnimation:bounceAnimation forKey:@"someKey"];
    [_imvMain.layer setValue:finalValue forKeyPath:keyPath];
}

#pragma mark - bound animation
-(void)arrValues:(CAKeyframeAnimation *)animation FromValue:(NSValue *)fromValue ToValue:(NSValue *)toValue
{
    CATransform3D fromTransform = [fromValue CATransform3DValue];
    CATransform3D toTransform = [toValue CATransform3DValue];
    
    animation.values = [self createTransformArrayFromM11:
                        [self valueArrayForStartValue:fromTransform.m11 endValue:toTransform.m11]
                                                     M12:
                        [self valueArrayForStartValue:fromTransform.m12 endValue:toTransform.m12]
                                                     M13:
                        [self valueArrayForStartValue:fromTransform.m13 endValue:toTransform.m13]
                                                     M14:
                        [self valueArrayForStartValue:fromTransform.m14 endValue:toTransform.m14]
                                                     M21:
                        [self valueArrayForStartValue:fromTransform.m21 endValue:toTransform.m21]
                                                     M22:
                        [self valueArrayForStartValue:fromTransform.m22 endValue:toTransform.m22]
                                                     M23:
                        [self valueArrayForStartValue:fromTransform.m23 endValue:toTransform.m23]
                                                     M24:
                        [self valueArrayForStartValue:fromTransform.m24 endValue:toTransform.m24]
                                                     M31:
                        [self valueArrayForStartValue:fromTransform.m31 endValue:toTransform.m31]
                                                     M32:
                        [self valueArrayForStartValue:fromTransform.m32 endValue:toTransform.m32]
                                                     M33:
                        [self valueArrayForStartValue:fromTransform.m33 endValue:toTransform.m33]
                                                     M34:
                        [self valueArrayForStartValue:fromTransform.m34 endValue:toTransform.m34]
                                                     M41:
                        [self valueArrayForStartValue:fromTransform.m41 endValue:toTransform.m41]
                                                     M42:
                        [self valueArrayForStartValue:fromTransform.m42 endValue:toTransform.m42]
                                                     M43:
                        [self valueArrayForStartValue:fromTransform.m43 endValue:toTransform.m43]
                                                     M44:
                        [self valueArrayForStartValue:fromTransform.m44 endValue:toTransform.m44]
                        ];
}


- (NSArray*) createTransformArrayFromM11:(NSArray*)m11 M12:(NSArray*)m12 M13:(NSArray*)m13 M14:(NSArray*)m14
                                     M21:(NSArray*)m21 M22:(NSArray*)m22 M23:(NSArray*)m23 M24:(NSArray*)m24
                                     M31:(NSArray*)m31 M32:(NSArray*)m32 M33:(NSArray*)m33 M34:(NSArray*)m34
                                     M41:(NSArray*)m41 M42:(NSArray*)m42 M43:(NSArray*)m43 M44:(NSArray*)m44 {
    NSUInteger numberOfTransforms = m11.count;
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:numberOfTransforms];
    CATransform3D value;
    
    for (NSInteger i = 1; i < numberOfTransforms; i++) {
        value = CATransform3DIdentity;
        value.m11 = [[m11 objectAtIndex:i] floatValue];
        value.m12 = [[m12 objectAtIndex:i] floatValue];
        value.m13 = [[m13 objectAtIndex:i] floatValue];
        value.m14 = [[m14 objectAtIndex:i] floatValue];
        
        value.m21 = [[m21 objectAtIndex:i] floatValue];
        value.m22 = [[m22 objectAtIndex:i] floatValue];
        value.m23 = [[m23 objectAtIndex:i] floatValue];
        value.m24 = [[m24 objectAtIndex:i] floatValue];
        
        value.m31 = [[m31 objectAtIndex:i] floatValue];
        value.m32 = [[m32 objectAtIndex:i] floatValue];
        value.m33 = [[m33 objectAtIndex:i] floatValue];
        value.m44 = [[m34 objectAtIndex:i] floatValue];
        
        value.m41 = [[m41 objectAtIndex:i] floatValue];
        value.m42 = [[m42 objectAtIndex:i] floatValue];
        value.m43 = [[m43 objectAtIndex:i] floatValue];
        value.m44 = [[m44 objectAtIndex:i] floatValue];
        
        [values addObject:[NSValue valueWithCATransform3D:value]];
    }
    return values;
}

- (NSArray*) valueArrayForStartValue:(CGFloat)startValue endValue:(CGFloat)endValue
{
    
    CGFloat duration = 0.5;        //动作时间
    NSInteger numberOfBounces = 6; //回弹4次
    NSInteger steps = 60*duration; //60 fps desired
    
    CGFloat stiffnessCoefficient = 0.2f;//质量（重度或硬度）
    
    CGFloat alpha = 0;
    if (startValue == endValue) {
        alpha = log2f(stiffnessCoefficient)/steps;
    } else {
        alpha = log2f(stiffnessCoefficient/fabsf(endValue - startValue))/steps;
    }
    if (alpha > 0) {
        alpha = -1.0f*alpha;
    }
    CGFloat numberOfPeriods = numberOfBounces/2 + 0.5;
    CGFloat omega = numberOfPeriods * 2*M_PI/steps;
    
        //uncomment this to get the equation of motion
        //	NSLog(@"y = %0.2f * e^(%0.5f*x)*cos(%0.10f*x) + %0.0f over %d frames", startValue - endValue, alpha, omega, endValue, steps);
    
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:steps];
    CGFloat value = 0;
    
    CGFloat oscillationComponent;
    CGFloat coefficient;
    
        // conforms to y = A * e^(-alpha*t)*cos(omega*t)
    for (NSInteger t = 0; t < steps; t++)
        {
            //decaying mass-spring-damper solution with initial displacement
        
        oscillationComponent =  cos(omega*t);
        
        coefficient =  (startValue - endValue);
        
        
        value = coefficient * pow(2.71, alpha*t) * oscillationComponent + endValue;
        
        
        
        [values addObject:[NSNumber numberWithFloat:value]];
        }
    return values;
}



@end
