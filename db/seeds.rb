# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



michael = Provider.create(first_name: "Michael", last_name: "Wilson")

user = User.create(email:'admin@purelife.com', first_name:'Admin', last_name:'Nimda', 
        password: '123456', password_confirmation: '123456', is_admin: true, role: 1, provider_id: michael.id)




sickly = Patient.create(first_name: "Sickly", last_name: 'McSickFace')

user = User.create(email: 'sickly@sickmail.com', first_name: 'Sickly', last_name: 'McSickFace', 
        password: '123456', password_confirmation: '123456', is_admin: false, role: 0, patient_id: sickly.id)





