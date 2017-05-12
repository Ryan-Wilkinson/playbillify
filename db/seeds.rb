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

organization_one = Organization.create(name: 'Bowery South', city: 'Atlanta', state: 'Georgia', user_id: organizer.id, description: 'You can purchase tickets online by clicking the TICKETS icon on any show page on our site and will be taken to the ticketing site. Tickets to all clubs and some Bowery Presents shows are sold at the venue box offices free of service charges. If tickets do not sell out in advance, they will be sold at the door on the night of the show.')

organization_two = Organization.create(name: 'Seven Stages', city: 'Atlanta', state: 'Georgia', user_id: organizer.id, description: '7 Stages is a professional, non-profit theatre company devoted to engaging artists and audiences by focusing on the social, political, and spiritual values of contemporary culture. 7 Stages gives primary emphasis to international work and the support and development of new plays, new playwrights, and new methods of collaboration.')

organization_two = Organization.create(name: 'Fox Theatre', city: 'Atlanta', state: 'Georgia', user_id: organizer.id, description: '7 Stages is a professional, non-profit theatre company devoted to engaging artists and audiences by focusing on the social, political, and spiritual values of contemporary culture. 7 Stages gives primary emphasis to international work and the support and development of new plays, new playwrights, and new methods of collaboration.')

event = Event.create(name: 'Riverdance', venue: 'Fox Theatre', city: 'Atlanta', state: 'GA', organization_id: organization_one.id, estimated_attendees: 20000, deadline: DateTime.strptime("09/01/2009 19:00", "%m/%d/%Y %H:%M"), description: 'The international Irish dance phenomenon is back by popular demand in Riverdance—The 20th Anniversary World Tour. Drawing on Irish traditions, the combined talents of the performers propel Irish dancing and music into the present day, capturing the imagination of audiences across all ages and cultures in an innovative and exciting blend of dance, music and song. Of all the performances to emerge from Ireland – in rock, music, theatre and film—nothing has carried the energy, the sensuality and the spectacle of Riverdance. Riverdance—The 20th Anniversary World Tour is composed by Bill Whelan, produced by Moya Doherty and directed by John McColgan, and comes directly to North America from a sold out run across Europe and Asia.', start_date: DateTime.strptime("10/15/2017 17:00", "%m/%d/%Y %H:%M"), end_date: DateTime.strptime("10/25/2017 17:00", "%m/%d/%Y %H:%M"))


event_two = Event.create(name: 'Netherworld Haunted House', venue: 'Netherworld', city: 'Norcross', state: 'GA', organization_id: organization_one.id, estimated_attendees: 20000, deadline: DateTime.strptime("09/01/2009 19:00", "%m/%d/%Y %H:%M"), description: 'Netherworld Haunted House is a self-guided, walk-through haunted attraction located in Atlanta, Georgia that began in 1997. This seasonal Halloween based event is known for its over-the-top special effects, intense make-up, elaborate costuming, skilled stunt actors, unique monsters and robotic creatures, unusual themes, and chilling detail.', start_date: DateTime.strptime("09/22/2017 17:00", "%m/%d/%Y %H:%M"), end_date: DateTime.strptime("11/03/2017 17:00", "%m/%d/%Y %H:%M"))

event_three = Event.create(name: 'Mamma Mia', venue: 'Fox Theatre', city: 'Atlanta', state: 'GA', organization_id: organization_one.id, estimated_attendees: 20000, deadline: DateTime.strptime(/15/2017 19:00", "%m/%d/%Y %H:%M"), description: "Based on the songs of the Swedish pop group ABBA, Mama Mia , is set on the Greek island of Kalokairi. A 20-year-old woman named Sophie wants to have a traditional wedding and hopes her father will walk her down the aisle, but there's one problem: she has no idea who her father is! With help from her mother’s journal, she narrows the possibilities down to three men, and hilarity ensues as they all claim her as their child! Featuring all the hits you know and love, like 'Dancing Queen', 'Thank You for the Music', and, of course, 'Mamma Mia!', this show will have you singing and dancing in the aisles!", start_date: DateTime.strptime("06/13/2017 17:00", "%m/%d/%Y %H:%M"), end_date: DateTime.strptime("06/18/2017 17:00", "%m/%d/%Y %H:%M"))

event_four = Event.create(name: 'Paw Patrol Live!', venue: 'Fox Theatre', city: 'Atlanta', state: 'GA', organization_id: organization_one.id, estimated_attendees: 20000, deadline: DateTime.strptime(/15/2017 19:00", "%m/%d/%Y %H:%M"), description: "Based on the songs of the Swedish pop group ABBA, Mama Mia , is set on the Greek island of Kalokairi. A 20-year-old woman named Sophie wants to have a traditional wedding and hopes her father will walk her down the aisle, but there's one problem: she has no idea who her father is! With help from her mother’s journal, she narrows the possibilities down to three men, and hilarity ensues as they all claim her as their child! Featuring all the hits you know and love, like 'Dancing Queen', 'Thank You for the Music', and, of course, 'Mamma Mia!', this show will have you singing and dancing in the aisles!", start_date: DateTime.strptime("07/08/2009 17:00", "%m/%d/%Y %H:%M"), end_date: DateTime.strptime("07/09/2017 17:00", "%m/%d/%Y %H:%M"))

business_one = Business.create(business_name: "Willy's Mexicana Grill", business_address1: "650 Ponce De Leon Ave, NE", business_city: "Atlanta", business_state: "Georgia", business_zip: "30308", business_phone: "(678) 704-4217", user_id: advertiser.id )

ad_one = Ad.create(size: "eighth-page", price: "30.00", event_id: event.id, dimensions: '100 x 200')
ad_two = Ad.create(size: "quarter-page", price: "75.00", event_id: event.id, dimensions: '200 x 300')
ad_one = Ad.create(size: "full-page", price: "175.00", event_id: event.id, dimensions: '100 x 200')
ad_two = Ad.create(size: "quarter-page", price: "50.00", event_id: event.id, dimensions: '200 x 300')
ad_three = Ad.create(size: "full-page", price: "200.00", event_id: event.id, dimensions: '100 x 200', updated_at: DateTime.strptime("07/09/2017 17:00", "%m/%d/%Y %H:%M"), advertiser_id: 'advertiser.id')

ad_four = Ad.create(size: "half-page", price: "115.00", event_id: event.id, dimensions: '200 x 300')
ad_five = Ad.create(size: "eighth-page", price: "30.00", event_id: event.id, dimensions: '100 x 200', advertiser_id: 'advertiser.id')
ad_six = Ad.create(size: "quarter-page", price: "75.00", event_id: event.id, dimensions: '200 x 300', advertiser_id: 'advertiser.id')
ad_seven = Ad.create(size: "full-page", price: "175.00", event_id: event.id, dimensions: '100 x 200')
ad_eight = Ad.create(size: "quarter-page", price: "50.00", event_id: event.id, dimensions: '200 x 300', advertiser_id: 'advertiser.id')
ad_nine = Ad.create(size: "full-page", price: "200.00", event_id: event.id, dimensions: '100 x 200', advertiser_id: 'advertiser.id')
ad_ten = Ad.create(size: "half-page", price: "115.00", event_id: event.id, dimensions: '200 x 300', advertiser_id: 'advertiser.id')
ad_twenty_one = Ad.create(size: "half-page", price: "115.00", event_id: event.id, dimensions: '200 x 300', advertiser_id: 'advertiser.id')

ad_eleven = Ad.create(size: "full-page", price: "175.00", event_id: event_two.id, dimensions: '100 x 200', advertiser_id: 'advertiser.id')
ad_twelve = Ad.create(size: "quarter-page", price: "50.00", event_id: event_two.id, dimensions: '200 x 300', advertiser_id: advertiser.id)
ad_twenty_two = Ad.create(size: "full-page", price: "175.00", event_id: event_two.id, dimensions: '100 x 200', advertiser_id: 'advertiser.id')
ad_twenty_three = Ad.create(size: "quarter-page", price: "50.00", event_id: event_two.id, dimensions: '200 x 300', advertiser_id: advertiser.id)

ad_thirteen = Ad.create(size: "full-page", price: "200.00", event_id: event_three.id, dimensions: '100 x 200', advertiser_id: advertiser.id)
ad_fourteen = Ad.create(size: "half-page", price: "115.00", event_id: event_three.id, dimensions: '200 x 300', updated_at: DateTime.strptime("02/08/2017 17:00", "%m/%d/%Y %H:%M"), advertiser_id: 'advertiser.id')
ad_fifteen = Ad.create(size: "eighth-page", price: "30.00", event_id: event_three.id, dimensions: '100 x 200', advertiser_id: 'advertiser.id')
ad_sixteen = Ad.create(size: "quarter-page", price: "75.00", event_id: event_three.id, dimensions: '200 x 300', updated_at: DateTime.strptime("02/04/2017 17:00", "%m/%d/%Y %H:%M"), advertiser_id: 'advertiser.id')
ad_seventeen = Ad.create(size: "full-page", price: "175.00", event_id: event_three.id, dimensions: '100 x 200', updated_at: DateTime.strptime("02/02/2017 17:00", "%m/%d/%Y %H:%M"), advertiser_id: 'advertiser.id')
ad_eighteen = Ad.create(size: "quarter-page", price: "50.00", event_id: event_three.id, dimensions: '200 x 300', updated_at: DateTime.strptime("02/22/2017 17:00", "%m/%d/%Y %H:%M"), advertiser_id: 'advertiser.id')
ad_nineteen = Ad.create(size: "full-page", price: "200.00", event_id: event_three.id, dimensions: '100 x 200', updated_at: DateTime.strptime("03/01/2017 17:00", "%m/%d/%Y %H:%M"), advertiser_id: 'advertiser.id')
ad_twenty = Ad.create(size: "half-page", price: "115.00", event_id: event_three.id, dimensions: '200 x 300', advertiser_id: 'advertiser.id')
ad_twenty_three = Ad.create(size: "full-page", price: "200.00", event_id: event_three.id, dimensions: '100 x 200', updated_at: DateTime.strptime("02/07/2017 17:00", "%m/%d/%Y %H:%M"), advertiser_id: 'advertiser.id')
ad_twenty_five = Ad.create(size: "half-page", price: "115.00", event_id: event_three.id, dimensions: '200 x 300', advertiser_id: 'advertiser.id')
ad_twenty_six = Ad.create(size: "eighth-page", price: "30.00", event_id: event_three.id, dimensions: '100 x 200', advertiser_id: 'advertiser.id')
ad_twenty_seven = Ad.create(size: "quarter-page", price: "75.00", event_id: event_three.id, dimensions: '200 x 300', updated_at: DateTime.strptime("02/04/2017 17:00", "%m/%d/%Y %H:%M"), advertiser_id: 'advertiser.id')
ad_twenty_eight = Ad.create(size: "full-page", price: "175.00", event_id: event_three.id, dimensions: '100 x 200', updated_at: DateTime.strptime("02/02/2017 17:00", "%m/%d/%Y %H:%M"), advertiser_id: 'advertiser.id')
ad_twenty_nine = Ad.create(size: "quarter-page", price: "50.00", event_id: event_three.id, dimensions: '200 x 300', updated_at: DateTime.strptime("02/06/2017 17:00", "%m/%d/%Y %H:%M"), advertiser_id: advertiser.id)
ad_thirty = Ad.create(size: "full-page", price: "200.00", event_id: event_three.id, dimensions: '100 x 200', updated_at: DateTime.strptime("02/10/2017 17:00", "%m/%d/%Y %H:%M"), advertiser_id: advertiser.id)
ad_forty = Ad.create(size: "half-page", price: "115.00", event_id: event_three.id, dimensions: '200 x 300', updated_at: DateTime.strptime("02/27/2017 17:00", "%m/%d/%Y %H:%M"), advertiser_id: advertiser.id)

