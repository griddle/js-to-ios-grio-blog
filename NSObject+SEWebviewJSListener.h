//
//  NSObject+SEWebviewJSListener.h
//  StudyEdge
//
//  Created by Garret Riddle on 7/8/12.
//  Copyright (c) 2012 grio. All rights reserved.
//



@interface NSObject (SEWebviewJSListener)


- (void)webviewMessageKey:(NSString *)key value:(NSString *)val;
- (BOOL)shouldOpenLinksExternally;

@end
