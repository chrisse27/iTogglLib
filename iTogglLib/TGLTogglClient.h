//
//  TGLTogglClient.h
//  iToggl
//
//  Created by Christoph Krautz on 04/05/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TGLTimeEntry.h"
#import "TGLUser.h"

FOUNDATION_EXPORT NSString * const TogglApiBaseUrl;
FOUNDATION_EXPORT NSString * const TogglApiToken;

@interface TGLTogglClient : NSObject

@property (readonly, strong) NSString *username;
@property (readonly, strong) NSString *password;

+ (NSDateFormatter *)formatter;

- (id)initWithUserName:(NSString*)username AndPassword:(NSString *)password;

- (TGLUser *)currentUser;
- (TGLTimeEntry *)currentTimeEntry;
- (NSArray *)timeEntriesBetween:(NSDate *)start And:(NSDate *)end;
- (TGLTimeEntry *)createAndStartTimeEntry:(TGLTimeEntry *)entry;
- (TGLTimeEntry *)stopTimeEntry:(TGLTimeEntry *)entry;

@end
