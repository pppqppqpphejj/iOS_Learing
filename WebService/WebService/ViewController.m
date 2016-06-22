//
//  ViewController.m
//  WebService
//
//  Created by aJia on 12/12/12.
//  Copyright (c) 2012年 rang. All rights reserved.
//

#import "ViewController.h"
#import "XMLDictionary.h"
#import "SoapHelper.h"

#import "ASIHTTPRequest.h"
#import "SoapXmlParseHelper.h"
@interface ViewController ()
{
    NSString * XMLDataString;

    NSMutableData*        webData;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    helper=[[ServiceHelper alloc] initWithQueueDelegate:self];
    NSString *  xmlString =[NSString stringWithFormat:
                            @"<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
                            "<tradeMsg>"
                            "<head>"
                            "<version>1.0.0</version>"
                            "<ref>O900082016042200000001</ref>"
                            "<sysCode>I90008</sysCode>"
                            "<busCode>SDRSLOGN</busCode>"
                            "<tradeSrc>O</tradeSrc>"
                            "<sender>O90008</sender>"
                            "<reciver>I90008</reciver>"
                            "<reSnd>N</reSnd>"
                            "<date>20160428</date>"
                            "<time>174811</time>"
                            "<rst>"
                            "<tradeCode>99</tradeCode>"
                            "<busiCode>9999</busiCode>"
                            "<info></info>"
                            "</rst>"
                            "</head>"
                            "<data>"
                            "<password>5f8591a3d4fe06393cad53edff27ba05</password>"
                            "<username>370102197605282527</username>"
                            "</data>"
                            "</tradeMsg>"];
    NSString *  signature = @"CVhCGzSsryiZThqUwYayiW4UnLfysvos10hVMpR4JRowG0lujlZU8ei9jVxn+AmmGrEIaZtfTdvPqpghheI8ctY4NufDwJz4wV5uFxa9xB4YpGJmF+wKZ6kCBi9NJViE5S24LviZ3Ijb0CvVwqBLu0WlG3J6t3edANvMsKUxhuk=";
    
    NSString * flag = @"00000001";
        //封装soap请求消息
    NSString*soapMsg =[NSString stringWithFormat:@"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:ser=\"http://service.system.zc.com/\">"
                       "<soapenv:Header/>"
                       "<soapenv:Body>"
                       "<flag>%@</flag>"
                       "<xml>%@</xml>"
                       "<signature>%@</signature>"
                       "</soapenv:Body>"
                       "</soapenv:Envelope>",flag,xmlString,signature];

    
        //请求发送到的路径
    NSURL*url =[NSURL URLWithString:defaultWebServiceUrl];
    
    NSMutableURLRequest*req =[NSMutableURLRequest requestWithURL:url];
    NSString*masLength =[NSString stringWithFormat:@"%d",[soapMsg length]];
        //  [_url release];
    
        //以下对请求信息添加属性
    [req addValue:@"application/soap+xml;charset=utf-8"forHTTPHeaderField:@"Content-Type"];
         [req addValue:defaultWebServiceAction forHTTPHeaderField:@"SOAPAction"];
    [req addValue:masLength forHTTPHeaderField:@"Content-Length"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody:[soapMsg dataUsingEncoding:NSUTF8StringEncoding]];
    
        //请求 self.conn
    NSURLConnection* theConnection =[[NSURLConnection alloc] initWithRequest:req delegate:self];
    
        //如果连接已经建好，则初始化data
    if(theConnection)
        {
        webData=[NSMutableData data]; //self.webData
        }
    else
        {
        NSLog(@"连接出错");
        }


	// Do any additional setup after loading the view, typically from a nib.
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [webData setLength: 0];//self
    NSLog(@"connection: didReceiveResponse:1");
}

    //刚开始接受响应时调用
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
    NSLog(@"connection: didReceiveData:%d",[webData length]);
}

    //如果电脑没有连接网络，则出现此信息（不是网络服务器不通）
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
//    self.conn =nil;
    webData =nil;
    NSLog(@"电脑没有连接网路");
}


-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"3 DONE. Received Bytes: %d", [webData length]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//开始加载动画
-(void)startLoadAnimation:(NSString*)strTitle{
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
	//[self.navigationController.view addSubview:HUD];
    [self.view addSubview:HUD];
	
	HUD.dimBackground = YES;
    //HUD.color=[UIColor redColor];
	HUD.labelText = strTitle;
	// Regiser for HUD callbacks so we can remove it from the window at the right time
	//HUD.delegate = self;
	
    [HUD show:YES];
}
#pragma mark -
#pragma mark MBProgressHUDDelegate methods
- (void)hudWasHidden:(MBProgressHUD *)hud {
	// Remove HUD from screen when the HUD was hidded
	[HUD removeFromSuperview];
	[HUD release];
	HUD = nil;
}

//同步请求
- (IBAction)buttonSyncClick:(id)sender {
    [self startLoadAnimation:@"loading"];
    NSLog(@"=======同步请求开始======\n");
//    http://www.sdhrss.gov.cn/webWebservice/services/PublicServiceIOS?
    NSString *  xmlString =[NSString stringWithFormat:
                          @"<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
                          "<tradeMsg>"
                          "<head>"
                          "<version>1.0.0</version>"
                          "<ref>O900082016042200000001</ref>"
                          "<sysCode>I90008</sysCode>"
                          "<busCode>SDRSLOGN</busCode>"
                          "<tradeSrc>O</tradeSrc>"
                          "<sender>O90008</sender>"
                          "<reciver>I90008</reciver>"
                          "<reSnd>N</reSnd>"
                          "<date>20160428</date>"
                          "<time>174811</time>"
                          "<rst>"
                          "<tradeCode>99</tradeCode>"
                          "<busiCode>9999</busiCode>"
                          "<info></info>"
                          "</rst>"
                          "</head>"
                          "<data>"
                          "<password>5f8591a3d4fe06393cad53edff27ba05</password>"
                          "<username>370102197605282527</username>"
                          "</data>"
                          "</tradeMsg>"];
    
    NSString *  signature = @"CVhCGzSsryiZThqUwYayiW4UnLfysvos10hVMpR4JRowG0lujlZU8ei9jVxn+AmmGrEIaZtfTdvPqpghheI8ctY4NufDwJz4wV5uFxa9xB4YpGJmF+wKZ6kCBi9NJViE5S24LviZ3Ijb0CvVwqBLu0WlG3J6t3edANvMsKUxhuk=";
    
   NSString * flag = @"00000001";
    
//    NSDictionary * dicParam = @{
//                                @"flag":@"00000001",
//                                @"xml":xmlString,
//                                @"signature":signature
//
//                                };
    

    
    NSString *webServiceStr = [NSString stringWithFormat:
                               @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                               "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                               "<soap:Body>\n"
                               "<xml>%@</xml>\n"
                               "</soap:Body>\n"
                               "</soap:Envelope>",xmlString];//webService头

    NSDictionary * dicParam1 = @{
                                 @"flag1":@"00000001",
                                 
                                 };
    NSDictionary * dicParam2 = @{
                                 @"xml":@"xml对不起",
                                 };
    NSDictionary * dicParam3 = @{
                                 @"signature":signature
                                 };
    
    NSMutableArray *arr=[NSMutableArray array];

    [arr addObject:dicParam1];
    [arr addObject:dicParam2];

    [arr addObject:dicParam3];


    
    NSString *soapMsg=[SoapHelper
                       arrayToDefaultSoapMessage:arr methodName:defaultWebServiceMethodName];
    
    //执行同步并取得结果
    NSString *xml=[helper syncServiceMethod:defaultWebServiceMethodName SoapMessage:soapMsg];
    
    NSLog(@"xml  %@",xml);
    
    
    NSData *data=[[NSData alloc] initWithBytes:xml.UTF8String length:[xml length]];
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data]; //设置XML数据
    [parser setShouldProcessNamespaces:NO];
    [parser setShouldReportNamespacePrefixes:NO];
    [parser setShouldResolveExternalEntities:NO];
    
    [parser setDelegate:self];
    [parser parse];
    
    
    
    
    
    
//    
//    NSDictionary * xmldoServiceReturnData = nil;
//    NSString * xmlData = nil;
//    
// NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLString:xml];
//    
//    NSDictionary * xmlsoapenvEnvelope = [xmlDoc objectForKey:@"soapenv:Body"];
//    NSDictionary * xmlsoapenvBody  =[xmlsoapenvEnvelope objectForKey:@"ns1:doServiceResponse"];
// 
    //将xml使用SoapXmlParseHelper类转换成想要的结果
    
    NSLog(@"同步请求返回的xml:\n%@\n",xml);
    NSLog(@"=======同步请求结束======\n");
    [HUD hide:YES];
}
//异步请求
- (IBAction)buttonAsycClick:(id)sender {
    [self startLoadAnimation:@"loading"];
    NSLog(@"=======异步请求开始======\n");
  
    NSString *  xmlString =[NSString stringWithFormat:
                            @"<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
                            "<tradeMsg>"
                            "<head>"
                            "<version>1.0.0</version>"
                            "<ref>O900082016042200000001</ref>"
                            "<sysCode>I90008</sysCode>"
                            "<busCode>SDRSLOGN</busCode>"
                            "<tradeSrc>O</tradeSrc>"
                            "<sender>O90008</sender>"
                            "<reciver>I90008</reciver>"
                            "<reSnd>N</reSnd>"
                            "<date>20160422</date>"
                            "<time>174811</time>"
                            "<rst>"
                            "<tradeCode>99</tradeCode>"
                            "<busiCode>9999</busiCode>"
                            "<info></info>"
                            "</rst>"
                            "</head>"
                            "<data>"
                            "<password>5f8591a3d4fe06393cad53edff27ba05</password>"
                            "<username>370102197605282527</username>"
                            "</data>"
                            "</tradeMsg>"];
    NSString *  signature = @"CVhCGzSsryiZThqUwYayiW4UnLfysvos10hVMpR4JRowG0lujlZU8ei9jVxn+AmmGrEIaZtfTdvPqpghheI8ctY4NufDwJz4wV5uFxa9xB4YpGJmF+wKZ6kCBi9NJViE5S24LviZ3Ijb0CvVwqBLu0WlG3J6t3edANvMsKUxhuk=";
    
    NSDictionary * param1 = @{
                              @"flag":@"0000001"
                              };
    
    NSDictionary * param2 = @{
                              
                              @"xml":xmlString
                              };
    NSDictionary * param3 = @{
                              
                              @"signature":signature
                              };
        //
    NSDictionary * dicParam = @{
                                @"flag":@"00000001",
                                @"xml":xmlString,
                                @"signature":signature
                                
                                };
    NSMutableArray *arr=[NSMutableArray array];
    [arr addObject:dicParam];
    NSString *soapMsg=[SoapHelper arrayToDefaultSoapMessage:arr methodName:defaultWebServiceMethodName];
    [helper asynServiceMethod:defaultWebServiceMethodName SoapMessage:soapMsg];
}
//队列请求
- (IBAction)buttonQueueClick:(id)sender {
    [self startLoadAnimation:@"loading"];
    NSLog(@"=======队列请求开始======\n");
    [helper resetQueue];//取消之前的请求
    for (int i=1; i<4; i++) {
        NSString *name=[NSString stringWithFormat:@"request%d",i];
        //获取soap
        NSMutableArray *arr=[NSMutableArray array];
        [arr addObject:[NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%d",i],@"type", nil]];
        [arr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"1",@"curPage", nil]];
        [arr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"10",@"pageSize", nil]];
        NSString *soapMsg=[SoapHelper arrayToDefaultSoapMessage:arr methodName:@"GetWebNewsByType"];
        
        //获取ASIHTTPRequest
        ASIHTTPRequest *request=[ServiceHelper commonSharedRequestMethod:@"GetWebNewsByType" SoapMessage:soapMsg];
        //设置UserInfo用于区分不同的请求
        [request setUserInfo:[NSDictionary dictionaryWithObjectsAndKeys:name,@"name", nil]];
        //添加到队列中
        [helper addRequestQueue:request];
    }
    [helper startQueue];//开始队列
}
#pragma mark -
#pragma mark 异步请求结果
-(void)finishSuccessRequest:(NSString*)xml{
    
    //将xml使用SoapXmlParseHelper类转换成想要的结果
    
    NSLog(@"异步请求返回的xml:\n%@\n",xml);
    NSLog(@"=======异步请求结束======\n");
     [HUD hide:YES];
}
-(void)finishFailRequest:(NSError*)error{
    NSLog(@"异步请发生失败:%@\n",[error description]);
     [HUD hide:YES];
}
- (void)dealloc {
    [helper release];
    [super dealloc];
}
#pragma mark -
#pragma mark 队列请求处理
-(void)finishQueueComplete{
    NSLog(@"＝＝＝所有队列请求完成=====\n");
     [HUD hide:YES];
}
-(void)finishSingleRequestSuccess:(NSString*)xml userInfo:(NSDictionary*)dic{
    
    //将xml使用SoapXmlParseHelper类转换成想要的结果
    
    NSString *name=[dic objectForKey:@"name"];
    NSLog(@"队列%@,请求完成\n",name);
    NSLog(@"队列%@,返回的xml为\n%@\n",name,xml);
}
-(void)finishSingleRequestFailed:(NSError*)error userInfo:(NSDictionary*)dic{
    NSString *name=[dic objectForKey:@"name"];
    NSLog(@"队列%@,请求失败\n",name);
    NSLog(@"队列%@,请求失败原因为\n%@\n",name,[error description]);

}

#pragma mark -  NSXMLParserDelegate
    //在文档开始的时候触发
-(void)parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"解析开始！");
    
}
    //解析起始标记
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    NSLog(@"标记：%@",elementName);
    
    NSLog(@"标记：elementName %@--------\nattributeDict%@",elementName,attributeDict);

    if ([elementName isEqualToString:@"soapenv:Envelope"]) {
        XMLDataString = elementName;
        NSLog(@"%@",XMLDataString);
    }
    
}
    //解析文本节点
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    NSLog(@"值：%@",string);
}
    //解析结束标记
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    NSLog(@"结束标记：%@",elementName);
}
    //文档结束时触发
-(void) parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"解析结束！");
}
@end
