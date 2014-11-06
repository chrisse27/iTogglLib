//
//  TGLWorkspace+Json.m
//  iTogglLib
//
//  Created by Christoph Krautz on 25/09/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import "TGLWorkspace+Json.h"

static NSString * const TGLJsonKeyWorkspaceIdentifier = @"id";
static NSString * const TGLJsonKeyWorkspaceName = @"name";

@implementation TGLWorkspace (Json)

+ (TGLWorkspace *)workspaceFromDictionary:(NSDictionary *)dictionary
{
    TGLWorkspace *workspace = [[TGLWorkspace alloc] init];
    
    workspace.identifier = [[dictionary objectForKey:TGLJsonKeyWorkspaceIdentifier] integerValue];
    workspace.name = [dictionary objectForKey:TGLJsonKeyWorkspaceName];
    
    return workspace;
}

@end
