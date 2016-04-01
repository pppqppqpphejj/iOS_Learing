//
//  Http.m
//  WXPayForIOS
//
//  Created by ssiwo02 on 15/12/29.
//  Copyright © 2015年 疯狂的地垄沟. All rights reserved.
//

#import "Http.h"
#import "XMLReader.h"

@implementation Http

//访问后台接口
+(NSDictionary *)request:(NSString *)url{
    //请求后台
    NSURL *requestURL = [NSURL URLWithString:url];
    NSMutableURLRequest *request  = [[NSMutableURLRequest alloc]initWithURL:requestURL];
    [request setValue:@"application/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    NSHTTPURLResponse* urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    
    if ([urlResponse statusCode] >= 200 && [urlResponse statusCode] < 300) {
        NSDictionary *xmlDict = [NSDictionary alloc];
        NSError *error2 = [NSError alloc];
        xmlDict = [[XMLReader dictionaryForXMLString:result error:&error2] objectForKey:@"xml"];
        
        return xmlDict;
    }
    return nil;
}
@end
