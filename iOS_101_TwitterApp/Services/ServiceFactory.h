//
// Created by tomaszj on 17.03.2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@protocol TwitterServiceProtocol;


@interface ServiceFactory : NSObject

- (id<TwitterServiceProtocol>)onlineTwitterService;
- (id<TwitterServiceProtocol>)offlineTwitterService;

@end