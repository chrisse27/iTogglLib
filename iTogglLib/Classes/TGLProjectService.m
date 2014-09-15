//
//  TGLProjectService.m
//  iTogglLib
//
//  Created by Christoph Krautz on 14/09/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import "TGLProjectService.h"

#import "TGLProject.h"
#import "TGLProject+Json.h"

NSString * const TGLProjectServiceUrl = @"projects";

@interface TGLProjectService ()
@property (strong) TGLTogglClient *client;
@end

@implementation TGLProjectService

- (instancetype)initWithClient:(TGLTogglClient *)client
{
    self = [super init];
    
    if (self) {
        _client = client;
    }
    
    return self;
}

- (NSArray *)allProjects
{
    NSArray *workspaces = [self.client.workspace allWorkspaces];
    
    NSMutableArray *projects = [NSMutableArray array];
    for (TGLWorkspace *workspace in workspaces) {
        NSArray *projectsOfWorkspace = [self.client.workspace projectsOfWorkspace:workspace];
        [projects addObjectsFromArray:projectsOfWorkspace];
    }
    
    return projects;
}

- (NSDictionary *)allProjectsByIdentifier
{
    NSArray *projects = [self allProjects];
    
    NSMutableDictionary *projectsByIdentifier = [NSMutableDictionary dictionaryWithCapacity:projects.count];
    for (TGLProject *project in projects) {
        [projectsByIdentifier setObject:project forKey:[NSNumber numberWithInteger: project.identifier]];
    }
    
    return projectsByIdentifier;
}

@end
