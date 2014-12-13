//
//  TGLProjectService.m
//  iTogglLib
//
//  Created by Christoph Krautz on 14/09/14.
//  Copyright 2014 Christoph Krautz
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
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
