//
//  TGLProjectService.h
//  iTogglLib
//
//  Created by Christoph Krautz on 14/09/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TGLTogglClient.h"

@interface TGLProjectService : NSObject

- (instancetype)initWithClient:(TGLTogglClient *)client;

- (NSArray *)allProjects;
- (NSDictionary *)allProjectsByIdentifier;

@end
