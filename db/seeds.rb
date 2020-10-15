# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
filler_steps = <<-DOC
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue, nisi ut fermentum pharetra, arcu nisi ornare turpis, a vulputate nunc sapien tristique massa. Ut in rutrum nisl. Nulla pulvinar dolor et nisl malesuada, sed tempor neque lacinia. Morbi laoreet, metus at condimentum ornare, ligula magna pharetra eros, quis gravida magna nunc posuere tellus. Fusce tempor eleifend felis, quis posuere mauris bibendum vestibulum. Praesent blandit a risus a gravida. Phasellus volutpat, nulla sit amet malesuada pharetra, velit est varius erat, ut dictum ligula urna id magna. Aliquam erat volutpat. Integer sit amet nisl tempus, convallis orci eu, hendrerit enim. In porttitor massa vel nisi gravida, nec tempus arcu finibus. Sed lacinia nibh eget leo efficitur gravida. In vulputate maximus maximus. Fusce nec lacinia purus, non dictum metus.

Fusce posuere ligula vel mattis ornare. Integer a lacus vel dui elementum eleifend. Nulla mollis tincidunt sem, in tempus ligula vestibulum ac. Suspendisse eget dolor eros. Integer lacinia arcu leo, non tincidunt nibh sodales quis. Nam eget tempus lorem, et finibus arcu. Suspendisse potenti. Aliquam sagittis ultrices tincidunt. Aenean rutrum mauris non sollicitudin cursus. Vivamus eget consectetur quam, eu pretium est.

Fusce nec augue aliquet, gravida purus non, efficitur urna. Etiam euismod fermentum lacus, id aliquam eros. Curabitur in est finibus, vulputate nisi et, rhoncus sapien. Morbi a tellus porta, ullamcorper augue at, congue urna. Maecenas sit amet rhoncus ante. Duis sit amet volutpat odio. Aliquam dapibus ac nunc ac vulputate. Nullam et vestibulum quam, in aliquet nisi.
DOC
user1 = User.create(user_name: "user1", first_name: "Bob", last_name: "Harry")
user2 = User.create(user_name: "user2", first_name: "Simon", last_name: "Johnson")
user3 = User.create(user_name: "user3", first_name: "Mary", last_name: "Garrison")
user4 = User.create(user_name: "user4", first_name: "Jessica", last_name: "Dupree")

Recipe.create(name:"Chicken Bake", description:"yummy food", steps: filler_steps, stars: 5, dietary_restrictions: "Gluten-Free", user_id: 1)
Recipe.create(name:"Eggplant Parmesan", description:"good eats", steps: filler_steps, stars: 5, dietary_restrictions: "Nut-Free", user_id: 2) 
Recipe.create(name:"Spaghetti and Meatballs", description:"delicious and healthy", steps: filler_steps, stars: 5, dietary_restrictions: "Low FODMAP", user_id: 3 )
Recipe.create(name:"Beef Ramen", description:"hearty", steps: filler_steps, stars: 5, dietary_restrictions: "Gluten-Free", user_id: 4 )
Recipe.create(name:"Gluten-free Bread", description:"organic food", steps: filler_steps, stars: 5, dietary_restrictions: "Kosher", user_id: 1 )
Recipe.create(name:"Roasted Chicken", description:"soooo gooood", steps: filler_steps, stars: 5, dietary_restrictions: "Low FODMAP", user_id: 2 )
Recipe.create(name:"Cheesy Mashed Potatoes", description:"Delish and tasty", steps: filler_steps, stars: 5, dietary_restrictions: "Gluten-Free", user_id: 3 )
Recipe.create(name:"Banana Pancakes", description:"great recipe and healthy", steps: filler_steps, stars: 5, dietary_restrictions: "Halal", user_id: 4 )
Recipe.create(name:"Raspberry Smoothie", description:"fresh ingredients", steps: filler_steps, stars: 5, dietary_restrictions: "Nut-Free", user_id: 1 )
