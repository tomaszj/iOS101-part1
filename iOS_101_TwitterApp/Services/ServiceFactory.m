//
// Created by tomaszj on 17.03.2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "ServiceFactory.h"
#import "TwitterServiceProtocol.h"
#import "OfflineTwitterService.h"
#import "OnlineTwitterService.h"


@implementation ServiceFactory {

}

- (id <TwitterServiceProtocol>)onlineTwitterService {
    return [OnlineTwitterService new];
}

- (id <TwitterServiceProtocol>)offlineTwitterService {
    return [OfflineTwitterService new];
}


@end