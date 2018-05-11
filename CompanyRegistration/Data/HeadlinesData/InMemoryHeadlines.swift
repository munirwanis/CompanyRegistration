//
//  InMemoryHeadlines.swift
//  CompanyRegistration
//
//  Created by Munir Wanis on 11/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import Foundation

class InMemoryHeadlines: RetrieveHeadlines {
    static var headlines: Headlines = Headlines(ownerName: "Nome Completo", email: "Email", phone: "Telefone", companyName: "Nome Fantasia", cnpj: "CNPJ", startDate: "Data de Ativação", isMei: "É MEI?")
    
    func getHeadlines() -> Headlines {
        return InMemoryHeadlines.headlines
    }
}
