# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



        # Providers
michael = Provider.create(first_name: "Michael", last_name: "Wilson")
user = User.create(email:'admin@purelife.com', first_name:'Admin', last_name:'Nimda', 
        password: '123456', password_confirmation: '123456', is_admin: true, role: 1, provider_id: michael.id)
user.posts.create(title: 'Uncertainty', content: "&nbsp;&nbsp;&nbsp;&nbsp;In times of uncertainty one must take steps or even leaps of faith not knowing where it will take them on their journey. We are all now living in an uncertain time and not sure of where life will take us. People are taking many steps into uncharted territory at this time, not knowing if they will fall or rise. To some this is exhilarating, to most it is stressful creating uncertainty. <br /><br />&nbsp;&nbsp;&nbsp;&nbsp;Recently I have embraced change and stepped away from the clinical nursing setting to better serve my family, our community, and myself. This has brought excitement as well as fear. Day to day I find more reasons to remind myself to breath, to be grateful for those small rituals of joy that have not changed like everything else, and to embrace the uncertainty of change. You have taken many steps to get where you are now. Don't forget that you have made it here upon your own personal power and volition . You didn't fall to this spot in time. You journeyed here long into the night and you will continue strong, resilient, and united into the day. You make your life anew with every breath you take, every word you speak, and every wish you make. <br /><br />&nbsp;&nbsp;&nbsp;&nbsp;As Victor E. Frankl once said, “When we are no longer able to change a situation-we are challenged to change ourselves.” You are healthy, happy, and whole as you are . Blessed you are.<br /><br />
#selfcare #selfblessing #growthmindset #changeisgood
")




        # Patients
sickly = Patient.create(first_name: "Sickly", last_name: 'McSickFace')
user = User.create(email: 'sickly@sickmail.com', first_name: 'Sickly', last_name: 'McSickFace', 
        password: '123456', password_confirmation: '123456', is_admin: false, role: 0, patient_id: sickly.id)


rocky = Patient.create(first_name: "Rocky", last_name: 'BrokeArm')
user = User.create(email: 'rocky@sickmail.com', first_name: 'Rocky', last_name: 'BrokeArm', 
        password: '123456', password_confirmation: '123456', is_admin: false, role: 0, patient_id: rocky.id)        




