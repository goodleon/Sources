//
//  Recent.swift
//  CodeReader
//
//  Created by vulgur on 16/6/23.
//  Copyright © 2016年 MAD. All rights reserved.
//

import Foundation

let RecentRepoFileKey = "recent_repo_file"
let RecentOwnerNameKey = "recent_owner_name"
let RecentRepoNameKey = "recent_repo_name"

class Recent: NSObject, NSCoding{
    
    var file: RepoFile
    var ownerName: String
    var repoName: String
    
    init(file: RepoFile, ownerName: String, repoName: String) {
        self.file = file
        self.ownerName = ownerName
        self.repoName = repoName
    }
    
    // MARK: NSCoding
    convenience required init?(coder aDecoder: NSCoder) {
        guard let file = aDecoder.decodeObject(forKey: RecentRepoFileKey) as? RepoFile,
            let ownerName = aDecoder.decodeObject(forKey: RecentOwnerNameKey) as? String,
            let repoName = aDecoder.decodeObject(forKey: RecentRepoNameKey) as? String
            else {
                return nil
            }
        self.init(file: file, ownerName: ownerName, repoName: repoName)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.file, forKey: RecentRepoFileKey)
        aCoder.encode(self.ownerName, forKey: RecentOwnerNameKey)
        aCoder.encode(self.repoName, forKey: RecentRepoNameKey)
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let anotherRecent = object as? Recent {
            return self.repoName == anotherRecent.repoName
                && self.ownerName == anotherRecent.ownerName
                && self.file == anotherRecent.file
        }
        return false
    }
}
