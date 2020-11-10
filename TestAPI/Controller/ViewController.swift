//
//  ViewController.swift
//  TestAPI
//
//  Created by Bruno Silva on 09/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var sunset: UILabel!
    @IBOutlet weak var sunrise: UILabel!
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - 1 criar a url base
        let urlBase = "https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400"
        pegaDados(da: urlBase)
    }
    
    //MARK: - Responsavel por pegar os dados da API
    private func pegaDados(da url: String) {
        
        //MARK: Criando uma tarefa
        URLSession.shared.dataTask(with: URL(string: url)!) { (dados, resposta, error) in
            
            //MARK: Tratando os dados
            guard let dadosRecebidos = dados, error == nil else {
                print("Aconteceu esse erro.. 😔, \(error?.localizedDescription)")
                return
            }
            
            var resposta: Resposta?
            
            //MARK: Convertendo os dados
            do {
                resposta = try JSONDecoder().decode(Resposta.self, from: dadosRecebidos)
            } catch {
                print("Olha, não consegui converte os seus dados.. 😭")
            }
            
            //MARK: Recebendo os valores convertidos
            guard let valoresConvertidos = resposta else {
                print("Não recebi nenhum dado.. 🤔")
                return
            }
            
            DispatchQueue.main.async {
                self.sunset.text = valoresConvertidos.results.sunset
                self.sunrise.text = valoresConvertidos.results.sunrise
            }
            
        }.resume()
    }
}

//{
//   "results":{
//      "sunrise":"6:51:29 AM",
//      "sunset":"5:11:54 PM",
//      "solar_noon":"12:01:42 PM",
//      "day_length":"10:20:25",
//      "civil_twilight_begin":"6:24:16 AM",
//      "civil_twilight_end":"5:39:08 PM",
//      "nautical_twilight_begin":"5:53:14 AM",
//      "nautical_twilight_end":"6:10:09 PM",
//      "astronomical_twilight_begin":"5:22:44 AM",
//      "astronomical_twilight_end":"6:40:39 PM"
//   },
//   "status":"OK"
//}

