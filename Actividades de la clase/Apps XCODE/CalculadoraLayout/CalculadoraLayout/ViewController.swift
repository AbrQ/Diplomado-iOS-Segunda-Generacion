//
//  ViewController.swift
//  CalculadoraLayout
//
//  Created by Abraham Quezada on 20/08/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelText: UILabel!
    
    var primerNumeroInfo: String = ""
    var segundoNumeroInfo: String = ""
    var simboloInfo: String = ""
    
    var primerNumero: Bool = true
    var simbolo: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let textoIntroducido = labelText.text!
        let textoEtiqueta = sender.titleLabel?.text
        
        if let texto = textoEtiqueta{
            switch texto{
            case "+","-","x","/":
                if simbolo{
                    return
                }
                simboloInfo = texto
                primerNumero = false
                simbolo = true
                labelText.text = "\(textoIntroducido) \(simboloInfo)"
                break
            case "=":
                primerNumero = true
                simbolo = false
                let resultado = calculo()
                labelText.text = "\(resultado)"
                break
                
            default:
                if primerNumero{
                    primerNumeroInfo = "\(primerNumeroInfo)\(texto)"
                }else{
                    segundoNumeroInfo = "\(segundoNumeroInfo)\(texto)"
                }
                labelText.text = "\(textoIntroducido)\(texto)"
                break
            }
        }
    }
    
    
    func calculo() -> Double{
        let primerNumero = Double(primerNumeroInfo)!
        let segundoNumero = Double(segundoNumeroInfo)!
        
        primerNumeroInfo = ""
        segundoNumeroInfo = ""
        
        switch simboloInfo{
        case "+":
            return primerNumero + segundoNumero
        case "-":
            return primerNumero - segundoNumero
        case "x":
            return primerNumero * segundoNumero
        case "/":
            return primerNumero / segundoNumero
        default:
            return 0
        }
    }
    
    @IBAction func clearScreen(_ sender: UIButton) {
        
        labelText.text = ""
        primerNumeroInfo = ""
        segundoNumeroInfo = ""
        simboloInfo = ""
        
        primerNumero = true
        simbolo = false
        
    }
    
    
}

