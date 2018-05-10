//
//  RetrieveContactsDAta.swift
//  CompanyRegistration
//
//  Created by Munir Wanis on 09/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import UIKit
import CoreData

extension CompanyData {
    var isEmpty: Bool {
        return (ownerName == nil || email == nil || phone == nil || companyName == nil || cnpj == nil || activationDate == nil)
    }
}

class RetrieveContactsData: RetrieveContacts {
    private let companyContext: CompanyData
    private let context: NSManagedObjectContext
    private let entityIdentifier = "Company"
    
    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        let companyEntity = NSEntityDescription.entity(forEntityName: entityIdentifier, in: context)!
        companyContext = CompanyData(entity: companyEntity, insertInto: context)
    }
    
    func getCompanies() -> [Company] {
        let companyFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityIdentifier)
        do {
            var companyData = try context.fetch(companyFetch) as? [CompanyData]
            
            if let removableIndex = companyData?.index(where: { $0.isEmpty }) {
                companyData?.remove(at: removableIndex)
            }
            
            let companies = companyData?.compactMap {
                Company(ownerName: $0.ownerName!, email: $0.email!, phone: $0.phone!, companyName: $0.companyName!, cnpj: $0.cnpj!, activationDate: $0.activationDate!, isMei: $0.isMei)
            } ?? []
            return companies
            
        } catch {
            print("Error fetching companies")
            print(error)
            return []
        }
    }
    
    func getCompany(from email: String) -> Company? {
        let companyFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityIdentifier)
        companyFetch.fetchLimit = 1
        companyFetch.predicate = NSPredicate(format: "email = %@", email)
        do {
            let result = try context.fetch(companyFetch).first as? CompanyData
            guard let companyData = result else {
                return nil
            }
            return Company(ownerName: companyData.ownerName!, email: companyData.email!, phone: companyData.phone!, companyName: companyData.companyName!, cnpj: companyData.cnpj!, activationDate: companyData.activationDate!, isMei: companyData.isMei)
        } catch {
            print("Error fetching company")
            print(error)
        }
        return nil
    }
    
    func insert(_ company: Company) -> Bool {
//        let companyContext = NSEntityDescription.insertNewObject(forEntityName: entityIdentifier, into: context) as! CompanyData
//        companyContext.setValue(company.activationDate, forKey: "activationDate")
//        companyContext.setValue(company.cnpj, forKey: "cnpj")
//        companyContext.setValue(company.companyName, forKey: "companyName")
//        companyContext.setValue(company.email, forKey: "email")
//        companyContext.setValue(company.isMei, forKey: "isMei")
//        companyContext.setValue(company.ownerName, forKey: "ownerName")
//        companyContext.setValue(company.phone, forKey: "phone")
        
        companyContext.activationDate = company.activationDate
        companyContext.cnpj = company.cnpj
        companyContext.companyName = company.companyName
        companyContext.email = company.email
        companyContext.isMei = company.isMei
        companyContext.ownerName = company.ownerName
        companyContext.phone = company.phone
        do {
            try context.save()
        } catch {
            print("Could not save new Company")
            print(error)
            return false
        }
        return true
    }
    
    func delete(_ company: Company) -> Bool {
        let companyFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityIdentifier)
        companyFetch.fetchLimit = 1
        companyFetch.predicate = NSPredicate(format: "email = %@", company.email)
        
        do {
            guard let result = try context.fetch(companyFetch).first as? NSManagedObject else {
                return false
            }
            context.delete(result)
            try context.save()
        } catch {
            print("Error deleting company")
            print(error)
            return false
        }
        return true
    }
}
