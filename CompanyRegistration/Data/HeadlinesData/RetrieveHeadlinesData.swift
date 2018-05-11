//
//  RetrieveHeadlinesData.swift
//  CompanyRegistration
//
//  Created by Munir Wanis on 11/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import UIKit
import CoreData

class RetrieveHeadlinesData: RetrieveHeadlines {
    private let context: NSManagedObjectContext
    private let entityIdentifier = "Headlines"
    
    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    
    func getHeadlines() -> Headlines {
        let nullableHeadlinesData = findHeadlines()
        guard let headlinesData = nullableHeadlinesData else {
            fatalError("Headlines came empty!")
        }
        
        return Headlines(
            ownerName: headlinesData.ownerName!,
            email: headlinesData.email!,
            phone: headlinesData.email!,
            companyName: headlinesData.companyName!,
            cnpj: headlinesData.cnpj!,
            startDate: headlinesData.activationDate!,
            isMei: headlinesData.isMei!
        )
    }
    
    private func findHeadlines() -> HeadlinesData? {
        let headlineFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityIdentifier)
        headlineFetch.fetchLimit = 1
        do {
            let result = try context.fetch(headlineFetch).first as? HeadlinesData
            return result
        } catch {
            print("Error generating headlines")
            print(error)
            return nil
        }
    }
    
    private func generateData() {
        do {
            let result = findHeadlines()
            guard result == nil else {
                return
            }
            
            let headlinesContext = NSEntityDescription.insertNewObject(forEntityName: entityIdentifier, into: context) as! HeadlinesData
            
            headlinesContext.activationDate = "Data de Ativação"
            headlinesContext.cnpj = "CNPJ"
            headlinesContext.companyName = "Nome Fantasia"
            headlinesContext.phone = "Telefone"
            headlinesContext.email = "Email"
            headlinesContext.ownerName = "Nome Completo"
            
            try context.save()
        } catch {
            print("Error generating headlines")
            print(error)
        }
    }
}
