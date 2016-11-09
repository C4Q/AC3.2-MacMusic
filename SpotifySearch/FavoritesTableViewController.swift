//
//  FavoritesTableViewController.swift
//  SpotifySearch
//
//  Created by Cris on 11/9/16.
//  Copyright © 2016 Cris. All rights reserved.
//

import UIKit

class Favorites {
    let songName: String
    let songID: String
    let songLyricsID: String
    let artistName: String
    
    init(songName: String, songID: String, songLyricsID: String, artistName: String) {
        self.songName = songName
        self.songID = songID
        self.songLyricsID = songLyricsID
        self.artistName = artistName
    }
    
}

class FavoritesTableViewController: UITableViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()

        if let favoriteSongsDict = UserDefaults.standard.value(forKey: "favoriteSongs") as? [[String : String]] {
            favoriteSongsDict.forEach({ (defaultSongObject) in
                if let songName = defaultSongObject["track_name"],
                    let songID = defaultSongObject["track_id"],
                    let songLyricsID = defaultSongObject["track_lyrics_id"],
                    let artistName = defaultSongObject[ "artist_name"] {
                    
                    let favoriteSongs = Favorites(songName: songName, songID: songID, songLyricsID: songLyricsID, artistName: songName)
                }
                
            })
            
        }
        
    }
    


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteSongCellID", for: indexPath) as! FavoritesTableViewCell

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}