//
//  TGLWorkspace+Json.m
//  iTogglLib
//
//  Created by Christoph Krautz on 25/09/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import "TGLWorkspace+Json.h"

#import "TGLWorkspace+Protected.h"

@implementation TGLWorkspace (Json)

+ (TGLWorkspace *)workspaceFromDictionary:(NSDictionary *)dictionary
{
    TGLWorkspace *workspace = [[TGLWorkspace alloc] init];
    
    workspace.identifier = [[dictionary objectForKey:@"id"] integerValue];
    workspace.name = [dictionary objectForKey:@"name"];
    
    return workspace;
}

- (NSDictionary *)dictionary
{
    return nil;
}

@end
