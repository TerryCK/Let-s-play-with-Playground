
class Person {
    var age: Int
    var residence: Residence?
    
    init(age: Int, resdience: Residence?) {
        self.age = age
        self.residence = resdience
    }
}


class Residence {
    var address: Address?
    
}

class Address {
    var apartmentNumber: String? = "3"
    var streetName: String
    var buildingNumber: String
    
    init(apartmentNumber: String, streetName: String, buildingNumber: String) {
        self.apartmentNumber = apartmentNumber
        self.streetName = streetName
        self.buildingNumber = buildingNumber
    }
}


let addressInstance: Address = Address(apartmentNumber: "5B", streetName: "忠孝路", buildingNumber: "8號")
let residenceInstance: Residence = Residence()
residenceInstance.address = addressInstance

let personInstance: Person = Person(age: 10, resdience: residenceInstance)



if let theResidence = personInstance.residence {
    if let theAddress = theResidence.address {
        if let theApartmentNumber = theAddress.apartmentNumber {
            print("This Residence has apartmentNumber \(theApartmentNumber).")
        }
    }
}

