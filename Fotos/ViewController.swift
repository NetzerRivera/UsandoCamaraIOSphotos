//
//  ViewController.swift
//  Fotos
//
//  Created by Netzer Rivera on 06/01/16.
//  Copyright © 2016 Netzer Rivera. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var fotoVista: UIImageView!
    @IBOutlet weak var camaraBoton: UIButton!
    
    private let miPicker = UIImagePickerController()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if !UIImagePickerController.isSourceTypeAvailable(.Camera){
        
        camaraBoton.hidden = true
        
        }
        miPicker.delegate =  self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func camaraMétodo() {
        
        miPicker.sourceType = UIImagePickerControllerSourceType.Camera
        presentViewController(miPicker, animated: true, completion: nil)
        
    }

    @IBAction func albumMetodo() {
        
        miPicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(miPicker, animated: true, completion: nil)
        
        
        
    }
    
    //metodo del delegado
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        fotoVista.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    @IBAction func guardarMetodo() {
        
        UIImageWriteToSavedPhotosAlbum(fotoVista.image!, nil, nil, nil)
        
        let alerta = UIAlertController(title: "Listo !", message: "Foto guardada en el álbum", preferredStyle: .Alert)
        
        let accionOK = UIAlertAction(title: "OK", style: .Default, handler: {accion in})
        
        
        alerta.addAction(accionOK)
        self.presentViewController(alerta, animated: true, completion: nil)
        
        
        
    }
}

