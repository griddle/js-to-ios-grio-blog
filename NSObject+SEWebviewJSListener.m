//
//  NSObject+SEWebviewJSListener.m
//  StudyEdge
//
//  Created by Garret Riddle on 7/8/12.
//  Copyright (c) 2012 grio. All rights reserved.
//

#import "NSObject+SEWebviewJSListener.h"

@implementation NSObject (SEWebviewJSListener)


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSString *requestString = [[[request URL] absoluteString] stringByReplacingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    NSArray *requestArray = [requestString componentsSeparatedByString:@":##sendToApp##"];
    
    if ([requestArray count] > 1){
        NSString *requestPrefix = [[requestArray objectAtIndex:0] lowercaseString];
        NSString *requestMssg = ([requestArray count] > 0) ? [requestArray objectAtIndex:1] : @"";
        [self webviewMessageKey:requestPrefix value:requestMssg];   
        return NO;
    }
    else if (navigationType == UIWebViewNavigationTypeLinkClicked && [self shouldOpenLinksExternally]) {
        // open links in safari
        [[UIApplication sharedApplication] openURL:[request URL]];
        return NO;
    }
    return YES;
}


- (void)webviewMessageKey:(NSString *)key value:(NSString *)val {}

- (BOOL)shouldOpenLinksExternally {
    return YES;
}

@end
