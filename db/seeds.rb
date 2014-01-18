# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Bank.count == 0
	Bank.create(name: 'Ponte Vedra Branch', phone: "(904) 564-8060", address: "155 Corridor Rd. Ponte Vedra, FL 32082")
	#, latitude: 30.1948971, longitude: -81.3817563)
	Bank.create(name: 'Jacksonville Beach Branch', phone: "(904) 564-8220", address: "2300 S 3rd St. Jacksonville Beach, FL 32250")
	#, latitude: 30.26874, longitude: -81.38906700000001)
	Bank.create(name: 'San Pablo Branch', phone: "(904) 564-8400", address: "14381 Beach Blvd. Jacksonville, FL 32250")
	#, latitude: 30.288558, longitude: -81.43723699999998)
	Bank.create(name: 'Gate Parkway Branch', phone: "(904) 564-8600", address: "10060 Skinner Lake Dr. Jacksonville, FL 32246")
	#, latitude: 30.251725, longitude: -81.53733799999998)
end