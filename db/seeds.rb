# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Publication.delete_all
ProfessionalService.delete_all
Course.delete_all
Report.delete_all
Person.delete_all
Department.delete_all
College.delete_all

admin = Person.create(first_name: 'Admin',
                      last_name: 'Admin',
                      net_id: 'admin',
                      banner_id: '000000000',
                      position: 'global_admin')

admin.add_role(:global_admin)
admin.save

College.create(name:'Anderson School of Management')
College.create(name:'College of Arts & Sciences')
College.create(name:'College of Education')
College.create(name:'College of Fine Arts')
College.create(name:'Graduate Studies')
College.create(name:'Honors College')
College.create(name:'College of Nursing')
College.create(name:'College of Pharmacy')
College.create(name:'College of Population Health')
College.create(name:'College of University Libraries & Learning Sciences')
College.create(name:'School of Architecture and Planning')
College.create(name:'School of Law')
engineering = College.create(name:'School of Engineering')
College.create(name:'School of Medicine')
College.create(name:'School of Public Administration')
College.create(name:'University College')

ece = engineering.departments.build(name: 'Electrical and Computer Engineering')
engineering.departments.build(name: 'Mechanical Engineering')
engineering.departments.build(name: 'Computer Science')
engineering.departments.build(name: 'Chemical Engineering')
engineering.save

greg = Person.create( first_name: 'Gregory',
                      last_name: 'Heileman',
                      net_id: 'heileman',
                      position: 'faculty',
                      banner_id: '0000003',
                      department: ece)
