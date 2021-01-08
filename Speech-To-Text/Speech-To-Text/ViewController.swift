//
//  ViewController.swift
//  Speech-To-Text
//
//  Created by taehy.k on 2021/01/07.
//

import UIKit
import Speech

class ViewController: UIViewController, SFSpeechRecognizerDelegate {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "ko-KR"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        speechRecognizer?.delegate = self
    }

    @IBAction func speechToText(_ sender: Any) {
        if audioEngine.isRunning {
            audioEngine.stop()
            recognitionRequest?.endAudio()
            button.isEnabled = false
            button.setTitle("Start Recording", for: .normal)
        } else {
            startRecording()
            button.setTitle("Stop Recording", for: .normal)
        }
    }
    
    func startRecording() {
            
            if recognitionTask != nil {
                recognitionTask?.cancel()
                recognitionTask = nil
            }
            
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(AVAudioSession.Category.record)
                try audioSession.setMode(AVAudioSession.Mode.measurement)
                try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
            } catch {
                print("audioSession properties weren't set because of an error.")
            }
            
            recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
            
            let inputNode = audioEngine.inputNode
 
            
            guard let recognitionRequest = recognitionRequest else {
                fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
            }
            
            recognitionRequest.shouldReportPartialResults = true
            
            recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in
                
                var isFinal = false
                
                if result != nil {
                    
                    self.textView.text = result?.bestTranscription.formattedString
                    isFinal = (result?.isFinal)!
                }
                
                if error != nil || isFinal {
                    self.audioEngine.stop()
                    inputNode.removeTap(onBus: 0)
                    
                    self.recognitionRequest = nil
                    self.recognitionTask = nil
                    
                    self.button.isEnabled = true
                }
            })
            
            let recordingFormat = inputNode.outputFormat(forBus: 0)
            inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
                self.recognitionRequest?.append(buffer)
            }
            
            audioEngine.prepare()
            
            do {
                try audioEngine.start()
            } catch {
                print("audioEngine couldn't start because of an error.")
            }
            
            textView.text = "Say something, I'm listening!"
            
        }
        
        
       
        func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
            if available {
                button.isEnabled = true
            } else {
                button.isEnabled = false
            }
        }

}

