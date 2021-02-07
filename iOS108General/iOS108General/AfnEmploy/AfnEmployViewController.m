//
//  AfnEmployViewController.m
//  iOS108General
//
//  Created by arni on 2021/2/7.
//  Copyright © 2021 iOS108. All rights reserved.
//

#import "AfnEmployViewController.h"
#import "AFNetworking.h"
#import "JSONKit.h"

#ifdef DEBUG

#define SLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )

#else

#define SLog(format, ...)

#endif


typedef void(^ResoultDataBlock)(id resoult);
typedef void(^ErrorBlock)(NSError *error);

@interface AfnEmployViewController ()
@property (strong,nonatomic)NSMutableDictionary * parms;
@property(nonatomic,copy)NSString * requestUrl;
@end

@implementation AfnEmployViewController

- (IBAction)errorAction_142:(id)sender {
    SLog(@"点击了失败的142-id");
    [self.parms setObject:@(142) forKey:@"packId"];
    [self errorGetWeixinInfo:self.requestUrl param:self.parms successBlock:^(id resoult) {
        if (resoult) {
            SLog(@"BlockResult： %@",resoult);
        }
    } failBlock:^(NSError *error) {
        if (error) {
            SLog(@"BlockError： %@",error);
        }
    }];
}
- (IBAction)errorAction_124:(id)sender {
    SLog(@"点击了失败的124-id");
    [self.parms setObject:@(124) forKey:@"packId"];
    [self errorGetWeixinInfo:self.requestUrl param:self.parms successBlock:^(id resoult) {
        if (resoult) {
            SLog(@"BlockResult： %@",resoult);
        }
    } failBlock:^(NSError *error) {
        if (error) {
            SLog(@"BlockError： %@",error);
        }
    }];
}
- (IBAction)successAction_142:(id)sender {
    SLog(@"点击了成功的142-id");
    [self.parms setObject:@(142) forKey:@"packId"];
    [self successGetWeixinInfo:self.requestUrl param:self.parms successBlock:^(id resoult) {
        if (resoult) {
            SLog(@"BlockResult： %@",resoult);
        }
    } failBlock:^(NSError *error) {
        if (error) {
            SLog(@"BlockError： %@",error);
        }
    }];
}
- (IBAction)successAction_124:(id)sender {
    SLog(@"点击了成功的124-id");
    [self.parms setObject:@(124) forKey:@"packId"];
    [self successGetWeixinInfo:self.requestUrl param:self.parms successBlock:^(id resoult) {
        if (resoult) {
            SLog(@"BlockResult： %@",resoult);
        }
    } failBlock:^(NSError *error) {
        if (error) {
            SLog(@"BlockError： %@",error);
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _parms = [NSMutableDictionary dictionary];
    _requestUrl =@"http://relweb.juexiaotime.com/courseapi/ruserCourseAppraise/v4/getRuserCourseAppraiseByPackId?";
    
    SLog(@"说明： 报错-1016 && 3840 的解决");
    SLog(@"说明： 本质原因： https://www.jianshu.com/p/ed0f877af1e7 ");
    SLog(@"解决方案： https://www.jianshu.com/p/609351473b04");
    SLog(@"相关参考（AFNetWorking(3.0)源码分析（五）——AFHTTPRequestSerializer & AFHTTPResponseSerializer）： https://blog.csdn.net/u013378438/article/details/83992411");
}
- (NSURLSessionTask *)successGetWeixinInfo:(NSString *)url param:(NSMutableDictionary *)pParams successBlock:(ResoultDataBlock)successBlock failBlock:(ErrorBlock)failBlock {
    [pParams setObject:@(1) forKey:@"mockType"];
    [pParams setObject:@(42) forKey:@"versionCode"];
    [pParams setObject:@(true) forKey:@"sourceIpad"];
    [pParams setObject:@"ipad" forKey:@"source"];
    AFHTTPRequestSerializer *tRequestSerializer = [AFHTTPRequestSerializer serializer];
    tRequestSerializer.timeoutInterval = 30;
    tRequestSerializer.stringEncoding = NSUTF8StringEncoding;
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.requestSerializer = tRequestSerializer;
    // 返回结果集自己处理
    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    NSURLSessionTask *session = [sessionManager GET:url parameters:pParams headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSError * tFictitiousError = nil;
        NSDictionary * tDicRes = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:&tFictitiousError];
        SLog(@"实质返回使用api解析的data：%@",tDicRes);
        /*
         NSJSONReadingMutableContainers //  创建可变的数组或字典 接收
         NSJSONReadingMutableLeaves  // 指定在JSON对象可变字符串被创建为NSMutableString的实例
         NSJSONReadingAllowFragments //  指定解析器应该允许不属于的NSArray或NSDictionary中的实例顶层对象
         */
        if (tFictitiousError) { // 如果进来的话tDicRes也是nil 但是判断错误的本质是 error 所以存在error的时候肯定不会有tDicRes的
            SLog(@"服务端返回的结果集已经接收到了，但是使用api解析错误了: %@。",tFictitiousError);
            tFictitiousError = nil;
            // JSONkit解析结果
            tDicRes = [responseObject objectFromJSONDataWithParseOptions:JKParseOptionLooseUnicode error:& tFictitiousError];
            SLog(@"JSONkit解析 --返回参数： %@",tDicRes);
            if (successBlock) {
                successBlock(tDicRes);
            }
        }else{
            SLog(@"使用api解析。");
            id result;
            if ([responseObject isKindOfClass:[NSData class]]) {
                result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            } else {
                result = responseObject;
            }
            if (successBlock) {
                successBlock(result);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failBlock) failBlock(error);
    }];
    
    [session resume];
    return session;
}

- (NSURLSessionTask *)errorGetWeixinInfo:(NSString *)url param:(NSMutableDictionary *)pParams successBlock:(ResoultDataBlock)successBlock failBlock:(ErrorBlock)failBlock {
    [pParams setObject:@(1) forKey:@"mockType"];
    [pParams setObject:@(42) forKey:@"versionCode"];
    [pParams setObject:@(true) forKey:@"sourceIpad"];
    [pParams setObject:@"ipad" forKey:@"source"];
    AFHTTPRequestSerializer *tRequestSerializer = [AFHTTPRequestSerializer serializer];
    tRequestSerializer.timeoutInterval = 30;
    tRequestSerializer.stringEncoding = NSUTF8StringEncoding;
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.requestSerializer = tRequestSerializer;
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    NSURLSessionTask *session = [sessionManager GET:url parameters:pParams headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        id result;
        if ([responseObject isKindOfClass:[NSData class]]) {
            result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        } else {
            result = responseObject;
        }
        if (successBlock) {
            successBlock(result);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failBlock) failBlock(error);
    }];
    [session resume];
    return session;
}

@end
