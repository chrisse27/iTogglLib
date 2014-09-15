//
//  TGLWorkspaceService.h
//  iTogglLib
//
//  Created by Christoph Krautz on 24/09/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TGLTogglClient.h"
#import "TGLWorkspace.h"

@interface TGLWorkspaceService : NSObject

- (instancetype)initWithClient:(TGLTogglClient *)client;

- (NSArray *)allWorkspaces;
- (NSArray *)projectsOfWorkspace:(TGLWorkspace *)workspace;
- (NSArray *)projectsOfWorkspaceIdentifier:(NSInteger)workspace;

@end
