//
//  BottomSwitch.h
//  SOMPUTON
//
//  Created by 邵瑞 on 15/12/19.
//  Copyright © 2015年 journey. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol didSelectTagViewSwitch <NSObject>

-(void)selectTagView:(NSInteger )selectTag;

@end

@interface BottomSwitch : UIView
@property (nonatomic,assign) id <didSelectTagViewSwitch> delegate;
@end
