package propertymanagement

class Address {

    String line1
    String line2
    String city
    String state
    String zip

    static constraints = {
        line1()
        line2()
        city()
        state()
        zip()
    }

    String toString() {
        "${line1} ${line2} ${city} ${state} ${zip}"
    }
}
