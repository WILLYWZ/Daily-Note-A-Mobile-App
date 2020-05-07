//
//  AudioViewController.swift
//  DailyMotion App
//
//  Created by Lyu, Kaiju on 5/1/20.
//  Copyright © 2020 C323 / Spring 2020. All rights reserved.
//
import UIKit
import CoreMIDI
import AVFoundation
import Foundation

class AudioViewController: UIViewController,
                        AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    
    @IBAction func stopAudio(_ sender: Any) {
        //stop recording or playing audio
    }
    
    @IBAction func playAudio(_ sender: Any) {
        //start playing audio
    }
    
    @IBAction func startRecord(_ sender: Any) {
        //start recording audio
    }
    
    // instance variables - from the AVFoundation framework,
    //   these are the main classes providing
    //   audio recording and audio playback capabilities:
    var audioRecorder: AVAudioRecorder?;
    var audioPlayer: AVAudioPlayer?;
    var audioSession: AVAudioSession!;
    var audioName = "audioFile.m4a";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view,
        //    typically from a nib, a xib, or a storyboard.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
            
    }
    
    func setupRecorder() {
        //Setting up recorder for method opertaion
        var recordSettings = [
            AVFormatIDKey: Int(kAudioFormatAppleLossless),
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue,
            AVEncoderBitRateKey: 320000,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey: 44100.0] as [String : Any]
        
        var eRror : NSError?
        
      //  audioRecorder = AVAudioRecorder(url: getURL(), settings: recordSettings as [NSObject: AnyObject], eRror: &eRror)
        
    }
    
    func getURL() -> NSURL {
        //Set up the URL for setUpRecorder using
        
        let path1 = (getDirectory() as NSString).appendingPathComponent(audioName)
        
        let path3 = NSURL(fileURLWithPath: path1)
        
        return path3
    }
    
    func getDirectory() -> String {
        //Set up the file directory for the getURL using
        let path2 = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
            as! [String]
        
        let documentsDirectory = path2[0]
        
        return documentsDirectory
    }
}
