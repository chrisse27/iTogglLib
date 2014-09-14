//
//  TGLUserService.h
//  iTogglLib
//
//  Created by Christoph Krautz on 14/09/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TGLTogglClient.h"

@class TGLTogglClient;

@interface TGLUserService : NSObject
- (instancetype)initWithClient:(TGLTogglClient *)client;

- (TGLUser *)currentUser;
@end
