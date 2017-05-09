# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Organization.delete_all
Ad.delete_all

user = User.new
user.email = 'test@example.com'
user.password = 'valid_password'
user.password_confirmation = 'valid_password'
user.save!

organizer = User.new
organizer.email = 'organizer@example.com'
organizer.password = 'awesome'
organizer.password_confirmation = 'awesome'
organizer.user_type = 'organization'
organizer.save!

advertiser = User.new
advertiser.email = 'advertiser@example.com'
advertiser.password = 'awesome'
advertiser.password_confirmation = 'awesome'
advertiser.user_type = 'advertiser'
advertiser.save!

organization_one = Organization.create(name: 'Bowery South', city: 'Atlanta', state: 'Georgia', user_id: user.id, photo_url: 'https://cdn.ticketfly.com/wp-content/themes/bowery/bowerynyc/images/bowery-presents.gif', description: 'You can purchase tickets online by clicking the TICKETS icon on any show page on our site and will be taken to the ticketing site. Tickets to all clubs and some Bowery Presents shows are sold at the venue box offices free of service charges. If tickets do not sell out in advance, they will be sold at the door on the night of the show.')
event = Event.create(name: 'Riverdance', venue: 'Fox Theatre', city: 'Atlanta', state: 'GA', organization_id: organization_one.id, estimated_attendees: 20000, photo_url: 'https://i2.wp.com/www.atlantamusicguide.com/wp-content/uploads/e47a6ac6f910c1686387bbbacaa41eb3.jpg?w=720', deadline: DateTime.strptime("09/01/2009 19:00", "%m/%d/%Y %H:%M"), description: 'The international Irish dance phenomenon is back by popular demand in Riverdance—The 20th Anniversary World Tour. Drawing on Irish traditions, the combined talents of the performers propel Irish dancing and music into the present day, capturing the imagination of audiences across all ages and cultures in an innovative and exciting blend of dance, music and song. Of all the performances to emerge from Ireland – in rock, music, theatre and film—nothing has carried the energy, the sensuality and the spectacle of Riverdance. Riverdance—The 20th Anniversary World Tour is composed by Bill Whelan, produced by Moya Doherty and directed by John McColgan, and comes directly to North America from a sold out run across Europe and Asia.', start_date: DateTime.strptime("09/01/2009 17:00", "%m/%d/%Y %H:%M"), end_date: DateTime.strptime("09/04/2009 17:00", "%m/%d/%Y %H:%M"))

ad_one = Ad.create(size: "eighth-page", price: "5.50", event_id: event.id, photo_url: '#', dimensions: '100 x 200')
ad_two = Ad.create(size: "quarter-page", price: "30.50", event_id: event.id, photo_url: '#', dimensions: '200 x 300')


ad_three = Ad.create(size: "full-page", price: "5.50", event_id: event.id, photo_url: '#', dimensions: '100 x 200', advertiser_id: 'advertiser.id')
ad_four = Ad.create(size: "half-page", price: "30.50", event_id: event.id, photo_url: '#', dimensions: '200 x 300', advertiser_id: 'advertiser.id')


