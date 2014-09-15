//
//  TGLWorkspaceService.m
//  iTogglLib
//
//  Created by Christoph Krautz on 24/09/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import "TGLWorkspaceService.h"

#import "TGLWorkspace.h"
#import "TGLWorkspace+Json.h"
#import "TGLProject.h"
#import "TGLProject+Json.h"

NSString * const TGLWorkspaceServiceUrl = @"workspaces";
NSString * const TGLWorkspaceProjectsUrl = @"/%ld/projects";

@interface TGLWorkspaceService ()
@property (strong) TGLTogglClient *client;
@end

@implementation TGLWorkspaceService

- (instancetype)initWithClient:(TGLTogglClient *)client
{
    self = [super init];
    
    if (self) {
        _client = client;
    }
    
    return self;
}

- (NSArray *)allWorkspaces
{
    NSMutableString *url = [NSMutableString stringWithString:TGLWorkspaceServiceUrl];
    
    NSArray *workspaceDicts = [self.client listByGetWithRelativeURL:url];
    if (!workspaceDicts) {
        NSLog(@"Could not retrieve workspaces.");
        return nil;
    }
    
    NSMutableArray *workspaces = [NSMutableArray arrayWithCapacity:workspaceDicts.count];
    for (NSDictionary *workspaceDict in workspaceDicts) {
        TGLWorkspace *workspace = [TGLWorkspace workspaceFromDictionary:workspaceDict];
        [workspaces addObject:workspace];
    }
    
    return workspaces;
}

- (NSArray *)projectsOfWorkspace:(TGLWorkspace *)workspace {
    return [self projectsOfWorkspaceIdentifier:workspace.identifier];
}

- (NSArray *)projectsOfWorkspaceIdentifier:(NSInteger)identifier {
    NSMutableString *url = [NSMutableString stringWithString:TGLWorkspaceServiceUrl];
    [url appendFormat:TGLWorkspaceProjectsUrl, (long)identifier];
    
    NSArray *projectDicts = [self.client listByGetWithRelativeURL:url];
    if (!projectDicts) {
        NSLog(@"Could not retrieve projects of workspace.");
        return nil;
    }
    
    NSMutableArray *projects = [NSMutableArray arrayWithCapacity:projectDicts.count];
    for (NSDictionary *projectDict in projectDicts) {
        TGLProject *project = [TGLProject projectFromDictionary:projectDict];
        [projects addObject:project];
    }
    
    return projects;
}

@end
